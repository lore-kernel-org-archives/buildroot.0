From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Wed, 30 Jul 2014 00:41:44 +0200
Subject: [Buildroot] [PATCH v4 1/1] New package: openvmtools
In-Reply-To: <20140729211549.GA5846@free.fr>
References: <1406635032-34970-1-git-send-email-kaszak@gmail.com>
 <20140729211549.GA5846@free.fr>
Message-ID: <CABbD_XBsgVB7KQPwKoEJDz3JOJ61_2AJO=JtNOWy+yiRqgrTQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Thanks for reviewing my patch!


>
> > +config BR2_PACKAGE_OPENVMTOOLS
> > +     bool "openvmtools"
> > +     depends on BR2_i386 || BR2_x86_64
> > +     depends on BR2_USE_MMU
> > +     depends on BR2_USE_WCHAR
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS
>
> Are all those dependencies just inherited from libglib2, or are they
> real dependencies on openvmtools?
>
> If they are only inherited from libglib2, they it is customary to
> indicate the package as a comment to the dependency, like:
>
>     depends on BR2_USE_MMU # libglib2
>     depends on BR2_USE_WCHAR # libglib2


Actually they are, I did remove the comments since the v1 of the patch,
because I misinterpreted ThomasP's recommendation.
I'll put these back.


> > +if BR2_PACKAGE_OPENVMTOOLS
> > +
> > +menu "openvmtools options"
>
> Do not put it in a sub-menu, the options will be properly indented in
> the frontends.
>
> We only do sub-menus when there are a *lot* of sub-options (there is no
> written rule on this, but above ~8 warants a sub-menu, otherwise
> indentation is considered enough.)


OK, I'll remove the sub-menu.


> > +config BR2_PACKAGE_OPENVMTOOLS_PROCPS
> > +     bool "openvmtools procps support"
>
> Do not repeat 'openvmtools' in the prompts. Since it depends on
> BR2_PACKAGE_OPENVMTOOLS, the frontends wil properly indent the
> sub-options, so that it is obvious they are options to openvmtools.
>

OK.


> > +     select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>
> I know we alkready have one package and one systm option that select
> busybox-show-others, but they are a bit special: one is systemd, the
> other is sysvinit. All other packages depend on
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> instead.
>
> For openvmtools, I would use a depends rather than a select, something
> like:
>
>     config BR2_PACKAGE_OPENVMTOOLS_PROCPS
>         bool "procps support"
>         depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>         select BR2_PACKAGE_PROCPS_NG
>
>     comment "procps support needs that BUSYBOX_SHOW_OTHERS be set"
>         depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>
> I'm not much satisfied with the comment text, however. If you find a
> better wording, feel free to adapt.


I'll change it to something like you recommended.


> > +config BR2_PACKAGE_OPENVMTOOLS_DNET
> > +     bool "openvmtools dnet support"
>
> Ditto: do not repeat 'openvmtools' in the prompts


OK.


> > +config BR2_PACKAGE_OPENVMTOOLS_PAM
> > +     bool "openvmtools PAM support"
>
> Ditto.
>

OK.


> > diff --git a/package/openvmtools/S10vmtoolsd
> b/package/openvmtools/S10vmtoolsd
> > new file mode 100644
> > index 0000000..3ab351e
> > --- /dev/null
> > +++ b/package/openvmtools/S10vmtoolsd
> > @@ -0,0 +1,33 @@
> > +#!/bin/sh
> > +#
> > +# Starts vmtoolsd for openvmtools
> > +#
> > +
> > +PID=/var/run/vmtoolsd.pid
> > +
> > +case "$1" in
> > +  start)
> > +     echo -n "Starting vmtoolsd: "
>
> This scripts uses a mix of tabs and spaces to do the indentation; for
> example, the cases lines ("start)", "stop)"...) are indented with
> spaces, while the rest is indented with tabs. Please be consistent.
>

I used dropbear's startup script as a template, and the indentation is
exactly the same. Also with openssh, exim or ptpd (and possibly some
others). I think I should not differ from those too much?


>
> > +
> > +exit $?
>
> No need to exit epxlicitly, it's implicit from POSIX, that a shell
> script exits with the error code from the last command. Besides, we do
> not care at all about the exit status of a startup script.
>

Although you are right, it's on the end of the dropbear startup script and
26 other initscripts in the package/ subdir. I think I should leave this to
stay consistent with the others as above.


> > +OPENVMTOOLS_CONF_OPT = \
> > +        --without-icu \
> > +        --without-x \
> > +        --without-gtk2 \
> > +        --without-gtkmm \
> > +        --without-kernel-modules
>
> On a single line. If it is too long, just split it, like:
>
>     OPENVMTOOLS_CONF_OPT = --without-icu --without-x \
>             --without-gtk2 --without-gtkmm --without-kernel-modules
>

OK. I though it is more visible.


> > +#-Wno-deprecated-declarations is a workaround for a bug in open-vm-tools
> > +#See http://sourceforge.net/p/open-vm-tools/mailman/message/31473171/
>
> Nit-pick: space after the '#' symbol.
>

OK.


>
> > +OPENVMTOOLS_CONF_ENV = CFLAGS+="-Wno-deprecated-declarations"
>
> This should be:
>
>     OPENVMTOOLS_CONF_ENV = CFLAGS="$(TARGET_CFLAGS)
> -Wno-deprecated-declarations"


OK.


> > +# When libfuse is available, openvmtools can build vmblock-fuse, so
> > +# make sure that libfuse gets built first.
> > +ifeq ($(BR2_PACKAGE_LIBFUSE),y)
> > +OPENVMTOOLS_DEPENDENCIES += libfuse
>
> No --enable-fuse/--disable-fuse options (or the likes)?
>

Unfortunately not. If the "configure" script finds libfuse, it builds
vmblock-fuse, else it won't. I experimented with it a bit, and found this
the most logical solution.


>
> > +define OPENVMTOOLS_POST_INSTALL_TARGET_THINGIES
> > +#needed by lib/system/systemLinux.c (or will cry in /var/log/messages)
>
> Do not put the comments in the macro; put them above the macro defintion.
>

OK.

Thanks again, I'll send a v5 patch soon. Regarding the init script, I can
use only spaces/tabs, but then this script will differ from the others.
Should I?

Kind regards,
Karoly Kasza
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140730/9b856b87/attachment.html>
