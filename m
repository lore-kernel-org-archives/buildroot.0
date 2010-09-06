From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 Sep 2010 14:37:22 +0200
Subject: [Buildroot] [git commit master 1/1] dropbear: add option to disable
	reverse DNS lookups
Message-ID: <20100906123837.68E388A50D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dd0d0f96d8e7a4b1feb2374c789892eec4386100
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add option to disable reverse DNS lookups on client connection, as
connections otherwise stall until DNS times out in configurations without
working reverse DNS.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    2 +-
 package/dropbear/Config.in   |    8 ++++++++
 package/dropbear/dropbear.mk |    4 ++++
 3 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 03bc5f4..394bb5f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,7 @@
 	Kconfig infrastructure rebased against 2.6.36-rc1, bringing
 	misc fixes + nconfig and savedefconfig targets.
 
-	Updated/fixed packages: busybox
+	Updated/fixed packages: busybox, dropbear
 
 2010.08: Released August 31th, 2010:
 
diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index 20469f8..e47ba45 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -5,3 +5,11 @@ config BR2_PACKAGE_DROPBEAR
 	  A small SSH 2 server designed for small memory environments.
 
 	  http://matt.ucc.asn.au/dropbear/dropbear.html
+
+config BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS
+	bool "disable reverse DNS lookups"
+	depends on BR2_PACKAGE_DROPBEAR
+	help
+	  Disable reverse DNS lookups on connection. This can be handy
+	  on systems without working DNS, as connections otherwise
+	  stall until DNS times out.
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index c73525b..ec678d7 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -21,6 +21,10 @@ $(eval $(call AUTOTARGETS,package,dropbear))
 
 $(DROPBEAR_HOOK_POST_EXTRACT):
 	$(SED) 's,^#define XAUTH_COMMAND.*/xauth,#define XAUTH_COMMAND "/usr/bin/xauth,g' $(DROPBEAR_DIR)/options.h
+ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS),y)
+	$(SED) 's,^#define DO_HOST_LOOKUP.*,/* #define DO_HOST_LOOKUP */,' \
+		$(DROPBEAR_DIR)/options.h
+endif
 	touch $@
 
 $(DROPBEAR_TARGET_INSTALL_TARGET):
-- 
1.7.1
