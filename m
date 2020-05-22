From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 22 May 2020 15:58:08 +0200
Subject: [Buildroot] [PATCH 2/2] package/dovecot: security bump to version
 2.3.10.1
In-Reply-To: <20200522135808.312867-1-fontaine.fabrice@gmail.com>
References: <20200522135808.312867-1-fontaine.fabrice@gmail.com>
Message-ID: <20200522135808.312867-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix CVE-2020-10957: In Dovecot before 2.3.10.1, unauthenticated
  sending of malformed parameters to a NOOP command causes a NULL
  Pointer Dereference and crash in submission-login, submission, or
  lmtp.
- Fix CVE-2020-10958: In Dovecot before 2.3.10.1, a crafted SMTP/LMTP
  message triggers an unauthenticated use-after-free bug in
  submission-login, submission, or lmtp, and can lead to a crash under
  circumstances involving many newlines after a command.
- Fix CVE-2020-10967: In Dovecot before 2.3.10.1, remote
  unauthenticated attackers can crash the lmtp or submission process by
  sending mail with an empty localpart.
- Drop first patch (already in version) and so autoreconf
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-Do-not-build-static-test-iostream-s.patch | 30 -------------------
 package/dovecot/dovecot.hash                  |  8 ++---
 package/dovecot/dovecot.mk                    |  4 +--
 3 files changed, 5 insertions(+), 37 deletions(-)
 delete mode 100644 package/dovecot/0001-lib-ssl-iostream-Do-not-build-static-test-iostream-s.patch

diff --git a/package/dovecot/0001-lib-ssl-iostream-Do-not-build-static-test-iostream-s.patch b/package/dovecot/0001-lib-ssl-iostream-Do-not-build-static-test-iostream-s.patch
deleted file mode 100644
index 686ed7383b..0000000000
--- a/package/dovecot/0001-lib-ssl-iostream-Do-not-build-static-test-iostream-s.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 40851dc3471809cabe8cc3f9b71980f8d82344ae Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 4 Jan 2020 14:39:39 +0100
-Subject: [PATCH] lib-ssl-iostream: Do not build static test-iostream-ssl
-
-Fixes broken static build:
-https://dovecot.org/pipermail/dovecot/2019-October/117326.html
-
-Patch sent upstream: https://github.com/dovecot/core/pull/111
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/lib-ssl-iostream/Makefile.am | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/lib-ssl-iostream/Makefile.am b/src/lib-ssl-iostream/Makefile.am
-index 94ead5cec..5aaea5d51 100644
---- a/src/lib-ssl-iostream/Makefile.am
-+++ b/src/lib-ssl-iostream/Makefile.am
-@@ -46,7 +46,6 @@ test_libs = \
- 	../lib/liblib.la
- 
- test_iostream_ssl_SOURCES = test-iostream-ssl.c
--test_iostream_ssl_LDFLAGS = -static
- test_iostream_ssl_LDADD = $(test_libs) $(SSL_LIBS) $(DLLIB)
- test_iostream_ssl_DEPENDENCIES = $(test_libs)
- 
--- 
-2.20.1
-
diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index e61937495a..09295816d3 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-sha256 f89fb69423fc5bdc05955c8fc0607eab9e33511f9a643b721763db6156c49651  dovecot-2.3.9.3.tar.gz
-sha256 a363b132e494f662d98c820d1481297e6ae72f194c2c91b6c39e1518b86240a8  COPYING
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
-sha256 52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
+sha256  6642e62f23b1b23cfac235007ca6e21cb67460cca834689fad450724456eb10c  dovecot-2.3.10.1.tar.gz
+sha256  a363b132e494f662d98c820d1481297e6ae72f194c2c91b6c39e1518b86240a8  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
+sha256  52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 86e101d80a..59b52a3f84 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.3
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).9.3
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).10.1
 DOVECOT_SITE = https://dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
@@ -14,8 +14,6 @@ DOVECOT_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	openssl
-# 0001-lib-ssl-iostream-Do-not-build-static-test-iostream-s.patch
-DOVECOT_AUTORECONF = YES
 # add host-gettext for AM_ICONV macro
 DOVECOT_DEPENDENCIES += host-gettext
 
-- 
2.26.2
