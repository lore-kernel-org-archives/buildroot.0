From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Jun 2012 18:13:51 +0200
Subject: [Buildroot] [PATCH 01/10] monit: new package
In-Reply-To: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
References: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
Message-ID: <76ee26a62979c235a63db61ecf4b631889531f2a.1338653505.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in       |    3 +++
 package/monit/Config.in |   10 ++++++++++
 package/monit/monit.mk  |   30 ++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 package/monit/Config.in
 create mode 100644 package/monit/monit.mk

diff --git a/package/Config.in b/package/Config.in
index ca8fc96..61f3fec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -644,6 +644,9 @@ source "package/htop/Config.in"
 source "package/kmod/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/module-init-tools/Config.in"
+endif
+source "package/monit/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/procps/Config.in"
 source "package/psmisc/Config.in"
 source "package/rsyslog/Config.in"
diff --git a/package/monit/Config.in b/package/monit/Config.in
new file mode 100644
index 0000000..6933aaf
--- /dev/null
+++ b/package/monit/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_MONIT
+	bool "monit"
+	help
+	  Monit is a free open source utility for managing and
+	  monitoring, processes, programs, files, directories and
+	  filesystems on a UNIX system. Monit conducts automatic
+	  maintenance and repair and can execute meaningful causal
+	  actions in error situations.
+
+	  http://mmonit.com/monit/
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
new file mode 100644
index 0000000..958618d
--- /dev/null
+++ b/package/monit/monit.mk
@@ -0,0 +1,30 @@
+#############################################################
+#
+# monit
+#
+#############################################################
+
+MONIT_VERSION = 5.4
+MONIT_SITE = http://mmonit.com/monit/dist/
+
+MONIT_CONF_ENV = \
+	libmonit_cv_setjmp_available=yes \
+	libmonit_cv_vsnprintf_c99_conformant=yes
+
+MONIT_CONF_OPT += \
+	--without-pam
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+MONIT_CONF_OPT += --with-ssl
+MONIT_DEPENDENCIES += openssl
+else
+MONIT_CONF_OPT += --without-ssl
+endif
+
+ifeq ($(BR2_LARGEFILE),y)
+MONIT_CONF_OPT += --with-largefiles
+else
+MONIT_CONF_OPT += --without-largefiles
+endif
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.9.5
