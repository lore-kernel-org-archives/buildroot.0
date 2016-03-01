From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Mar 2016 18:13:58 +0100
Subject: [Buildroot] [git commit] python-m2crypto: don't reference SSLv2
	functions if openssl is built without SSLv2 support
Message-ID: <20160301171630.DDC947FFEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa016cd6537983d3d6adeeac8783568f015fe708
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/018/0183ba8c9fccc87f9e72279c49c2fdc1a9fcb556/

The recent openssl security bump disabled SSLv2 support, but python-m2crypto
was still referencing SSLv2 functions causing undefined symbols when the
module was imported.  Backport an upstream patch to only reference these
symbols if openssl is built with SSLv2 support.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...o-build-with-SSLv2-when-it-is-not-availab.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/python-m2crypto/0001-Don-t-try-to-build-with-SSLv2-when-it-is-not-availab.patch b/package/python-m2crypto/0001-Don-t-try-to-build-with-SSLv2-when-it-is-not-availab.patch
new file mode 100644
index 0000000..7210fa2
--- /dev/null
+++ b/package/python-m2crypto/0001-Don-t-try-to-build-with-SSLv2-when-it-is-not-availab.patch
@@ -0,0 +1,36 @@
+From ac01b38302474920288c1a9eb63fd35fa8d1db5b Mon Sep 17 00:00:00 2001
+From: Bosse Klykken <larkly@gmail.com>
+Date: Tue, 17 Jul 2012 15:55:00 +0200
+Subject: [PATCH] =?UTF-8?q?Don=E2=80=99t=20try=20to=20build=20with=20SSLv2?=
+ =?UTF-8?q?=20when=20it=20is=20not=20available.?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The patch originally from http://stackoverflow.com/a/11072709/164233
+
+Fixes #30
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ SWIG/_ssl.i | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/SWIG/_ssl.i b/SWIG/_ssl.i
+index 3f6bd61..89b1ad1 100644
+--- a/SWIG/_ssl.i
++++ b/SWIG/_ssl.i
+@@ -52,8 +52,10 @@ extern const char *SSL_alert_desc_string(int);
+ %rename(ssl_get_alert_desc_v) SSL_alert_desc_string_long;
+ extern const char *SSL_alert_desc_string_long(int);
+ 
++#ifndef OPENSSL_NO_SSL2
+ %rename(sslv2_method) SSLv2_method;
+ extern SSL_METHOD *SSLv2_method(void);
++#endif
+ %rename(sslv3_method) SSLv3_method;
+ extern SSL_METHOD *SSLv3_method(void);
+ %rename(sslv23_method) SSLv23_method;
+-- 
+2.7.0
+
