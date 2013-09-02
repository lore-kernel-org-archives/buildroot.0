From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Sep 2013 12:43:59 +0200
Subject: [Buildroot] [git commit] libmicrohttpd: disable spdy support
Message-ID: <20130902104447.453849B6C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37dfcbabb9d64a453f8d248f6a2e9708728484da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It requires OpenSSL and IPv6 support and it should probably be an
option since SSL support uses GnuTLS thus making a huge target
footprint with 2 SSL/TLS libraries for full support.
But most of all it's considered experimental.
Fixes:
http://autobuild.buildroot.net/results/836/836c39c11cecbcf9399675ba3ab01202417b9642/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libmicrohttpd-01-openssl-conditional.patch     |   20 ++++++++++++++++++++
 package/libmicrohttpd/libmicrohttpd.mk             |    2 ++
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd-01-openssl-conditional.patch b/package/libmicrohttpd/libmicrohttpd-01-openssl-conditional.patch
new file mode 100644
index 0000000..37d5e1e
--- /dev/null
+++ b/package/libmicrohttpd/libmicrohttpd-01-openssl-conditional.patch
@@ -0,0 +1,20 @@
+Subject: [PATCH] Fix configure failure for --disable-spdy
+
+The @HAVE_OPENSSL@ conditional is used in src/Makefile.in so when SPDY
+support is forcibly disabled the AM_CONDITIONAL is never executed, causing
+configure to bail out.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura libmicrohttpd-0.9.29.orig/configure.ac libmicrohttpd-0.9.29/configure.ac
+--- libmicrohttpd-0.9.29.orig/configure.ac	2013-09-02 06:17:44.660620584 -0300
++++ libmicrohttpd-0.9.29/configure.ac	2013-09-02 06:36:44.598189751 -0300
+@@ -341,6 +341,8 @@
+                    enable_spdy="yes"], 
+                    [AM_CONDITIONAL(HAVE_OPENSSL, false)
+                    enable_spdy="no"])
++else
++ AM_CONDITIONAL(HAVE_OPENSSL, false)
+ fi
+ 
+ if test "$enable_spdy" = "yes"
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 31ef7fe..d0501ee 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -8,6 +8,8 @@ LIBMICROHTTPD_VERSION = 0.9.29
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
+LIBMICROHTTPD_CONF_OPT = --disable-spdy
+LIBMICROHTTPD_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
 LIBMICROHTTPD_LICENSE = LGPLv2.1+
