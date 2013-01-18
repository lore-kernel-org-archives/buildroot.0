From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Fri, 18 Jan 2013 23:08:44 +0100
Subject: [Buildroot] [PATCH v3 2/5] polkit: new package
In-Reply-To: <1358546927-25707-1-git-send-email-marek.belisko@open-nandra.com>
References: <1358546927-25707-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <1358546927-25707-3-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/Config.in        |    1 +
 package/polkit/Config.in |   11 +++++++++++
 package/polkit/polkit.mk |   20 ++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 package/polkit/Config.in
 create mode 100644 package/polkit/polkit.mk

diff --git a/package/Config.in b/package/Config.in
index e6153f0..c889d8a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -761,6 +761,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/module-init-tools/Config.in"
 endif
 source "package/monit/Config.in"
+source "package/polkit/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/procps/Config.in"
 source "package/psmisc/Config.in"
diff --git a/package/polkit/Config.in b/package/polkit/Config.in
new file mode 100644
index 0000000..36206bd
--- /dev/null
+++ b/package/polkit/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_POLKIT
+	bool "polkit"
+	depends on BR2_USE_WCHAR # gettext
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_EXPAT
+	help
+	  PolicyKit is a toolkit for defining and handling
+	  authorizations.  It is used for allowing unprivileged
+	  processes to speak to privileged processes.
+
+	  http://www.freedesktop.org/wiki/Software/polkit
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
new file mode 100644
index 0000000..db19348
--- /dev/null
+++ b/package/polkit/polkit.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# polkit
+#
+#############################################################
+POLKIT_VERSION = 0.103
+POLKIT_SITE = http://www.freedesktop.org/software/polkit/releases/
+POLKIT_LICENSE = GPLv2
+POLKIT_LICENSE_FILES = COPYING
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
