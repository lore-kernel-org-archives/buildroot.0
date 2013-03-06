From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Mar 2013 21:53:49 +0100
Subject: [Buildroot] [git commit] pcre: add support for 16 bits and 32 bits
	variants
Message-ID: <20130306212505.26E169AEFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7154798a461a8b2c2882fa2c1ce2c58b0d8d6614
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Until now, we have been building only the 8bits PCRE variant. However,
Qt5 requires the 16bits variant. This commit therefore adds support to
build the 16bits and 32bits variants of PCRE. In order to preserve
backward compatibility, the 8bits variant is automatically chosen if
no specific variant is defined.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pcre/Config.in |   22 ++++++++++++++++++++++
 package/pcre/pcre.mk   |    4 ++++
 2 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/pcre/Config.in b/package/pcre/Config.in
index a4e2547..5d16e6d 100644
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
+	  This option builds the 8-bits pcre library, i.e 'libpcre'
+
+config BR2_PACKAGE_PCRE_16
+	bool "16-bit pcre"
+	help
+	  This option builds the 16-bits pcre library, i.e 'libpcre16'
+
+config BR2_PACKAGE_PCRE_32
+	bool "32-bit pcre"
+	help
+	  This option builds the 32-bits pcre library, i.e 'libpcre32'
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
