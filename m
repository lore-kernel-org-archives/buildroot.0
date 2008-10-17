From: Shinya Kuribayashi <skuribay@ruby.dti.ne.jp>
Date: Sat, 18 Oct 2008 01:40:24 +0900
Subject: [Buildroot] [PATCH 3/9] Add support for multilib external
	toolchains
In-Reply-To: <20081016203230.15826.93873.stgit@localhost.localdomain>
References: <20081016203220.15826.26173.stgit@localhost.localdomain>
	<20081016203230.15826.93873.stgit@localhost.localdomain>
Message-ID: <48F8BFF8.2050509@ruby.dti.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Grant,

Grant Likely wrote:
> However, buildroot needs copy the correct version of the libraries to
> match the flags used to compile the applications.

Right.  External toolchain + Multilib support has been one of buildroot
problems.  I also have some hacks on this , but could not make it into
good shape.

I gave it a try, and it works fine; appropriate libraries are copied to
rootfs.  Here's a log with MIPS toolchain (Sourcery G++ Lite):

----------------------------------------------------------------
mkdir -p /home/skuribay/devel/buildroot/project_build_mips/uclibc/root/lib
copy_toolchain_lib_root multilib=uclibc/soft-float lib=libc.so.0 dst=/lib
copy_toolchain_lib_root multilib=uclibc/soft-float lib=libuClibc-0.9.29.so dst=/lib
for libs in ld-uClibc.so.0 libcrypt.so.0 libdl.so.0 libgcc_s.so libm.so.0 libnsl.so.0 libpthread.so.0 libresolv.so.0 librt.so.0 libutil.so.0; do \
                LIB="$libs"; DST="/lib"; STRIP="y"; LIB_DIR=`/opt/codesourcery/mips-4.2/bin/mips-linux-gnu-gcc -Os -pipe -muclibc -msoft-float -print-file-name=${LIB} | sed -e "s,/${LIB}\$,,"`; MULTILIB=`/opt/codesourcery/mips-4.2/bin/mips-linux-gnu-gcc -Os -pipe -muclibc -msoft-float -print-multi-directory`; if test -z "${LIB_DIR}"; then echo "copy_toolchain_lib_root: lib=${LIB} not found"; exit -1; fi; LIB="$libs"; for FILE in `find ${LIB_DIR} -maxdepth 1 -type l -name "${LIB}*"`; do LIB=`basename ${FILE}`; while test \! -z "${LIB}"; do echo "copy_toolchain_lib_root multilib=${MULTILIB} lib=${LIB} dst=${DST}"; rm -fr /home/skuribay/devel/buildroot/project_build_mips/uclibc/root${DST}/${LIB}; mkdir -p /home/skuribay/devel/buildroot/project_build_mips/uclibc/root${DST}; if test -h ${LIB_DIR}/${LIB}; then cp -d ${LIB_DIR}/${LIB} /home/skuribay/devel/buildroot/project_build_mips/uclibc/root${DST}/; elif test -f ${LIB_DIR}/${LIB}; then cp ${LIB_DIR}/${LIB} /home/skuribay/devel/b
uildroot/project_build_mips/uclibc/root${DST}/${LIB}; case "${STRIP}" in (0 | n | no) ;; (*) /opt/codesourcery/mips-4.2/bin/mips-linux-gnu-strip "/home/skuribay/devel/buildroot/project_build_mips/uclibc/root${DST}/${LIB}"; ;; esac; else exit -1; fi; LIB="`readlink ${LIB_DIR}/${LIB}`"; done; done; echo -n; \
        done
