From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Sep 2015 23:37:45 +0200
Subject: [Buildroot] [git commit] micropython-lib: new packages
Message-ID: <20150917214802.4C9F381F6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21c7af2f665343926ff950f16d60d5d104357db8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Core Python libraries ported to MicroPython.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |    1 +
 package/micropython-lib/Config.in          |    7 +++++++
 package/micropython-lib/micropython-lib.mk |   18 ++++++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e702e5f..de072e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -510,6 +510,7 @@ endmenu
 endif
 	source "package/lutok/Config.in"
 	source "package/micropython/Config.in"
+	source "package/micropython-lib/Config.in"
 	source "package/moarvm/Config.in"
 	source "package/mono/Config.in"
 if BR2_PACKAGE_MONO
diff --git a/package/micropython-lib/Config.in b/package/micropython-lib/Config.in
new file mode 100644
index 0000000..a7e017b
--- /dev/null
+++ b/package/micropython-lib/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MICROPYTHON_LIB
+	bool "micropython-lib"
+	depends on BR2_PACKAGE_MICROPYTHON
+	help
+	  Core Python libraries ported to MicroPython.
+
+	  http://micropython.org
diff --git a/package/micropython-lib/micropython-lib.mk b/package/micropython-lib/micropython-lib.mk
new file mode 100644
index 0000000..a4a6cf6
--- /dev/null
+++ b/package/micropython-lib/micropython-lib.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# micropython-lib
+#
+################################################################################
+
+MICROPYTHON_LIB_VERSION = v0.5
+MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-lib,$(MICROPYTHON_LIB_VERSION))
+MICROPYTHON_LIB_LICENSE = Python software foundation license v2 (some modules), MIT (everything else)
+MICROPYTHON_LIB_LICENSE_FILES = LICENSE
+
+define MICROPYTHON_LIB_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		PREFIX=$(TARGET_DIR)/usr/lib/micropython \
+		install
+endef
+
+$(eval $(generic-package))
