From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Dec 2011 23:30:26 +0100
Subject: [Buildroot] [PATCH 5/7] util-linux: add host variant for
	host-lttng-babeltrace
In-Reply-To: <cover.1324506157.git.thomas.petazzoni@free-electrons.com>
References: <cover.1324506157.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9b50cf34e1292e99408dd810852cfa7faf404bd2.1324506157.git.thomas.petazzoni@free-electrons.com>
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
 package/util-linux/util-linux.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index a3d6e13..6bffc2c 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -67,7 +67,16 @@ UTIL_LINUX_CONF_OPT += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-login-utils) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write)
 
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
