From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2019 16:37:18 +0100
Subject: [Buildroot] =?utf-8?q?=5BPATCH=5D_package/wolfssl=3A_add_upstrea?=
 =?utf-8?q?m_security_fix_for_CVE-2019=E2=80=9318840?=
Message-ID: <20191128153718.30599-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security vulnerability:

- CVE-2019-18840: In wolfSSL 4.1.0 through 4.2.0c, there are missing sanity
  checks of memory accesses in parsing ASN.1 certificate data while
  handshaking.  Specifically, there is a one-byte heap-based buffer overflow
  inside the DecodedCert structure in GetName in wolfcrypt/src/asn.c because
  the domain name location index is mishandled.  Because a pointer is
  overwritten, there is an invalid free.

For details, see the writeup:
https://medium.com/@social_62682/heap-overflow-in-wolfssl-cve-2019-18840-185d233c27de

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-location-index-hasn-t-exceed-maxim.patch | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 package/wolfssl/0001-Check-domain-name-location-index-hasn-t-exceed-maxim.patch

diff --git a/package/wolfssl/0001-Check-domain-name-location-index-hasn-t-exceed-maxim.patch b/package/wolfssl/0001-Check-domain-name-location-index-hasn-t-exceed-maxim.patch
new file mode 100644
index 0000000000..758992e148
--- /dev/null
+++ b/package/wolfssl/0001-Check-domain-name-location-index-hasn-t-exceed-maxim.patch
@@ -0,0 +1,84 @@
+From 52f28bd5149360f8e3bf8ca13d3fb9a77283df7c Mon Sep 17 00:00:00 2001
+From: Sean Parkinson <sean@wolfssl.com>
+Date: Wed, 6 Nov 2019 08:28:09 +1000
+Subject: [PATCH] Check domain name location index hasn't exceed maximum before
+ setting
+
+[CVE-2019?18840]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ wolfcrypt/src/asn.c | 30 ++++++++++++++++++++----------
+ 1 file changed, 20 insertions(+), 10 deletions(-)
+
+diff --git a/wolfcrypt/src/asn.c b/wolfcrypt/src/asn.c
+index 637f4c355..d3793b7b3 100644
+--- a/wolfcrypt/src/asn.c
++++ b/wolfcrypt/src/asn.c
+@@ -5117,8 +5117,10 @@ static int GetName(DecodedCert* cert, int nameType)
+                 XMEMCPY(&full[idx], &cert->source[cert->srcIdx], strLen);
+                 idx += strLen;
+             #if defined(OPENSSL_EXTRA)
+-                /* store order that DN was parsed */
+-                dName->loc[count++] = id;
++                if (count < DOMAIN_COMPONENT_MAX) {
++                    /* store order that DN was parsed */
++                    dName->loc[count++] = id;
++                }
+             #endif
+             }
+ 
+@@ -5191,8 +5193,10 @@ static int GetName(DecodedCert* cert, int nameType)
+                 XMEMCPY(&full[idx], &cert->source[cert->srcIdx], strLen);
+                 idx += strLen;
+             #if defined(OPENSSL_EXTRA)
+-                /* store order that DN was parsed */
+-                dName->loc[count++] = id;
++                if (count < DOMAIN_COMPONENT_MAX) {
++                    /* store order that DN was parsed */
++                    dName->loc[count++] = id;
++                }
+             #endif
+             }
+ 
+@@ -5276,8 +5280,10 @@ static int GetName(DecodedCert* cert, int nameType)
+                     XMEMCPY(&full[idx], &cert->source[cert->srcIdx], adv);
+                     idx += adv;
+                 #if defined(OPENSSL_EXTRA)
+-                    /* store order that DN was parsed */
+-                    dName->loc[count++] = ASN_EMAIL_NAME;
++                    if (count < DOMAIN_COMPONENT_MAX) {
++                        /* store order that DN was parsed */
++                        dName->loc[count++] = ASN_EMAIL_NAME;
++                    }
+                 #endif
+                 }
+             }
+@@ -5298,8 +5304,10 @@ static int GetName(DecodedCert* cert, int nameType)
+                             dName->uidLen = adv;
+ 
+                             #ifdef OPENSSL_EXTRA
+-                            /* store order that DN was parsed */
+-                            dName->loc[count++] = ASN_USER_ID;
++                            if (count < DOMAIN_COMPONENT_MAX) {
++                                /* store order that DN was parsed */
++                                dName->loc[count++] = ASN_USER_ID;
++                            }
+                             #endif
+                         #endif /* OPENSSL_EXTRA */
+                             break;
+@@ -5315,8 +5323,10 @@ static int GetName(DecodedCert* cert, int nameType)
+                             dcnum++;
+ 
+                             #ifdef OPENSSL_EXTRA
+-                            /* store order that DN was parsed */
+-                            dName->loc[count++] = ASN_DOMAIN_COMPONENT;
++                            if (count < DOMAIN_COMPONENT_MAX) {
++                                /* store order that DN was parsed */
++                                dName->loc[count++] = ASN_DOMAIN_COMPONENT;
++                            }
+                             #endif
+                         #endif /* OPENSSL_EXTRA */
+                             break;
+-- 
+2.20.1
+
-- 
2.20.1
