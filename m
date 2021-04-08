From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu, 8 Apr 2021 21:52:46 +0300
Subject: [Buildroot] [PATCH 1/1] package/uftrace: new package
In-Reply-To: <20210404090338.GD2252@scaer>
References: <20210403191609.1168606-1-asafka7@gmail.com>
 <20210404090338.GD2252@scaer>
Message-ID: <CALFsTFVv2XjXXcXJRr1-_K7Dd2+dxea7enKfV6cK-hx7Xzs8Sw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Sun, Apr 4, 2021 at 12:03 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Asaf, All,
>
> On 2021-04-03 22:16 +0300, Asaf Kahlon spake thusly:
> > The uftrace tool is to trace and analyze execution of a
> > program written in C/C++. It was heavily inspired by the
> > ftrace framework of the Linux kernel (especially function
> > graph tracer) and supports userspace programs.
> > It supports various kind of commands and filters to help
> > analysis of the program execution and performance.
>
> Rather than duplicate the package description in the commit log, I
> think it makes more sense that it contains explanations about the
> packaging in Buildroot. See below.

I'll amend the message, thanks.

>
> > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> > ---
> >  DEVELOPERS                   |  1 +
> >  package/Config.in            |  1 +
> >  package/busybox/busybox.     |  0
>
> Uh? ;-)

Oops :) Will be fixed.

>
> [--SNIP--]
> > diff --git a/package/uftrace/Config.in b/package/uftrace/Config.in
> > new file mode 100644
> > index 0000000000..ca3041195e
> > --- /dev/null
> > +++ b/package/uftrace/Config.in
> > @@ -0,0 +1,12 @@
> > +config BR2_PACKAGE_UFTRACE
> > +     bool "uftrace"
> > +     depends on BR2_arm || BR2_aarch64 || BR2_x86_64
>
> AFAICS, it also support i386...
>
> Even though the architecture dependencies are pretty trivial today, I
> think it would be good to introduce a _ARCH_SUPPORTS symbol:
>
>     config BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
>         bool
>         default y if BR2_arm
>         default y if BR2_aarch64
>         default y if BR2_i386
>         default y if BR2_x86_64
>
>     config BR2_PACKAGE_UFTRACE
>         bool "uftrace"
>         depends on BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
>

Done on v2.

> [--SNIP--]
> > diff --git a/package/uftrace/uftrace.mk b/package/uftrace/uftrace.mk
> > new file mode 100644
> > index 0000000000..b696ac4c6e
> > --- /dev/null
> > +++ b/package/uftrace/uftrace.mk
> > @@ -0,0 +1,26 @@
> > +################################################################################
> > +#
> > +# uftrace
> > +#
> > +################################################################################
> > +
> > +UFTRACE_VERSION = 0.9.4
> > +UFTRACE_SITE = https://github.com/namhyung/uftrace/archive/refs/tags
>
> Please use the github macro; see e.g. boot/shim/shim.mk and the manual:
>     https://buildroot.org/downloads/manual/manual.html#github-download-url
>

Done in v2.

> > +UFTRACE_SOURCE = v0.9.4.tar.gz
>
> No need to specify _SOURCE when using the github macro.
>
> > +UFTRACE_LICENSE = GPL-2.0
> > +UFTRACE_LICENSE_FILES = COPYING
> > +
> > +ifeq ($(BR2_PACKAGE_ELFUTILS),y)
> > +UFTRACE_DEPENDENCIES += elfutils
> > +endif
> > +
> > +define UFTRACE_BUILD_CMDS
> > +     $(TARGET_CONFIGURE_OPTS) ARCH=$(BR2_ARCH) $(MAKE) -C $(@D) $(UFTRACE_MAKE_OPTS)
>
> You are not setting UFTRACE_MAKE_OPTS anywhere that I can see...

You're right, removed.

>
> > +endef
> >
> > +define UFTRACE_INSTALL_TARGET_CMDS
> > +     $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
> > +             $(UFTRACE_MAKE_OPTS) install
> > +endef
> > +
> > +$(eval $(generic-package))
>
> There is a ./configure script (but it is not autotools, so this truly is
> a generic-package indeed): any reason why you are not using it? A little
> note about it in the commit log would be nice.

Well, the ./configure script is called from the Makefile, and actually
I don't see any reason to run it separately.
But I agree a proper commit message should be added in order to make
the compilation process clean.

>
> I was wondering if having a host variant would not be interesting too.
> Indeed, uftrace has a record mode, where it has a 'record' mode where it
> stores all the traces into a file, and replay/report/graph modes where
> it reads from that file to do off-sire analysis. So one might be
> interested in running in record mode in the target, and doing the
> analysis on the development machine...

That's an interesting idea. I admit I didn't try this use case.

I'll send a v2 soon, and I'll invest some time later to check the
option to add a host.
Anyway, thanks for the review!

>
> Thoughts?
>
> Regards,
> Yann E. MORIN.
>
> > --
> > 2.27.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

Regards,
Asaf.
