From: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Date: Tue, 1 Mar 2016 12:13:33 +0530
Subject: [Buildroot] [Buildroot PATCH Selinux v10 07/11] qemu x86
 selinux: base br defconfig
In-Reply-To: <20160223225525.1afdff9d@free-electrons.com>
References: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
 <1455603506-26138-7-git-send-email-niranjan.reddy@rockwellcollins.com>
 <20160223225525.1afdff9d@free-electrons.com>
Message-ID: <CAMshMJZUyV8NhrWdryfbmQrB0eb03Vz15ZT_jfW6Nbh9vxQLAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wed, Feb 24, 2016 at 3:25 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Niranjan Reddy,
>
> On Tue, 16 Feb 2016 11:48:22 +0530, Niranjan Reddy wrote:
> > From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> >
> > This will build a base SELinux system that boots with SELinux
> > in permissive mode. Also adding documentation on how to use it.
> >
> > Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > Signed-off-by: Niranjan <niranjan.reddy@rockwellcollins.com>
>
> I think this defconfig is a very good idea. However, there are some
> issues with the way things are implemented below.
>
> >  board/qemu/x86/linux-4.0-selinux.config | 77
> +++++++++++++++++++++++++++++++++
>
> Rather than a full defconfig, can you use a defconfig fragment, and
> combine the regular Qemu x86 defconfig with your SELinux defconfig
> fragment?
>

OK. So should i combine in this manner and make a single configuration file
with selinux as optional ??

linux-4.3.config & linux-4.0-selinux.config  ==> linux-selinux.config

qemu_x86_defconfig & qemu_x86_selinux_defconfig  ==>
qemu_x86_optionalselinux_defconfig



>
> > diff --git a/configs/qemu_x86_selinux_defconfig
> b/configs/qemu_x86_selinux_defconfig
> > new file mode 100644
> > index 0000000..feb4534
> > --- /dev/null
> > +++ b/configs/qemu_x86_selinux_defconfig
> > @@ -0,0 +1,67 @@
> > +# Architecture
> > +BR2_x86_pentiumpro=y
> > +
> > +# Default to the latest Code Sourcery
> > +BR2_TOOLCHAIN_EXTERNAL=y
>
> We normally default to the internal toolchain backend. If using glibc
> is required for proper SELinux operation, it is fine to use glibc.
>
>
  Agree. will change to internal toolchain and use glibc.


> > +
> > +# Select SYSV init to provide selinux enabled init
> > +BR2_INIT_SYSV=y
> > +
> > +# Default password to allow PAM login
> > +BR2_TARGET_GENERIC_ROOT_PASSWD="root"
> > +
> > +# Default the shell to bash, sh symlinks to busybox which
> > +# is not compatible with refpolicy
> > +BR2_SYSTEM_BIN_SH_BASH=y
>
> Even with the one file per binary approach of Busybox? sh is going to
> be a symlink to ash, which is a real binary, very much like sh is going
> to be a symlink to bash when bash is enabled.
>
> > +
> > +# Pull in SELinux specific file overlay to allow login
> > +# in enforcing mode.
> > +BR2_ROOTFS_DEVICE_TABLE="system/device_table.txt
> board/common_selinux/skeleton_permissions.txt"
> > +BR2_ROOTFS_OVERLAY="board/common_selinux/skeleton"
> > +BR2_ROOTFS_POST_BUILD_SCRIPT="board/common_selinux/post_build.sh"
>
> All those files are only added in PATCH 11/11. So basically this patch
> and PATCH 11/11 should be merged together.
>

  Agree.


>
> > +
> > +# Lock to a kernel that's been tested against selinux libs
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0"
> > +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> >
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.0-selinux.config"
> > +
> > +# Customized busybox config providing a tailored
> > +# balance of applets vs full apps
> > +BR2_PACKAGE_BUSYBOX_CONFIG="board/common_selinux/busybox-selinux.config"
>
> Ditto, this file is only introduced in PATCH 11/11.
>

Agree.

>
> > +
> > +# Ensure busybox is built as individual binaries for the
> > +# SELinux refpolicy to work correctly
> > +BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES=y
> > +
> > +# Audit service
> > +BR2_PACKAGE_AUDIT=y
> > +
> > +# Enhanced authentication with selinux hooks
> > +BR2_PACKAGE_LINUX_PAM=y
> > +
> > +# Full version of login with SELinux support
> > +BR2_PACKAGE_UTIL_LINUX=y
> > +BR2_PACKAGE_UTIL_LINUX_BINARIES=y
> > +BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS=y
> > +
> > +# SSH daemon for secure login
> > +BR2_PACKAGE_OPENSSH=y
> > +
> > +# Provides tools for fs security context relabeling
> > +BR2_PACKAGE_POLICYCOREUTILS=y
> > +
> > +# SELinux policy config/definition
> > +BR2_PACKAGE_REFPOLICY=y
> > +
> > +# Logging daemon
> > +BR2_PACKAGE_RSYSLOG=y
> > +
> > +#rootfs with spare space for fs relabel activity
> > +BR2_TARGET_ROOTFS_EXT2=y
> > +BR2_TARGET_ROOTFS_EXT2_RESBLKS=5
> > +# BR2_TARGET_ROOTFS_TAR is not set
> > +
> > +# Offline tools for policy analysis/building
> > +BR2_PACKAGE_HOST_CHECKPOLICY=y
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com


Thanks,
Niranjan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160301/31caa990/attachment.html>
