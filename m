From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Nov 2018 22:16:09 +0100
Subject: [Buildroot] [git commit] libffi: bump to version 3.3-rc0
Message-ID: <20181109211757.9FCE1821B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57cf454c61b67681a9bbae456e558c880006bf67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update site to github (for the time being, as 3.3-rc0 is a release
  candidate, it is not published on the official ftp)
- Update third patch
- Remove fourth and fifth patches (already in version)
- Remove uneeded hooks, as public headers are now installed in the
  standard path since
  https://github.com/libffi/libffi/commit/982b89c01aca99c7bc229914fc1521f96930919b
- New risc-v support:
  https://github.com/libffi/libffi/commit/3840d49aaa831d649b1597518a2903dfed0d57f3

Fixes:
 - http://autobuild.buildroot.org/results/3edf66362ea5a83291f19373e4b6f2e5cce98d7b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...nable-hardfloat-in-the-MIPS-assembly-code.patch |  5 +-
 .../0004-m68k-support-ISA-A-Coldfire-CPUs.patch    | 77 ----------------------
 .../0005-mips-use-__linux__-and-not-linux.patch    | 37 -----------
 package/libffi/libffi.hash                         |  4 +-
 package/libffi/libffi.mk                           | 26 +-------
 5 files changed, 8 insertions(+), 141 deletions(-)

