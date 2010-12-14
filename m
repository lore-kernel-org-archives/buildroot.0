From: Bryan Hundven <bryanhundven@gmail.com>
Date: Mon, 13 Dec 2010 16:58:36 -0800
Subject: [Buildroot] [git commit master 1/1] libfloat: remove package
In-Reply-To: <20101214003643.2EC3B8E2DA@busybox.osuosl.org>
References: <20101214003643.2EC3B8E2DA@busybox.osuosl.org>
Message-ID: <AANLkTinzXp05yq4b5ZHRv33HdX3cs6VzGDCgpwo1SpJW@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tomas, all,

On Mon, Dec 13, 2010 at 4:35 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> commit: http://git.buildroot.net/buildroot/commit/?id=accbd71154b8815678baa12f21f853ed8478f400
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> This package has been marked deprecated in Buildroot last year, no-one
> complained, and it isn't developed upstream anymore. So get rid of it.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
> ?CHANGES ? ? ? ? ? ? ? ? ? ? ? ? | ? ?2 +-
> ?package/Config.in ? ? ? ? ? ? ? | ? ?1 -
> ?package/libfloat/Config.in ? ? ?| ? ?8 -----
> ?package/libfloat/libfloat.mk ? ?| ? 65 ---------------------------------------
> ?package/libfloat/libfloat.patch | ? 45 ---------------------------
> ?5 files changed, 1 insertions(+), 120 deletions(-)
> ?delete mode 100644 package/libfloat/Config.in
> ?delete mode 100644 package/libfloat/libfloat.mk
> ?delete mode 100644 package/libfloat/libfloat.patch
>
> diff --git a/CHANGES b/CHANGES
> index f3d8243..c4cf18c 100644
> --- a/CHANGES
> +++ b/CHANGES
> @@ -12,7 +12,7 @@
>
> ? ? ? ?New packages: dhrystone, fbgrab, lsuio, rsh-redone, whetstone
>
> - ? ? ? Removed packages: microcom, ng-spice-rework
> + ? ? ? Removed packages: libfloat, microcom, ng-spice-rework
>
> ? ? ? ?Issues resolved (http://bugs.uclibc.org):
>
> diff --git a/package/Config.in b/package/Config.in
> index eb4ea8e..0f3eca4 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -323,7 +323,6 @@ source "package/libcap/Config.in"
> ?source "package/libdaemon/Config.in"
> ?source "package/libelf/Config.in"
> ?source "package/libevent/Config.in"
> -source "package/libfloat/Config.in"
> ?source "package/libglib2/Config.in"
> ?source "package/liboil/Config.in"
> ?source "package/startup-notification/Config.in"
> diff --git a/package/libfloat/Config.in b/package/libfloat/Config.in
> deleted file mode 100644
> index 3df9334..0000000
> --- a/package/libfloat/Config.in
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -config BR2_PACKAGE_LIBFLOAT
> - ? ? ? bool "libfloat"
> - ? ? ? depends on BR2_DEPRECATED
> - ? ? ? help
> - ? ? ? ?Soft floating point library.
> -
> - ? ? ? ?http://netwinder.osuosl.org/devteam/scottb/libfloat/
> -
> diff --git a/package/libfloat/libfloat.mk b/package/libfloat/libfloat.mk
> deleted file mode 100644
> index 0c4ae28..0000000
> --- a/package/libfloat/libfloat.mk
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -#############################################################
> -#
> -# libfloat
> -#
> -#############################################################
> -LIBFLOAT_SOURCE:=libfloat_990616.orig.tar.gz
> -LIBFLOAT_PATCH:=libfloat_990616-3.diff.gz
> -LIBFLOAT_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/libf/libfloat
> -LIBFLOAT_CAT:=$(ZCAT)
> -LIBFLOAT_DIR:=$(BUILD_DIR)/libfloat
> -
> -LIBFLOAT_TARGET=
> -ifeq ($(strip $(SOFT_FLOAT)),true)
> -ifeq ("$(strip $(ARCH))","arm")
> -ifeq ($(findstring 3.3.,$(GCC_VERSION)),3.3.)
> -LIBFLOAT_TARGET+=$(STAGING_DIR)/lib/libfloat.so
> -endif
> -endif
> -endif
> -
> -$(DL_DIR)/$(LIBFLOAT_SOURCE):
> - ? ? ? ?$(call DOWNLOAD,$(LIBFLOAT_SITE),$(LIBFLOAT_SOURCE))
> -
> -$(DL_DIR)/$(LIBFLOAT_PATCH):
> - ? ? ? ?$(call DOWNLOAD,$(LIBFLOAT_SITE),$(LIBFLOAT_PATCH))
> -
> -libfloat-source: $(DL_DIR)/$(LIBFLOAT_SOURCE) $(DL_DIR)/$(LIBFLOAT_PATCH)
> -
> -$(LIBFLOAT_DIR)/.unpacked: $(DL_DIR)/$(LIBFLOAT_SOURCE) $(DL_DIR)/$(LIBFLOAT_PATCH)
> - ? ? ? $(LIBFLOAT_CAT) $(DL_DIR)/$(LIBFLOAT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
> - ? ? ? # Remove the binary files distributed with the the package.
> - ? ? ? -$(MAKE) -C $(LIBFLOAT_DIR) clean
> - ? ? ? toolchain/patch-kernel.sh $(LIBFLOAT_DIR) $(DL_DIR) $(LIBFLOAT_PATCH)
> - ? ? ? toolchain/patch-kernel.sh $(LIBFLOAT_DIR) package/libfloat/ libfloat\*.patch
> - ? ? ? touch $@
> -
> -$(LIBFLOAT_DIR)/libfloat.so.1: $(LIBFLOAT_DIR)/.unpacked
> - ? ? ? $(MAKE) CC="$(TARGET_CC)" LD=$(TARGET_CROSS)ld -C $(LIBFLOAT_DIR)
> -
> -$(STAGING_DIR)/lib/libfloat.so $(STAGING_DIR)/lib/libfloat.a: $(LIBFLOAT_DIR)/libfloat.so.1
> - ? ? ? cp -dpf $(LIBFLOAT_DIR)/libfloat.a $(STAGING_DIR)/lib/libfloat.a
> - ? ? ? cp -dpf $(LIBFLOAT_DIR)/libfloat.so.1 $(STAGING_DIR)/lib/libfloat.so.1
> - ? ? ? (cd $(STAGING_DIR)/lib; ln -snf libfloat.so.1 libfloat.so)
> - ? ? ? cp -dpf $(LIBFLOAT_DIR)/libfloat.a $(TARGET_DIR)/usr/lib/libfloat.a
> - ? ? ? cp -dpf $(LIBFLOAT_DIR)/libfloat.so.1 $(TARGET_DIR)/lib/libfloat.so.1
> - ? ? ? $(STRIPCMD) $(TARGET_DIR)/lib/libfloat.so.1 > /dev/null 2>&1
> - ? ? ? (cd $(TARGET_DIR)/lib; ln -snf libfloat.so.1 libfloat.so)
> - ? ? ? (cd $(TARGET_DIR)/usr/lib; ln -snf /lib/libfloat.so libfloat.so)
> -
> -libfloat: $(gcc_initial) $(STAGING_DIR)/lib/libfloat.so
> -
> -libfloat-clean:
> - ? ? ? -$(MAKE) -C $(LIBFLOAT_DIR) clean
> -
> -libfloat-dirclean:
> - ? ? ? rm -rf $(LIBFLOAT_DIR)
> -
> -#############################################################
> -#
> -# Toplevel Makefile options
> -#
> -#############################################################
> -#ifeq ($(BR2_PACKAGE_LIBFLOAT),y)
> -#TARGETS+=libfloat
> -#endif
> diff --git a/package/libfloat/libfloat.patch b/package/libfloat/libfloat.patch
> deleted file mode 100644
> index 90459a8..0000000
> --- a/package/libfloat/libfloat.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -diff -urN libfloat-dist/Makefile libfloat/Makefile
> ---- libfloat-dist/Makefile ? ? 2003-10-26 00:33:45.000000000 -0500
> -+++ libfloat/Makefile ?2003-10-26 01:07:26.000000000 -0500
> -@@ -1,7 +1,7 @@
> - # Makefile for the Linux soft-float library
> -
> --CC=gcc -O2 -freg-struct-return -fomit-frame-pointer -D__LIBFLOAT__
> --#CC=gcc -g -O2 -freg-struct-return -D__LIBFLOAT__
> -+CFLAGS= -O2 -freg-struct-return -fomit-frame-pointer -D__LIBFLOAT__ -msoft-float
> -+LIBGCC=$(shell $(CC) -print-libgcc-file-name)
> - AR=ar
> -
> - all: libfloat.a libfloat.so.1
> -@@ -12,24 +11,24 @@
> -
> - libfloat.so.1: softfloat.os fplib_glue.os
> - ? ? ? rm -f libfloat.so.1
> -- ? ? ?gcc -shared -Wl,-soname,libfloat.so.1 softfloat.os fplib_glue.os -o libfloat.so.1
> -+ ? ? ?$(LD) -shared -soname=libfloat.so.1 softfloat.os fplib_glue.os -o libfloat.so.1 $(LIBGCC)
> -
> - softfloat.o: softfloat/bits64/softfloat.c
> -- ? ? ?$(CC) -c -o softfloat.o -Isoftfloat/bits64/ARM-gcc softfloat/bits64/softfloat.c
> -+ ? ? ?$(CC) $(CFLAGS) -c -o softfloat.o -Isoftfloat/bits64/ARM-gcc softfloat/bits64/softfloat.c
> -
> - fplib_glue.o: fplib_glue.S
> -- ? ? ?$(CC) -c -o fplib_glue.o fplib_glue.S
> -+ ? ? ?$(CC) $(CFLAGS) -c -o fplib_glue.o fplib_glue.S
> -
> - softfloat.os: softfloat/bits64/softfloat.c
> -- ? ? ?$(CC) -fpic -c -o softfloat.os -Isoftfloat/bits64/ARM-gcc softfloat/bits64/softfloat.c
> -+ ? ? ?$(CC) $(CFLAGS) -fpic -c -o softfloat.os -Isoftfloat/bits64/ARM-gcc softfloat/bits64/softfloat.c
> -
> - fplib_glue.os: fplib_glue.S
> -- ? ? ?$(CC) -fpic -c -o fplib_glue.os fplib_glue.S
> -+ ? ? ?$(CC) $(CFLAGS) -fpic -c -o fplib_glue.os fplib_glue.S
> -
> - install: libfloat.a libfloat.so.1
> - ? ? ? cp -a libfloat.a $(DESTDIR)/usr/lib
> -- ? ? ?cp -a libfloat.so.1 $(DESTDIR)/usr/lib
> -- ? ? ?cd $(DESTDIR)/usr/lib; ln -s libfloat.so.1 libfloat.so
> -+ ? ? ?cp -a libfloat.so.1 $(DESTDIR)/lib
> -+ ? ? ?cd $(DESTDIR)/lib; ln -s libfloat.so.1 libfloat.so
> - ? ? ? #ldconfig
> -
> - clean:
> --
> 1.7.2.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

I have no problem with this library being removed, but my questions as
posted on gcc-help@ goes unanswered...

http://gcc.gnu.org/ml/gcc-help/2010-11/msg00211.html

I figured maybe I might get some visibility here as to why gcc still
has -lfloat in LIBGCC_SPEC.
I also re-posted this question on:
http://lists.arm.linux.org.uk/lurker/message/20101203.001116.a0f69061.en.html

Either 1) no one has answered this because I am obviously an idiot and
don't know some basic tribal knowledge, or 2) no one knows.

Any help understanding this would be very appreciated.

Thanks,

-Bryan
