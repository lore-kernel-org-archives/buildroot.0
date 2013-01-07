From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Mon,  7 Jan 2013 21:43:15 +0100
Subject: [Buildroot] [PATCH v2 2/6] polkit: new package
In-Reply-To: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <1357591399-3566-3-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/Config.in        |    1 +
 package/polkit/Config.in |   10 ++++++++++
 package/polkit/polkit.mk |   20 ++++++++++++++++++++
 3 files changed, 31 insertions(+)
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
index 0000000..cb2fecd
--- /dev/null
+++ b/package/polkit/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_POLKIT
+	bool "polkit"
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
index 0000000..35e8b9f
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
+POLKIT_LICENCE = GPL
+POLKIT_LICENCE_FILES = COPYING
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
