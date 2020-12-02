From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  2 Dec 2020 19:58:38 +0100
Subject: [Buildroot] [PATCH/next v1] package/libaio: bump version to 0.3.112
Message-ID: <20201202185838.11828-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- remove 0001-src-Makefile-add-ENABLE_SHARED-boolean-to-allow-stat.patch
  (upstream committed [1])

- remove 0002-Makefile-add-missing-DESTDIR-variable-use.patch
  (upstream committed [2])

- remove 0003-Link-against-libgcc-to-avoid-unresolved-symbols.patch
  (upstream committed [3])

Changelog (from libaio.spec):
  - Add async poll support (Christoph Hellwig)
  - Use canonical DESTDIR= environment variable (Thomas Petazzoni)
  - Add ability to disable building the shared library (Thomas Petazzoni)

[1] https://pagure.io/libaio/c/970196192771eeda39fabcc59a5dae9613e871a8.patch
[2] https://pagure.io/libaio/c/4059161333a14a0c705efecc5765b6cb2a29ae02.patch
[3] https://pagure.io/libaio/c/de5775ea1b42ea83e305db9c17372e3f0a8dd3a3.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...-ENABLE_SHARED-boolean-to-allow-stat.patch | 56 ------------------
 ...ile-add-missing-DESTDIR-variable-use.patch | 32 -----------
 ...t-libgcc-to-avoid-unresolved-symbols.patch | 57 -------------------
 package/libaio/libaio.hash                    |  4 +-
 package/libaio/libaio.mk                      |  2 +-
 5 files changed, 3 insertions(+), 148 deletions(-)
 delete mode 100644 package/libaio/0001-src-Makefile-add-ENABLE_SHARED-boolean-to-allow-stat.patch
 delete mode 100644 package/libaio/0002-Makefile-add-missing-DESTDIR-variable-use.patch
 delete mode 100644 package/libaio/0003-Link-against-libgcc-to-avoid-unresolved-symbols.patch

