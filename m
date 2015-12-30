From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 14:54:10 +0100
Subject: [Buildroot] [git commit] bind: bump to version 9.10.3-P2
Message-ID: <20151230135413.766588274C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07c1ad4647b6a8e60338fc01ddcb2d629de0ad14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Leave the LTS series for the latest stable version for libressl
compatibility.
Unfortunately this means threads are now required, but this shouldn't be
a problem for a fully-featured resolver.

Drop 0001-disable-tests.patch since it's no longer required, genrandom
isn't run unless the tests are called upon.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bind/0001-disable-tests.patch | 28 ----------------------------
 package/bind/Config.in                |  5 +++--
 package/bind/bind.hash                |  4 ++--
 package/bind/bind.mk                  |  9 ++++++++-
 4 files changed, 13 insertions(+), 33 deletions(-)

diff --git a/package/bind/0001-disable-tests.patch b/package/bind/0001-disable-tests.patch
deleted file mode 100644
index 181b229..0000000
--- a/package/bind/0001-disable-tests.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Disable tests to avoid cross-compilation issues (tries to run genrandom).
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura bind-9.9.4-P2.orig/bin/Makefile.in bind-9.9.4-P2/bin/Makefile.in
---- bind-9.9.4-P2.orig/bin/Makefile.in	2013-12-19 21:28:28.000000000 -0300
-+++ bind-9.9.4-P2/bin/Makefile.in	2014-01-17 11:41:25.378784210 -0300
-@@ -19,7 +19,7 @@
- VPATH =		@srcdir@
- top_srcdir =	@top_srcdir@
- 
--SUBDIRS =	named rndc dig dnssec tools tests nsupdate \
-+SUBDIRS =	named rndc dig dnssec tools nsupdate \
- 		check confgen @PYTHON_TOOLS@ @PKCS11_TOOLS@
- TARGETS =
- 
-diff -Nura bind-9.9.4-P2.orig/lib/Makefile.in bind-9.9.4-P2/lib/Makefile.in
---- bind-9.9.4-P2.orig/lib/Makefile.in	2013-12-19 21:28:28.000000000 -0300
-+++ bind-9.9.4-P2/lib/Makefile.in	2014-01-17 11:41:30.489954861 -0300
-@@ -23,7 +23,7 @@
- # Attempt to disable parallel processing.
- .NOTPARALLEL:
- .NO_PARALLEL:
--SUBDIRS =	isc isccc dns isccfg bind9 lwres tests
-+SUBDIRS =	isc isccc dns isccfg bind9 lwres
- TARGETS =
- 
- @BIND9_MAKE_RULES@
diff --git a/package/bind/Config.in b/package/bind/Config.in
index d758884..a580f0e 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_BIND
 	bool "bind"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	help
 	  BIND (Berkeley Internet Name Domain) is an implementation of
@@ -37,6 +38,6 @@ config BR2_PACKAGE_BIND_TOOLS
 
 endif
 
-comment "bind needs a toolchain w/ dynamic library"
+comment "bind needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index befc8d7..ae71bd1 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,2 @@
-# Verified from ftp://ftp.isc.org/isc/bind9/9.9.8-P2/bind-9.9.8-P2.tar.gz.sha256.asc
-sha256	f5841926e19637b93ec0b44b5abfbab2410e692736cf11143d461f656fbdf329	bind-9.9.8-P2.tar.gz
+# Verified from ftp://ftp.isc.org/isc/bind9/9.10.3-P2/bind-9.10.3-P2.tar.gz.sha256.asc
+sha256	4a6c1911ac0d4b6be635b63de3429b6c168ea244043f12bbc8a4eb3368fd6ecd	bind-9.10.3-P2.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 0e9a0f4..5a77d82 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.9.8-P2
+BIND_VERSION = 9.10.3-P2
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
 BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
@@ -36,6 +36,13 @@ else
 BIND_CONF_OPTS += --disable-linux-caps
 endif
 
+ifeq ($(BR2_PACKAGE_JSON_C),y)
+BIND_CONF_OPTS += --with-libjson=yes
+BIND_DEPENDENCIES += json-c
+else
+BIND_CONF_OPTS += --with-libjson=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 BIND_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr --enable-newstats
 BIND_DEPENDENCIES += libxml2
