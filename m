From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 Nov 2011 13:18:26 +0100
Subject: [Buildroot] [git commit branch/next] nano: make tiny flag optional
Message-ID: <20111118121916.C50CD8F5D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61d8d88d4023be0b9e0138bf415cc3f922bdd68a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Closes #3421

[Peter: tweak Config.in]
Signed-off-by: Daniele Salvatore Albano <info@daccii.it>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/nano/Config.in |    7 +++++++
 package/nano/nano.mk   |    6 +++++-
 2 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/package/nano/Config.in b/package/nano/Config.in
index 8c78096..ef7f69d 100644
--- a/package/nano/Config.in
+++ b/package/nano/Config.in
@@ -6,3 +6,10 @@ config BR2_PACKAGE_NANO
 	  Great editor for new users.
 
 	  http://www.nano-editor.org/
+
+config BR2_PACKAGE_NANO_TINY
+	bool "optimize for size"
+	default y
+	depends on BR2_PACKAGE_NANO
+	help
+	  Disable all features for the sake of size.
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 2bf7121..439f583 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -7,9 +7,13 @@
 NANO_VERSION = 2.3.1
 NANO_SITE = http://www.nano-editor.org/dist/v2.3
 NANO_MAKE_ENV = CURSES_LIB="-lncurses"
-NANO_CONF_OPT = --without-slang --enable-tiny
+NANO_CONF_OPT = --without-slang
 NANO_DEPENDENCIES = ncurses
 
+ifeq ($(BR2_PACKAGE_NANO_TINY),y)
+	NANO_CONF_OPT += --enable-tiny
+endif
+
 define NANO_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/src/nano $(TARGET_DIR)/usr/bin/nano
 endef
