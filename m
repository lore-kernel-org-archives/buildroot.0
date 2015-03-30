From: Alex Suykov <alex.suykov@gmail.com>
Date: Mon, 30 Mar 2015 14:13:39 +0300
Subject: [Buildroot] [PATCH] aiccu: fix uclibc builds
Message-ID: <20150330111339.GA30483@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uClibc defines __GLIBC__ but does not provide res_nquery.

Fixes:
http://autobuild.buildroot.net/results/17248fa7f4deaacdab9bb22a777f51209af11e60/
http://autobuild.buildroot.net/results/bf155246563e2f6c44e18f7ee423305600a68b7e/
http://autobuild.buildroot.net/results/32a8c566604e79bf2de7d7236b49b6ab40b8cefd/
http://autobuild.buildroot.net/results/4093e4679412b50048860299dcfc301927e2cabc/

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/aiccu/0005-res-ninit.patch | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/aiccu/0005-res-ninit.patch b/package/aiccu/0005-res-ninit.patch
index 89770fb..faf38df 100644
--- a/package/aiccu/0005-res-ninit.patch
+++ b/package/aiccu/0005-res-ninit.patch
@@ -9,7 +9,7 @@
  int getrrs(const char *label, int rrtype, void gotrec(unsigned int num, int type, const char *record))
  {
 -#ifdef _LINUX
-+#ifdef __GLIBC__
++#if defined(__GLIBC__) && !defined(__UCLIBC__)
  	struct __res_state	res;
  #endif
  	unsigned char		answer[8192];
@@ -18,7 +18,7 @@
  	uint32_t		ttl = 0;
  
 -#ifdef _LINUX
-+#ifdef __GLIBC__
++#if defined(__GLIBC__) && !defined(__UCLIBC__)
  	memset(&res, 0, sizeof(res));
  	res.options = RES_DEBUG;
  	res_ninit(&res);
@@ -27,7 +27,7 @@
  
  	memset(answer, 0, sizeof(answer));
 -#ifdef _LINUX
-+#ifdef __GLIBC__
++#if defined(__GLIBC__) && !defined(__UCLIBC__)
  	ret = res_nquery(&res, label, C_IN, rrtype, answer, sizeof(answer));
  #else
  	ret = res_query(label, C_IN, rrtype, answer, sizeof(answer));
-- 
2.0.3
