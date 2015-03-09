From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  9 Mar 2015 20:42:57 +0100
Subject: [Buildroot] [PATCH v1 2/3] postgresql: fix IPv6 detection for
	uclibc compile
In-Reply-To: <1425930178-16084-1-git-send-email-ps.report@gmx.net>
References: <1425930178-16084-1-git-send-email-ps.report@gmx.net>
Message-ID: <1425930178-16084-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Assist configure IPv6 support detection for uclibc,
fixes the following uclibc compile failure:

auth.c: In function ?CheckRADIUSAuth?:
auth.c:2379:24: error: ?in6addr_any? undeclared (first use in this function)
  localaddr.sin6_addr = in6addr_any;

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Tested with the following buildroot defonfig:

BR2_arm=y
BR2_arm1176jzf_s=y
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="3.18"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="246530ff8a4f302b8666c6d9cf509407d8c1257a"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/raspberrypi/linux-3.18-rpi-dt.defconfig"
BR2_LINUX_KERNEL_ZIMAGE=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
BR2_PACKAGE_POSTGRESQL=y
---
 package/postgresql/postgresql.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 03154af..7ebf795 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -14,6 +14,12 @@ POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+# overwrite IPV6 detection
+ifeq ($(BR2_INET_IPV6),y)
+POSTGRESQL_CONF_ENV += ac_cv_type_struct_sockaddr_in6=yes
+else
+POSTGRESQL_CONF_ENV += ac_cv_type_struct_sockaddr_in6=no
+endif
 # PostgreSQL does not build against uClibc with locales
 # enabled, due to an uClibc bug, see
 # http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html
-- 
2.1.4
