From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Apr 2017 13:02:27 +0200
Subject: [Buildroot] [PATCH] syslinux: Builds with the target toolchain
In-Reply-To: <1491386987-6695-1-git-send-email-benoit.allard@greenbone.net>
References: <1491386987-6695-1-git-send-email-benoit.allard@greenbone.net>
Message-ID: <20170405130227.10a029e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks a lot for doing this work. I have a number of comments below,
nothing really major.

First of all, this deserves a longer commit log to explain why you're
doing this.

On Wed,  5 Apr 2017 12:09:47 +0200, Beno?t Allard wrote:
> Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
> ---
>  DEVELOPERS                                             |  1 +

This change should be in a separate patch. For new packages, we want it
to be with the patch adding the package. But since the syslinux package
already exists, it should be a separate patch, as it's unrelated to
making syslinux build with the target toolchain.

> diff --git a/boot/syslinux/0003-fix_ftbfs_no_dynamic_linker.patch b/boot/syslinux/0003-fix_ftbfs_no_dynamic_linker.patch
> new file mode 100644
> index 0000000..dacc07c
> --- /dev/null
> +++ b/boot/syslinux/0003-fix_ftbfs_no_dynamic_linker.patch
> @@ -0,0 +1,16 @@
> +Fix for https://bugs.debian.org/846679 : syslinux: FTBFS: ld:
> +ldlinux.elf: Not enough room for program headers, try linking with -N
> +
> +Patch from: Steve McIntyre <93sam@debian.org>
> +https://bugs.debian.org/cgi-bin/bugreport.cgi?att=1;bug=846679;filename=syslinux_6.03%2Bdfsg-14.1.debdiff;msg=10

This needs your Signed-off-by as well. Also leave an empty line between
the Signed-off-by line and the start of the patch itself.

> diff --git a/boot/syslinux/0004-fix-ld-oformat-32bits.patch b/boot/syslinux/0004-fix-ld-oformat-32bits.patch
> new file mode 100644
> index 0000000..2187772
> --- /dev/null
> +++ b/boot/syslinux/0004-fix-ld-oformat-32bits.patch
> @@ -0,0 +1,15 @@
> +Force ld to output i386 bytecodes and not x86_64 to be consistent with the
> +other .o files.
> +
> +Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>

Ditto: add an empty line here. But in fact, since syslinux is using Git
(http://www.syslinux.org/wiki/index.php?title=Development), we would
like to have Git-formatted patches instead (i.e patches generated with
git format-patch).

> diff --git a/boot/syslinux/0005-build-utils-with-host-toolchain.patch b/boot/syslinux/0005-build-utils-with-host-toolchain.patch
> new file mode 100644
> index 0000000..09778d3
> --- /dev/null
> +++ b/boot/syslinux/0005-build-utils-with-host-toolchain.patch
> @@ -0,0 +1,18 @@
> +The utilities are meant to run on the host machine, hence must be built using
> +the host toolchain.
> +
> +Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>

Please  format with "git format-patch" as well.

> +--- a/utils/Makefile	2017-04-05 11:49:48.156097181 +0200
> ++++ b/utils/Makefile	2017-04-05 11:50:30.234872515 +0200
> +@@ -17,8 +17,9 @@
> + VPATH = $(SRC)
> + include $(MAKEDIR)/syslinux.mk
> + 
> +-CFLAGS   = $(GCCWARN) -Os -fomit-frame-pointer -D_FILE_OFFSET_BITS=64 -I$(SRC)
> +-LDFLAGS  = -O2
> ++CC       = $(HOSTCC)
> ++CFLAGS   = $(HOST_CFLAGS) $(GCCWARN) -Os -fomit-frame-pointer -D_FILE_OFFSET_BITS=64 -I$(SRC)
> ++LDFLAGS  = $(HOST_LDFLAGS) -O2
> + 
> + C_TARGETS	 = isohybrid gethostip memdiskfind
> + SCRIPT_TARGETS	 = mkdiskimage

Also, if you could submit those patches to the upstream syslinux
project, it would be nice.



> diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
> index 5b7906c..50feea3 100644
> --- a/boot/syslinux/syslinux.mk
> +++ b/boot/syslinux/syslinux.mk
> @@ -51,8 +51,10 @@ SYSLINUX_POST_PATCH_HOOKS += SYSLINUX_CLEANUP
>  # and the internal zlib should take precedence so -I shouldn't
>  # be used.
>  define SYSLINUX_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
> -		AR="$(HOSTAR)" $(SYSLINUX_EFI_ARGS) -C $(@D) $(SYSLINUX_TARGET)
> +        $(TARGET_MAKE_ENV) $(MAKE1) \
> +            CC="$(TARGET_CC)" LD="$(TARGET_LD)" NASM="$(HOST_DIR)/usr/bin/nasm" \
> +            HOSTCC="$(HOSTCC)" HOST_CFLAGS="$(HOST_CFLAGS)" HOST_LDFLAGS="$(HOST_LDFLAGS)" \

In fact, it would have been better to use CC_FOR_BUILD,
CFLAGS_FOR_BUILD, LDFLAGS_FOR_BUILD in the syslinux Makefile. If you do
this, then you can simplify this to:

	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) \
		NASM=... $(SYSLINUX_EFI_ARGS) -C $(@D) $(SYSLINUX_TARGET)

>  # Repeat CC and AR, since syslinux really wants to check them at
>  # install time

You're no longer repeating CC and AR, so this comment no longer makes
sense.

>  define SYSLINUX_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
> -		AR="$(HOSTAR)" $(SYSLINUX_EFI_ARGS) INSTALLROOT=$(HOST_DIR) \
> -		-C $(@D) $(SYSLINUX_TARGET) install
> +	$(TARGET_MAKE_ENV) $(MAKE) $(SYSLINUX_EFI_ARGS) INSTALLROOT=$(HOST_DIR) -C $(@D) $(SYSLINUX_TARGET) install
>  endef

It would also be good in the commit log to explicitly say that you have
tested this with a x86-64 Buildroot toolchain, and that it produces as
expected a working 32-bit syslinux, tested on HW.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
