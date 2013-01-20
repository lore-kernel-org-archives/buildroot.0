From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 23:07:52 +0100
Subject: [Buildroot] [git commit] polkit: new package
Message-ID: <20130120221146.94C249A440@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff3c47ee04daa6f97e9911659fdea0636d65327f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Config.in comment tweak]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/polkit/Config.in |   11 +++++++++++
 package/polkit/polkit.mk |   21 +++++++++++++++++++++
 3 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3fe5c79..167a526 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -779,6 +779,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/module-init-tools/Config.in"
 endif
 source "package/monit/Config.in"
+source "package/polkit/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/procps/Config.in"
 source "package/psmisc/Config.in"
diff --git a/package/polkit/Config.in b/package/polkit/Config.in
new file mode 100644
index 0000000..da5f985
--- /dev/null
+++ b/package/polkit/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_POLKIT
+	bool "polkit"
+	depends on BR2_USE_WCHAR # libglib2
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
index 0000000..3eb0422
--- /dev/null
+++ b/package/polkit/polkit.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# polkit
+#
+#############################################################
+
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
