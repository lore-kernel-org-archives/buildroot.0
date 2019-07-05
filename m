From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  5 Jul 2019 06:35:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: Fix build with libnettle
 3.5
Message-ID: <20190705043509.19163-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/1ee/1ee4c34087147ba06081a99ed6bb7524f48731e2/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0002-Fix-build-with-libnettle-3.5.patch   | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/dnsmasq/0002-Fix-build-with-libnettle-3.5.patch

diff --git a/package/dnsmasq/0002-Fix-build-with-libnettle-3.5.patch b/package/dnsmasq/0002-Fix-build-with-libnettle-3.5.patch
new file mode 100644
index 0000000000..a19a149458
--- /dev/null
+++ b/package/dnsmasq/0002-Fix-build-with-libnettle-3.5.patch
@@ -0,0 +1,46 @@
+From 6fd9aba7abe1e084123bc5002959350897774ace Mon Sep 17 00:00:00 2001
+From: Vladislav Grishenko <themiron@mail.ru>
+Date: Wed, 26 Jun 2019 20:27:11 +0500
+Subject: [PATCH] Fix build with libnettle 3.5
+
+Downloaded from
+https://github.com/themiron/dnsmasq/commit/6fd9aba7abe1e084123bc5002959350897774ace
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/crypto.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/crypto.c b/src/crypto.c
+index 1f1c12b..9cfe371 100644
+--- a/src/crypto.c
++++ b/src/crypto.c
+@@ -296,6 +296,10 @@ static int dnsmasq_ecdsa_verify(struct blockdata *key_data, unsigned int key_len
+   static struct ecc_point *key_256 = NULL, *key_384 = NULL;
+   static mpz_t x, y;
+   static struct dsa_signature *sig_struct;
++#if NETTLE_VERSION_MAJOR == 3 && NETTLE_VERSION_MINOR < 4
++#define nettle_get_secp_256r1() (&nettle_secp_256r1)
++#define nettle_get_secp_384r1() (&nettle_secp_384r1)
++#endif
+   
+   if (!sig_struct)
+     {
+@@ -315,7 +319,7 @@ static int dnsmasq_ecdsa_verify(struct blockdata *key_data, unsigned int key_len
+ 	  if (!(key_256 = whine_malloc(sizeof(struct ecc_point))))
+ 	    return 0;
+ 	  
+-	  nettle_ecc_point_init(key_256, &nettle_secp_256r1);
++	  nettle_ecc_point_init(key_256, nettle_get_secp_256r1());
+ 	}
+       
+       key = key_256;
+@@ -328,7 +332,7 @@ static int dnsmasq_ecdsa_verify(struct blockdata *key_data, unsigned int key_len
+ 	  if (!(key_384 = whine_malloc(sizeof(struct ecc_point))))
+ 	    return 0;
+ 	  
+-	  nettle_ecc_point_init(key_384, &nettle_secp_384r1);
++	  nettle_ecc_point_init(key_384, nettle_get_secp_384r1());
+ 	}
+       
+       key = key_384;
-- 
2.20.1
