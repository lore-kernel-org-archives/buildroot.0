From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:37 +0000
Subject: [Buildroot] [PATCH 28/32] package/systemd: add optional support for
	hwdb
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-29-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/Config.in  | 11 +++++++++++
 package/systemd/systemd.mk |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index b0dbdbd..432c8b9 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -307,4 +307,15 @@ config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
 	  When this feature is enabled, Systemd mounts smackfs and manages
 	  security labels for sockets.
 
+config BR2_PACKAGE_SYSTEMD_HWDB
+	bool "enable hardware database support"
+	help
+	  The hardware database is a key-value store for associating modalias-like
+	  keys to udev-property-like values. It is used primarily by udev to add the
+	  relevant properties to matching devices, but it can also be
+	  queried directly.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-hwdb.html
+	  http://www.freedesktop.org/software/systemd/man/hwdb.html
+
 endif # BR2_PACKAGE_SYSTEMD
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 9f64971..a32ccf2 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -271,6 +271,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-smack
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_HWDB),y)
+SYSTEMD_CONF_OPTS += --enable-hwdb
+else
+SYSTEMD_CONF_OPTS += --disable-hwdb
+endif
+
 # mq_getattr needs -lrt
 SYSTEMD_MAKE_OPTS += LIBS=-lrt
 SYSTEMD_MAKE_OPTS += LDFLAGS+=-ldl
-- 
1.9.1