copy_toolchain_lib_root multilib=uclibc/soft-float lib=ld-uClibc.so.0 dst=/lib
copy_toolchain_lib_root multilib=uclibc/soft-float lib=ld-uClibc-0.9.29.so dst=/lib
copy_toolchain_lib_root multilib=uclibc/soft-float lib=libcrypt.so.0 dst=/lib
copy_toolchain_lib_root multilib=uclibc/soft-float lib=libcrypt-0.9.29.so dst=/lib
copy_toolchain_lib_root multilib=uclibc/soft-float lib=libdl.so.0 dst=/lib
copy_toolchain_lib_root multilib=uclibc/soft-float lib=libdl-0.9.29.so dst=/lib
copy_toolchain_lib_root multilib=uclibc/soft-float lib=libgcc_s.so dst=/lib
copy_toolchain_lib_root multilib=uclibc/soft-float lib=libgcc_s.so.1 dst=/lib
copy_toolchain_lib_root multilib=uclibc/soft-float lib=libm.so.0 dst=/lib
copy_toolchain_lib_root multilib=uclibc/soft-float lib=libm-0.9.29.so dst=/lib
copy_toolchain_lib_root multilib=uclibc/soft-float lib=libnsl.so.0 dst=/lib
copy_toolchain_lib_root multilib=uclibc/soft-float lib=libnsl-0.9.29.so dst=/lib
copy_toolchain_lib_root multilib=uclibc/soft-float lib=libpthread.so.0 dst=/lib
copy_toolchain_lib_root multilib=uclibc/soft-float lib=libpthread-0.9.29.so dst=/lib
copy_toolchain_lib_root multilib=uclibc/soft-float lib=libresolv.so.0 dst=/lib
copy_toolchain_lib_root multilib=uclibc/soft-float lib=libresolv-0.9.29.so dst=/lib
copy_toolchain_lib_root multilib=uclibc/soft-float lib=librt.so.0 dst=/lib
copy_toolchain_lib_root multilib=uclibc/soft-float lib=librt-0.9.29.so dst=/lib
copy_toolchain_lib_root multilib=uclibc/soft-float lib=libutil.so.0 dst=/lib
copy_toolchain_lib_root multilib=uclibc/soft-float lib=libutil-0.9.29.so dst=/lib
*** Using kernel-headers generated from kernel source
rm -rf /home/skuribay/devel/buildroot/toolchain_build_mips/linux
[ -d /home/skuribay/devel/buildroot/toolchain_build_mips ] || /usr/bin/install -d /home/skuribay/devel/buildroot/toolchain_build_mips
bzcat /home/skuribay/devel/buildroot/dl/linux-2.6.27.tar.bz2 | tar -C /home/skuribay/devel/buildroot/toolchain_build_mips   -xf -
make: *** [/home/skuribay/devel/buildroot/toolchain_build_mips/linux-2.6.27/.unpacked] Interrupt

skuribay at ubuntu:~/devel/buildroot$ 
skuribay at ubuntu:~/devel/buildroot$ mips-linux-gnu-gcc --version
mips-linux-gnu-gcc (Sourcery G++ Lite 4.2-177) 4.2.3
Copyright (C) 2007 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

skuribay at ubuntu:~/devel/buildroot$ 
----------------------------------------------------------------

So, ack.

Acked-by: Shinya Kuribayashi <skuribay@ruby.dti.ne.jp>

> diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
> index bbf430c..ba10dc7 100644
> --- a/toolchain/external-toolchain/ext-tool.mk
> +++ b/toolchain/external-toolchain/ext-tool.mk
> @@ -10,7 +10,8 @@ copy_toolchain_lib_root = \
>  	DST="$(strip $2)"; \
>  	STRIP="$(strip $3)"; \
>   \
> -	LIB_DIR=`$(TARGET_CC) -print-file-name=$${LIB} | sed -e "s,/$${LIB}\$$,,"`; \
> +	LIB_DIR=`$(TARGET_CC) $(subst ",,$(BR2_TARGET_OPTIMIZATION)) -print-file-name=$${LIB} | sed -e "s,/$${LIB}\$$,,"`; \
> +	MULTILIB=`$(TARGET_CC) $(subst ",,$(BR2_TARGET_OPTIMIZATION)) -print-multi-directory`; \

By the way,
I have to mention about one more known problem.  External toolchain +
Software-floating-point-option also doesn't work.  So, we have to give
`-msoft-float' option to $(BR2_TARGET_OPTIMIZATION) directly.

The curprit is package/Makefile.in.  $(BR2_SOFT_FLOAT) is only effective
when buildroot toolchain is selected.  This is not soft-float-point only
issue, but also applied to other remaining menu-options of external
toolchain.  Nothing is handled with external toolchains as below:

(package/Makefile.in)-------------------------------------------
# else it's an external toolchain
#########################################################################
else
TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include -I$(TOOLCHAIN_EXTERNAL_PATH)/$(TOOLCHAIN_EXTERNAL_PREFIX)/include
TARGET_CXXFLAGS=$(TARGET_CFLAGS)
TARGET_LDFLAGS=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
endif
#########################################################################
----------------------------------------------------------------

If someone has some patches on this, we'd like to see them.

Thanks,

  Shinya
