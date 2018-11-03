From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 15:56:57 +0100
Subject: [Buildroot] [git commit] package/wireshark: add libkrb5 optional
 dependency
Message-ID: <20181103145452.B5CA4812D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eceb09c3b856664f338fcb9b448e81a6bee8a15d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Specify the path to found libkrb5 as this is done for other options

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wireshark/wireshark.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 421338f0f8..357ef10c9f 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -19,7 +19,6 @@ WIRESHARK_AUTORECONF = YES
 # wireshark adds -I$includedir to CFLAGS, causing host/target headers mixup.
 # Work around it by pointing includedir at staging
 WIRESHARK_CONF_OPTS = \
-	--without-krb5 \
 	--enable-static=no \
 	--with-libsmi=no \
 	--with-pcap=$(STAGING_DIR)/usr \
@@ -84,6 +83,13 @@ else
 WIRESHARK_CONF_OPTS += --with-gcrypt=no
 endif
 
+ifeq ($(BR2_PACKAGE_LIBKRB5),y)
+WIRESHARK_CONF_OPTS += --with-krb5=$(STAGING_DIR)/usr
+WIRESHARK_DEPENDENCIES += libkrb5
+else
+WIRESHARK_CONF_OPTS += --without-krb5
+endif
+
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 WIRESHARK_CONF_OPTS += --with-libnl
 WIRESHARK_DEPENDENCIES += libnl
