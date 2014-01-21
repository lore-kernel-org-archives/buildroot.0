From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jan 2014 21:57:20 +0100
Subject: [Buildroot] [git commit] ttcp: remove deprecated package
Message-ID: <20140121205928.201769AB97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ef5c3a5c707be1cbfd233223cdfb5528925e2a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since this is the only package depending on BR2_DEPRECATED_SINCE_2012_05,
remove that symbol as well.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in                                          |    4 ---
 Config.in.legacy                                   |    7 +++++
 package/Config.in                                  |    1 -
 package/ttcp/Config.in                             |    7 -----
 .../ttcp/ttcp-0001-replace-deprecated-bcopy.patch  |   15 ------------
 package/ttcp/ttcp.mk                               |   25 --------------------
 6 files changed, 7 insertions(+), 52 deletions(-)

diff --git a/Config.in b/Config.in
index 93d8fce..fa723fe 100644
--- a/Config.in
+++ b/Config.in
@@ -268,10 +268,6 @@ config BR2_DEPRECATED_SINCE_2010_11
 	bool
 	default y
 
-config BR2_DEPRECATED_SINCE_2012_05
-	bool
-	default y
-
 config BR2_DEPRECATED_SINCE_2012_11
 	bool
 	default y
diff --git a/Config.in.legacy b/Config.in.legacy
index 2fed2d8..473d0ef 100644
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
 config BR2_PACKAGE_LIBNFC_LLCP
 	bool "libnfc-llcp has been removed"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
diff --git a/package/Config.in b/package/Config.in
index cd869d8..ed31354 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -935,7 +935,6 @@ source "package/thttpd/Config.in"
 source "package/tinyhttpd/Config.in"
 source "package/tn5250/Config.in"
 source "package/transmission/Config.in"
-source "package/ttcp/Config.in"
 source "package/tvheadend/Config.in"
 source "package/udpcast/Config.in"
 source "package/ulogd/Config.in"
diff --git a/package/ttcp/Config.in b/package/ttcp/Config.in
deleted file mode 100644
index 53b1c32..0000000
--- a/package/ttcp/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_TTCP
-	bool "ttcp"
-	depends on BR2_DEPRECATED_SINCE_2012_05
-	help
-	  Benchmarking tool for determining TCP and UDP performance.
-
-	  ftp://ftp.sgi.com/sgi/src/ttcp/README
diff --git a/package/ttcp/ttcp-0001-replace-deprecated-bcopy.patch b/package/ttcp/ttcp-0001-replace-deprecated-bcopy.patch
deleted file mode 100644
index fb8ef7f..0000000
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
index 7667b20..0000000
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
