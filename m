From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Nov 2020 22:00:12 +0100
Subject: [Buildroot] [git commit] package/libcap: bump version to 2.45
Message-ID: <20201103204720.6B7D687120@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d38eb052e7006b6e74e9453351d7f245144481e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This libcap release is now able to build on environments w/o thread support.

- add PTHREADS make arg to allow building without thread support
- add SHARED make arg (replace of DYNAMIC)
- remove patch that function is now in upstream (SHARED)

Fixes:
http://autobuild.buildroot.net/results/fc1e7573327c7412dfa45b45a96966d993c7fc86/

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...file-disable-building-installing-shared-l.patch | 38 ----------------------
 package/libcap/libcap.hash                         |  2 +-
 package/libcap/libcap.mk                           |  5 +--
 3 files changed, 4 insertions(+), 41 deletions(-)

diff --git a/package/libcap/0001-libcap-Makefile-disable-building-installing-shared-l.patch b/package/libcap/0001-libcap-Makefile-disable-building-installing-shared-l.patch
deleted file mode 100644
index 6d49f235a9..0000000000
--- a/package/libcap/0001-libcap-Makefile-disable-building-installing-shared-l.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From b7ca9dd97bbd9657c541f749ea6baf1f45b7c98a Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Wed, 9 Sep 2020 22:22:18 +0200
-Subject: [PATCH] libcap/Makefile: disable building/installing shared
- library when DYNAMIC is empty
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-[slightly manual modifications that patch still applies for libcap 2.44]
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- libcap/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libcap/Makefile b/libcap/Makefile
-index 81b089e..dfd4dea 100644
---- a/libcap/Makefile
-+++ b/libcap/Makefile
-@@ -22,7 +22,7 @@ MAJLIBNAME=$(LIBNAME).$(VERSION)
- MINLIBNAME=$(MAJLIBNAME).$(MINOR)
- GPERF_OUTPUT = _caps_output.gperf
- 
--all: $(MINLIBNAME) $(STACAPLIBNAME) pcs $(STAPSXLIBNAME)
-+all: $(if $(DYNAMIC),$(MINLIBNAME)) $(STACAPLIBNAME) pcs $(STAPSXLIBNAME)
- 
- pcs: libcap.pc libpsx.pc
- 
-@@ -93,7 +93,7 @@ cap_test: cap_test.c libcap.h
- test: cap_test
- 	./cap_test
- 
--install: install-static install-shared
-+install: $(if $(DYNAMIC),install-shared) install-static
- 
- install-common: pcs
- 	mkdir -p -m 0755 $(FAKEROOT)$(INCDIR)/sys
--- 
-2.26.2
-
diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index 8850da0b32..32986a41df 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,5 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256  92188359cd5be86e8e5bd3f6483ac6ce582264f912398937ef763def2205c8e1  libcap-2.44.tar.xz
+sha256  d66639f765c0e10557666b00f519caf0bd07a95f867dddaee131cd284fac3286  libcap-2.45.tar.xz
 
 # Hash for license file:
 sha256  088cabde4662b4121258d298b0b2967bc1abffa134457ed9bc4a359685ab92bc  License
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index e09bc1a624..2b80a3cb7d 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.44
+LIBCAP_VERSION = 2.45
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
@@ -19,7 +19,8 @@ LIBCAP_MAKE_FLAGS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	BUILD_CC="$(HOSTCC)" \
 	BUILD_CFLAGS="$(HOST_CFLAGS)" \
-	DYNAMIC=$(if $(BR2_STATIC_LIBS),,yes)
+	SHARED=$(if $(BR2_STATIC_LIBS),,yes) \
+	PTHREADS=$(if $(BR2_TOOLCHAIN_HAS_THREADS),yes,)
 
 LIBCAP_MAKE_DIRS = libcap
 
