From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Apr 2013 23:41:29 +0200
Subject: [Buildroot] [PATCH v2 6/7] arch: Introduce blackfin-specific
 Makefile
In-Reply-To: <1364550643-11793-6-git-send-email-sonic.adi@gmail.com>
References: <1364550643-11793-1-git-send-email-sonic.adi@gmail.com>
 <1364550643-11793-6-git-send-email-sonic.adi@gmail.com>
Message-ID: <20130407234129.60c6ac9d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Fri, 29 Mar 2013 17:50:42 +0800, Sonic Zhang wrote:

> +config BR2_BFIN_INSTALL_FDPIC_SHARED
> +	depends on BR2_bfin && !BR2_BINFMT_FDPIC
> +	bool "Install FDPIC shared libraries"
> +	default y

Any reason to have this default to y ?

> +	help
> +	  Blackfin Linux kernel supports running both FDPIC and FLAT applications

	  The Blackfin Linux kernel ...

> +	  concurrently if the binary format specific libraries installed properly.

							are installed properly.

> +	  This option allow developer to install FDPIC libraries into a buildroot

			allows the developer

> +	  rootfs image built with binary format macro other than BR2_BINFMT_FDPIC.

			built with a binary format that is not FDPIC.

> +
> +config BR2_BFIN_INSTALL_FLAT_SHARED
> +	depends on BR2_bfin && !BR2_BINFMT_FLAT_SHARED
> +	bool "Install FLAT shared libraries"
> +	default y
> +	help
> +	  Blackfin Linux kernel supports running both FDPIC and FLAT applications
> +	  concurrently if the binary format specific libraries installed properly.
> +	  This option allow developer to install FLAT libraries into a buildroot
> +	  rootfs image built with binary format macro other than
> +	  BR2_BINFMT_FLAT_SHARED.

Same typos.

> diff --git a/arch/Makefile.in.bfin b/arch/Makefile.in.bfin
> new file mode 100644
> index 0000000..9089bc5
> --- /dev/null
> +++ b/arch/Makefile.in.bfin
> @@ -0,0 +1,22 @@
> +TARGETS_BFIN-$(BR2_BFIN_INSTALL_FDPIC_SHARED) += target-shared-libs-fdpic
> +TARGETS_BFIN-$(BR2_BFIN_INSTALL_FLAT_SHARED) += target-shared-libs-flat
> +TARGETS += $(TARGETS_BFIN-y)
> +
> +CROSS_COMPILE_SHARED_FDPIC ?= bfin-linux-uclibc-
> +target-shared-libs-fdpic:
> +	set -e; \
> +	t=`$(CROSS_COMPILE_SHARED_FDPIC)gcc $(CPUFLAGS) -print-file-name=libc.a`; \
> +	t=`dirname $$t`/../..; \
> +	for i in $$t/lib/*so*; do \
> +		i=`readlink -f "$$i"`; \
> +		soname=`$(CROSS_COMPILE_SHARED_FDPIC)readelf -d "$$i" | sed -n '/(SONAME)/s:.*[[]\(.*\)[]].*:\1:p'`; \
> +		$(INSTALL) -D $$i $(TARGET_DIR)/lib/$$soname; \
> +	done
> +
> +CROSS_COMPILE_SHARED_FLAT ?= bfin-uclinux-
> +target-shared-libs-flat:
> +	set -e; \
> +	t=`$(CROSS_COMPILE_SHARED_FLAT)gcc $(CPUFLAGS) -mid-shared-library -print-file-name=libc`; \
> +	if [ -f $$t -a ! -h $$t ] ; then \
> +		$(INSTALL) -D $$t $(TARGET_DIR)/lib/lib1.so; \
> +	fi

I am still not happy with this, because it simply doesn't work unless
you have the Blackfin toolchain installed globally on your system,
which simply isn't the case for normal users.

So I believe we should extend the external toolchain logic to be able
to use three variants of the Blackfin toolchain:

	* Only FDPIC
	* Only FLAT
	* Both FLAT and FDPIC

And then, this logic should be moved in the external toolchain logic,
where we already do the process of copying libraries from the toolchain
to the target, and from the toolchain to the staging directory.

Also:

 * $(CPUFLAGS) isn't defined anywhere

 * the logic to determine which .so files to copy should use the
   $(LIB_EXTERNAL_LIBS) and $(USR_LIB_EXTERNAL_LIBS) that we already
   use in ext-tool.mk.

 * I don't quite understand the logic you're using for the shared flat
   library copying. You use -print-file-name=libc, but then you copy it
   under the name 'lib1.so'. I think a comment above this part would be
   useful.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
