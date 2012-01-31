From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jan 2012 20:40:05 +0100
Subject: [Buildroot] [PATCH 7/8] util-linux: add host variant for
	host-lttng-babeltrace
In-Reply-To: <cover.1328038759.git.thomas.petazzoni@free-electrons.com>
References: <cover.1328038759.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b2a0f7f41aaba9aa1691286d04bb51fe3b6a35f6.1328038759.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lttng-babeltrace needs libuuid, which is provided by util-linux, and
since we want to build lttng-babeltrace for the host, we need to build
libuuid for the host. It's a shame that libuuid is part of such a big
package as util-linux.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/util-linux.mk |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index a3d6e13..86d970f 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -13,6 +13,9 @@ UTIL_LINUX_DEPENDENCIES = host-pkg-config
 
 UTIL_LINUX_CONF_OPT += --disable-rpath --disable-makeinstall-chown
 
+# We don't want the host-busybox dependency to be added automatically
+HOST_UTIL_LINUX_DEPENDENCIES = host-pkg-config
+
 # If both util-linux and busybox are selected, make certain util-linux
 # wins the fight over who gets to have their utils actually installed
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
@@ -67,7 +70,18 @@ UTIL_LINUX_CONF_OPT += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-login-utils) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write)
 
+# In the host version of util-linux, we so far only require libuuid,
+# and none of the util-linux utilities, so we disable all of them.
+HOST_UTIL_LINUX_CONF_OPT += \
+	--enable-libuuid \
+	--disable-mount --disable-fsck --disable-libmount \
+	--disable-uuidd --disable-libblkid --disable-agetty \
+	--disable-cramfs --disable-switch_root --disable-pivot_root \
+	--disable-fallocate --disable-unshare --disable-rename \
+	--disable-schedutils --disable-wall --disable-partx
+
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
 
 # MKINSTALLDIRS comes from tweaked m4/nls.m4, but autoreconf uses staging
 # one, so it disappears
-- 
1.7.4.1
