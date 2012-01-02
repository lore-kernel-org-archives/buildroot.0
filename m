From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Jan 2012 23:02:33 +0100
Subject: [Buildroot] [git commit] autotools: add escaping when using
	HOST_MAKE_ENV and TARGET_MAKE_ENV
Message-ID: <20120102221533.4F04C8FF7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43695a98920a8b2856f8973b8afac2c012cf0f45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without this escaping, the evaluation of HOST_MAKE_ENV and
TARGET_MAKE_ENV is done when the AUTOTARGETS_INNER macro is defined,
not when it is instantiated by the various packages. The result is
that the $(PKG_CONFIG_HOST_BINARY) variable, used in $(HOST_MAKE_ENV)
gets expanded before it is defined.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.autotools.in |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 3f523dc..c84afa0 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -212,11 +212,11 @@ endif
 ifndef $(2)_BUILD_CMDS
 ifeq ($(5),target)
 define $(2)_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_SRCDIR)
 endef
 else
 define $(2)_BUILD_CMDS
-	$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_SRCDIR)
 endef
 endif
 endif
@@ -227,7 +227,7 @@ endif
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) -C $$($$(PKG)_SRCDIR) install
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) -C $$($$(PKG)_SRCDIR) install
 endef
 endif
 
@@ -237,7 +237,7 @@ endif
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
 	for i in $$$$(find $(STAGING_DIR)/usr/lib* -name "*.la"); do \
 		cp -f $$$$i $$$$i~; \
 		$$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \
@@ -251,7 +251,7 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_SRCDIR)
 endef
 endif
 
@@ -261,7 +261,7 @@ endif
 #
 ifndef $(2)_CLEAN_CMDS
 define $(2)_CLEAN_CMDS
-	-$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE)  $$($$(PKG)_CLEAN_OPT) -C $$($$(PKG)_SRCDIR)
+	-$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE)  $$($$(PKG)_CLEAN_OPT) -C $$($$(PKG)_SRCDIR)
 endef
 endif
 
@@ -271,7 +271,7 @@ endif
 #
 ifndef $(2)_UNINSTALL_STAGING_CMDS
 define $(2)_UNINSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_UNINSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_UNINSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
 endef
 endif
 
@@ -281,7 +281,7 @@ endif
 #
 ifndef $(2)_UNINSTALL_TARGET_CMDS
 define $(2)_UNINSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_UNINSTALL_TARGET_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_UNINSTALL_TARGET_OPT) -C $$($$(PKG)_SRCDIR)
 endef
 endif
 
