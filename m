From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 1 Dec 2015 08:44:59 -0200
Subject: [Buildroot] [PATCH] musl: add a sys/queue.h implementation
In-Reply-To: <20151201112916.57ef96b3@free-electrons.com>
References: <1448924535-8093-1-git-send-email-sergio.prado@e-labworks.com>
 <20151201112916.57ef96b3@free-electrons.com>
Message-ID: <CANu7NGv0XVv-7H_p3R=QM477bNmZCZEMUrPU-VKWk0afmQ93Ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

2015-12-01 8:29 GMT-02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Sergio,
>
> On Mon, 30 Nov 2015 21:02:15 -0200, Sergio Prado wrote:
>
> >  package/musl/musl.mk                               |   5 +
> >  package/sys-queue/Config.in                        |   8 +
> >  package/sys-queue/queue.h                          | 846
> +++++++++++++++++++++
>
> Rather than bundling the queue.h file, can we download it from some
> location ? For example, you could use
> http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys/queue.h?rev=1.30.
>

One of my first questions was if we should keep queue.h inside Buildroot or
download it from somewhere. And you say we could keep it inside Buildroot,
and point me to package/makedevs/ that has a source code inside it. But I
can change it if that's a problem.


> > diff --git a/package/sys-queue/Config.in b/package/sys-queue/Config.in
> > new file mode 100644
> > index 000000000000..edc6610f6e65
> > --- /dev/null
> > +++ b/package/sys-queue/Config.in
> > @@ -0,0 +1,8 @@
> > +config BR2_PACKAGE_SYS_QUEUE
> > +     bool "sys/queue.h support"
> > +     help
> > +       Musl does not provide a 'sys/queue.h' implementation, and this
> would
> > +       be a problem for packages that depend on it.
> > +
> > +       This package provides an implementation of 'sys/queue.h', based
> on
> > +       the NetBSD implementation.
>
> Do we really need this package to have a prompt? I think it could
> remain a hidden package, no?
>

Since it is not included in the package/Config.in, it is still hidden,
right? At least I can't find it when searching inside menuconfig. I created
this file just as a matter of documentation, but I can remove if it is not
necessary.


>
> > diff --git a/package/sys-queue/sys-queue.mk b/package/sys-queue/
> sys-queue.mk
> > new file mode 100644
> > index 000000000000..053ef8fd9e0d
> > --- /dev/null
> > +++ b/package/sys-queue/sys-queue.mk
> > @@ -0,0 +1,23 @@
> >
> +################################################################################
> > +#
> > +# sys-queue
> > +#
> >
> +################################################################################
> > +
> > +# source included in buildroot
> > +SYS_QUEUE_SOURCE =
> > +SYS_QUEUE_VERSION = 1.70
>
> Where is this version coming from ?
>

From the source code.
http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys/queue.h?rev=1.70


>
> > +
> > +SYS_QUEUE_LICENSE = BSD
>
> BSD-3c
>
> > +SYS_QUEUE_LICENSE_FILES = queue.h
> > +
> > +SYS_QUEUE_INSTALL_STAGING = YES
> > +
> > +define SYS_QUEUE_INSTALL_STAGING_CMDS
> > +     if [ ! -f $(STAGING_DIR)/usr/include/sys/queue.h ]; then \
> > +             $(INSTALL) -D -m 0644 package/sys-queue/queue.h \
> > +                     $(STAGING_DIR)/usr/include/sys/queue.h; \
> > +     fi
> > +endef
>
> As Baruch said, please install unconditionally.
>

OK.


>
> Otherwise, looks good to me.
>
> Thanks!
>

Thanks!


>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151201/7ac828e0/attachment.html>
