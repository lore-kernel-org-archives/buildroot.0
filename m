From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:15 +0200
Subject: [Buildroot] [PATCH 15/31] package/systemd: add optional support for
	hibernation
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-15-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gabe Evans <gabe@hashrabbit.co>

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/Config.in  | 10 +++++++++-
 package/systemd/systemd.mk |  6 ++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index a857a95..3fcb74d 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -308,4 +308,12 @@ config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
 	  When this feature is enabled, Systemd mounts smackfs and manages
 	  security labels for sockets.
 
-endif
+config BR2_PACKAGE_SYSTEMD_HIBERNATE
+	bool "enable hibernation support"
+	help
+	  When this features is enabled, additional tools and services are built to
+	  support suspending and resuming the system.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-sleep.html
+
+endif # BR2_PACKAGE_SYSTEMD
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5b0aa01..96c34a4 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -277,6 +277,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-smack
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
2.8.1
