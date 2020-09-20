From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 20 Sep 2020 17:06:58 +0200
Subject: [Buildroot] [PATCH v1 2/3] package/postgresql: needs locale command
In-Reply-To: <20200920150659.7562-1-ps.report@gmx.net>
References: <20200920150659.7562-1-ps.report@gmx.net>
Message-ID: <20200920150659.7562-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Running (as e.g. /etc/init.d/S50postgresql does):

  su - postgres -c '/usr/bin/pg_ctl initdb -D /var/lib/pgsql'

gives the following warning:

  performing post-bootstrap initialization ... sh: locale: not found
  1970-01-01 01:13:43.498 UTC [246] WARNING:  no usable system locales were found
  ok

Strace (greped for locale) of the command shows:

  247   execve("/bin/sh", ["sh", "-c", "locale -a"], 0x1ece86e0 /* 18 vars */ <unfinished ...>
  247   newfstatat(AT_FDCWD, "/bin/locale", 0x7fcbe31a30, 0) = -1 ENOENT (No such file or directory)
  247   newfstatat(AT_FDCWD, "/sbin/locale", 0x7fcbe31a30, 0) = -1 ENOENT (No such file or directory)
  247   newfstatat(AT_FDCWD, "/usr/bin/locale", 0x7fcbe31a30, 0) = -1 ENOENT (No such file or directory)
  247   newfstatat(AT_FDCWD, "/usr/sbin/locale", 0x7fcbe31a30, 0) = -1 ENOENT (No such file or directory)
  247   write(2, "locale: not found", 17) = 17

Fix it by selecting BR2_PACKAGE_GLIBC_UTILS providing the locale command
for glibc.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:

 - tested with the following defconfig

    BR2_aarch64=y
    BR2_cortex_a72=y
    BR2_ARM_FPU_VFPV4=y
    BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
    BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
    BR2_TOOLCHAIN_BUILDROOT_CXX=y
    BR2_SYSTEM_DHCP="eth0"
    BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
    BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
    BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay --aarch64"
    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
    BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,1c64f4bc22811d2d371b271daa3fb27895a8abdd)/linux-1c64f4bc22811d2d371b271daa3fb27895a8abdd.tar.gz"
    BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
    BR2_LINUX_KERNEL_DTS_SUPPORT=y
    BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b"
    BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
    BR2_PACKAGE_STRACE=y
    BR2_PACKAGE_RPI_FIRMWARE=y
    BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
    BR2_PACKAGE_POSTGRESQL=y
    BR2_TARGET_ROOTFS_EXT2=y
    BR2_TARGET_ROOTFS_EXT2_4=y
    BR2_TARGET_ROOTFS_EXT2_SIZE="192M"
    # BR2_TARGET_ROOTFS_TAR is not set
    BR2_PACKAGE_HOST_DOSFSTOOLS=y
    BR2_PACKAGE_HOST_GENIMAGE=y
    BR2_PACKAGE_HOST_MTOOLS=y
---
 package/postgresql/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index 2f677daf5b..b15d34d3f0 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_POSTGRESQL
 	# postgresql is unlikely to be used in a pure statically
 	# linked environment.
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_GLIBC_UTILS if BR2_PACKAGE_GLIBC # locale cmd
 	help
 	  PostgreSQL is a powerful, open source object-relational
 	  database system.
-- 
2.28.0
