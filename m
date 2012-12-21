From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Fri, 21 Dec 2012 22:45:00 +0100
Subject: [Buildroot] [PATCH 2/6] polkit: new package
In-Reply-To: <1356126305-16133-1-git-send-email-marek.belisko@open-nandra.com>
References: <1356126305-16133-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <1356126305-16133-3-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Marek Belisko <marek.belisko@streamunlimited.com>
---
 package/Config.in        |    1 +
 package/polkit/Config.in |    8 ++++++++
 package/polkit/polkit.mk |   18 ++++++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/polkit/Config.in
 create mode 100644 package/polkit/polkit.mk

diff --git a/package/Config.in b/package/Config.in
index afecb8e..155a429 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -749,6 +749,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/module-init-tools/Config.in"
 endif
 source "package/monit/Config.in"
+source "package/polkit/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/procps/Config.in"
 source "package/psmisc/Config.in"
diff --git a/package/polkit/Config.in b/package/polkit/Config.in
new file mode 100644
index 0000000..9ca347a
--- /dev/null
+++ b/package/polkit/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_POLKIT
+        bool "polkit"
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_DBUS_EXPAT
+	help
+	  PolicyKit is a toolkit for defining and handling
+	  authorizations.  It is used for allowing unprivileged
+	  processes to speak to privileged processes.
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
new file mode 100644
index 0000000..8c882f2
--- /dev/null
+++ b/package/polkit/polkit.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# polkit
+#
+#############################################################
+POLKIT_VERSION = 0.103
+POLKIT_SITE = http://www.freedesktop.org/software/polkit/releases/
+
+POLKIT_INSTALL_STAGING = YES
+
+POLKIT_DEPENDENCIES = libglib2 host-intltool expat
+
+# We could also support --with-authfw=pam
+POLKIT_CONF_OPT = \
+	--with-authfw=shadow \
+	--with-os-type=unknown
+
+$(eval $(autotools-package))
-- 
1.7.10.4
