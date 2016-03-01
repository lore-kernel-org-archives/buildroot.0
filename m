From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Mar 2016 19:52:49 +0100
Subject: [Buildroot] [git commit] tn5250: don't reference SSLv2/v3 functions
	if openssl is built without them
Message-ID: <20160301185505.C5D9F80429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2f6b5d69762edbcf820b74236683ca801b0c158
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/83e/83e29482cad6adef18a0e97bc8e75df302467dbb/

The recent openssl security bump disabled SSLv2 support, but tn5250 was
still referencing SSLv2 functions breaking the build.

Include a patch from OpenBSD to only reference the SSLv2 / SSLv3 symbols if
openssl is built with support for them.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...lding-against-OpenSSL-without-SSLv2_SSLv3.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/tn5250/0002-Allow-building-against-OpenSSL-without-SSLv2_SSLv3.patch b/package/tn5250/0002-Allow-building-against-OpenSSL-without-SSLv2_SSLv3.patch
new file mode 100644
index 0000000..67f0fa6
--- /dev/null
+++ b/package/tn5250/0002-Allow-building-against-OpenSSL-without-SSLv2_SSLv3.patch
@@ -0,0 +1,32 @@
+$OpenBSD: patch-lib5250_sslstream_c,v 1.1 2015/10/07 16:09:04 jca Exp $
+
+Allow building against OpenSSL without SSLv2/SSLv3 support.
+
+Download from:
+http://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/net/tn5250/patches/patch-lib5250_sslstream_c
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+--- a/lib5250/sslstream.c.orig	Fri Nov 21 09:12:21 2008
++++ b/lib5250/sslstream.c	Tue Oct  6 21:32:29 2015
+@@ -368,13 +368,19 @@ int tn5250_ssl_stream_init (Tn5250Stream *This)
+         methstr[4] = '\0';
+    }
+ 
++#ifndef OPENSSL_NO_SSL2
+    if (!strcmp(methstr, "ssl2")) {
+         meth = SSLv2_client_method();         
+         TN5250_LOG(("SSL Method = SSLv2_client_method()\n"));
+-   } else if (!strcmp(methstr, "ssl3")) {
++   } else
++#endif
++#ifndef OPENSSL_NO_SSL3
++   if (!strcmp(methstr, "ssl3")) {
+         meth = SSLv3_client_method();         
+         TN5250_LOG(("SSL Method = SSLv3_client_method()\n"));
+-   } else {
++   } else
++#endif
++   {
+         meth = SSLv23_client_method();         
+         TN5250_LOG(("SSL Method = SSLv23_client_method()\n"));
+    }
