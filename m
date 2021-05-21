From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 May 2021 11:04:32 +0200
Subject: [Buildroot] [PATCH] package/ebtables: fix runtime in case of
 BR2_KERNEL_64_USERLAND_32
In-Reply-To: <20210518074628.24811-1-patrickdepinguin@gmail.com>
References: <20210518074628.24811-1-patrickdepinguin@gmail.com>
Message-ID: <fdc1055e-9811-24c6-4e5d-38dc0e2201cb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/05/2021 09:46, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> ebtables 2.0.11 no longer works correctly when userland is 32-bit and the
> kernel is 64-bit. This used to work correctly in version 2.0.10-4.
> 
> Problem is twofold:
> - ebtables itself was broken and needs to be patched
> - buildroot needs to pass the correct flag again to indicate when we are in
>   this situation
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

 Applied to master, thanks.

> ---
>  ...estore-KERNEL_64_USERSPACE_32-checks.patch | 104 ++++++++++++++++++
>  ...-option-enable-kernel-64-userland-32.patch |  50 +++++++++
>  package/ebtables/ebtables.mk                  |   6 +
>  3 files changed, 160 insertions(+)
>  create mode 100644 package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch
>  create mode 100644 package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch
> 
> diff --git a/package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch b/package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch
> new file mode 100644
> index 0000000000..61e5b63b12
> --- /dev/null
> +++ b/package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch
> @@ -0,0 +1,104 @@
> +From 7297a8ef3cab3b0faf1426622ee902a2144e2e89 Mon Sep 17 00:00:00 2001
> +From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> +Date: Wed, 24 Mar 2021 11:27:14 +0100
> +Subject: [PATCH] ebtables.h: restore KERNEL_64_USERSPACE_32 checks
> +
> +Commit e6359eedfbf497e52d52451072aea4713ed80a88 replaced the file ebtables.h
> +but removed the usage of KERNEL_64_USERSPACE_32. This breaks boards where
> +such flag is relevant, with following messages:
> +
> +[ 6364.971346] kernel msg: ebtables bug: please report to author: Standard target size too big
> +
> +Unable to update the kernel. Two possible causes:
> +1. Multiple ebtables programs were executing simultaneously. The ebtables
> +   userspace tool doesn't by default support multiple ebtables programs running
> +   concurrently. The ebtables option --concurrent or a tool like flock can be
> +   used to support concurrent scripts that update the ebtables kernel tables.
> +2. The kernel doesn't support a certain ebtables extension, consider
> +   recompiling your kernel or insmod the extension.
> +
> +Analysis shows that the structure 'ebt_replace' passed from userspace
> +ebtables to the kernel, is too small, i.e 80 bytes instead of 120 in case of
> +64-bit kernel.
> +
> +Note that the ebtables build system seems to assume that 'sparc64' is the
> +only case where KERNEL_64_USERSPACE_32 is relevant, but this is not true.
> +This situation can happen on many architectures, especially in embedded
> +systems. For example, an Aarch64 processor with kernel in 64-bit but
> +userland build for 32-bit Arm. Or a 64-bit MIPS Octeon III processor, with
> +userland running in the 'n32' ABI.
> +
> +Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

 I've added the patchwork reference to both patches.

[snip]
> +diff --git a/configure.ac b/configure.ac
> +index c24ede3..3e89c0c 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -15,10 +15,17 @@ AS_IF([test "x$LOCKFILE" = x], [LOCKFILE="/var/lib/ebtables/lock"])
> + 
> + regular_CFLAGS="-Wall -Wunused"
> + regular_CPPFLAGS=""
> ++
> + case "$host" in
> + 	sparc64-*)
> +-		regular_CPPFLAGS="$regular_CPPFLAGS -DEBT_MIN_ALIGN=8 -DKERNEL_64_USERSPACE_32";;
> ++		enable_kernel_64_userland_32=yes ;;
> + esac
> ++AC_ARG_ENABLE([kernel-64-userland-32],
> ++    AC_HELP_STRING([--enable-kernel-64-userland-32], [indicate that ebtables will be built as a 32-bit application but run under a 64-bit kernel])
> ++)
> ++AS_IF([test "x$enable_kernel_64_userland_32" = xyes],
> ++    [regular_CPPFLAGS="$regular_CPPFLAGS -DEBT_MIN_ALIGN=8 -DKERNEL_64_USERSPACE_32"]

 Since the proper name is userspace, not userland, I think upstream will want
you to rename that configure option.

 I don't know, however, so I've applied as-is. Whoever bumps ebtables will
notice when the patch gives a conflict.


 Regards,
 Arnout

> ++)
> + 
> + AC_SUBST([regular_CFLAGS])
> + AC_SUBST([regular_CPPFLAGS])
> +-- 
> +2.26.2
> +
> diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
> index 54932334c2..2f9dd5ac4b 100644
> --- a/package/ebtables/ebtables.mk
> +++ b/package/ebtables/ebtables.mk
> @@ -11,6 +11,12 @@ EBTABLES_LICENSE_FILES = COPYING
>  EBTABLES_CPE_ID_VENDOR = netfilter
>  EBTABLES_SELINUX_MODULES = iptables
>  
> +# for 0003-configure.ac-add-option-enable-kernel-64-userland-32.patch
> +EBTABLES_AUTORECONF = YES
> +ifeq ($(BR2_KERNEL_64_USERLAND_32),y)
> +EBTABLES_CONF_OPTS += --enable-kernel-64-userland-32
> +endif
> +
>  ifeq ($(BR2_PACKAGE_EBTABLES_UTILS_SAVE),y)
>  define EBTABLES_INSTALL_TARGET_UTILS_SAVE
>  	$(INSTALL) -m 0755 -D $(@D)/ebtables-save.sh $(TARGET_DIR)/usr/sbin/ebtables-legacy-save
> 
