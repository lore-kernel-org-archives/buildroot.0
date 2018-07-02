From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:11:48 +0200
Subject: [Buildroot] [PATCH 14/50] package/busybox: invert dependency with
 sysklogd
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <a6684f106777bb21f8b9a1f0e4b5ec198002ae88.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk   | 1 +
 package/sysklogd/sysklogd.mk | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 655b4b4647..74629eb698 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_SYSKLOGD),sysklogd) \
 	$(if $(BR2_PACKAGE_SYSLOG_NG),syslog-ng) \
 	$(if $(BR2_PACKAGE_SYSTEMD),systemd) \
 	$(if $(BR2_PACKAGE_SYSVINIT),sysvinit) \
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 1c8259a9af..c4f064c10b 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -9,11 +9,6 @@ SYSKLOGD_SITE = http://www.infodrom.org/projects/sysklogd/download
 SYSKLOGD_LICENSE = GPL-2.0+
 SYSKLOGD_LICENSE_FILES = COPYING
 
-# Override BusyBox implementations if BusyBox is enabled.
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-SYSKLOGD_DEPENDENCIES = busybox
-endif
-
 # Override SKFLAGS which is used as CFLAGS.
 define SYSKLOGD_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) SKFLAGS="$(TARGET_CFLAGS) -DSYSV" \
-- 
2.14.1
