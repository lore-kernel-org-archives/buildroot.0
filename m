From: Nikolay Nikolaev <nicknickolaev@gmail.com>
Date: Mon, 19 Mar 2012 15:53:48 +0200
Subject: [Buildroot] [PATCH] ttcp: convert to gentargets
Message-ID: <CAL7hd5KREM9ESu0=O=K6AczHXutnPZBnNY9-tD6SbC4mzxdu8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nikolay Nikolaev <nicknickolaev@gmail.com>
---
 package/ttcp/ttcp-1.12-bcopy.patch |   12 ++++++++
 package/ttcp/ttcp-bcopy.patch      |   12 --------
 package/ttcp/ttcp.mk               |   54 ++++++++++++-----------------------
 3 files changed, 31 insertions(+), 47 deletions(-)
 create mode 100644 package/ttcp/ttcp-1.12-bcopy.patch
 delete mode 100644 package/ttcp/ttcp-bcopy.patch

diff --git a/package/ttcp/ttcp-1.12-bcopy.patch
b/package/ttcp/ttcp-1.12-bcopy.patch
new file mode 100644
index 0000000..c98c88f
--- /dev/null
+++ b/package/ttcp/ttcp-1.12-bcopy.patch
@@ -0,0 +1,12 @@
+diff -urN ttcp-0rig/ttcp.c ttcp/ttcp.c
+--- ttcp-0rig/ttcp.c	1993-05-17 00:00:00.000000000 +0200
++++ ttcp/ttcp.c	2009-01-14 23:46:19.000000000 +0100
+@@ -241,7 +241,7 @@
+ 			if ((addr=gethostbyname(host)) == NULL)
+ 				err("bad hostname");
+ 			sinhim.sin_family = addr->h_addrtype;
+-			bcopy(addr->h_addr,(char*)&addr_tmp, addr->h_length);
++			memmove((char*)&addr_tmp, addr->h_addr, addr->h_length);
+ #if defined(cray)
+ 			sinhim.sin_addr = addr_tmp;
+ #else
diff --git a/package/ttcp/ttcp-bcopy.patch b/package/ttcp/ttcp-bcopy.patch
deleted file mode 100644
index c98c88f..0000000
--- a/package/ttcp/ttcp-bcopy.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -urN ttcp-0rig/ttcp.c ttcp/ttcp.c
---- ttcp-0rig/ttcp.c	1993-05-17 00:00:00.000000000 +0200
-+++ ttcp/ttcp.c	2009-01-14 23:46:19.000000000 +0100
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
index 1acf120..376c762 100644
--- a/package/ttcp/ttcp.mk
+++ b/package/ttcp/ttcp.mk
@@ -3,45 +3,29 @@
 # ttcp
 #
 #############################################################
-#
-TTCP_VERSION:=
-TTCP_SOURCE_URL=http://ftp.sunet.se/pub/network/monitoring/ttcp
-TTCP_SOURCE=ttcp$(TTCP_VERSION).c
-TTCP_DIR=$(BUILD_DIR)/ttcp$(TTCP_VERSION)
-
-$(DL_DIR)/$(TTCP_SOURCE):
-	 $(call DOWNLOAD,$(TTCP_SOURCE_URL)/$(TTCP_SOURCE))
-
-$(TTCP_DIR)/.unpacked: $(DL_DIR)/$(TTCP_SOURCE)
-	-mkdir $(TTCP_DIR)
-	cp -af $(DL_DIR)/$(TTCP_SOURCE) $(TTCP_DIR)
-	support/scripts/apply-patches.sh $(TTCP_DIR) package/ttcp/ ttcp-\*.patch
-	touch $(TTCP_DIR)/.unpacked
-
-$(TTCP_DIR)/.configured: $(TTCP_DIR)/.unpacked
-	touch $(TTCP_DIR)/.configured

-$(TTCP_DIR)/ttcp: $(TTCP_DIR)/.configured
-	$(TARGET_CC) -O2 -o $(TTCP_DIR)/ttcp $(TTCP_DIR)/$(TTCP_SOURCE)
+TTCP_SITE = http://sources.buildroot.net/
+TTCP_SOURCE = ttcp.c
+TTCP_VERSION = 1.12

-$(TARGET_DIR)/usr/bin/ttcp: $(TTCP_DIR)/ttcp
-	cp -af $(TTCP_DIR)/ttcp $(TARGET_DIR)/usr/bin/
+define TTCP_EXTRACT_CMDS
+	cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/
+endef

-ttcp: $(TARGET_DIR)/usr/bin/ttcp
+define TTCP_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) ttcp
+endef

-ttcp-source: $(DL_DIR)/$(TTCP_SOURCE)
+define TTCP_CLEAN_CMDS
+	rm -f $(@D)/ttcp
+endef

-ttcp-clean:
-	rm -f $(TTCP_DIR)/*.o $(TTCP_DIR)/ttcp
+define TTCP_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/ttcp $(TARGET_DIR)/usr/bin/ttcp
+endef

-ttcp-dirclean:
-	rm -rf $(TTCP_DIR)
+define TTCP_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/ttcp
+endef

-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_TTCP),y)
-TARGETS+=ttcp
-endif
+$(eval $(call GENTARGETS))
-- 
1.7.9.1
