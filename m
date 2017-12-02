From: Keith Mok <ek9852@gmail.com>
Date: Fri, 1 Dec 2017 22:25:05 -0800
Subject: [Buildroot] [PATCH 1/2] android-tools: Enable build for ext4
 fsutils
In-Reply-To: <20171201124924.ajmy3ibrnlznfddb@t450s.lan>
References: <20171130205631.93251-1-ek9852@gmail.com>
 <20171201124924.ajmy3ibrnlznfddb@t450s.lan>
Message-ID: <CAHjoi4fMAY3B7kOBfUQ1VNknR27ks-RU+nYGhy3+w609kA+s+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Basically depends on BR2_PACKAGE_LIBSELINUX.
But BR2_PACKAGE_LIBSELINUX depends on BR2_TOOLCHAIN_HAS_THREADS
BR2_STATIC_LIBS BR2_TOOLCHAIN_USES_GLIBC BR2_arc
Those dependency are just copied from FASTBOOT.

Thanks,
Keith

2017-12-01 4:49 GMT-08:00 Gary Bisson <gary.bisson@boundarydevices.com>:

> Hi Keith,
>
> Thank you for your contribution. Please find my remark inline below.
>
> On Thu, Nov 30, 2017 at 12:56:30PM -0800, Keith Mok wrote:
> > This enable the build for make_ext4fs, simg2img, etc.
> > For creating Android sparse ext4 files and extract tools (simg2img).
> >
> > Signed-off-by: Keith Mok <ek9852@gmail.com>
> > ---
> >  ...ke_ext4fs-makefiles-for-out-of-tree-build.patch | 53
> ++++++++++++++++++++++
> >  package/android-tools/Config.in                    | 12 +++++
> >  package/android-tools/Config.in.host               |  6 +++
> >  package/android-tools/android-tools.mk             | 39
> +++++++++++-----
> >  4 files changed, 99 insertions(+), 11 deletions(-)
> >  create mode 100644 package/android-tools/0008-
> Fix-make_ext4fs-makefiles-for-out-of-tree-build.patch
> >
> > diff --git a/package/android-tools/0008-Fix-make_ext4fs-makefiles-for-out-of-tree-build.patch
> b/package/android-tools/0008-Fix-make_ext4fs-makefiles-for-
> out-of-tree-build.patch
> > new file mode 100644
> > index 0000000..ec68c25
> > --- /dev/null
> > +++ b/package/android-tools/0008-Fix-make_ext4fs-makefiles-for-
> out-of-tree-build.patch
> > @@ -0,0 +1,53 @@
> > +[PATCH] Fix make_ext4fs makefiles for out-of-tree build
> > +
> > +Signed-off-by: Keith Mok <keith@density.io>
> > +---
> > + debian/makefiles/ext4_utils.mk | 11 ++++++-----
> > + 1 file changed, 6 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/debian/makefiles/ext4_utils.mk b/debian/makefiles/
> ext4_utils.mk
> > +index cb64916..b56e27e 100644
> > +--- a/debian/makefiles/ext4_utils.mk
> > ++++ b/debian/makefiles/ext4_utils.mk
> > +@@ -1,6 +1,7 @@
> > + # Makefile for ext4_utils; based on https://heiher.info/2227.html
> > + # Author: Dmitrijs Ledkovs <xnox@ubuntu.com>
> > +
> > ++VPATH+= $(SRCDIR)/extras/ext4_utils
> > + SRCS+=make_ext4fs.c
> > + SRCS+=ext4fixup.c
> > + SRCS+=ext4_utils.c
> > +@@ -13,7 +14,7 @@ SRCS+=sha1.c
> > + SRCS+=wipe.c
> > + SRCS+=crc16.c
> > +
> > +-VPATH+=../../core/libsparse
> > ++VPATH+= $(SRCDIR)/core/libsparse
> > + SRCS+= backed_block.c
> > + SRCS+= sparse_crc32.c
> > + SRCS+= sparse.c
> > +@@ -23,6 +24,7 @@ SRCS+= output_file.c
> > +
> > + OBJS_SHARED:= $(SRCS:.c=.o)
> > +
> > ++VPATH+= $(SRCDIR)/extras/ext4_utils
> > + SRCS+=make_ext4fs_main.c
> > + SRCS+=ext4fixup_main.c
> > + SRCS+=setup_fs.c
> > +@@ -31,10 +33,9 @@ SRCS+=img2simg.c
> > + SRCS+=simg2img.c
> > + SRCS+=simg2simg.c
> > +
> > +-CPPFLAGS+= -I.
> > +-CPPFLAGS+= -I/usr/include
> > +-CPPFLAGS+= -I../../core/include
> > +-CPPFLAGS+= -I../../core/libsparse/include/
> > ++CPPFLAGS+= -I$(SRCDIR)/core/include
> > ++CPPFLAGS+= -I$(SRCDIR)/extras/ext4_utils/
> > ++CPPFLAGS+= -I$(SRCDIR)/core/libsparse/include/
> > +
> > + LIBS+= -lz -lselinux
> > +
> > +--
> > +2.13.6 (Apple Git-96)
> > +
> > diff --git a/package/android-tools/Config.in b/package/android-tools/
> Config.in
> > index 96e36e6..6697d45 100644
> > --- a/package/android-tools/Config.in
> > +++ b/package/android-tools/Config.in
> > @@ -75,6 +75,18 @@ config BR2_PACKAGE_ANDROID_TOOLS_ADBD
> >         target, which can be used to interact with a host machine
> >         implementing the ADB protocol.
> >
> > +config BR2_PACKAGE_ANDROID_TOOLS_EXT4_UTILS
> > +     bool "ext4-utils"
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
> > +     depends on !BR2_STATIC_LIBS # libselinux
> > +     depends on BR2_TOOLCHAIN_USES_GLIBC # libselinux
> > +     depends on !BR2_arc # libselinux
> > +     select BR2_PACKAGE_LIBSELINUX
> > +     select BR2_PACKAGE_ZLIB
> > +     help
> > +       This option will build and install the ext4 utility for the
> > +       host, which can be used to build sparse/extract ext4 image.
> > +
>
> There should be a comment here to explain all the dependencies. It is
> required when the dependencies are not met, so the user knows about it.
>
> You can have a look at the fasboot comment as an example (should be more
> or less the same).
>
> Other than that, the series looks good!
>
> Thanks,
> Gary
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171201/0872e305/attachment.html>
