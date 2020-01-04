From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jan 2020 15:08:23 +0100
Subject: [Buildroot] [PATCH 1/2] package/dovecot: bump version to 2.3.9.2
Message-ID: <20200104140824.2338592-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://dovecot.org/pipermail/dovecot-news/2019-October/000419.html
https://dovecot.org/pipermail/dovecot-news/2019-December/000423.html
https://dovecot.org/pipermail/dovecot-news/2019-December/000425.html
https://dovecot.org/pipermail/dovecot-news/2019-December/000427.html

Please note that according to
https://security-tracker.debian.org/tracker/CVE-2019-19722
CVE-2019-19722 fixes a bug introduced in 2.3.9 so backporting this patch
to older buildroot branches is not necessary.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...-Do-not-build-static-test-iostream-s.patch | 30 +++++++++++++++++++
 package/dovecot/dovecot.hash                  |  2 +-
 package/dovecot/dovecot.mk                    |  6 +++-
 3 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 package/dovecot/0002-lib-ssl-iostream-Do-not-build-static-test-iostream-s.patch

diff --git a/package/dovecot/0002-lib-ssl-iostream-Do-not-build-static-test-iostream-s.patch b/package/dovecot/0002-lib-ssl-iostream-Do-not-build-static-test-iostream-s.patch
new file mode 100644
index 0000000000..686ed7383b
--- /dev/null
+++ b/package/dovecot/0002-lib-ssl-iostream-Do-not-build-static-test-iostream-s.patch
@@ -0,0 +1,30 @@
+From 40851dc3471809cabe8cc3f9b71980f8d82344ae Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 4 Jan 2020 14:39:39 +0100
+Subject: [PATCH] lib-ssl-iostream: Do not build static test-iostream-ssl
+
+Fixes broken static build:
+https://dovecot.org/pipermail/dovecot/2019-October/117326.html
+
+Patch sent upstream: https://github.com/dovecot/core/pull/111
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/lib-ssl-iostream/Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/lib-ssl-iostream/Makefile.am b/src/lib-ssl-iostream/Makefile.am
+index 94ead5cec..5aaea5d51 100644
+--- a/src/lib-ssl-iostream/Makefile.am
++++ b/src/lib-ssl-iostream/Makefile.am
+@@ -46,7 +46,6 @@ test_libs = \
+ 	../lib/liblib.la
+ 
+ test_iostream_ssl_SOURCES = test-iostream-ssl.c
+-test_iostream_ssl_LDFLAGS = -static
+ test_iostream_ssl_LDADD = $(test_libs) $(SSL_LIBS) $(DLLIB)
+ test_iostream_ssl_DEPENDENCIES = $(test_libs)
+ 
+-- 
+2.20.1
+
diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index 3d78af0092..e8c76b3c1e 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-sha256 666ce084760a47e601d49a9be3c7993c48789d332631e8dfb45f443b367b1260  dovecot-2.3.7.2.tar.gz
+sha256 4784fb98dd41b83888e4aa9908efcbcad2e04a254e97440863903c0c498486f9  dovecot-2.3.9.2.tar.gz
 sha256 a363b132e494f662d98c820d1481297e6ae72f194c2c91b6c39e1518b86240a8  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256 52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 65c2bcef69..5b19fa6235 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.3
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).7.2
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).9.2
 DOVECOT_SITE = https://dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
@@ -14,6 +14,10 @@ DOVECOT_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	openssl
+# 0002-lib-ssl-iostream-Do-not-build-static-test-iostream-s.patch
+DOVECOT_AUTORECONF = YES
+# add host-gettext for AM_ICONV macro
+DOVECOT_DEPENDENCIES += host-gettext
 
 DOVECOT_CONF_ENV = \
 	RPCGEN=__disable_RPCGEN_rquota \
-- 
2.20.1
