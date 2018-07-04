From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Jul 2018 21:43:55 +0200
Subject: [Buildroot] [git commit] dropbear: Disable legacy/insecure options
Message-ID: <20180704194023.75C09866C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72d4d098b0dbb10d3904868acc11c97acafa8d80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dropbear by default enables a number of algorithms that are now considered
insecure and should only be used when legacy support is required:
   3DES encryption
   Blowfish encryption
   SHA1-96 message integrity
   CBC encryption mode
   DSA public keys
   Diffie-Hellman Group1 key exchange

So disable them by default, but add a config option for bringing them back.
Furthermore the Blowfish legacy algorithm is unconditionally disabled

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
Reviewed-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dropbear/Config.in   | 10 ++++++++++
 package/dropbear/dropbear.mk | 12 +++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index 5d6b83b6d1..62f77bad9d 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -56,4 +56,14 @@ config BR2_PACKAGE_DROPBEAR_LASTLOG
 	  Enable logging of dropbear access to lastlog. Notice that
 	  Buildroot does not generate lastlog by default.
 
+config BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO
+	bool "enable legacy crypto"
+	help
+	  Enable legacy and possibly insecure algorithms:
+	    3DES encryption
+	    SHA1-96 message integrity
+	    CBC encryption mode
+	    DSA public keys
+	    Diffie-Hellman Group1 key exchange
+
 endif
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index bb902bc7ce..7b1468cfb1 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -56,13 +56,23 @@ endef
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_SVR_PASSWORD_AUTH
 endif
 
+define DROPBEAR_DISABLE_LEGACY_CRYPTO
+	echo '#define DROPBEAR_3DES 0'                  >> $(@D)/localoptions.h
+	echo '#define DROPBEAR_ENABLE_CBC_MODE 0'       >> $(@D)/localoptions.h
+	echo '#define DROPBEAR_SHA1_96_HMAC 0'          >> $(@D)/localoptions.h
+	echo '#define DROPBEAR_DSS 0'                   >> $(@D)/localoptions.h
+	echo '#define DROPBEAR_DH_GROUP1 0'             >> $(@D)/localoptions.h
+endef
+ifneq ($(BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO),y)
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_LEGACY_CRYPTO
+endif
+
 define DROPBEAR_ENABLE_REVERSE_DNS
 	echo '#define DO_HOST_LOOKUP 1'                 >> $(@D)/localoptions.h
 endef
 
 define DROPBEAR_BUILD_FEATURED
 	echo '#define DROPBEAR_SMALL_CODE 0'            >> $(@D)/localoptions.h
-	echo '#define DROPBEAR_BLOWFISH 1'              >> $(@D)/localoptions.h
 	echo '#define DROPBEAR_TWOFISH128 1'            >> $(@D)/localoptions.h
 	echo '#define DROPBEAR_TWOFISH256 1'            >> $(@D)/localoptions.h
 endef
