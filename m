From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Jun 2015 01:19:40 +0200
Subject: [Buildroot] [PATCH 4/4] core/pkg-kconfig: allow saving config
 to a non-existing custom config file
In-Reply-To: <20150612233936.40177f8c@free-electrons.com>
References: <cover.1433591404.git.yann.morin.1998@free.fr>
 <a195692f03dab1f3074825feab277c905379dfa2.1433591404.git.yann.morin.1998@free.fr>
 <20150612233936.40177f8c@free-electrons.com>
Message-ID: <20150612231940.GJ3583@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-12 23:39 +0200, Thomas Petazzoni spake thusly:
> On Sat,  6 Jun 2015 13:54:26 +0200, Yann E. MORIN wrote:
> 
> > diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> > index 6bb2559..453a59d 100644
> > --- a/package/pkg-kconfig.mk
> > +++ b/package/pkg-kconfig.mk
> > @@ -90,9 +90,10 @@ endif
> >  
> >  # Configuration editors (menuconfig, ...)
> >  #
> > -# Apply the kconfig fixups right after exiting the configurators, so
> > -# that the user always sees a .config file that is clean wrt. our
> > -# requirements.
> > +# We need to apply the configuration fixups right after a configuration
> > +# editor exits, so that it is possible to save the configuration right
> > +# after exiting an editor, and so the user always sees a .config file
> > +# that is clean wrt. our requirements.
> 
> Shouldn't this chunk be part of the previous patch?

Well, this chunk is _updating_ the comment introduced in the previous
patch.

In the previous patch, we were not yet able to save back the
configuration to a non-existing, so I did not talk about that in the
previous patch.

With this new patch, we are now able to save the configuration back to
a non-existing file, so I ammend the comment to take this new
possibility into account.

> >  # Because commands in $(1)_FIXUP_KCONFIG are probably using $(@D), we
> >  # fake it for the configurators (otherwise it is set to just '.', i.e.
> > @@ -108,14 +109,35 @@ $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_
> >  	rm -f $$($(2)_DIR)/.stamp_{target,staging,images}_installed
> >  	$$(call $(1)_FIXUP_KCONFIG)
> >  
> > -$(1)-savedefconfig: $$($(2)_DIR)/.stamp_kconfig_fixup_done
> > +# Saving back the configuration
> > +#
> > +# Ideally, that should directly depend on $$($(2)_DIR)/.stamp_kconfig_fixup_done,
> > +# but that breaks the use-case in PR-8156 (from a clean tree):
> > +#   make menuconfig           <- enable kernel, use an in-tree defconfig, save and exit
> > +#   make linux-menuconfig     <- enable/disable whatever option, save and exit
> > +#   make menuconfig           <- change to use a custom defconfig file, set a path, save and exit
> > +#   make linux-update-config  <- should save to the new custom defconfig file
> > +#
> > +# Because of that use-case, saving the configuration can not directly depend
> 
> can not -> cannot

Well, the Oxford dictionary believes both are acceptable (but cannot is
much more usual, granted):
    https://www.oxforddictionaries.com/words/cannot-or-can-not
    https://www.oxforddictionaries.com/definition/english/cannot

Also, the "can not" construct is more acceptable when one wants to
emphasize the negative part, which is exactly what I wwanted to convey
here. Think of it like if I said: "it can *not* depend on..."
That's the position of the Washington State University language site:
    http://public.wsu.edu/~brians/errors/cannot.html

But Oh well... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
