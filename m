From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 00:57:45 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] ptpd2: fix build failures
 due to EVP_MD_CTX conflict and U64 missing
Message-ID: <20181023225611.1BBD48870A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f42003b3fb108ed420789ba2407b90bf26809d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

In src/dep/ntpengine/ntp_isc_md5.*, the typedef of EVP_MD_CTX
conflicts with a definition of the same type done by OpenSSL. This
issue is referenced at https://github.com/ptpd/ptpd/issues/54, and has
been fixed upstream in commit
https://github.com/ptpd/ptpd/commit/838b985510c360e651d18134e64f258f2f4c6e7c.

In src/dep/snmp.c, U64 can be missing or conflicts with new perl as
reported at https://github.com/ptpd/ptpd/issues/25. This issue has
been fixed upstream in commit
https://github.com/ptpd/ptpd/commit/1886522b50fe44e5c0dedd01d13ac456b941f744. This
commit is adapted to apply on the current version of ptpd2 we have in
Buildroot.

Fixes:
http://autobuild.buildroot.net/results/47b99a6de256bfc0f5a8ae1484bb34e93b407237/
http://autobuild.buildroot.net/results/08365fc559dda74640b9750358c82e84600a68ea/
http://autobuild.buildroot.net/results/9b41c513500c63a9890973a0f17ffdb84d44d580/
http://autobuild.buildroot.net/results/2ed79d01635c9a5e1018229dc6f4b7240a995b87/
http://autobuild.buildroot.net/results/6d1b7e191f573334115684b85165f2bc27d75d8f/
http://autobuild.buildroot.net/results/f54c6fd841b3ea77dc12048c81f3f2991b679252/
http://autobuild.buildroot.net/results/332bc77bcde0bef1b2fd7b9993409dd051c27cd6/
http://autobuild.buildroot.net/results/4b416edaec9528d75a82c9570b8f8297718ca62d/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5b7bc560a5859d4b9f0c2a14c10e83c18fbd6bca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...d5-rename-EVP_MD_CTX-into-PTPD_EVP_MD_CTX.patch | 46 ++++++++++++++++++++++
 ...-25-Removing-type-U64-from-net-snmp-relat.patch | 28 +++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/package/ptpd2/0002-ntp_isc_md5-rename-EVP_MD_CTX-into-PTPD_EVP_MD_CTX.patch b/package/ptpd2/0002-ntp_isc_md5-rename-EVP_MD_CTX-into-PTPD_EVP_MD_CTX.patch
new file mode 100644
index 0000000000..9a9beacf90
--- /dev/null
+++ b/package/ptpd2/0002-ntp_isc_md5-rename-EVP_MD_CTX-into-PTPD_EVP_MD_CTX.patch
@@ -0,0 +1,46 @@
+From 838b985510c360e651d18134e64f258f2f4c6e7c Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Fri, 31 Aug 2018 18:46:56 +0200
+Subject: [PATCH] ntp_isc_md5: rename EVP_MD_CTX into PTPD_EVP_MD_CTX
+
+EVP_MD_CTX can conflict with openssl that defines a completely different
+typedef with same name.
+
+Since this typedef is used only twice in the entire ptpd,
+substitute EVP_MD_CTX with PTPD_EVP_MD_CTX.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ src/dep/ntpengine/ntp_isc_md5.c | 2 +-
+ src/dep/ntpengine/ntp_isc_md5.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/dep/ntpengine/ntp_isc_md5.c b/src/dep/ntpengine/ntp_isc_md5.c
+index 7d04467..e4e34ac 100644
+--- a/src/dep/ntpengine/ntp_isc_md5.c
++++ b/src/dep/ntpengine/ntp_isc_md5.c
+@@ -262,7 +262,7 @@ MD5authencrypt(
+ {
+ 	u_char	digest[64];
+ 	u_int	len;
+-	EVP_MD_CTX ctx;
++	PTPD_EVP_MD_CTX ctx;
+         pkt[length / 4] = htonl(keyid);
+ 	EVP_DigestInit(&ctx);
+ 	EVP_DigestUpdate(&ctx, (u_char *)key, (u_int)strlen(key));
+diff --git a/src/dep/ntpengine/ntp_isc_md5.h b/src/dep/ntpengine/ntp_isc_md5.h
+index fa6e2ee..236c0e4 100644
+--- a/src/dep/ntpengine/ntp_isc_md5.h
++++ b/src/dep/ntpengine/ntp_isc_md5.h
+@@ -80,7 +80,7 @@ isc_md5_final(isc_md5_t *ctx, unsigned char *digest);
+ # define MD5Init(c)             isc_md5_init(c)
+ # define MD5Update(c, p, s)     isc_md5_update(c, p, s)
+ # define MD5Final(d, c)         isc_md5_final((c), (d)) /* swapped */
+-  typedef MD5_CTX                       EVP_MD_CTX;
++  typedef MD5_CTX                       PTPD_EVP_MD_CTX;
+ # define EVP_DigestInit(c)              MD5Init(c)
+ # define EVP_DigestUpdate(c, p, s)      MD5Update(c, p, s)
+ # define EVP_DigestFinal(c, d, pdl)     \
+-- 
+2.17.1
+
diff --git a/package/ptpd2/0003-Solve-issue-25-Removing-type-U64-from-net-snmp-relat.patch b/package/ptpd2/0003-Solve-issue-25-Removing-type-U64-from-net-snmp-relat.patch
new file mode 100644
index 0000000000..f952755d36
--- /dev/null
+++ b/package/ptpd2/0003-Solve-issue-25-Removing-type-U64-from-net-snmp-relat.patch
@@ -0,0 +1,28 @@
+From 84157b11e8f27318f7291823c657f6313c3b60af Mon Sep 17 00:00:00 2001
+From: Jan Breuer <jan.breuer@jaybee.cz>
+Date: Tue, 12 Jul 2016 18:07:08 +0200
+Subject: [PATCH] Solve issue #25 - Removing type U64 from net-snmp related
+ code
+
+[Thomas: Backport to 2.3.1.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
+2.14.4
+
