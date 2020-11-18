From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Nov 2020 10:48:11 +0100
Subject: [Buildroot] [git commit] package/c-ares: fix install
Message-ID: <20201118093547.4E90D82128@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b359d0e7e5f8a1208b274ab57b1fae38af00663f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

c-ares 1.17.0 removed install of ares_dns.h which will result in build
failures with libeXosip and resiprocate

Fixes:
 - http://autobuild.buildroot.org/results/51573434303118fd92f32819e038971edee8bc28
 - http://autobuild.buildroot.org/results/cbf158f0c037d44ef293a8804d18c84e3b731059

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-src-lib-Makefile.am-install-ares_dns.h.patch | 37 ++++++++++++++++++++++
 package/c-ares/c-ares.mk                           |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/package/c-ares/0001-src-lib-Makefile.am-install-ares_dns.h.patch b/package/c-ares/0001-src-lib-Makefile.am-install-ares_dns.h.patch
new file mode 100644
index 0000000000..02422dde38
--- /dev/null
+++ b/package/c-ares/0001-src-lib-Makefile.am-install-ares_dns.h.patch
@@ -0,0 +1,37 @@
+From e2180d95fb67f57b6ffba01fefb4844a1ca4f792 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 18 Nov 2020 08:12:45 +0100
+Subject: [PATCH] src/lib/Makefile.am: install ares_dns.h
+
+This will avoid the following build failure with resiprocate:
+
+In file included from dns/DnsCnameRecord.cxx:7:
+dns/AresCompat.hxx:5:10: fatal error: ares_dns.h: No such file or directory
+ #include "ares_dns.h"
+          ^~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/cbf158f0c037d44ef293a8804d18c84e3b731059
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/c-ares/c-ares/pull/376]
+---
+ src/lib/Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/lib/Makefile.am b/src/lib/Makefile.am
+index c918667..92a4152 100644
+--- a/src/lib/Makefile.am
++++ b/src/lib/Makefile.am
+@@ -14,6 +14,8 @@ lib_LTLIBRARIES = libcares.la
+ 
+ man_MANS = $(MANPAGES)
+ 
++include_HEADERS = ares_dns.h
++
+ # adig and ahost are just sample programs and thus not mentioned with the
+ # regular sources and headers
+ EXTRA_DIST = Makefile.inc config-win32.h CMakeLists.txt \
+-- 
+2.29.2
+
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index d3510b3c81..ca1baf8af0 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -10,6 +10,8 @@ C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
 C_ARES_LICENSE = MIT
 C_ARES_LICENSE_FILES = LICENSE.md
+# We're patching src/lib/Makefile.am
+C_ARES_AUTORECONF = YES
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
