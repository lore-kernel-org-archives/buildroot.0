From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 22:28:30 +0100
Subject: [Buildroot] [git commit] package/wolfssl: bump to version 4.3.0
Message-ID: <20191222212011.371538D9F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0de5314662c9ab55d0fa725435745b40827c0814
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch already applied upstream (refactored on commit c06efb6c1fda0)

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...n-name-location-index-hasn-t-exceed-maxim.patch | 84 ----------------------
 package/wolfssl/wolfssl.hash                       |  2 +-
 package/wolfssl/wolfssl.mk                         |  2 +-
 3 files changed, 2 insertions(+), 86 deletions(-)

diff --git a/package/wolfssl/0001-Check-domain-name-location-index-hasn-t-exceed-maxim.patch b/package/wolfssl/0001-Check-domain-name-location-index-hasn-t-exceed-maxim.patch
deleted file mode 100644
index 758992e148..0000000000
--- a/package/wolfssl/0001-Check-domain-name-location-index-hasn-t-exceed-maxim.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 52f28bd5149360f8e3bf8ca13d3fb9a77283df7c Mon Sep 17 00:00:00 2001
-From: Sean Parkinson <sean@wolfssl.com>
-Date: Wed, 6 Nov 2019 08:28:09 +1000
-Subject: [PATCH] Check domain name location index hasn't exceed maximum before
- setting
-
-[CVE-2019???18840]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- wolfcrypt/src/asn.c | 30 ++++++++++++++++++++----------
- 1 file changed, 20 insertions(+), 10 deletions(-)
-
-diff --git a/wolfcrypt/src/asn.c b/wolfcrypt/src/asn.c
-index 637f4c355..d3793b7b3 100644
---- a/wolfcrypt/src/asn.c
-+++ b/wolfcrypt/src/asn.c
-@@ -5117,8 +5117,10 @@ static int GetName(DecodedCert* cert, int nameType)
-                 XMEMCPY(&full[idx], &cert->source[cert->srcIdx], strLen);
-                 idx += strLen;
-             #if defined(OPENSSL_EXTRA)
--                /* store order that DN was parsed */
--                dName->loc[count++] = id;
-+                if (count < DOMAIN_COMPONENT_MAX) {
-+                    /* store order that DN was parsed */
-+                    dName->loc[count++] = id;
-+                }
-             #endif
-             }
- 
-@@ -5191,8 +5193,10 @@ static int GetName(DecodedCert* cert, int nameType)
-                 XMEMCPY(&full[idx], &cert->source[cert->srcIdx], strLen);
-                 idx += strLen;
-             #if defined(OPENSSL_EXTRA)
--                /* store order that DN was parsed */
--                dName->loc[count++] = id;
-+                if (count < DOMAIN_COMPONENT_MAX) {
-+                    /* store order that DN was parsed */
-+                    dName->loc[count++] = id;
-+                }
-             #endif
-             }
- 
-@@ -5276,8 +5280,10 @@ static int GetName(DecodedCert* cert, int nameType)
-                     XMEMCPY(&full[idx], &cert->source[cert->srcIdx], adv);
-                     idx += adv;
-                 #if defined(OPENSSL_EXTRA)
--                    /* store order that DN was parsed */
--                    dName->loc[count++] = ASN_EMAIL_NAME;
-+                    if (count < DOMAIN_COMPONENT_MAX) {
-+                        /* store order that DN was parsed */
-+                        dName->loc[count++] = ASN_EMAIL_NAME;
-+                    }
-                 #endif
-                 }
-             }
-@@ -5298,8 +5304,10 @@ static int GetName(DecodedCert* cert, int nameType)
-                             dName->uidLen = adv;
- 
-                             #ifdef OPENSSL_EXTRA
--                            /* store order that DN was parsed */
--                            dName->loc[count++] = ASN_USER_ID;
-+                            if (count < DOMAIN_COMPONENT_MAX) {
-+                                /* store order that DN was parsed */
-+                                dName->loc[count++] = ASN_USER_ID;
-+                            }
-                             #endif
-                         #endif /* OPENSSL_EXTRA */
-                             break;
-@@ -5315,8 +5323,10 @@ static int GetName(DecodedCert* cert, int nameType)
-                             dcnum++;
- 
-                             #ifdef OPENSSL_EXTRA
--                            /* store order that DN was parsed */
--                            dName->loc[count++] = ASN_DOMAIN_COMPONENT;
-+                            if (count < DOMAIN_COMPONENT_MAX) {
-+                                /* store order that DN was parsed */
-+                                dName->loc[count++] = ASN_DOMAIN_COMPONENT;
-+                            }
-                             #endif
-                         #endif /* OPENSSL_EXTRA */
-                             break;
--- 
-2.20.1
-
diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index c1b7972c5b..5509552ca4 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 3562af485c26cd7abe94d9404fbfc0c5c9bceb4aab29b81ebf5e6c2467507e12 wolfssl-4.2.0-stable.tar.gz
+sha256 6896f8ad6c44aff3e583006eeee839600848a0e37118ebbb7514eca9409ae08b  wolfssl-4.3.0-stable.tar.gz
 
 # Hash for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index f8ec4bd1ba..8834a0f468 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 4.2.0-stable
+WOLFSSL_VERSION = 4.3.0-stable
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION))
 WOLFSSL_INSTALL_STAGING = YES
 
