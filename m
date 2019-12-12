From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Thu, 12 Dec 2019 11:35:06 +0100
Subject: [Buildroot] [PATCH v4 01/13] new recipe : host-systemd
In-Reply-To: <20191212111920.297bdca6@windsurf>
References: <20191212075400.1499536-1-jeremy.rosen@smile.fr>
 <20191212075400.1499536-2-jeremy.rosen@smile.fr>
 <20191212111920.297bdca6@windsurf>
Message-ID: <CAFvCimVDqVMYi-SZtm2906XjisqJeQcRNDmnq9XR-+qqnE3Rrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le jeu. 12 d?c. 2019 ? 11:19, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

>
> >  ifeq ($(BR2_PACKAGE_SYSTEMD_HWDB),y)
> >  SYSTEMD_CONF_OPTS += -Dhwdb=true
> > +define SYSTEMD_BUILD_HWDB
> > +     $(HOST_DIR)/bin/udevadm hwdb --update --root $(TARGET_DIR)
> > +endef
>
> I think this change could be a separate patch, no? Or is the udevadm
> binary installed by host-systemd conflicting with the one installed by
> host-eudev ?
>
> Should be explained in the commit log.
>
>
That's a matter of taste, I guess
No it doesn't conflict, i'll split in v5


> > +SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_BUILD_HWDB
> > +
> >  else
> >  SYSTEMD_CONF_OPTS += -Dhwdb=false
> >  endif
> > @@ -551,3 +556,96 @@ SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
> >  SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
> >
> >  $(eval $(meson-package))
>
> We normally have both meson-package and host-meson-package macro
> invocations at the end of .mk files.
>
>
Ok, I wanted to separate the host and target part clearly, but i'll follow
proper styling


> > +#
> > +# Host-systemd configuration
> > +#
> > +#Options tweaked for buildroot
> > +HOST_SYSTEMD_CONF_OPTS= \
> > +     -Dsplit-bin=true \
> > +     -Dsplit-usr=false \
> > +     --prefix=/usr \
>
> This should really be:
>
>         --prefix=$(HOST_DIR)
>
>
No... upstream does not user --prefix properly and we are force to set it
to /usr
even if HOST_DIR would make more sense.

I'll discuss this more in depth in the commit log


> > +     --libdir=lib \
> > +     --sysconfdir=/etc \
> > +     --localstatedir=/var
>
> But in fact, all these options are already passed by the
> host-meson-package infrastructure. Why are you overriding them ?
>
>
it's probably a bit overkill, but these need to be set to the same value as
the target, not the ones provided by the host
It's a bit complex to follow because upstream does not understand the
concept of cross-tool correctly so we might build
a systemctl that does the right thing for the host instead of doing the
right thing for the target


> > +#disable everything else
>
> Space after #
>
> ok

> > +HOST_SYSTEMD_CONF_OPTS+= \
>
> Space before +=
>
> ok

>
> > +HOST_SYSTEMD_DEPENDENCIES = \
> > +     host-util-linux \
> > +     host-patchelf \
> > +     host-libcap \
> > +     host-gperf
> > +
> > +# Fix RPATH After installation
> > +# * systemd provides a install_rpath instruction to meson because the
> binaries need to link with
> > +#   libsystemd which is not in a standard path
> > +# * meson can only replace the RPATH, not append to it
> > +# * the original rpatch is thus lost.
>
> rpatch -> rpath
>
>
darn me typing to fast


> > +# * the original path had been tweaked by buildroot vial LD_FLAGS to
> add $(HOST_DIR)/lib
>
> vial -> via
>
> ditto

> LD_FLAGS -> LDFLAGS
>
> > +# * thus re-tweak rpath after the installation for all binaries that
> need it
>
> I must admit I don't really understand what's going on here. Can't you
> simply do something like this:
>
> HOST_SYSTEMD_CONF_ENV = \
>         LDFLAGS="$(HOST_LDFLAGS) -Wl,-rpath,$(HOST_DIR)/lib/systemd"
>
> and that's it ?
>
>
No.. that's already what is done by host-package-meson but meson+systemd
breaks that.

Meson does not support using -rpath in LDFLAGS. It will rewrite the rpath
at the end of the
build using the information it has, but that does not include parsing the
ENV var and directly
understanding the linker flags.

Normally, everything should be alright since systemd tells meson about
libsystemd's location *
through meson conf files. meson would user systemd's instructions and
combine it with the
--prefix option to rewrite rpath correctly.

However systemd does not handle --prefix correctly (it hardcodes lots of
stuff in its build system based
on --prefix) so --prefix can either be empty or point to /usr. (this is
heavily linked to the split-usr problem)

Because of that, meson will erase our LDFLAGS provided rpath but won't
rewrite them correctly.
I have spent quite some time with Yann at Lyon looking for a way around,
and this seems the best one
until upstream deals correctly with --prefix.

I tried to be both concise and clear in my comment in the .mk (since i'm
pretty sure this is where
future contributors will stumble) but apparently i'm not there yet :)



> > +#buildroot detects incorrect RPATH, so adding new binaries should be
> safe (it won't compile
> > +#unless properly integrated).
>
> Space after #, and lines are too long.
>
> > +HOST_SYSTEMD_HOST_TOOLS = \
> > +     systemd-analyze  systemd-mount systemctl udevadm
> > +
> > +define HOST_SYSTEMD_FIX_RPATH
> > +     $(foreach f,$(HOST_SYSTEMD_HOST_TOOLS), \
> > +             $(HOST_DIR)/bin/patchelf --set-rpath
> $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $(HOST_DIR)/bin/$(f)
> > +     )
> > +endef
> > +
> > +HOST_SYSTEMD_POST_INSTALL_HOOKS +=  HOST_SYSTEMD_FIX_RPATH
> > +HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
>
> With the correct --prefix=$(HOST_DIR) passed by the default
> host-meson-package infrastructure, this DESTDIR=$(HOST_DIR) should no
> longer be necessary.
>
>
see my comment above

Thx for the review... I'll wait a bit and send a v5 integrating all your
remarks


> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191212/bf57adfc/attachment.html>