diff --git a/package/libffi/0003-libffi-enable-hardfloat-in-the-MIPS-assembly-code.patch b/package/libffi/0003-libffi-enable-hardfloat-in-the-MIPS-assembly-code.patch
index 776990df65..168972a871 100644
--- a/package/libffi/0003-libffi-enable-hardfloat-in-the-MIPS-assembly-code.patch
+++ b/package/libffi/0003-libffi-enable-hardfloat-in-the-MIPS-assembly-code.patch
@@ -7,6 +7,8 @@ This way it will be possible to build it for soft-float. This is only a
 temporary fix. The package needs to be fixed properly.
 
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+[Update for 3.3-rc0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/mips/n32.S | 1 +
  src/mips/o32.S | 1 +
@@ -17,9 +19,10 @@ index c6985d3..dc842d5 100644
 --- a/src/mips/n32.S
 +++ b/src/mips/n32.S
 @@ -44,6 +44,7 @@
- 	.abicalls
  #endif
+ #if !defined(__mips_isa_rev) || (__mips_isa_rev<6)
  	.set mips4
+ #endif
 +	.set hardfloat
  	.text
  	.align	2
diff --git a/package/libffi/0004-m68k-support-ISA-A-Coldfire-CPUs.patch b/package/libffi/0004-m68k-support-ISA-A-Coldfire-CPUs.patch
deleted file mode 100644
index 9308c8951a..0000000000
--- a/package/libffi/0004-m68k-support-ISA-A-Coldfire-CPUs.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 733bb188b898385cfb5ad28cc0e3ecaf38237350 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Sat, 20 Aug 2016 00:52:19 +0200
-Subject: [PATCH] m68k: support ISA-A Coldfire CPUs
-
-Fix compilation for m68k/coldfire CPUs like mcf5208.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Signed-off-by: Thorsten Glaser <tg@mirbsd.de>
----
- src/m68k/sysv.S |   29 ++++++++++++++++++++++++++++-
- 1 file changed, 28 insertions(+), 1 deletion(-)
-
-diff --git a/src/m68k/sysv.S b/src/m68k/sysv.S
-index ec2b14f..ea40f11 100644
---- a/src/m68k/sysv.S
-+++ b/src/m68k/sysv.S
-@@ -3,7 +3,7 @@
-    sysv.S - Copyright (c) 2012 Alan Hourihane
- 	    Copyright (c) 1998, 2012 Andreas Schwab
- 	    Copyright (c) 2008 Red Hat, Inc.
--	    Copyright (c) 2012 Thorsten Glaser
-+	    Copyright (c) 2012, 2016 Thorsten Glaser
- 
-    m68k Foreign Function Interface
- 
-@@ -72,6 +72,15 @@ CALLFUNC(ffi_call_SYSV):
- 	pea	4(%sp)
- #if !defined __PIC__
- 	jsr	CALLFUNC(ffi_prep_args)
-+#elif defined(__uClinux__) && defined(__ID_SHARED_LIBRARY__)
-+	move.l  _current_shared_library_a5_offset_(%a5),%a0
-+	move.l  CALLFUNC(ffi_prep_args at GOT)(%a0),%a0
-+	jsr     (%a0)
-+#elif defined(__mcoldfire__) && !defined(__mcfisab__) && !defined(__mcfisac__)
-+	move.l  #_GLOBAL_OFFSET_TABLE_ at GOTPC,%a0
-+	lea     (-6,%pc,%a0),%a0
-+	move.l  CALLFUNC(ffi_prep_args at GOT)(%a0),%a0
-+	jsr     (%a0)
- #else
- 	bsr.l	CALLFUNC(ffi_prep_args at PLTPC)
- #endif
-@@ -215,6 +224,15 @@ CALLFUNC(ffi_closure_SYSV):
- 	move.l	%a0,-(%sp)
- #if !defined __PIC__
- 	jsr	CALLFUNC(ffi_closure_SYSV_inner)
-+#elif defined(__uClinux__) && defined(__ID_SHARED_LIBRARY__)
-+	move.l  _current_shared_library_a5_offset_(%a5),%a0
-+	move.l  CALLFUNC(ffi_closure_SYSV_inner at GOT)(%a0),%a0
-+	jsr     (%a0)
-+#elif defined(__mcoldfire__) && !defined(__mcfisab__) && !defined(__mcfisac__)
-+	move.l  #_GLOBAL_OFFSET_TABLE_ at GOTPC,%a0
-+	lea     (-6,%pc,%a0),%a0
-+	move.l  CALLFUNC(ffi_closure_SYSV_inner at GOT)(%a0),%a0
-+	jsr     (%a0)
- #else
- 	bsr.l	CALLFUNC(ffi_closure_SYSV_inner at PLTPC)
- #endif
-@@ -317,6 +335,15 @@ CALLFUNC(ffi_closure_struct_SYSV):
- 	move.l	%a0,-(%sp)
- #if !defined __PIC__
- 	jsr	CALLFUNC(ffi_closure_SYSV_inner)
-+#elif defined(__uClinux__) && defined(__ID_SHARED_LIBRARY__)
-+	move.l  _current_shared_library_a5_offset_(%a5),%a0
-+	move.l  CALLFUNC(ffi_closure_SYSV_inner at GOT)(%a0),%a0
-+	jsr     (%a0)
-+#elif defined(__mcoldfire__) && !defined(__mcfisab__) && !defined(__mcfisac__)
-+	move.l  #_GLOBAL_OFFSET_TABLE_ at GOTPC,%a0
-+	lea     (-6,%pc,%a0),%a0
-+	move.l  CALLFUNC(ffi_closure_SYSV_inner at GOT)(%a0),%a0
-+	jsr     (%a0)
- #else
- 	bsr.l	CALLFUNC(ffi_closure_SYSV_inner at PLTPC)
- #endif
--- 
-1.7.10.4
-
diff --git a/package/libffi/0005-mips-use-__linux__-and-not-linux.patch b/package/libffi/0005-mips-use-__linux__-and-not-linux.patch
deleted file mode 100644
index a48f3d3b6d..0000000000
--- a/package/libffi/0005-mips-use-__linux__-and-not-linux.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 1f43e5edfd91bee80e518432b80db01f1bf226e3 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 22 Oct 2017 15:02:11 +0200
-Subject: [PATCH] mips: use __linux__ and not linux
-
-The "linux" symbol is not POSIX compliant [1], and therefore not
-defined when building with -std=c99. Due to this, the linux
-conditional block doesn't get used on Linux when building Python 3.x
-(which is built with -std=c99). To fix this, we use the POSIX
-compliant __linux__ symbol, which is defined when -std=c99 is used.
-
-This fixes the build of Python 3.x on MIPS/musl configuration, as it
-makes sures that <asm/sgidefs.h> gets included and not <sgidefs.h>.
-
-[1] https://sourceforge.net/p/predef/wiki/OperatingSystems/
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/mips/ffitarget.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/mips/ffitarget.h b/src/mips/ffitarget.h
-index 717d659..6faa358 100644
---- a/src/mips/ffitarget.h
-+++ b/src/mips/ffitarget.h
-@@ -32,7 +32,7 @@
- #error "Please do not include ffitarget.h directly into your source.  Use ffi.h instead."
- #endif
- 
--#ifdef linux
-+#ifdef __linux__
- # include <asm/sgidefs.h>
- #elif defined(__rtems__)
- /*
--- 
-2.13.6
-
diff --git a/package/libffi/libffi.hash b/package/libffi/libffi.hash
index 0153f7e37e..97deb988e6 100644
--- a/package/libffi/libffi.hash
+++ b/package/libffi/libffi.hash
@@ -1,4 +1,4 @@
-# From ftp://sourceware.org/pub/libffi/sha512.sum
-sha512	980ca30a8d76f963fca722432b1fe5af77d7a4e4d2eac5144fbc5374d4c596609a293440573f4294207e1bdd9fda80ad1e1cafb2ffb543df5a275bc3bd546483  libffi-3.2.1.tar.gz
+# Locally calculated
+sha256	db41cfb9ec8052fcd116a94c12237303c4447af4844d50e4fea7163661e31743  libffi-v3.3-rc0.tar.gz
 # License files, locally calculated
 sha256	0f4d7a0bfb83c37465d42dc305f124189196cc0cc2cc8d6f8461103682aebbc5  LICENSE
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 32e01e9cd1..b21d12cbd4 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -4,34 +4,12 @@
 #
 ################################################################################
 
-LIBFFI_VERSION = 3.2.1
-LIBFFI_SITE = ftp://sourceware.org/pub/libffi
+LIBFFI_VERSION = v3.3-rc0
+LIBFFI_SITE = $(call github,libffi,libffi,$(LIBFFI_VERSION))
 LIBFFI_LICENSE = MIT
 LIBFFI_LICENSE_FILES = LICENSE
 LIBFFI_INSTALL_STAGING = YES
 LIBFFI_AUTORECONF = YES
 
-# Move the headers to the usual location, and adjust the .pc file
-# accordingly.
-define LIBFFI_MOVE_HEADERS
-	mv $(1)/lib/libffi-$(LIBFFI_VERSION)/include/*.h $(1)/include/
-	$(SED) '/^includedir.*/d' -e '/^Cflags:.*/d' \
-		$(1)/lib/pkgconfig/libffi.pc
-	rm -rf $(1)/lib/libffi-*
-endef
-
-LIBFFI_MOVE_STAGING_HEADERS = $(call LIBFFI_MOVE_HEADERS,$(STAGING_DIR)/usr)
-LIBFFI_POST_INSTALL_STAGING_HOOKS += LIBFFI_MOVE_STAGING_HEADERS
-
-HOST_LIBFFI_MOVE_HOST_HEADERS = $(call LIBFFI_MOVE_HEADERS,$(HOST_DIR))
-HOST_LIBFFI_POST_INSTALL_HOOKS += HOST_LIBFFI_MOVE_HOST_HEADERS
-
-# Remove headers that are not at the usual location from the target
-define LIBFFI_REMOVE_TARGET_HEADERS
-	$(RM) -rf $(TARGET_DIR)/usr/lib/libffi-$(LIBFFI_VERSION)
-endef
-
-LIBFFI_POST_INSTALL_TARGET_HOOKS += LIBFFI_REMOVE_TARGET_HEADERS
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
