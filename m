From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 19 Nov 2020 22:58:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/c-ares: bump to version 1.17.1
Message-ID: <20201119215826.14126-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch (not needed since
https://github.com/c-ares/c-ares/commit/b83731ddb6b7834fa0e1eb14a523603c3c040298)
and so autoreconf

https://c-ares.haxx.se/changelog.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...c-lib-Makefile.am-install-ares_dns.h.patch | 37 -------------------
 package/c-ares/c-ares.hash                    |  2 +-
 package/c-ares/c-ares.mk                      |  4 +-
 3 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 package/c-ares/0001-src-lib-Makefile.am-install-ares_dns.h.patch

diff --git a/package/c-ares/0001-src-lib-Makefile.am-install-ares_dns.h.patch b/package/c-ares/0001-src-lib-Makefile.am-install-ares_dns.h.patch
deleted file mode 100644
index 02422dde38..0000000000
--- a/package/c-ares/0001-src-lib-Makefile.am-install-ares_dns.h.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From e2180d95fb67f57b6ffba01fefb4844a1ca4f792 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 18 Nov 2020 08:12:45 +0100
-Subject: [PATCH] src/lib/Makefile.am: install ares_dns.h
-
-This will avoid the following build failure with resiprocate:
-
-In file included from dns/DnsCnameRecord.cxx:7:
-dns/AresCompat.hxx:5:10: fatal error: ares_dns.h: No such file or directory
- #include "ares_dns.h"
-          ^~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/cbf158f0c037d44ef293a8804d18c84e3b731059
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/c-ares/c-ares/pull/376]
----
- src/lib/Makefile.am | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/lib/Makefile.am b/src/lib/Makefile.am
-index c918667..92a4152 100644
---- a/src/lib/Makefile.am
-+++ b/src/lib/Makefile.am
-@@ -14,6 +14,8 @@ lib_LTLIBRARIES = libcares.la
- 
- man_MANS = $(MANPAGES)
- 
-+include_HEADERS = ares_dns.h
-+
- # adig and ahost are just sample programs and thus not mentioned with the
- # regular sources and headers
- EXTRA_DIST = Makefile.inc config-win32.h CMakeLists.txt \
--- 
-2.29.2
-
diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index a24f3d72ea..235b7dbc66 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  1cecd5dbe21306c7263f8649aa6e9a37aecb985995a3489f487d98df2b40757d  c-ares-1.17.0.tar.gz
+sha256  d73dd0f6de824afd407ce10750ea081af47eba52b8a6cb307d220131ad93fc40  c-ares-1.17.1.tar.gz
 
 # Hash for license file
 sha256  db4eb63fe09daebdf57d3f79b091bb5ee5070c0d761040e83264e648d307af4c  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index ca1baf8af0..8f200237cf 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.17.0
+C_ARES_VERSION = 1.17.1
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
 C_ARES_LICENSE = MIT
 C_ARES_LICENSE_FILES = LICENSE.md
-# We're patching src/lib/Makefile.am
-C_ARES_AUTORECONF = YES
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.29.2
