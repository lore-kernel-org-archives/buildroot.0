From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Jan 2020 10:58:10 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/dillo: fix
 openssl support
Message-ID: <20200111100536.7B5FA8875C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0325706b4382c205d3040842ee2f0e7b0dfe4758
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Add two patches to fix openssl support:

 - 0003-Fix-openssl-detection.patch (suggested by Jonathan Kimmitt)
 - 0004-Support-OpenSSL-1.1.0.patch (taken from upstream)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 62ad96c057219779eae6ddf49727beb3773d9e55)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dillo/0003-Fix-openssl-detection.patch | 29 ++++++++++++++++++++++
 package/dillo/0004-Support-OpenSSL-1.1.0.patch | 33 ++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/package/dillo/0003-Fix-openssl-detection.patch b/package/dillo/0003-Fix-openssl-detection.patch
new file mode 100644
index 0000000000..6e5f1d021f
--- /dev/null
+++ b/package/dillo/0003-Fix-openssl-detection.patch
@@ -0,0 +1,29 @@
+From 96dde9dedf806256cdc6cbf5cacbd5c8d74e6288 Mon Sep 17 00:00:00 2001
+From: Jonathan Kimmitt <jrrk2@cam.ac.uk>
+Date: Thu, 9 Jan 2020 22:01:42 +0100
+Subject: [PATCH] Fix openssl detection
+
+SSL_library_init is now a define, use OPENSSL_init_ssl instead.
+
+Signed-off-by: Jonathan Kimmitt <jrrk2@cam.ac.uk>
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 66b5e9f..206fd53 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -276,7 +276,7 @@ if test "x$enable_ssl" = "xyes"; then
+ 
+   if test "x$ssl_ok" = "xyes"; then
+     old_libs="$LIBS"
+-    AC_CHECK_LIB(ssl, SSL_library_init, ssl_ok=yes, ssl_ok=no, -lcrypto)
++    AC_CHECK_LIB(ssl, OPENSSL_init_ssl, ssl_ok=yes, ssl_ok=no, -lcrypto)
+     LIBS="$old_libs"
+   fi
+ 
+-- 
+2.24.1
+
diff --git a/package/dillo/0004-Support-OpenSSL-1.1.0.patch b/package/dillo/0004-Support-OpenSSL-1.1.0.patch
new file mode 100644
index 0000000000..87b9d0dce3
--- /dev/null
+++ b/package/dillo/0004-Support-OpenSSL-1.1.0.patch
@@ -0,0 +1,33 @@
+From ff44d8b2d5211a502afdb3e612dae0e8133b5124 Mon Sep 17 00:00:00 2001
+From: Johannes Hofmann <Johannes.Hofmann@gmx.de>
+Date: Thu, 9 Jan 2020 22:07:15 +0100
+Subject: [PATCH] Support OpenSSL 1.1.0
+
+taken-from: pkgsrc (Ryo ONODERA)
+submitted-by: Jun Ebihara <jun@soum.co.jp>
+
+Upstream: https://hg.dillo.org/dillo/rev/b171b8610400
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ dpi/https.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/dpi/https.c b/dpi/https.c
+index 766b3af..025cfc4 100644
+--- a/dpi/https.c
++++ b/dpi/https.c
+@@ -476,7 +476,11 @@ static int handle_certificate_problem(SSL * ssl_connection)
+       case X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT:
+          /*Either self signed and untrusted*/
+          /*Extract CN from certificate name information*/
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+          if ((cn = strstr(remote_cert->name, "/CN=")) == NULL) {
++#else
++         if ((cn = strstr(X509_get_subject_name(remote_cert), "/CN=")) == NULL) {
++#endif
+             strcpy(buf, "(no CN given)");
+          } else {
+             char *cn_end;
+-- 
+2.24.1
+
