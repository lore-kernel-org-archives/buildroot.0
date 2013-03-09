From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  9 Mar 2013 15:40:35 +0100
Subject: [Buildroot] [PATCH] pcre: always enable the 8-bits version
Message-ID: <1362840035-9883-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 7154798a461a8b2c (pcre: add support for 16 bits and 32 bits
variants), added in preparation to the introduction of the Qt5
packages, could break other packages that use pcre.

Even though by default the pcre 8 bits library is selected if no other
variant is selected, a randpackageconfig, or an user, could
potentially enable the 16 bits variant even if a package requires the
8 bits variant.

This has caused a number of build breakage on packages like ngrep,
cegui, nmap and others in the autobuilders.

In older to solve this, we simply unconditionally build the 8-bits
variant. Since each variant is only ~90k in size, it's probably not
worth the effort giving the possibility of building the 16 bits
variant only.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pcre/Config.in |   12 +++---------
 package/pcre/pcre.mk   |    2 +-
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/package/pcre/Config.in b/package/pcre/Config.in
index 5d16e6d..dc92274 100644
--- a/package/pcre/Config.in
+++ b/package/pcre/Config.in
@@ -1,20 +1,14 @@
 config BR2_PACKAGE_PCRE
 	bool "pcre"
-	# Ensure at least the default 8-bit library is enabled.
-	select BR2_PACKAGE_PCRE_8 if \
-	       (!BR2_PACKAGE_PCRE_16 && !BR2_PACKAGE_PCRE_32)
 	help
-	  Perl Compatible Regular Expressions
+	  Perl Compatible Regular Expressions. By default, only the
+	  8-bits libpcre is built. To get the 16-bits and/or 32-bits
+	  variants libpcre16/libpcre32, use the package sub-options.
 
 	  http://www.pcre.org/
 
 if BR2_PACKAGE_PCRE
 
-config BR2_PACKAGE_PCRE_8
-	bool "8-bit pcre"
-	help
-	  This option builds the 8-bits pcre library, i.e 'libpcre'
-
 config BR2_PACKAGE_PCRE_16
 	bool "16-bit pcre"
 	help
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index b1339fb..745309f 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -16,7 +16,7 @@ ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 PCRE_CONF_OPT = --disable-cpp
 endif
 
-PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_8),--enable-pcre8,--disable-pcre8)
+PCRE_CONF_OPT += --enable-pcre8
 PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_16),--enable-pcre16,--disable-pcre16)
 PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_32),--enable-pcre32,--disable-pcre32)
 
-- 
1.7.9.5
