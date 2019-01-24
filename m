From: Chris Packham <judge.packham@gmail.com>
Date: Fri, 25 Jan 2019 08:58:48 +1300
Subject: [Buildroot] [PATCH v2] syslog-ng: fix builds with static libc
Message-ID: <20190124195848.16647-1-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bring in an upstream patch to fix builds for targets which lack dlfcn.h
and revert "package/syslog-ng: depend on !BR2_STATIC_LIBS".

This reverts commit 44dbd2907c5995b0b0c56cb2274dc60415205dd8. Now that
upstream has different fix for the build issues with a static libc we
can re-enable syslog-ng on these systems.

Fixes:
- http://autobuild.buildroot.net/results/c0bca852e053cd0e021205b3a949e750ae602333

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
Changes in v2:
- squash revert and upstream fix into single patch
- include URL of build failure this fixes

 package/syslog-ng/Config.in      | 6 ++----
 package/syslog-ng/syslog-ng.hash | 1 +
 package/syslog-ng/syslog-ng.mk   | 1 +
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
index 6407645974..fbc236221a 100644
--- a/package/syslog-ng/Config.in
+++ b/package/syslog-ng/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_SYSLOG_NG
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_EVENTLOG
 	select BR2_PACKAGE_LIBGLIB2
@@ -16,8 +15,7 @@ config BR2_PACKAGE_SYSLOG_NG
 
 	  https://syslog-ng.org/
 
-comment "syslog-ng needs a toolchain w/ dynamic library, wchar, threads"
+comment "syslog-ng needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 1f83e39ff0..69c94da02b 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -3,3 +3,4 @@ sha256 5cf931a9d7bead0e6d9a2c65eee8f6005a005878f59aa280f3c4294257ed5178  syslog-
 sha256 835219c8ca76156e6337236d1bcb8e617c0b1c2783b4a8bc478e18a86743d607  COPYING
 sha256 ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
+sha256 feb26f77921b42fa7e5468229d883c5fae0b349cd075013eec2cb071a677179b  d85121c0dc700cad4bd9735b0ee1dab9addf9dd7.patch
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index ecde9e8181..f96b97f30e 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -18,6 +18,7 @@ SYSLOG_NG_AUTORECONF = YES
 SYSLOG_NG_CONF_ENV = LIBS=-lrt
 SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
 	--disable-java --disable-java-modules --disable-mongodb
+SYSLOG_NG_PATCH = https://github.com/balabit/syslog-ng/commit/d85121c0dc700cad4bd9735b0ee1dab9addf9dd7.patch
 
 ifeq ($(BR2_PACKAGE_GEOIP),y)
 SYSLOG_NG_DEPENDENCIES += geoip
-- 
2.20.1
