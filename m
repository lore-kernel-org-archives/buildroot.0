From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 20 Aug 2019 02:44:13 +0300
Subject: [Buildroot] [PATCH 1/1] package/tinyssh: new package
Message-ID: <20190819234413.18292-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TinySSH is a minimalistic SSH server which implements only a subset of
SSHv2 features.

Might be useful for small systems.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/tinyssh/Config.in    |  8 ++++++++
 package/tinyssh/tinyssh.hash |  2 ++
 package/tinyssh/tinyssh.mk   | 19 +++++++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/tinyssh/Config.in
 create mode 100644 package/tinyssh/tinyssh.hash
 create mode 100644 package/tinyssh/tinyssh.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e50ac78ae7..5884cea0a0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2307,6 +2307,7 @@ F:	package/tstools/
 N:	Vadim Kochan <vadim4j@gmail.com>
 F:	package/brcm-patchram-plus/
 F:	package/gettext-tiny/
+F:	package/tinyssh/
 
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clang/
diff --git a/package/Config.in b/package/Config.in
index 710ed12be0..d6793c891b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2073,6 +2073,7 @@ endif
 	source "package/thttpd/Config.in"
 	source "package/tinc/Config.in"
 	source "package/tinyhttpd/Config.in"
+	source "package/tinyssh/Config.in"
 	source "package/tor/Config.in"
 	source "package/traceroute/Config.in"
 	source "package/transmission/Config.in"
diff --git a/package/tinyssh/Config.in b/package/tinyssh/Config.in
new file mode 100644
index 0000000000..da19d2d454
--- /dev/null
+++ b/package/tinyssh/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_TINYSSH
+	bool "tinyssh"
+	depends on BR2_USE_MMU # fork()
+	help
+	  TinySSH is a minimalistic SSH server which implements only
+	  a subset of SSHv2 features.
+
+	  https://tinyssh.org
diff --git a/package/tinyssh/tinyssh.hash b/package/tinyssh/tinyssh.hash
new file mode 100644
index 0000000000..0ca7c5b741
--- /dev/null
+++ b/package/tinyssh/tinyssh.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256  7e5e080c594db9110869ecea7c9a258507a0de10a09613a584347b3d707fb609  tinyssh-acd059bcac384fcd4af35d1babc87142eca610af.tar.gz
diff --git a/package/tinyssh/tinyssh.mk b/package/tinyssh/tinyssh.mk
new file mode 100644
index 0000000000..69341e13e8
--- /dev/null
+++ b/package/tinyssh/tinyssh.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# tinyssh
+#
+################################################################################
+
+TINYSSH_VERSION = acd059bcac384fcd4af35d1babc87142eca610af
+TINYSSH_SITE = $(call github,janmojzis,tinyssh,$(TINYSSH_VERSION))
+TINYSSH_LICENSE = CC0-1.0
+
+define TINYSSH_BUILD_CMDS
+	$(TARGET_MAKE_ENV) CC="$(TARGET_CC)" $(MAKE) -C $(@D) cross-compile
+endef
+
+define TINYSSH_INSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
2.22.0
