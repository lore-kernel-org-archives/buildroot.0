From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:38 +0000
Subject: [Buildroot] [PATCH 29/32] package/systemd: add optional support for
	hibernation
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-30-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/Config.in  | 8 ++++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 432c8b9..21ea032 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -318,4 +318,12 @@ config BR2_PACKAGE_SYSTEMD_HWDB
 	  http://www.freedesktop.org/software/systemd/man/systemd-hwdb.html
 	  http://www.freedesktop.org/software/systemd/man/hwdb.html
 
+config BR2_PACKAGE_SYSTEMD_HIBERNATE
+	bool "enable hibernation support"
+	help
+	  When this features is enabled, additional tools and services are built to
+	  support suspending and resuming the system.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-sleep.html
+
 endif # BR2_PACKAGE_SYSTEMD
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index a32ccf2..b9de3b7 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -277,6 +277,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-hwdb
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_HIBERNATE),y)
+SYSTEMD_CONF_OPTS += --enable-hibernate
+else
+SYSTEMD_CONF_OPTS += --disable-hibernate
+endif
+
 # mq_getattr needs -lrt
 SYSTEMD_MAKE_OPTS += LIBS=-lrt
 SYSTEMD_MAKE_OPTS += LDFLAGS+=-ldl
-- 
1.9.1
