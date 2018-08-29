From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 29 Aug 2018 15:09:54 +0200
Subject: [Buildroot] [PATCH next] ptpd2: fix EVP_MD_CTX conflict and U64
 missing
Message-ID: <20180829130954.98313-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

EVP_MD_CTX typedef conflicts with openssl same name typedef EVP_MD_CTX.

U64 can be missing or conflict with new perl as reported here:
https://github.com/ptpd/ptpd/issues/25
Use Ad Hoc patch since the one proposed on upstream [1] is too new and can't
be applied to current version(2.3.1)

Add 2 patches to package to:
- replace EVP_MD_CTX with EVP_MD5_CTX to avoid conflicts with openssl
- replace U64 with struct counter64 to avoid to miss it with certain
toolchains

Fixes:
http://autobuild.buildroot.net/results/47b/47b99a6de256bfc0f5a8ae1484bb34e93b407237//
http://autobuild.buildroot.net/results/083/08365fc559dda74640b9750358c82e84600a68ea//
http://autobuild.buildroot.net/results/9b4/9b41c513500c63a9890973a0f17ffdb84d44d580//
http://autobuild.buildroot.net/results/2ed/2ed79d01635c9a5e1018229dc6f4b7240a995b87//
http://autobuild.buildroot.net/results/6d1/6d1b7e191f573334115684b85165f2bc27d75d8f//
http://autobuild.buildroot.net/results/f54/f54c6fd841b3ea77dc12048c81f3f2991b679252//
http://autobuild.buildroot.net/results/332/332bc77bcde0bef1b2fd7b9993409dd051c27cd6//
http://autobuild.buildroot.net/results/4b4/4b416edaec9528d75a82c9570b8f8297718ca62d//

[1]: https://github.com/ptpd/ptpd/commit/99cbb146b6114fc5fd7b59a90ceb56c27e5ee700

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 ...5-rename-EVP_MD_CTX-into-EVP_MD5_CTX.patch | 46 +++++++++++++++++++
 ...mp-replace-U64-with-struct-counter64.patch | 30 ++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 package/ptpd2/0002-ntp_isc_md5-rename-EVP_MD_CTX-into-EVP_MD5_CTX.patch
 create mode 100644 package/ptpd2/0003-snmp-replace-U64-with-struct-counter64.patch

diff --git a/package/ptpd2/0002-ntp_isc_md5-rename-EVP_MD_CTX-into-EVP_MD5_CTX.patch b/package/ptpd2/0002-ntp_isc_md5-rename-EVP_MD_CTX-into-EVP_MD5_CTX.patch
new file mode 100644
index 0000000000..4da355da94
--- /dev/null
+++ b/package/ptpd2/0002-ntp_isc_md5-rename-EVP_MD_CTX-into-EVP_MD5_CTX.patch
@@ -0,0 +1,46 @@
+From cd269dbd2c3c8cb8f1c627d1f0b85ee9712ac012 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Tue, 28 Aug 2018 20:49:06 +0200
+Subject: [PATCH] ntp_isc_md5: rename EVP_MD_CTX into EVP_MD5_CTX
+
+EVP_MD_CTX can conflict with openssl.
+Openssl defines a structure completely different but with same name.
+
+Since this typedef is used only twice in the entire ptpd, substitute
+EVP_MD_CTX with EVP_MD5_CTX.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ src/dep/ntpengine/ntp_isc_md5.c | 2 +-
+ src/dep/ntpengine/ntp_isc_md5.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/dep/ntpengine/ntp_isc_md5.c b/src/dep/ntpengine/ntp_isc_md5.c
+index 850d004..e163177 100644
+--- a/src/dep/ntpengine/ntp_isc_md5.c
++++ b/src/dep/ntpengine/ntp_isc_md5.c
+@@ -262,7 +262,7 @@ MD5authencrypt(
+ {
+ 	u_char	digest[64];
+ 	u_int	len;
+-	EVP_MD_CTX ctx;
++	EVP_MD5_CTX ctx;
+         pkt[length / 4] = htonl(keyid); 
+ 	EVP_DigestInit(&ctx);
+ 	EVP_DigestUpdate(&ctx, (u_char *)key, (u_int)strlen(key));
+diff --git a/src/dep/ntpengine/ntp_isc_md5.h b/src/dep/ntpengine/ntp_isc_md5.h
+index fa6e2ee..c1ee78a 100644
+--- a/src/dep/ntpengine/ntp_isc_md5.h
++++ b/src/dep/ntpengine/ntp_isc_md5.h
+@@ -80,7 +80,7 @@ isc_md5_final(isc_md5_t *ctx, unsigned char *digest);
+ # define MD5Init(c)             isc_md5_init(c)
+ # define MD5Update(c, p, s)     isc_md5_update(c, p, s)
+ # define MD5Final(d, c)         isc_md5_final((c), (d)) /* swapped */
+-  typedef MD5_CTX                       EVP_MD_CTX;
++  typedef MD5_CTX                       EVP_MD5_CTX;
+ # define EVP_DigestInit(c)              MD5Init(c)
+ # define EVP_DigestUpdate(c, p, s)      MD5Update(c, p, s)
+ # define EVP_DigestFinal(c, d, pdl)     \
+-- 
+2.17.1
+
diff --git a/package/ptpd2/0003-snmp-replace-U64-with-struct-counter64.patch b/package/ptpd2/0003-snmp-replace-U64-with-struct-counter64.patch
new file mode 100644
index 0000000000..edeed1fef6
--- /dev/null
+++ b/package/ptpd2/0003-snmp-replace-U64-with-struct-counter64.patch
@@ -0,0 +1,30 @@
+From 5fd3fd4497ae16ee7d0d4f1a864f4d8f6d80cee5 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Tue, 28 Aug 2018 22:01:53 +0200
+Subject: [PATCH] snmp: replace U64 with struct counter64
+
+U64 is not always present in toolchains and can conflict with new perl.
+
+Replace it with struct counter64.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ src/dep/snmp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/dep/snmp.c b/src/dep/snmp.c
+index 5c08aaa..3086c86 100644
+--- a/src/dep/snmp.c
++++ b/src/dep/snmp.c
+@@ -221,7 +221,7 @@ snmpHeaderIndexBest(struct snmpHeaderIndex *idx)
+ 
+ #define SNMP_LOCAL_VARIABLES			\
+ 	static unsigned long long_ret;		\
+-	static U64 counter64_ret;		\
++	static struct counter64 counter64_ret;	\
+ 	static uint32_t ipaddr;			\
+ 	Integer64 bigint;			\
+ 	struct snmpHeaderIndex idx;		\
+-- 
+2.17.1
+
-- 
2.17.1
