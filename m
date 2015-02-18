From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Feb 2015 15:16:09 -0300
Subject: [Buildroot] [PATCH] polarssl: security bump to version 1.2.13
Message-ID: <1424283369-574-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Includes the previous CVE-2015-1182 fix (patch dropped) and other fixes
(security and non) from the 1.3 branch (no CVEs yet), see release notes:
https://polarssl.org/tech-updates/releases/polarssl-1.2.13-released

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/polarssl/0003-fix-CVE-2015-1182.patch | 19 -------------------
 package/polarssl/polarssl.hash                |  4 ++--
 package/polarssl/polarssl.mk                  |  2 +-
 3 files changed, 3 insertions(+), 22 deletions(-)
 delete mode 100644 package/polarssl/0003-fix-CVE-2015-1182.patch

diff --git a/package/polarssl/0003-fix-CVE-2015-1182.patch b/package/polarssl/0003-fix-CVE-2015-1182.patch
deleted file mode 100644
index 9309c9d..0000000
--- a/package/polarssl/0003-fix-CVE-2015-1182.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Fix CVE-2015-1182 - Remote attack using crafted certificates.
-Patch status: from upstream see:
-https://polarssl.org/tech-updates/security-advisories/polarssl-security-advisory-2014-04
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff --git a/library/asn1parse.c b/library/asn1parse.c
-index a3a2b56..e2117bf 100644
---- a/library/asn1parse.c
-+++ b/library/asn1parse.c
-@@ -278,6 +278,8 @@ int asn1_get_sequence_of( unsigned char **p,
-             if( cur->next == NULL )
-                 return( POLARSSL_ERR_ASN1_MALLOC_FAILED );
-
-+            memset( cur->next, 0, sizeof( asn1_sequence ) );
-+
-             cur = cur->next;
-         }
-     }
diff --git a/package/polarssl/polarssl.hash b/package/polarssl/polarssl.hash
index 9769788..d68185b 100644
--- a/package/polarssl/polarssl.hash
+++ b/package/polarssl/polarssl.hash
@@ -1,2 +1,2 @@
-# From https://polarssl.org/tech-updates/releases/polarssl-1.2.12-released
-sha256	63dd60e78d25c438648607bb177b063dcf5fbf3ced9ee794fcb165d101940131	polarssl-1.2.12-gpl.tgz
+# From https://polarssl.org/tech-updates/releases/polarssl-1.2.13-released
+sha256	62f44f2a9f39b5cefb229e5dd2644ca20ead477cb1843d6ff30671624315b021	polarssl-1.2.13-gpl.tgz
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index 046c6bf..83e1851 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 POLARSSL_SITE = https://polarssl.org/code/releases
-POLARSSL_VERSION = 1.2.12
+POLARSSL_VERSION = 1.2.13
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
 POLARSSL_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_POLARSSL_PROGRAMS),ON,OFF)
-- 
2.0.5