diff --git a/package/libaio/0001-src-Makefile-add-ENABLE_SHARED-boolean-to-allow-stat.patch b/package/libaio/0001-src-Makefile-add-ENABLE_SHARED-boolean-to-allow-stat.patch
deleted file mode 100644
index 9c876bdc5c..0000000000
--- a/package/libaio/0001-src-Makefile-add-ENABLE_SHARED-boolean-to-allow-stat.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 4dc04ef55710f7f5c1e55ebb5cba8e22a126404e Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 29 Aug 2016 22:14:26 +0200
-Subject: [PATCH] src/Makefile: add ENABLE_SHARED boolean to allow static-only
- build
-
-Currently, the libaio builds sytem builds a shared library
-unconditionally. In some environments, this is not possible or
-desirable. This commit adds a new Makefile variable, ENABLE_SHARED,
-which defaults to "1" (i.e shared library enabled) and that allows to
-override this behavior, and therefore to disable the build and
-installation of the shared library.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/Makefile | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index eadb336..cfab240 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -8,12 +8,17 @@ SO_CFLAGS=-shared $(CFLAGS)
- L_CFLAGS=$(CFLAGS)
- LINK_FLAGS=
- LINK_FLAGS+=$(LDFLAGS)
-+ENABLE_SHARED ?= 1
- 
- soname=libaio.so.1
- minor=0
- micro=1
- libname=$(soname).$(minor).$(micro)
--all_targets += libaio.a $(libname)
-+all_targets += libaio.a
-+
-+ifeq ($(ENABLE_SHARED),1)
-+all_targets += $(libname)
-+endif
- 
- all: $(all_targets)
- 
-@@ -55,9 +60,11 @@ $(libname): $(libaio_sobjs) libaio.map
- install: $(all_targets)
- 	install -D -m 644 libaio.h $(includedir)/libaio.h
- 	install -D -m 644 libaio.a $(libdir)/libaio.a
-+ifeq ($(ENABLE_SHARED),1)
- 	install -D -m 755 $(libname) $(libdir)/$(libname)
- 	ln -sf $(libname) $(libdir)/$(soname)
- 	ln -sf $(libname) $(libdir)/libaio.so
-+endif
- 
- $(libaio_objs): libaio.h
- 
--- 
-2.14.4
-
diff --git a/package/libaio/0002-Makefile-add-missing-DESTDIR-variable-use.patch b/package/libaio/0002-Makefile-add-missing-DESTDIR-variable-use.patch
deleted file mode 100644
index 49b9892ea4..0000000000
--- a/package/libaio/0002-Makefile-add-missing-DESTDIR-variable-use.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 517d9fbe63fbd7e72445dce1cb3f3d8457d838cb Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Tue, 14 Aug 2018 23:17:25 +0200
-Subject: [PATCH] Makefile: add missing DESTDIR variable use
-
-Patch borrowed from OpenEmbedded, available at
-recipes/libaio/libaio-0.3.106/destdir.patch in their source tree.
-
-It just adds support for the traditional DESTDIR variable to install
-the library in a different sysroot than the normal /.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index e9dbdb0..c1fb831 100644
---- a/Makefile
-+++ b/Makefile
-@@ -14,7 +14,7 @@ all:
- 	@$(MAKE) -C src
- 
- install:
--	@$(MAKE) -C src install prefix=$(prefix) includedir=$(includedir) libdir=$(libdir)
-+	@$(MAKE) -C src install prefix=$(DESTDIR)$(prefix) includedir=$(DESTDIR)$(includedir) libdir=$(DESTDIR)$(libdir)
- 
- check:
- 	@$(MAKE) -C harness check
--- 
-2.14.4
-
diff --git a/package/libaio/0003-Link-against-libgcc-to-avoid-unresolved-symbols.patch b/package/libaio/0003-Link-against-libgcc-to-avoid-unresolved-symbols.patch
deleted file mode 100644
index 17204be75b..0000000000
--- a/package/libaio/0003-Link-against-libgcc-to-avoid-unresolved-symbols.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 672eaebd131c789a528e3a9cd089b4b69a82012b Mon Sep 17 00:00:00 2001
-From: Guillem Jover <guillem@debian.org>
-Date: Fri, 28 Sep 2018 13:15:54 +0300
-Subject: [PATCH] Link against libgcc to avoid unresolved symbols
-
-We need to link agaisnt -lgcc, on at least hppa, PPC and ARC.
-That's because in some corner-cases like compilation with -Os
-on ARC and PPC so-called millicode (basically function prologue and
-epilogue) implemented in libgcc.a is used. So we end up with
-GLOBAL UNDEFINED symbol in libaio.so and then on linkage of the final
-applicaiton LD fails to proceed saying:
---------------------------->8----------------------
-hidden symbol '__ld_r13_to_r15_ret' in .../libgcc.a(_millicodethunk_ret.o) is referenced by DSO
---------------------------->8----------------------
-
-Also it looks like in general it is not the best idea to use either
-"-nostartfiles" or "-nostdlib" when linking shared libs because
-default construtor/destructor functions won't be executed, see
-"5.2. Library constructor and destructor functions" in [1]
-
-So let's stop passing "-nostdlib" and "-nostartfiles" and get required
-stuff built-in libaio.
-
-Initial patch taken from Debian [2].
-
-Fixes build failures in Buildroot like blktrace [3], lvm2 [4].
-
-Was submitted upstream via pull-request [5].
-
-[1] http://tldp.org/HOWTO/Program-Library-HOWTO/miscellaneous.html
-[2] https://sources.debian.org/patches/libaio/0.3.111-1/01_link_libs.patch/
-[3] http://autobuild.buildroot.net/results/17461209755038a30118d76acb4f43469a22a139/
-[4] http://autobuild.buildroot.net/results/a5dfc87f94b97135e5cc84f6a876114891ed9dd9/
-[5] https://pagure.io/libaio/pull-request/7
-
-Signed-off-by: Guillem Jover <guillem@debian.org>
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- src/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index eadb336b47e3..5911c810c766 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -3,7 +3,7 @@ includedir=$(prefix)/include
- libdir=$(prefix)/lib
- 
- CFLAGS ?= -g -fomit-frame-pointer -O2
--CFLAGS += -nostdlib -nostartfiles -Wall -I. -fPIC
-+CFLAGS += -Wall -I. -fPIC
- SO_CFLAGS=-shared $(CFLAGS)
- L_CFLAGS=$(CFLAGS)
- LINK_FLAGS=
--- 
-2.17.1
-
diff --git a/package/libaio/libaio.hash b/package/libaio/libaio.hash
index 17dd1ff706..ac815a73b5 100644
--- a/package/libaio/libaio.hash
+++ b/package/libaio/libaio.hash
@@ -1,5 +1,5 @@
 # From https://releases.pagure.org/libaio/CHECKSUMS
-sha256	62cf871ad8fd09eb3418f00aca7a7d449299b8e1de31c65f28bf6a2ef1fa502a	libaio-0.3.111.tar.gz
+sha256  ab0462f2c9d546683e5147b1ce9c195fe95d07fac5bf362f6c01637955c3b492 libaio-0.3.112.tar.gz
 
 # Hash for license file:
-sha256	5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509	COPYING
+sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index a215ca6533..34f08b75e7 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBAIO_VERSION = 0.3.111
+LIBAIO_VERSION = 0.3.112
 LIBAIO_SITE = https://releases.pagure.org/libaio
 LIBAIO_INSTALL_STAGING = YES
 LIBAIO_LICENSE = LGPL-2.1+
-- 
2.29.2
