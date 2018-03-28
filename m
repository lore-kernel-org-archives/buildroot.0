From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 28 Mar 2018 10:38:26 +0200
Subject: [Buildroot] [V4 1/2] dropbear: bump to version 2018.76
Message-ID: <20180328083827.31540-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

with this new version:
  - "configure --enable-static" should now be used instead of
    "make STATIC=1"
  - any customised options should be put in localoptions.h

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/dropbear/dropbear.hash |  2 +-
 package/dropbear/dropbear.mk   | 31 ++++++++++++++-----------------
 2 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 98776e717..ef2011d90 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,2 +1,2 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256 6cbc1dcb1c9709d226dff669e5604172a18cf5dbf9a201474d5618ae4465098c dropbear-2017.75.tar.bz2
+sha256 f2fb9167eca8cf93456a5fc1d4faf709902a3ab70dd44e352f3acbc3ffdaea65 dropbear-2018.76.tar.bz2
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 01a1a07b7..25859a382 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2017.75
+DROPBEAR_VERSION = 2018.76
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause-like, BSD-2-Clause
@@ -12,6 +12,8 @@ DROPBEAR_LICENSE_FILES = LICENSE
 DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
 DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
 
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_SVR_PASSWORD_AUTH
+
 ifeq ($(BR2_PACKAGE_DROPBEAR_CLIENT),y)
 # Build dbclient, and create a convenience symlink named ssh
 DROPBEAR_PROGRAMS += dbclient
@@ -23,32 +25,28 @@ DROPBEAR_MAKE = \
 	PROGRAMS="$(DROPBEAR_PROGRAMS)"
 
 ifeq ($(BR2_STATIC_LIBS),y)
-DROPBEAR_MAKE += STATIC=1
+DROPBEAR_CONF_OPTS += --enable-static
 endif
 
-define DROPBEAR_FIX_XAUTH
-	$(SED) 's,^#define XAUTH_COMMAND.*/xauth,#define XAUTH_COMMAND "/usr/bin/xauth,g' $(@D)/options.h
+define DROPBEAR_SVR_PASSWORD_AUTH
+	echo '#if !HAVE_CRYPT'                          >> $(@D)/localoptions.h
+	echo '#define DROPBEAR_SVR_PASSWORD_AUTH 0'     >> $(@D)/localoptions.h
+	echo '#endif'                                   >> $(@D)/localoptions.h
 endef
 
-DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_FIX_XAUTH
-
 define DROPBEAR_ENABLE_REVERSE_DNS
-	$(SED) 's:.*\(#define DO_HOST_LOOKUP\).*:\1:' $(@D)/options.h
-endef
-
-define DROPBEAR_BUILD_SMALL
-	$(SED) 's:.*\(#define NO_FAST_EXPTMOD\).*:\1:' $(@D)/options.h
+	echo '#define DO_HOST_LOOKUP 1'                 >> $(@D)/localoptions.h
 endef
 
 define DROPBEAR_BUILD_FEATURED
-	$(SED) 's:^#define DROPBEAR_SMALL_CODE::' $(@D)/options.h
-	$(SED) 's:.*\(#define DROPBEAR_BLOWFISH\).*:\1:' $(@D)/options.h
-	$(SED) 's:.*\(#define DROPBEAR_TWOFISH128\).*:\1:' $(@D)/options.h
-	$(SED) 's:.*\(#define DROPBEAR_TWOFISH256\).*:\1:' $(@D)/options.h
+	echo '#define DROPBEAR_SMALL_CODE 0'            >> $(@D)/localoptions.h
+	echo '#define DROPBEAR_BLOWFISH 1'              >> $(@D)/localoptions.h
+	echo '#define DROPBEAR_TWOFISH128 1'            >> $(@D)/localoptions.h
+	echo '#define DROPBEAR_TWOFISH256 1'            >> $(@D)/localoptions.h
 endef
 
 define DROPBEAR_DISABLE_STANDALONE
-	$(SED) 's:\(#define NON_INETD_MODE\):/*\1 */:' $(@D)/options.h
+	echo '#define NON_INETD_MODE 0'                 >> $(@D)/localoptions.h
 endef
 
 define DROPBEAR_INSTALL_INIT_SYSTEMD
@@ -73,7 +71,6 @@ DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_REVERSE_DNS
 endif
 
 ifeq ($(BR2_PACKAGE_DROPBEAR_SMALL),y)
-DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_BUILD_SMALL
 DROPBEAR_CONF_OPTS += --disable-zlib
 else
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_BUILD_FEATURED
-- 
2.11.0
