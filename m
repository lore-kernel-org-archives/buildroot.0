From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 31 Jan 2012 23:49:53 +0100
Subject: [Buildroot] [git commit] util-linux: add host variant for
	host-lttng-babeltrace
Message-ID: <20120131232309.EE35190953@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=421344df699f7545cf405048acbf4f9cd496b359
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lttng-babeltrace needs libuuid, which is provided by util-linux, and
since we want to build lttng-babeltrace for the host, we need to build
libuuid for the host. It's a shame that libuuid is part of such a big
package as util-linux.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
