From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Dec 2010 17:27:50 +0100
Subject: [Buildroot] [PATCH 14/14] package: pass TARGET_MAKE_ENV at
	install/clean/uninstall steps
In-Reply-To: <cover.1292257643.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292257643.git.thomas.petazzoni@free-electrons.com>
Message-ID: <44f934455cebed54b30310c7bc86857b09320de2.1292257643.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TARGET_MAKE_ENV contains the PATH to the host tools built in
$(HOST_DIR), and not having this directory in the PATH while
installing packages may cause troubles.

The specific example that trigerred the problem is the following
one. libglib2 ./configure tries to find a awk version, either gawk or
mawk. On my limited testing system, only mawk is available, so
normally, libglib2 detects mawk and uses it, and it works perfectly.

However, when host-gawk has been compiled before libglib2 (which
happens for example if you have used the Crosstool-NG backend), gawk
is well detected in $(HOST_DIR)/usr/bin at ./configure time
($(HOST_DIR)/usr/bin is in the PATH at ./configure time, thanks to
TARGET_MAKE_ENV). But at install time, when libglib2 uses gawk, it
doesn't find it anymore because it is not in the PATH.

This also makes things coherent with host installation, in which
$(HOST_MAKE_ENV) was already used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.autotools.in |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 7d04e44..de0a355 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -210,7 +210,7 @@ endif
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	$$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
+	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
 	for i in $$$$(find $(STAGING_DIR)/usr/lib* -name "*.la"); do \
 		cp -f $$$$i $$$$i~; \
 		$$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \
@@ -224,7 +224,7 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	$$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_SRCDIR)
+	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_SRCDIR)
 endef
 endif
 
@@ -234,7 +234,7 @@ endif
 #
 ifndef $(2)_CLEAN_CMDS
 define $(2)_CLEAN_CMDS
-	-$$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE)  $$($$(PKG)_CLEAN_OPT) -C $$($$(PKG)_SRCDIR)
+	-$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE)  $$($$(PKG)_CLEAN_OPT) -C $$($$(PKG)_SRCDIR)
 endef
 endif
 
@@ -244,7 +244,7 @@ endif
 #
 ifndef $(2)_UNINSTALL_STAGING_CMDS
 define $(2)_UNINSTALL_STAGING_CMDS
-	$$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_UNINSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
+	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_UNINSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
 endef
 endif
 
@@ -254,7 +254,7 @@ endif
 #
 ifndef $(2)_UNINSTALL_TARGET_CMDS
 define $(2)_UNINSTALL_TARGET_CMDS
-	$$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_UNINSTALL_TARGET_OPT) -C $$($$(PKG)_SRCDIR)
+	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_UNINSTALL_TARGET_OPT) -C $$($$(PKG)_SRCDIR)
 endef
 endif
 
-- 
1.7.0.4
