From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Aug 2015 23:13:25 +0200
Subject: [Buildroot] [PATCH v1 2/3] aufs: new kernel extension.
In-Reply-To: <1438387017-10597-2-git-send-email-christian@paral.in>
References: <1438387017-10597-1-git-send-email-christian@paral.in>
 <1438387017-10597-2-git-send-email-christian@paral.in>
Message-ID: <20150803211325.GQ3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2015-07-31 16:56 -0700, Christian Stewart spake thusly:
> Adding a kernel extension that patches the kernel with the correct
> version of aufs-standalone. This relies on the user ensuring the
> correct version is set in the configs.

Some more nitial comments...

> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  linux/Config.ext.in                | 54 ++++++++++++++++++++++++++++++++++++++
>  linux/linux-ext-aufs-standalone.mk | 23 ++++++++++++++++
>  2 files changed, 77 insertions(+)
>  create mode 100644 linux/linux-ext-aufs-standalone.mk
> 
> diff --git a/linux/Config.ext.in b/linux/Config.ext.in
> index ea79aa1..b6b48cf 100644
> --- a/linux/Config.ext.in
> +++ b/linux/Config.ext.in
> @@ -62,4 +62,58 @@ config BR2_LINUX_KERNEL_EXT_FBTFT
>  
>  	  https://github.com/notro/fbtft
>  
> +# aufs-standalone
> +config BR2_LINUX_KERNEL_EXT_AUFS_STANDALONE
> +	bool "Aufs Filesystem Module patch"
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_AUFS_STANDALONE
> +	help
> +	  Aufs is split in two parts: a kernel part and a userspace
> +	  part. Enabling this option automatically selects the aufs
> +	  standalone (module) package and patches the Linux kernel
> +	  built by Buildroot with the aufs kernel part (ie fs/aufs).
> +
> +	  It is important to use the correct branch of aufs-standalone.
> +
> +comment "aufs needs a toolchain w/ threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
> +choice
> +	prompt "aufs major version"
> +	depends on BR2_LINUX_KERNEL_EXT_AUFS_STANDALONE

Remove this 'depends on' but enclose the options inside an if...endif
block.

> +	default BR2_PACKAGE_AUFS_4X if BR2_KERNEL_HEADERS_4_0 || BR2_KERNEL_HEADERS_4.1
> +	default BR2_PACKAGE_AUFS_3X if !(BR2_KERNEL_HEADERS_4_0 || BR2_KERNEL_HEADERS_4.1)

See the comment below, about kernel version...

> +config BR2_PACKAGE_AUFS_STANDALONE_4X
> +	bool "4.x"
> +
> +config BR2_PACKAGE_AUFS_STANDALONE_3X
> +	bool "3.x"
> +
> +endchoice
> +
> +# While we don't build from the kernel headers
> +# we can get a default value here
> +config BR2_PACKAGE_AUFS_STANDALONE_VERSION
> +	string "aufs-standalone branch"
> +	depends on BR2_LINUX_KERNEL_EXT_AUFS_STANDALONE
> +	help
> +	  Aufs-standalone repository branch to use. Must match kernel version.

The help entry goes last (i.e. after the defaults).

> +	default "3.0"  if BR2_KERNEL_HEADERS_3_0
> +	default "3.1"  if BR2_KERNEL_HEADERS_3_2 || BR2_KERNEL_HEADERS_3_4
> +	default "3.10" if BR2_KERNEL_HEADERS_3_10
> +	default "3.11" if BR2_KERNEL_HEADERS_3_11
> +	default "3.12" if BR2_KERNEL_HEADERS_3_12
> +	default "3.13" if BR2_KERNEL_HEADERS_3_13
> +	default "3.14" if BR2_KERNEL_HEADERS_3_14
> +	default "3.15" if BR2_KERNEL_HEADERS_3_15
> +	default "3.16" if BR2_KERNEL_HEADERS_3_16
> +	default "3.17" if BR2_KERNEL_HEADERS_3_17
> +	default "3.18" if BR2_KERNEL_HEADERS_3_18
> +	default "3.19" if BR2_KERNEL_HEADERS_3_19
> +	default "4.0"  if BR2_KERNEL_HEADERS_4_0
> +	default "4.1"  if BR2_KERNEL_HEADERS_4_1

So, this means we can't build aufs except with an internal toolchain.

Besides, the headers that were used to build the toolchain ar enot
necessarily the same version as the kernel that will be running on the
target.

That's just wrong. What we need to do here is just ask the user what
will be the version of the runnoing kernel (we can have a hint if
BR2_LINUX_KERNEL_LATEST_VERSION is set, or if BR2_TOOLCHAIN_BUILDROOT &&
BR2_LINUX_KERNEL_SAME_AS_HEADERS are set. Otherwise, we need the user to
tell us...

>  endmenu
> diff --git a/linux/linux-ext-aufs-standalone.mk b/linux/linux-ext-aufs-standalone.mk
> new file mode 100644
> index 0000000..4ef6d60
> --- /dev/null
> +++ b/linux/linux-ext-aufs-standalone.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +# Linux Aufs extensions
> +#
> +# Patch the linux kernel with aufs extension
> +################################################################################
> +
> +LINUX_EXTENSIONS += aufs-standalone
> +
> +define AUFS_STANDALONE_PREPARE_KERNEL
> +	if test -d $(LINUX_DIR)/fs/aufs/; then \
> +		echo "Your kernel already supports AUFS. Not patching."; \

This should be a hard-error.

Also, we want to check that the aufs version indeed matches that of hte
kernel, and error-out if not.

Regards,
Yann E. MORIN.

> +	else \
> +		$(APPLY_PATCHES) $(LINUX_DIR) $(AUFS_STANDALONE_SRCDIR) \
> +			$(AUFS_STANDALONE_MAJOR_VERSION)-kbuild.patch \
> +			$(AUFS_STANDALONE_MAJOR_VERSION)-base.patch \
> +			$(AUFS_STANDALONE_MAJOR_VERSION)-mmap.patch \
> +			$(AUFS_STANDALONE_MAJOR_VERSION)-standalone.patch ; \
> +	fi
> +	cp $(AUFS_STANDALONE_SRCDIR)/Documentation/ABI/testing/* $(LINUX_DIR)/Documentation/ABI/testing/
> +	cp -r $(AUFS_STANDALONE_SRCDIR)/Documentation/filesystems/aufs/ $(LINUX_DIR)/Documentation/filesystems/aufs/
> +	cp -r $(AUFS_STANDALONE_SRCDIR)/fs/aufs/ $(LINUX_DIR)/fs/
> +	cp $(AUFS_STANDALONE_SRCDIR)/include/uapi/linux/aufs_type.h $(LINUX_DIR)/include/uapi/linux/
> +endef
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
