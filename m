From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 17:23:44 +0200
Subject: [Buildroot] [git commit] dropbear: bump to version 2018.76
Message-ID: <20180428154800.1423C88FE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e035a9aecc37b87a277fd53f84743a18a6f03a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

with this new version:
  - "configure --enable-static" should now be used instead of
    "make STATIC=1"
  - any customised options should be put in localoptions.h

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dropbear/dropbear.hash |  2 +-
 package/dropbear/dropbear.mk   | 31 ++++++++++++++-----------------
 2 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 98776e7179..ef2011d907 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,2 +1,2 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256 6cbc1dcb1c9709d226dff669e5604172a18cf5dbf9a201474d5618ae4465098c dropbear-2017.75.tar.bz2
+sha256 f2fb9167eca8cf93456a5fc1d4faf709902a3ab70dd44e352f3acbc3ffdaea65 dropbear-2018.76.tar.bz2
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 01a1a07b76..236f9b4762 100644
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
@@ -23,32 +23,30 @@ DROPBEAR_MAKE = \
 	PROGRAMS="$(DROPBEAR_PROGRAMS)"
 
 ifeq ($(BR2_STATIC_LIBS),y)
-DROPBEAR_MAKE += STATIC=1
+DROPBEAR_CONF_OPTS += --enable-static
 endif
 
-define DROPBEAR_FIX_XAUTH
-	$(SED) 's,^#define XAUTH_COMMAND.*/xauth,#define XAUTH_COMMAND "/usr/bin/xauth,g' $(@D)/options.h
+# Ensure that dropbear doesn't use crypt() when it's not available
+define DROPBEAR_SVR_PASSWORD_AUTH
+	echo '#if !HAVE_CRYPT'                          >> $(@D)/localoptions.h
+	echo '#define DROPBEAR_SVR_PASSWORD_AUTH 0'     >> $(@D)/localoptions.h
+	echo '#endif'                                   >> $(@D)/localoptions.h
 endef
-
-DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_FIX_XAUTH
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_SVR_PASSWORD_AUTH
 
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
