From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Jun 2016 19:19:25 +0200
Subject: [Buildroot] [PATCH] package/php: fix date.timezone
In-Reply-To: <03dc8593-c3d7-3dbc-924c-81b58937e099@mind.be>
References: <1465728504-17997-1-git-send-email-yann.morin.1998@free.fr>
 <03dc8593-c3d7-3dbc-924c-81b58937e099@mind.be>
Message-ID: <20160616171925.GB3665@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-06-14 00:42 +0200, Arnout Vandecappelle spake thusly:
> On 12-06-16 12:48, Yann E. MORIN wrote:
> > In 5f37843a (php.ini: set date.timezone), the configured timezone was
> > used as the default for PHP.
> > 
> > However, BR2_TARGET_LOCALTIME is a string, so is quoted, so it is never
> > empty, so the check for emptynessnever matches.
> > 
> > Fix that by q-stripping the value before testing it. Note however that
> > we do not q-strip it before storing it in the php.ini file, because it
> > has to be q-stripped in there.
> 
>  That's actually not correct. The idea is that it should be possible to run:
> 
> make BR2_TARGET_LOCALTIME="UTC"

No, please no...I am absolutely against allowing this.

It is OK for things like BR2_DL_DIR or BR2_DEFCONFIG, for which we have
explicit handling and does not "leak" into the target filesystem.

However, for configuration variables that affect the target filesystem,
I think we should not allow specifying them on the command line at all.
Or what, we could pass any-and-all options on the command line? Noooo...

Configuration variables that affect the content of the target filesystem
should all be confined to the .config file.

However, there is a remaining bug lurking around (see below).

> in which case the variable will _not_ have quotes. Therefore, everywhere in
> Buildroot, we do something like:
> 
> PHP_LOCALTIME = "$(call qstrip,$(BR2_TARGET_LOCALTIME))"
> 
>  Note BTW that we already have
> 
> TZ_LOCALTIME = $(call qstrip,$(BR2_TARGET_LOCALTIME))
> TZDATA_LOCALTIME = $(call qstrip,$(BR2_TARGET_LOCALTIME))
> 
> so perhaps it would make sense to move this qstripping to global scope...

Yes, maybe... I'll see to it.

>  Regards,
>  Arnout
> 
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Floris Bos <bos@je-eigen-domein.nl>
> > ---
> >  package/php/php.mk | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/php/php.mk b/package/php/php.mk
> > index 2997b1b..8dc70f0 100644
> > --- a/package/php/php.mk
> > +++ b/package/php/php.mk
> > @@ -32,9 +32,10 @@ ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
> >  PHP_STATIC_LIBS += -lpthread
> >  endif
> >  
> > -ifeq ($(BR2_TARGET_LOCALTIME),)
> > +ifeq ($(call qstrip,$(BR2_TARGET_LOCALTIME)),)
> >  PHP_LOCALTIME = UTC

Here, UTC is not quoted... I'll fix that.

Regards,
Yann E. MORIN.

> >  else
> > +# Not q-stripping this value, as we need quotes in the php.ini file
> >  PHP_LOCALTIME = $(BR2_TARGET_LOCALTIME)
> >  endif
> >  
> > 
> 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
