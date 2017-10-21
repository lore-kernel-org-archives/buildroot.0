From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 21:28:13 +0200
Subject: [Buildroot] [git commit] heirloom-mailx: add libressl support patch
Message-ID: <20171021192125.6243C81110@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f145e4957fa562ed8df89527433fccd438b3502
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

heirloom-mailx has two small issues when compiling against LibreSSL:
  - RAND_egd is used (LibreSSL does not support RAND_egd)
    Solution: "Guard" the code calling RAND_egd

  - SSLv3_client_method function is used (LibreSSL does not support SSLv3)
    Solution: "Guard" the code with #ifndef OPENSSL_NO_SSL3

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../heirloom-mailx/0002-fix-libressl-support.patch | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/package/heirloom-mailx/0002-fix-libressl-support.patch b/package/heirloom-mailx/0002-fix-libressl-support.patch
new file mode 100644
index 0000000..0fafa4a
--- /dev/null
+++ b/package/heirloom-mailx/0002-fix-libressl-support.patch
@@ -0,0 +1,54 @@
+From aad28d30af6c3a74c522dd61943788e908860c84 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Adamduskett@outlook.com>
+Date: Fri, 4 Aug 2017 07:22:47 -0400
+Subject: [PATCH] fix libressl support
+
+heirloom-mailx has two small issues when compiling against LibreSSL:
+  - RAND_egd is used (LibreSSL does not support RAND_egd)
+    Solution: "Guard" the code calling RAND_egd
+
+  - SSLv3_client_method function is used (LibreSSL does not support SSLv3)
+    Solution: "Guard" the code with #ifndef OPENSSL_NO_SSL3
+
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ openssl.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/openssl.c b/openssl.c
+index 44fe4e5..c4a1bb7 100644
+--- a/openssl.c
++++ b/openssl.c
+@@ -137,11 +137,13 @@ ssl_rand_init(void)
+ 
+ 	if ((cp = value("ssl-rand-egd")) != NULL) {
+ 		cp = expand(cp);
++#ifndef OPENSSL_NO_EGD
+ 		if (RAND_egd(cp) == -1) {
+ 			fprintf(stderr, catgets(catd, CATSET, 245,
+ 				"entropy daemon at \"%s\" not available\n"),
+ 					cp);
+ 		} else
++#endif
+ 			state = 1;
+ 	} else if ((cp = value("ssl-rand-file")) != NULL) {
+ 		cp = expand(cp);
+@@ -216,10 +218,15 @@ ssl_select_method(const char *uhp)
+ 
+ 	cp = ssl_method_string(uhp);
+ 	if (cp != NULL) {
++		#ifndef OPENSSL_NO_SSL3
+ 		if (equal(cp, "ssl3"))
+ 			method = SSLv3_client_method();
+ 		else if (equal(cp, "tls1"))
+ 			method = TLSv1_client_method();
++		#else
++		if (equal(cp, "tls1"))
++			method = TLSv1_client_method();
++		#endif
+ 		else {
+ 			fprintf(stderr, catgets(catd, CATSET, 244,
+ 					"Invalid SSL method \"%s\"\n"), cp);
+-- 
+2.13.3
+
