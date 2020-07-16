From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 22:38:55 +0200
Subject: [Buildroot] [git commit] package/exim: bump to version 4.94
Message-ID: <20200716203458.49D3087818@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db322f25a1681658a92d9e0f51d094831166e67d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop seventh patch (already in version with
  https://git.exim.org/exim.git/commitdiff/302e7912253bd1f1a88f04d9a8a71d8a3c9b93fc)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...se-fix-version.-h-sh-generation-with-para.patch | 84 ----------------------
 package/exim/exim.hash                             | 10 +--
 package/exim/exim.mk                               |  4 +-
 3 files changed, 7 insertions(+), 91 deletions(-)

diff --git a/package/exim/0007-Makefile-Base-fix-version.-h-sh-generation-with-para.patch b/package/exim/0007-Makefile-Base-fix-version.-h-sh-generation-with-para.patch
deleted file mode 100644
index e97bd78a6a..0000000000
--- a/package/exim/0007-Makefile-Base-fix-version.-h-sh-generation-with-para.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 19f6e36d3473ddba1a211e7af9352a10febb7270 Mon Sep 17 00:00:00 2001
-From: Luca Ceresoli <luca@lucaceresoli.net>
-Date: Fri, 1 May 2020 16:27:48 +0200
-Subject: [PATCH] Makefile-Base: fix version.{h,sh} generation with parallel
- build
-
-When using parallel make (make -j<N>) the build sometimes fails either
-during 'make' or during 'make install'.
-
-Error messages look either like:
-
-  make[1]: Entering directory '/home/buildroot/autobuild/instance-2/output-1/build/exim-4.93.0.4'
-  /bin/sh scripts/source_checks
-  `Makefile' is up to date.
-
-  make[2]: Entering directory '/home/buildroot/autobuild/instance-2/output-1/build/exim-4.93.0.4/build-br'
-  /bin/sh ../scripts/Configure-os.c
-  ../scripts/reversion: Your copy of Exim lacks any version information.
-  Makefile:785: recipe for target 'version.sh' failed
-
-or like:
-
-  DESTDIR=/home/buildroot/autobuild/instance-2/output-1/target INSTALL_ARG="-no_chown -no_symlink" build=br /usr/bin/make -j4 -C /home/buildroot/autobuild/instance-2/output-1/build/exim-4.93.0.4  CFLAGS="-std=c99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  " install
-  make[1]: Entering directory '/home/buildroot/autobuild/instance-2/output-1/build/exim-4.93.0.4'
-  /bin/sh scripts/source_checks
-  `Makefile' is up to date.
-
-  make[2]: Entering directory '/home/buildroot/autobuild/instance-2/output-1/build/exim-4.93.0.4/build-br'
-  /home/buildroot/autobuild/instance-2/output-1/host/bin/i586-linux-gcc version.c
-  version.c: In function 'version_init':
-  version.c:32:1: error: expected expression before ';' token
-   ;
-   ^
-
-This is due to the rule:
-
-  version.h version.sh::
- 	@../scripts/reversion
-
-that executes reversion twice, once to satisfy the version.h target and
-once for version.sh. This is unnecessary because reversion generates both
-files anyway, but harmless without parallel build. When using parallel make
-however reversion is sporadically run in a time sequence such that the
-generated files are being used by other rules while they are being
-rewritten by the second reversion instance.
-
-Fix by making only one of the two targets run reversion, and the other one
-depend on it.
-
-Fixes builds found by the Buildroot autobuilders:
-  http://autobuild.buildroot.net/results/ebf/ebfccad007e216564889645a07f5487747116331//
-  http://autobuild.buildroot.net/results/56a/56a8457efcb32579ad6da99a769b6438dd0db267//
-  http://autobuild.buildroot.net/results/6a1/6a1f8a352649baf767b094cb6bbe2a7397fa7fac//
-  http://autobuild.buildroot.net/results/5ed/5ed1c42b3d33198f32d1267e5cc2b1fa1211495a//
-  http://autobuild.buildroot.net/results/b30/b304569948fd481ce33ecd052a1036153c5d459e//
-  http://autobuild.buildroot.net/results/d2c/d2c7abfe08672e53ff890127f787f8d2e84860f4//
-
-Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
-Upstream-status: patch submitted (https://bugs.exim.org/show_bug.cgi?id=2566)
-
----
- OS/Makefile-Base | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/OS/Makefile-Base b/OS/Makefile-Base
-index b66678bee4de..4966c25b5359 100644
---- a/OS/Makefile-Base
-+++ b/OS/Makefile-Base
-@@ -664,9 +664,11 @@ PHDRS = ../config.h \
- 
- # Update Exim's version information and build the version object.
- 
--version.h version.sh::
-+version.sh::
- 	@../scripts/reversion
- 
-+version.h: version.sh
-+
- cnumber.h: version.h
- 
- version.o: $(HDRS) cnumber.h version.h version.c
--- 
-2.26.2
-
diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 7cedf1bc88..265a95c6f5 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
-# From https://ftp.exim.org/pub/exim/exim4/fixes/00-sha256sums.txt
-sha256 537d366ee18ed357656f54f255f8f9e11bde9684fcaaecaaa56f84cdbcd3e405  exim-4.93.0.4.tar.xz
-# From https://ftp.exim.org/pub/exim/exim4/fixes/00-sha512sums.txt
-sha512 84951849b69399d6f187d2801760dc0cb9e61c88c7c88aaca4e07e48120199a6be94b2236d058ffeacb8d611dd84056b610d480353c301a3ad5799768dd39d96  exim-4.93.0.4.tar.xz
+# From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
+sha256  f77ee8faf04f5db793243c3ae81c1f4e452cd6ad7dd515a80edf755c4b144bdb  exim-4.94.tar.xz
+# From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
+sha512  3bf95ade30902327403e7308089a3e423761da5b0745397dace7c7fd15ba3838d93e0ee418f1fed57606f79e57b793c7c7407e5c0d526146f0036126d5d95316  exim-4.94.tar.xz
 # Locally calculated
-sha256 49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
+sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index dc445c6d93..6643abbf65 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.93.0.4
+EXIM_VERSION = 4.94
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
-EXIM_SITE = https://ftp.exim.org/pub/exim/exim4/fixes
+EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
 EXIM_LICENSE_FILES = LICENCE
 EXIM_DEPENDENCIES = host-berkeleydb host-pcre pcre berkeleydb host-pkgconf
