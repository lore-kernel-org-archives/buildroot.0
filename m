From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Feb 2013 00:25:52 +0100
Subject: [Buildroot] [PATCH 01/30] pcre: add support for 16 bits and 32 bits
	variants
In-Reply-To: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362007582-14753-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, we have been building only the 8bits PCRE variant. However,
Qt5 requires the 16bits variant. This commit therefore adds support to
build the 16bits and 32bits variants of PCRE. In order to preserve
backward compatibility, the 8bits variant is automatically chosen is
no specific variant is defined.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pcre/Config.in |   22 ++++++++++++++++++++++
 package/pcre/pcre.mk   |    4 ++++
 2 files changed, 26 insertions(+)

diff --git a/package/pcre/Config.in b/package/pcre/Config.in
index a4e2547..3b77cb2 100644
--- a/package/pcre/Config.in
+++ b/package/pcre/Config.in
@@ -1,6 +1,28 @@
 config BR2_PACKAGE_PCRE
 	bool "pcre"
+	# Ensure at least the default 8-bit library is enabled.
+	select BR2_PACKAGE_PCRE_8 if \
+	       (!BR2_PACKAGE_PCRE_16 && !BR2_PACKAGE_PCRE_32)
 	help
 	  Perl Compatible Regular Expressions
 
 	  http://www.pcre.org/
+
+if BR2_PACKAGE_PCRE
+
+config BR2_PACKAGE_PCRE_8
+	bool "8-bit pcre"
+	help
+	  This option builds the 8-bit pcre library, i.e 'libpcre'
+
+config BR2_PACKAGE_PCRE_16
+	bool "16-bit pcre"
+	help
+	  This option builds the 8-bit pcre library, i.e 'libpcre16'
+
+config BR2_PACKAGE_PCRE_32
+	bool "32-bit pcre"
+	help
+	  This option builds the 8-bit pcre library, i.e 'libpcre32'
+
+endif
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 48266ff..b1339fb 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -16,4 +16,8 @@ ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 PCRE_CONF_OPT = --disable-cpp
 endif
 
+PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_8),--enable-pcre8,--disable-pcre8)
+PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_16),--enable-pcre16,--disable-pcre16)
+PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_32),--enable-pcre32,--disable-pcre32)
+
 $(eval $(autotools-package))
-- 
1.7.9.5
