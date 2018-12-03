From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  3 Dec 2018 14:07:34 +0200
Subject: [Buildroot] [PATCH] keyutils: bump to version 1.6
Message-ID: <6e85f490000f44ac712e4e9065abd38641b7ffd2.1543838854.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Refresh patch 0001.

Drop patch 0003; no longer needed after upstream headers rearrange.

Add license hash.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/keyutils/0001-fix-install-rule.patch  | 10 +++---
 .../0003-Add-missing-limits.h-include.patch   | 32 -------------------
 package/keyutils/keyutils.hash                |  4 ++-
 package/keyutils/keyutils.mk                  |  2 +-
 4 files changed, 10 insertions(+), 38 deletions(-)
 delete mode 100644 package/keyutils/0003-Add-missing-limits.h-include.patch

diff --git a/package/keyutils/0001-fix-install-rule.patch b/package/keyutils/0001-fix-install-rule.patch
index 3670d28e6673..26545716cbfe 100644
--- a/package/keyutils/0001-fix-install-rule.patch
+++ b/package/keyutils/0001-fix-install-rule.patch
@@ -6,15 +6,17 @@ the host library.
 Based on the former patch by Yann E. MORIN.
 
 Signed-off-by: Vicente Olivert Riera <vincent.riera@imgtec.com>
+[baruch: update for 1.6]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 
 --- keyutils-1.5.9/Makefile.orig	2014-09-22 16:13:41.593562765 +0100
 +++ keyutils-1.5.9/Makefile	2014-09-22 16:14:05.377963952 +0100
-@@ -168,7 +168,7 @@ ifeq ($(NO_SOLIB),0)
+@@ -184,7 +184,7 @@ ifeq ($(NO_SOLIB),0)
  	$(INSTALL) -D $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(LIBNAME)
  	$(LNS) $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SONAME)
  	mkdir -p $(DESTDIR)$(USRLIBDIR)
 -	$(LNS) $(LIBDIR)/$(SONAME) $(DESTDIR)$(USRLIBDIR)/$(DEVELLIB)
 +	$(LNS) $(SONAME) $(DESTDIR)$(USRLIBDIR)/$(DEVELLIB)
- endif
- 	$(INSTALL) -D keyctl $(DESTDIR)$(BINDIR)/keyctl
- 	$(INSTALL) -D request-key $(DESTDIR)$(SBINDIR)/request-key
+ 	sed \
+ 	-e 's, at VERSION\@,$(VERSION),g' \
+ 	-e 's, at prefix\@,$(PREFIX),g' \
diff --git a/package/keyutils/0003-Add-missing-limits.h-include.patch b/package/keyutils/0003-Add-missing-limits.h-include.patch
deleted file mode 100644
index 45c84398f99f..000000000000
--- a/package/keyutils/0003-Add-missing-limits.h-include.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From b2c6d3744dca029560d0d5e780f16561f8eeed53 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 12 Jul 2015 16:22:14 +0200
-Subject: [PATCH] Add missing <limits.h> include
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-key.dns_resolver.c uses ?UINT_MAX? and ?ULONG_MAX?, but forgets to
-include <limits.h>, which causes build failure with certain C
-libraries (notably the musl C library).
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- key.dns_resolver.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/key.dns_resolver.c b/key.dns_resolver.c
-index c2a9fe5..d41e219 100644
---- a/key.dns_resolver.c
-+++ b/key.dns_resolver.c
-@@ -56,6 +56,7 @@
- #include <stdlib.h>
- #include <unistd.h>
- #include <time.h>
-+#include <limits.h>
- 
- static const char *DNS_PARSE_VERSION = "1.0";
- static const char prog[] = "key.dns_resolver";
--- 
-2.4.5
-
diff --git a/package/keyutils/keyutils.hash b/package/keyutils/keyutils.hash
index b14b7bec13c7..d6781628cd66 100644
--- a/package/keyutils/keyutils.hash
+++ b/package/keyutils/keyutils.hash
@@ -1,2 +1,4 @@
 # Locally computed
-sha256 115c3deae7f181778fd0e0ffaa2dad1bf1fe2f5677cf2e0e348cdb7a1c93afb6  keyutils-1.5.10.tar.bz2
+sha256 d3aef20cec0005c0fa6b4be40079885567473185b1a57b629b030e67942c7115  keyutils-1.6.tar.bz2
+sha256 f46409d4822b2457b39bbd0e7881eecb396130eb8320b7748fa7e9488970aa6d  LICENCE.GPL
+sha256 0d15593e3a8ad90917f8509b5ac1e4b5e5d196434a68029aa9dc0858a4a4c521  LICENCE.LGPL
diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index 048b6894d31c..c8de3a0dfc3a 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEYUTILS_VERSION = 1.5.10
+KEYUTILS_VERSION = 1.6
 KEYUTILS_SOURCE = keyutils-$(KEYUTILS_VERSION).tar.bz2
 KEYUTILS_SITE = http://people.redhat.com/~dhowells/keyutils
 KEYUTILS_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.19.2
