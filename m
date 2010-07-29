From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jul 2010 23:48:48 +0200
Subject: [Buildroot] [PATCH 05/19] xerces: fix dependency on iconv
In-Reply-To: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
Message-ID: <aad29b55a8851dec26399e37f2b87c0b38c98fc3.1280440124.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All "select BR2_PACKAGE_LIBICONV" must use the "if !BR2_ENABLE_LOCALE"
condition, otherwise we can end up with a toolchain suppoting locales
*and* the libiconv package being compiled, which confuses other
packages. Example with glib:

gconvert.c:52:2: error: #error GNU libiconv in use but included
iconv.h not from libiconv

In addition to that, in xerces.mk, we add the dependency on libiconv
when it is available, to make sure it gets compiled before xerces.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xerces/Config.in |    2 +-
 package/xerces/xerces.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xerces/Config.in b/package/xerces/Config.in
index 85bd96c..123f0c1 100644
--- a/package/xerces/Config.in
+++ b/package/xerces/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_XERCES
 	bool "xerces-c++"
 	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PACKAGE_LIBICONV
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Xerces-C++ is a validating XML parser written in portable C++.
 
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 9f77be6..8a1f693 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -87,7 +87,7 @@ $(TARGET_DIR)/usr/lib/$(LIBXERCES_BINARY): $(STAGING_DIR)/usr/lib/$(LIBXERCES_BI
 	cp -a $(STAGING_DIR)/usr/lib/$(LIBXERCES_BINARY)* $(TARGET_DIR)/usr/lib
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/$(LIBXERCES_BINARY)
 
-xerces: $(TARGET_DIR)/usr/lib/$(LIBXERCES_BINARY)
+xerces: $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(TARGET_DIR)/usr/lib/$(LIBXERCES_BINARY)
 
 xerces-bin: $(XERCES_DIR)/usr/lib/$(LIBXERCES_BINARY)
 
-- 
1.7.0.4
