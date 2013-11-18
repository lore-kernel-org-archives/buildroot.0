From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 18 Nov 2013 09:16:25 -0300
Subject: [Buildroot] [PATCH] libcurl: add security patch for CVE-2013-4545
Message-ID: <1384776985-3050-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcurl/libcurl-0001-CVE-2013-4545.patch | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/libcurl/libcurl-0001-CVE-2013-4545.patch

diff --git a/package/libcurl/libcurl-0001-CVE-2013-4545.patch b/package/libcurl/libcurl-0001-CVE-2013-4545.patch
new file mode 100644
index 0000000..39545fe
--- /dev/null
+++ b/package/libcurl/libcurl-0001-CVE-2013-4545.patch
@@ -0,0 +1,32 @@
+From 3c3622b66221d89509cffaa693fc7dcd5c5b96cf Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 2 Oct 2013 15:31:10 +0200
+Subject: [PATCH] OpenSSL: acknowledge CURLOPT_SSL_VERIFYHOST without
+ VERIFYPEER
+
+Setting only CURLOPT_SSL_VERIFYHOST without CURLOPT_SSL_VERIFYPEER set
+should still verify that the host name fields in the server certificate
+is fine or return failure.
+
+Bug: http://curl.haxx.se/mail/lib-2013-10/0002.html
+Reported-by: Ishan SinghLevett
+---
+ lib/ssluse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/ssluse.c b/lib/ssluse.c
+index 4f3c1e1..9974ac8 100644
+--- a/lib/ssluse.c
++++ b/lib/ssluse.c
+@@ -2351,7 +2351,7 @@ ossl_connect_step3(struct connectdata *conn,
+    * operations.
+    */
+ 
+-  if(!data->set.ssl.verifypeer)
++  if(!data->set.ssl.verifypeer && !data->set.ssl.verifyhost)
+     (void)servercert(conn, connssl, FALSE);
+   else
+     retcode = servercert(conn, connssl, TRUE);
+-- 
+1.8.3.2
+
-- 
1.8.3.2
