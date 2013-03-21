From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Mar 2013 15:02:23 -0300
Subject: [Buildroot] [PATCH] dropbear: bump to version 2013.56
Message-ID: <1363888943-843-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch ECHOs to SEDs to avoid issues with defines changing after
sysoptions.h was included - and it's cleaner.
Enable hmac-sha2-256 and hmac-sha2-512 support for the full featured.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dropbear/dropbear.mk | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index bd45221..cec57db 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,8 +4,9 @@
 #
 #############################################################
 
-DROPBEAR_VERSION = 2012.55
+DROPBEAR_VERSION = 2013.56
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
+DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
 DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
 		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
@@ -24,16 +25,18 @@ endef
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_FIX_XAUTH
 
 define DROPBEAR_DISABLE_REVERSE_DNS
-	$(SED) 's,^#define DO_HOST_LOOKUP.*,/* #define DO_HOST_LOOKUP */,' $(@D)/options.h
+	$(SED) 's:\(#define DO_HOST_LOOKUP\):/*\1 */:' $(@D)/options.h
 endef
 
 define DROPBEAR_BUILD_SMALL
-	echo "#define DROPBEAR_SMALL_CODE" >>$(@D)/options.h
-	echo "#define NO_FAST_EXPTMOD" >>$(@D)/options.h
+	$(SED) 's:.*\(#define DROPBEAR_SMALL_CODE\).*:\1:' $(@D)/options.h
+	$(SED) 's:.*\(#define NO_FAST_EXPTMOD\).*:\1:' $(@D)/options.h
 endef
 
 define DROPBEAR_BUILD_FEATURED
-	echo "#define DROPBEAR_BLOWFISH" >>$(@D)/options.h
+	$(SED) 's:.*\(#define DROPBEAR_BLOWFISH\).*:\1:' $(@D)/options.h
+	$(SED) 's:.*\(#define DROPBEAR_SHA2_256_HMAC\).*:\1:' $(@D)/options.h
+	$(SED) 's:.*\(#define DROPBEAR_SHA2_512_HMAC\).*:\1:' $(@D)/options.h
 endef
 
 ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS),y)
-- 
1.8.1.5
