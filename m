From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 20:37:37 +0100
Subject: [Buildroot] [git commit] libcli: new package
Message-ID: <20150114193838.EDA3280DE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e51be5039f7a85967054ee24628e4eba4ccc7446
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libcli provides a shared library for including a Cisco-like command-
line interface into other software. It's a telnet interface which
supports command-line editing, history, authentication and callbacks
for a user-definable function tree.

[Thomas: rewrap Config.in help text.]

Signed-off-by: Steve James <ste@junkomatic.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |    1 +
 package/libcli/Config.in |   11 +++++++++++
 package/libcli/libcli.mk |   44 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f866c0d..7bd31e8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -964,6 +964,7 @@ endmenu
 menu "Text and terminal handling"
 	source "package/enchant/Config.in"
 	source "package/icu/Config.in"
+	source "package/libcli/Config.in"
 	source "package/libedit/Config.in"
 	source "package/libenca/Config.in"
 	source "package/libestr/Config.in"
diff --git a/package/libcli/Config.in b/package/libcli/Config.in
new file mode 100644
index 0000000..e20afb0
--- /dev/null
+++ b/package/libcli/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBCLI
+	bool "libcli"
+	help
+	  Libcli provides a shared library for including a Cisco-like
+	  command- line interface into other software. It's a telnet
+	  interface which supports command-line editing, history,
+	  authentication and callbacks for a user-definable function
+	  tree.
+
+	  http://sites.dparrish.com/libcli
+
diff --git a/package/libcli/libcli.mk b/package/libcli/libcli.mk
new file mode 100644
index 0000000..17eed79
--- /dev/null
+++ b/package/libcli/libcli.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# libcli
+#
+################################################################################
+
+LIBCLI_VERSION = c63c9d35144939c8b4fa3c5394aed2e29ff517b0
+LIBCLI_SITE = $(call github,dparrish,libcli,$(LIBCLI_VERSION))
+LIBCLI_LICENSE = LGPLv2.1
+LIBCLI_LICENSE_FILES = COPYING
+LIBCLI_INSTALL_STAGING = YES
+
+# We will pass optimisation level via CFLAGS so remove libcli default
+LIBCLI_MAKE_ARGS += OPTIM=
+
+# We can't run the test harness
+LIBCLI_MAKE_ARGS += TESTS=
+
+# Disable the static library for shared only build
+ifeq ($(BR2_SHARED_LIBS),y)
+LIBCLI_MAKE_ARGS += STATIC_LIB=
+endif
+
+# Disable the shared library for static only build
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBCLI_MAKE_ARGS += DYNAMIC_LIB=
+endif
+
+define LIBCLI_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		$(LIBCLI_MAKE_ARGS)
+endef
+
+define LIBCLI_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		$(LIBCLI_MAKE_ARGS) DESTDIR=$(STAGING_DIR) PREFIX=/usr install
+endef
+
+define LIBCLI_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		$(LIBCLI_MAKE_ARGS) DESTDIR=$(TARGET_DIR) PREFIX=/usr install
+endef
+
+$(eval $(generic-package))
