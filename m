From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 May 2009 19:25:25 +0200
Subject: [Buildroot] [PATCH 3/5] cups: add pdftops option
In-Reply-To: <1242321927-10185-2-git-send-email-jacmet@sunsite.dk>
References: <1242321927-10185-1-git-send-email-jacmet@sunsite.dk>
	<1242321927-10185-2-git-send-email-jacmet@sunsite.dk>
Message-ID: <1242321927-10185-3-git-send-email-jacmet@sunsite.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The pdftops support in cups needs C++ support, whereas the rest doesn't.
Add a BR2_PACKAGE_CUPS_PDFTOPS (depending on C++ support) to enable it
if needed.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cups/Config.in |   13 +++++++++++++
 package/cups/cups.mk   |    6 ++++++
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/cups/Config.in b/package/cups/Config.in
index 8b1f8a5..0176423 100644
--- a/package/cups/Config.in
+++ b/package/cups/Config.in
@@ -4,3 +4,16 @@ config BR2_PACKAGE_CUPS
 	  The Common Unix Printing System
 
 	  http://www.cups.org
+
+if BR2_PACKAGE_CUPS
+
+config BR2_PACKAGE_CUPS_PDFTOPS
+       bool "pdftops support"
+       depends on BR2_INSTALL_LIBSTDCPP
+       help
+         Enable pdftops support
+
+comment "pdftops support requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+endif
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index e3d6f78..d1bf0fa 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -58,6 +58,12 @@ else
 	CUPS_CONF_OPT +=	--disable-python
 endif
 
+ifeq ($(BR2_PACKAGE_CUPS_PDFTOPS),y)
+	CUPS_CONF_OPT += --enable-pdftops
+else
+	CUPS_CONF_OPT += --disable-pdftops
+endif
+
 $(DL_DIR)/$(CUPS_SOURCE):
 	 $(call DOWNLOAD,$(CUPS_SITE),$(CUPS_SOURCE))
 
-- 
1.6.2
