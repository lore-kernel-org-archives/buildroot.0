From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Aug 2016 23:59:51 +0200
Subject: [Buildroot] [PATCH 10/16 v3] core: introduce per br2-external ID
In-Reply-To: <4bce70e5-7e9a-ef8b-6dc8-dbe2356df194@mind.be>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <a161d4b17c131b471418e4fa979aa73129ad102c.1468750623.git.yann.morin.1998@free.fr>
 <4bce70e5-7e9a-ef8b-6dc8-dbe2356df194@mind.be>
Message-ID: <20160827215951.GJ5755@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-08-27 23:49 +0200, Arnout Vandecappelle spake thusly:
>  I guess you're about to send a v3 so I'll try to still do a quick review of the
> remaining things.

Not really "about" to. But I will, yes.

Thanks! :-)

> On 17-07-16 12:34, Yann E. MORIN wrote:
> > This unique ID is used to construct a per br2-external tree variable,
> > BR2_EXTERNAL_$(ID), which contains the path to the br2-external tree.
> > 
> > This variable is available both from Kconfig (set in the Kconfig
> > snippet) and from the .mk files.
> > 
> > Also, display the BR2_EXTERNAL_$(ID) and its path as a comment in the
> > menuconfig.
> > 
> > This will ultimately allow us to support multiple br2-external trees at
> > once, with that ID (and thus BR2_EXTERNAL_$(ID)) uniquely defining which
> > br2-external tree is being used.
> > 
> > Note: since the variables in the Makefile and in Kconfig are named the
> > same, the one we computed early on (second hunk) will be overridden by
> > the one in .config when we have it. Thus, even though they are set to
> > the same raw value, the one from .config is quoted and, being included
> > later in the Makefile, will take precedence, so we must un-quote it
> > before we include the br2-external's makefile (third hunk). That's
> > unfortunate, but there is no easy way around that as we want the two
> > variables to be named the same in Makefile and Kconfig (and we can't
> > ask the user to un-quote that variable himself either), hence the
> > little dirty trick.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Peter Korsgaard <jacmet@uclibc.org>
> > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > ---
> >  Makefile | 22 +++++++++++++++++++++-
> >  1 file changed, 21 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index be2f586..72b55cb 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -148,6 +148,9 @@ $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
> >  #
> >  # When BR2_EXTERNAL is set to an empty value (e.g. explicitly in command
> >  # line), the .br-external file is removed.
> > +#
> > +# If the br2-external tree defines its ID, then export the path in the
> > +# BR2_EXTERNAL_$(ID) variable.
> 
>  I agree with Thomas that NAME is better than ID.
> 
>  The name can be anything, including, for example, MK - which would create a
> conflict with BR2_EXTERNAL_MK. Therefore I think there should be an additional
> prefix, e.g. BR2_EXTERNAL_DIR_$(NAME).

OK, will see to it.

> >  BR2_EXTERNAL_FILE = $(BASE_DIR)/.br-external
> >  -include $(BR2_EXTERNAL_FILE)
> > @@ -160,6 +163,13 @@ else
> >    endif
> >    override BR2_EXTERNAL := $(_BR2_EXTERNAL)
> >    $(shell echo BR2_EXTERNAL ?= $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
> > +  ifneq ($(wildcard $(BR2_EXTERNAL)/external.id),)
> > +    BR2_EXTERNAL_ID := $(shell cat $(BR2_EXTERNAL)/external.id 2>/dev/null)
> 
>  BR2_EXTERNAL_ID is an internal variable, so it should be EXTERNAL_NAME I think.
> Admittedly many of the currently existing BR2_EXTERNAL variables wrongly have
> the BR2 prefix, but let's not make it worse :-)

OK, fair enough. Will see to it.

> > +    ifeq ($(BR2_EXTERNAL_ID),)
> > +      $(error $(BR2_EXTERNAL) has no ID (in file 'external.id'))
> > +    endif
> > +    BR2_EXTERNAL_$(BR2_EXTERNAL_ID) = $(BR2_EXTERNAL)
> > +  endif
> >    BR2_EXTERNAL_MK = $(BR2_EXTERNAL)/external.mk
> >  endif
> >  
> > @@ -457,6 +467,10 @@ include boot/common.mk
> >  include linux/linux.mk
> >  include fs/common.mk
> >  
> > +# If the br2-external tree defines its ID, then the BR2_EXTERNAL_$(ID)
> > +# variable is also present in .config, so it is quoted. We must unquote
> > +# it before feeding it to the br2-external makefile.
> > +BR2_EXTERNAL_$(BR2_EXTERNAL_ID) := $(call qstrip,$(BR2_EXTERNAL_$(BR2_EXTERNAL_ID)))
> >  # Nothing to include if no BR2_EXTERNAL tree in use
> >  include $(BR2_EXTERNAL_MK)
> >  
> > @@ -882,7 +896,13 @@ $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
> >  	$(Q)if [ -n '$(BR2_EXTERNAL)' ]; then \
> >  		printf "#\n# Automatically generated file; DO NOT EDIT.\n#\n\n"; \
> >  		printf 'menu "User-provided options"\n\n'; \
> > -		printf 'source "%s/Config.in"\n\n' $$(cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd); \
> > +		if [ -z "$(BR2_EXTERNAL_ID)" ]; then \
> > +			printf 'source "%s/Config.in"\n\n' $$(cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd); \
> > +		else \
> > +			printf 'config BR2_EXTERNAL_%s\n' $(BR2_EXTERNAL_ID); \
> > +			printf '\tstring\n\tdefault "%s"\n\n' $(BR2_EXTERNAL_$(BR2_EXTERNAL_ID)); \
> 
>  Why is this config still needed? It was there before because that's the only
> way to use it in the 'source' statement, but now that we generate the external
> Config.in, I don't think it's needed anymore. Which also removes the need for
> the unquoting.

Hmmm.. As far as I can see, it is still needed, because the Config.in
files in the br2-external tree may want to include other Config.in
files, no?

Like for example (with the variable renamed as per above):

    .../ext-tree/Config.in
        source "$BR2_EXTERNAL_DIR_FOO/package/pkg-1/Config.in"
        source "$BR2_EXTERNAL_DIR_FOO/package/pkg-2/Config.in"

So it is stil needed to have the path to each br2-external paths from
Kconfig.

Unless I missed something?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
