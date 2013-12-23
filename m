From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 23 Dec 2013 09:35:49 +0100
Subject: [Buildroot] [PATCH 3 of 3 v2] ttcp: remove deprecated package
In-Reply-To: <patchbomb.1387787746@argentina>
References: <patchbomb.1387787746@argentina>
Message-ID: <f0b7e095ac0e986ef6a7.1387787749@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Config.in.legacy                                      |   7 ++++
 feature-removal-schedule.txt                          |   3 -
 package/Config.in                                     |   1 -
 package/ttcp/Config.in                                |   7 ----
 package/ttcp/ttcp-0001-replace-deprecated-bcopy.patch |  15 ---------
 package/ttcp/ttcp.mk                                  |  25 ---------------
 6 files changed, 7 insertions(+), 51 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.02"
 
+config BR2_PACKAGE_TTCP
+	bool "ttcp has been removed"
+	select BR2_LEGACY
+	help
+	  The 'ttcp' package has been removed since it has been
+	  deprecated for more than four buildroot releases.
+
 config BR2_PACKAGE_SQUASHFS3
 	bool "squashfs3 has been removed"
 	select BR2_LEGACY
diff --git a/feature-removal-schedule.txt b/feature-removal-schedule.txt
--- a/feature-removal-schedule.txt
+++ b/feature-removal-schedule.txt
@@ -10,9 +10,6 @@ should have been removed right now. Expe
 To be removed in 2011.11:
 BR2_PACKAGE_LZMA
 
-To be removed in 2013.05:
-BR2_PACKAGE_TTCP
-
 To be removed in 2013.11:
 BR2_HAVE_DOCUMENTATION
 BR2_PACKAGE_PKG_CONFIG
diff --git a/package/Config.in b/package/Config.in
--- a/package/Config.in
+++ b/package/Config.in
@@ -910,7 +910,6 @@ source "package/thttpd/Config.in"
 source "package/tinyhttpd/Config.in"
 source "package/tn5250/Config.in"
 source "package/transmission/Config.in"
-source "package/ttcp/Config.in"
 source "package/tvheadend/Config.in"
 source "package/udpcast/Config.in"
 source "package/ulogd/Config.in"
diff --git a/package/ttcp/Config.in b/package/ttcp/Config.in
deleted file mode 100644
--- a/package/ttcp/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_TTCP
-	bool "ttcp"
-	depends on BR2_DEPRECATED
-	help
-	  Benchmarking tool for determining TCP and UDP performance.
-
-	  ftp://ftp.sgi.com/sgi/src/ttcp/README
diff --git a/package/ttcp/ttcp-0001-replace-deprecated-bcopy.patch b/package/ttcp/ttcp-0001-replace-deprecated-bcopy.patch
deleted file mode 100644
--- a/package/ttcp/ttcp-0001-replace-deprecated-bcopy.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Replace deprecated bcopy call by using memmove instead.
-
-Index: b/ttcp.c
-===================================================================
---- a/ttcp.c
-+++ b/ttcp.c
-@@ -241,7 +241,7 @@
- 			if ((addr=gethostbyname(host)) == NULL)
- 				err("bad hostname");
- 			sinhim.sin_family = addr->h_addrtype;
--			bcopy(addr->h_addr,(char*)&addr_tmp, addr->h_length);
-+			memmove((char*)&addr_tmp, addr->h_addr, addr->h_length);
- #if defined(cray)
- 			sinhim.sin_addr = addr_tmp;
- #else
diff --git a/package/ttcp/ttcp.mk b/package/ttcp/ttcp.mk
deleted file mode 100644
--- a/package/ttcp/ttcp.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# ttcp
-#
-################################################################################
-
-TTCP_VERSION = 1.12
-TTCP_SITE    = ftp://ftp.sgi.com/sgi/src/ttcp/
-TTCP_SOURCE  = ttcp.c
-TTCP_LICENSE = public domain
-
-define TTCP_EXTRACT_CMDS
-	cp -f -t $(@D) $(DL_DIR)/$(TTCP_SOURCE)
-endef
-
-define TTCP_BUILD_CMDS
-	$(TARGET_CC) $(TARGET_CPPFLAGS) $(TARGET_CFLAGS) \
-		-o $(@D)/ttcp $(@D)/$(TTCP_SOURCE)
-endef
-
-define TTCP_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/ttcp $(TARGET_DIR)/usr/bin/ttcp
-endef
-
-$(eval $(generic-package))
