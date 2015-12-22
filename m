From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 22:58:39 +0100
Subject: [Buildroot] [git commit] rfkill: new package
Message-ID: <20151222215914.189EB826CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8d2e3b545dd40549d14d589472fd1ddf9c3da98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: use "br" as the version suffix instead of "-br" so that the
final version string is "0.5-br" and not "0.5--br".]

Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |  1 +
 package/rfkill/Config.in   |  7 +++++++
 package/rfkill/rfkill.hash |  2 ++
 package/rfkill/rfkill.mk   | 22 ++++++++++++++++++++++
 4 files changed, 32 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 4a1d706..4292188 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -419,6 +419,7 @@ endif
 	source "package/pps-tools/Config.in"
 	source "package/pulseview/Config.in"
 	source "package/read-edid/Config.in"
+	source "package/rfkill/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rpi-userland/Config.in"
 	source "package/rtl8188eu/Config.in"
diff --git a/package/rfkill/Config.in b/package/rfkill/Config.in
new file mode 100644
index 0000000..0d07913
--- /dev/null
+++ b/package/rfkill/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_RFKILL
+	bool "rfkill"
+	help
+	  rfkill is a small userspace tool to query the state of the
+	  rfkill switches.
+
+	  https://wireless.wiki.kernel.org/en/users/documentation/rfkill
diff --git a/package/rfkill/rfkill.hash b/package/rfkill/rfkill.hash
new file mode 100644
index 0000000..21be0a2
--- /dev/null
+++ b/package/rfkill/rfkill.hash
@@ -0,0 +1,2 @@
+# From: https://www.kernel.org/pub/software/network/rfkill/sha256sums.asc
+sha256	e0ae3004215e39a6c5c36e0726558740728d16f67ebdb8bea621250f6091d86a  rfkill-0.5.tar.xz
diff --git a/package/rfkill/rfkill.mk b/package/rfkill/rfkill.mk
new file mode 100644
index 0000000..2f9fe9f
--- /dev/null
+++ b/package/rfkill/rfkill.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# rfkill
+#
+################################################################################
+
+RFKILL_VERSION = 0.5
+RFKILL_SOURCE = rfkill-$(RFKILL_VERSION).tar.xz
+RFKILL_SITE = https://www.kernel.org/pub/software/network/rfkill
+RFKILL_LICENSE = ISC
+RFKILL_LICENSE_FILES = COPYING
+
+define RFKILL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		VERSION_SUFFIX="br"
+endef
+
+define RFKILL_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
