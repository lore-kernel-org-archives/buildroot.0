From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 23:33:59 +0200
Subject: [Buildroot] [git commit] package/sunwait: new package
Message-ID: <20191021212836.1493883AFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43abc0a1e583cc47fcb9fb782295c1fad0162ee7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sunwait calculates sunrise or sunset times with civil, nautical,
astronomical and custom twilights.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[Thomas:
 - add dependency on C++
 - improve the build logic to pass cflags/ldflags properly]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/sunwait/Config.in    | 11 +++++++++++
 package/sunwait/sunwait.hash |  3 +++
 package/sunwait/sunwait.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 199c59d429..db7d81fa86 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -185,6 +185,7 @@ F:	package/python-pillow/
 F:	package/python-pydal/
 F:	package/python-web2py/
 F:	package/sshguard/
+F:	package/sunwait/
 F:	package/sysdig/
 
 N:	Anisse Astier <anisse@astier.eu>
diff --git a/package/Config.in b/package/Config.in
index f5af43081d..d4cfd50a4b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1873,6 +1873,7 @@ menu "Miscellaneous"
 	source "package/qemu/Config.in"
 	source "package/qpdf/Config.in"
 	source "package/shared-mime-info/Config.in"
+	source "package/sunwait/Config.in"
 	source "package/taskd/Config.in"
 	source "package/wine/Config.in"
 	source "package/xutil_util-macros/Config.in"
diff --git a/package/sunwait/Config.in b/package/sunwait/Config.in
new file mode 100644
index 0000000000..e141c778a3
--- /dev/null
+++ b/package/sunwait/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_SUNWAIT
+	bool "sunwait"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Sunwait calculates sunrise or sunset times with civil,
+	  nautical, astronomical and custom twilights.
+
+	  https://github.com/risacher/sunwait
+
+comment "sunwait needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/sunwait/sunwait.hash b/package/sunwait/sunwait.hash
new file mode 100644
index 0000000000..8396fa27dd
--- /dev/null
+++ b/package/sunwait/sunwait.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  ef26ed05882d5286a64a37c4044f99b877cc54f58a46f0e37ca60c93398df910  sunwait-7326b53e5406c7ebd552ae6dc0fc659252a18e7f.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/sunwait/sunwait.mk b/package/sunwait/sunwait.mk
new file mode 100644
index 0000000000..4b27e8267a
--- /dev/null
+++ b/package/sunwait/sunwait.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# sunwait
+#
+################################################################################
+
+SUNWAIT_VERSION = 7326b53e5406c7ebd552ae6dc0fc659252a18e7f
+SUNWAIT_SITE = $(call github,risacher,sunwait,$(SUNWAIT_VERSION))
+SUNWAIT_LICENSE = GPL-3.0
+SUNWAIT_LICENSE_FILES = LICENSE
+
+SUNWAIT_MAKE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	C=$(TARGET_CXX) \
+	CFLAGS="$(TARGET_CFLAGS) -c" \
+	LDFLAGS="$(TARGET_LDFLAGS) -lm"
+
+define SUNWAIT_BUILD_CMDS
+	$(MAKE) $(SUNWAIT_MAKE_OPTS) -C $(@D) all
+endef
+
+define SUNWAIT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/sunwait $(TARGET_DIR)/usr/bin/sunwait
+endef
+
+$(eval $(generic-package))
