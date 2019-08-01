From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 11:03:04 +0200
Subject: [Buildroot] [git commit] package/icu: bump version to 64.2
Message-ID: <20190801090106.386EB81E3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28317118dc26b48496cca139c8792eb6fd27ac5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash after upstream commit:
https://github.com/unicode-org/icu/commit/fc255de3f050271198074c7e8865a805d33c20c4

Added patch to fix big endian build.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/icu/0005-Fix-big-endian-build.patch | 34 +++++++++++++++++++++++++++++
 package/icu/icu.hash                        |  7 +++---
 package/icu/icu.mk                          |  2 +-
 3 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/package/icu/0005-Fix-big-endian-build.patch b/package/icu/0005-Fix-big-endian-build.patch
new file mode 100644
index 0000000000..2cb2129010
--- /dev/null
+++ b/package/icu/0005-Fix-big-endian-build.patch
@@ -0,0 +1,34 @@
+From 9be0b489a94b57419202c552022f25cb95bfac51 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 17 Apr 2019 16:41:58 +0200
+Subject: [PATCH] Fix big-endian build
+
+Bug-report: https://unicode-org.atlassian.net/browse/ICU-20533
+Patch taken from: https://bugs.gentoo.org/682170
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Downloaded from
+http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch?h=master
+
+[Bernd: Fixed path]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ data/Makefile.in | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/source/data/Makefile.in b/source/data/Makefile.in
+index 778b6c7..67203e7 100644
+--- a/source/data/Makefile.in
++++ b/source/data/Makefile.in
+@@ -148,7 +148,8 @@ ICUDATA_ARCHIVE = $(firstword $(wildcard $(srcdir)/in/$(ICUDATA_BASENAME_VERSION
+ # and convert it to the current type.
+ ifneq ($(ICUDATA_ARCHIVE),)
+ ICUDATA_SOURCE_ARCHIVE = $(OUTDIR)/$(ICUDATA_PLATFORM_NAME).dat
+-$(ICUDATA_SOURCE_ARCHIVE): $(ICUDATA_ARCHIVE) $(OUTDIR)
++$(ICUDATA_SOURCE_ARCHIVE): $(ICUDATA_ARCHIVE)
++	$(MKINSTALLDIRS) $(OUTDIR)
+ 	$(INVOKE) $(TOOLBINDIR)/icupkg -t$(ICUDATA_CHAR) $(ICUDATA_ARCHIVE) $(ICUDATA_SOURCE_ARCHIVE)
+ endif
+ else
diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index 66a0a8dc80..86de0e14ea 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,3 +1,4 @@
-# From http://download.icu-project.org/files/icu4c/60.2/SHASUM512.txt
-sha512 8e718e66c13e7f25714404c46b91ed6305efff1df70c328be2ec743023a7719016dae72a5fa0a05d6f5599983590a2044ff72d3453a048d987ab546d0416d694  icu4c-60_2-src.tgz
-sha256 24c771ce37201a3ab604852e47d10d21595d0493269dd6c8a5e567e998e18c00  LICENSE
+# From http://download.icu-project.org/files/icu4c/64.2/SHASUM512.txt
+sha512 5ecb4c230ba45918747a1cf9aef86f555aa07d5b29b1d07ab674e8013f46dfb907a0e9d6945db41155f9dc3012fd94e1152ffc19f61a68b6dfcbabdcb8ae9d78  icu4c-64_2-src.tgz
+# Locally computed
+sha256 6a18c5fac70d7860b57f5b72b4e2c9a1ba6b3d2741eef7ff9767c5379364f10d  LICENSE
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 7bc1b97624..81d1dbc179 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -7,7 +7,7 @@
 # Git tags (and therefore versions on release-monitoring.org) use the
 # XX-Y format, but the tarballs are named XX_Y and the containing
 # directories XX.Y.
-ICU_VERSION = 60-2
+ICU_VERSION = 64-2
 ICU_SOURCE = icu4c-$(subst -,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = http://download.icu-project.org/files/icu4c/$(subst -,.,$(ICU_VERSION))
 ICU_LICENSE = ICU License
