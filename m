From: Dagg Stompler <daggs@gmx.com>
Date: Fri, 17 Jul 2020 19:46:40 +0300
Subject: [Buildroot] [PATCH 1/4] meson-tools: new Package
Message-ID: <20200717164643.4702-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

add meson-tools for handling of amlogic boards boot firmware signatures

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 DEVELOPERS                           |  3 +++
 package/Config.in.host               |  1 +
 package/meson-tools/Config.in.host   |  9 +++++++++
 package/meson-tools/meson-tools.hash |  2 ++
 package/meson-tools/meson-tools.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/meson-tools/Config.in.host
 create mode 100644 package/meson-tools/meson-tools.hash
 create mode 100644 package/meson-tools/meson-tools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f91314a13a..64af92dd2f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -620,6 +620,9 @@ N:	Cyril Bur <cyrilbur@gmail.com>
 F:	arch/Config.in.powerpc
 F:	package/kvm-unit-tests

+N:	Dagg Stompler <daggs@gmx.com>
+F:	package/meson-tools/
+
 N:	Daniel J. Leach <dleach@belcan.com>
 F:	package/dacapo/

diff --git a/package/Config.in.host b/package/Config.in.host
index 647fc24841..e222e7e448 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -43,6 +43,7 @@ menu "Host utilities"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
 	source "package/mender-artifact/Config.in.host"
+	source "package/meson-tools/Config.in.host"
 	source "package/mfgtools/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
 	source "package/mtd/Config.in.host"
diff --git a/package/meson-tools/Config.in.host b/package/meson-tools/Config.in.host
new file mode 100644
index 0000000000..d90be61aeb
--- /dev/null
+++ b/package/meson-tools/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_MESON_TOOLS
+	bool "host meson-tools"
+	help
+	  meson-tools is a collection of tools for use with
+	  the Amlogic Meson family of ARM based SoCs.
+	  it allows management of signatures which are required
+	  for booting amlogic based boards with u-boot.
+
+	  https://github.com/afaerber/meson-tools
diff --git a/package/meson-tools/meson-tools.hash b/package/meson-tools/meson-tools.hash
new file mode 100644
index 0000000000..f10f5d8590
--- /dev/null
+++ b/package/meson-tools/meson-tools.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	10d707b2f741df03ff5000f2a82c6f577036ce1cd34d9278b22b92cb616b6fce	meson-tools-0a02e2d34413f4bf9b15946352bc8c8ee13a5843.tar.gz
diff --git a/package/meson-tools/meson-tools.mk b/package/meson-tools/meson-tools.mk
new file mode 100644
index 0000000000..7fe115c6dd
--- /dev/null
+++ b/package/meson-tools/meson-tools.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# meson-tools
+#
+################################################################################
+
+HOST_MESON_TOOLS_VERSION = 0a02e2d34413f4bf9b15946352bc8c8ee13a5843
+HOST_MESON_TOOLS_SITE = $(call github,afaerber,meson-tools,$(HOST_MESON_TOOLS_VERSION))
+HOST_MESON_TOOLS_LICENSE = GPL-2.0+
+HOST_MESON_TOOLS_LICENSE_FILES = COPYING README.md
+HOST_MESON_TOOLS_DEPENDENCIES = host-openssl
+
+HOST_MESON_TOOLS_PROGS = amlbootsig unamlbootsig amlinfo
+
+define HOST_MESON_TOOLS_BUILD_CMDS
+	$(MAKE) -C $(@D) CC="$(HOSTCC)" CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS) -lssl -lcrypto"
+endef
+
+define HOST_MESON_TOOLS_INSTALL_CMDS
+	$(foreach f,$(HOST_MESON_TOOLS_PROGS),
+		$(INSTALL) -D -m 0755 $(@D)/$(f) $(HOST_DIR)/bin/$(f))
+endef
+
+$(eval $(host-generic-package))
--
2.27.0
