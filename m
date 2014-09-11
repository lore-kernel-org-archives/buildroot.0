From: Floris Bos <bos@je-eigen-domein.nl>
Date: Thu, 11 Sep 2014 17:43:31 +0200
Subject: [Buildroot] [PATCH 1/1] dropbear: add extra build customization
	options
Message-ID: <1410450212-30718-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds:

- Option to build client (defaults y, for compatibility)
- Option to disable password authentication,
  to only allow public key authentication instead
- Option to disable TCP forwarding.
  Defaults to y, as most legitimate users are not using it,
  and the feature is very popular with spammers that scan
  for devices with weak passwords and use them to relay spam.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/dropbear/Config.in   | 21 +++++++++++++++++++++
 package/dropbear/dropbear.mk | 31 ++++++++++++++++++++++++++++---
 2 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index 68c3b71..dad2ab3 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -8,6 +8,12 @@ config BR2_PACKAGE_DROPBEAR
 
 if BR2_PACKAGE_DROPBEAR
 
+config BR2_PACKAGE_DROPBEAR_CLIENT
+	bool "client programs"
+	default y
+	help
+	  Provides dbclient, ssh
+
 config BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS
 	bool "disable reverse DNS lookups"
 	help
@@ -15,6 +21,21 @@ config BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS
 	  on systems without working DNS, as connections otherwise
 	  stall until DNS times out.
 
+config BR2_PACKAGE_DROPBEAR_DISABLE_PASSWORD_AUTH
+	bool "disable password authentication"
+	help
+	  Disable password authentication. Typically used when security
+	  requirements demand that only public key authentication is allowed.
+
+config BR2_PACKAGE_DROPBEAR_DISABLE_TCP_FORWARDING
+	bool "disable TCP forwarding"
+	default y
+	help
+	  Disable TCP forwarding. SSH allows tunneling TCP connections,
+	  if you do not need that, it is better to disable it.
+	  Spammers are known to scan for accounts with weak passwords
+	  and abuse this functionality as easy cross-platform way to relay spam.
+
 config BR2_PACKAGE_DROPBEAR_SMALL
 	bool "optimize for size"
 	default y
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index e8fcdf6..4d1492c 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -7,12 +7,18 @@
 DROPBEAR_VERSION = 2014.65
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
+DROPBEAR_LICENSE = MIT, BSD-2c-like, BSD-2c
+DROPBEAR_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_PACKAGE_DROPBEAR_CLIENT),y)
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
 DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
 		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
-
-DROPBEAR_LICENSE = MIT, BSD-2c-like, BSD-2c
-DROPBEAR_LICENSE_FILES = LICENSE
+else
+DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
+DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
+		PROGRAMS="dropbear dropbearkey dropbearconvert scp"
+endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 DROPBEAR_MAKE += STATIC=1
@@ -28,6 +34,17 @@ define DROPBEAR_ENABLE_REVERSE_DNS
 	$(SED) 's:.*\(#define DO_HOST_LOOKUP\).*:\1:' $(@D)/options.h
 endef
 
+define DROPBEAR_DISABLE_PASSWORD_AUTH
+	$(SED) 's:\(#define ENABLE_SVR_PASSWORD_AUTH\).*:/*\1 */:' $(@D)/options.h
+endef
+
+define DROPBEAR_DISABLE_TCP_FORWARDING
+	$(SED) 's:\(#define ENABLE_CLI_LOCALTCPFWD\).*:/*\1 */:' $(@D)/options.h
+	$(SED) 's:\(#define ENABLE_CLI_REMOTETCPFWD\).*:/*\1 */:' $(@D)/options.h
+	$(SED) 's:\(#define ENABLE_SVR_LOCALTCPFWD\).*:/*\1 */:' $(@D)/options.h
+	$(SED) 's:\(#define ENABLE_SVR_REMOTETCPFWD\).*:/*\1 */:' $(@D)/options.h
+endef
+
 define DROPBEAR_BUILD_SMALL
 	$(SED) 's:.*\(#define DROPBEAR_SMALL_CODE\).*:\1:' $(@D)/options.h
 	$(SED) 's:.*\(#define NO_FAST_EXPTMOD\).*:\1:' $(@D)/options.h
@@ -64,6 +81,14 @@ ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS),)
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_REVERSE_DNS
 endif
 
+ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_TCP_FORWARDING),y)
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_TCP_FORWARDING
+endif
+
+ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_PASSWORD_AUTH),y)
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_PASSWORD_AUTH
+endif
+
 ifeq ($(BR2_PACKAGE_DROPBEAR_SMALL),y)
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_BUILD_SMALL
 DROPBEAR_CONF_OPT += --disable-zlib
-- 
1.8.3.2
