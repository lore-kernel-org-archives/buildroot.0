From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Aug 2017 18:44:52 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/spidermonkey185: new package
Message-ID: <20170806164452.11938-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

This is the old 1.8.5 branch of spidermonkey, used in Firefox 4.
It is rather unmaintained, but some software still depend on it,
such as couchdb.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Bernd: Updated the patch by Nicolas
- rebased
- added myself to DEVELOPERS
- updated patches to solve build problems found by test-pkg
  - patches 1-10 were taken from Fedora:
    https://src.fedoraproject.org/rpms/js/tree/f26
  - patches 11 & 13 are from Nicolas original patch series
  - patch 12 was added to fix armv5 support
- HOST_CFLAGS was added to fix configure errors detected by test-pkg:
  - br-arcle-hs38:
    gcc: error: unrecognized command line option '-matomic';
    did you mean '-mbionic'?
  - br-xtensa-full:
    gcc: error: unrecognized command line option '-mlongcalls'
    gcc: error: unrecognized command line option '-mauto-litpools'
  - powerpc-ctng_e500v2-linux-gnuspe:
    gcc: error: unrecognized argument in option '-mabi=spe'
    gcc: note: valid arguments to '-mabi=' are: ms sysv
    gcc: error: unrecognized command line option '-mfloat-gprs=double';
    did you mean '-ffloat-store'?
- JIT support was disabled for BR2_ARM_CPU_ARMV4 to fix:
  {standard input}:35: Error: selected processor does not support ARM mode `blx SetVMFrameRegs'
  {standard input}:37: Error: selected processor does not support ARM mode `blx PushActiveVMFrame'
  {standard input}:46: Error: selected processor does not support ARM mode `blx PopActiveVMFrame'
  {standard input}:55: Error: selected processor does not support ARM mode `blx js_InternalThrow'
  {standard input}:60: Error: selected processor does not support ARM mode `blx PopActiveVMFrame'
  {standard input}:69: Error: selected processor does not support ARM mode `blx ip'
  config/rules.mk:1475: recipe for target 'MethodJIT.o' failed
- test-pkg also detected build errors on powerpc and x86_64:
  jsapi.cpp: In function ?JSBool JS_ConvertArgumentsVA(JSContext*, uintN, jsval*, const char*, __va_list_tag*)?:
  jsapi.cpp:361:63: error: cannot convert ?__va_list_tag**? to ?__va_list_tag (*)[1]?
   for argument ?5? to ?JSBool TryArgumentFormatter(JSContext*, const char**, JSBool, jsval**, __va_list_tag (*)[1])?
                                       JS_ADDRESSOF_VA_LIST(ap))) {
  which were fixed by ac_cv_va_val_copy=no

This package now passes test-pkg on the next branch with this defconfig
BR2_PACKAGE_SPIDERMONKEY185=y

                armv5-ctng-linux-gnueabi [ 1/47]: OK
              armv7-ctng-linux-gnueabihf [ 2/47]: OK
                        br-aarch64-glibc [ 3/47]: OK
                           br-arcle-hs38 [ 4/47]: OK
                            br-arm-basic [ 5/47]: SKIPPED
                  br-arm-cortex-a9-glibc [ 6/47]: OK
                   br-arm-cortex-a9-musl [ 7/47]: OK
                   br-arm-cortex-m4-full [ 8/47]: SKIPPED
                             br-arm-full [ 9/47]: OK
                    br-arm-full-nothread [10/47]: SKIPPED
                      br-arm-full-static [11/47]: SKIPPED
                            br-bfin-full [12/47]: SKIPPED
                   br-i386-pentium4-full [13/47]: OK
                br-i386-pentium-mmx-musl [14/47]: OK
                       br-m68k-5208-full [15/47]: SKIPPED
                      br-m68k-68040-full [16/47]: SKIPPED
                    br-microblazeel-full [17/47]: SKIPPED
                 br-mips32r6-el-hf-glibc [18/47]: OK
                      br-mips64-n64-full [19/47]: OK
                 br-mips64r6-el-hf-glibc [20/47]: OK
                      br-mipsel-o32-full [21/47]: OK
                          br-nios2-glibc [22/47]: OK
                      br-openrisc-uclibc [23/47]: SKIPPED
               br-powerpc-603e-basic-cpp [24/47]: OK
             br-powerpc64le-power8-glibc [25/47]: OK
               br-powerpc64-power7-glibc [26/47]: OK
                  br-powerpc-e500mc-full [27/47]: OK
                             br-sh4-full [28/47]: OK
                        br-sparc64-glibc [29/47]: OK
                         br-sparc-uclibc [30/47]: OK
                    br-x86-64-core2-full [31/47]: OK
                          br-x86-64-musl [32/47]: OK
                          br-xtensa-full [33/47]: OK
                     i686-ctng-linux-gnu [34/47]: OK
                          linaro-aarch64 [35/47]: OK
                              linaro-arm [36/47]: OK
             mips64el-ctng_n32-linux-gnu [37/47]: OK
             mips64el-ctng_n64-linux-gnu [38/47]: OK
        powerpc-ctng_e500v2-linux-gnuspe [39/47]: OK
                     sourcery-arm-armv4t [40/47]: OK
                            sourcery-arm [41/47]: OK
                     sourcery-arm-thumb2 [42/47]: OK
                         sourcery-mips64 [43/47]: OK
                           sourcery-mips [44/47]: OK
                          sourcery-nios2 [45/47]: OK
                         sourcery-x86-64 [46/47]: OK
           x86_64-ctng_locales-linux-gnu [47/47]: OK
47 builds, 9 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v4: rebased and major patch overhaul
v3: Addressed Maxime Hadjinlian's comments
v2:
* Moved package to Libraries/Other
* Tried to make the package reconfigurable, but stopped when the patch
  grew even larger than previous patches.  Instead, simplified the patch
  to not force a specific arm version, to make the configure patch smaller.
* Added patches to fix DESTDIR being embedded in the symlink and
  remove the leftover nspr dependency.
* Added comment on why we define symbols for the host compiler.
* Added upstream patches to fix problems on various architectures,
  taking inspiration for the patches that Debian uses.
* Disabled the JIT on sparc64 because that does not compile.
* Added host-perl and host-python, because they are used to build.
* Changed license as per Arnout suggestion


 DEVELOPERS                                         |   1 +
 package/Config.in                                  |   1 +
 .../spidermonkey185/0001-64bit-big-endian.patch    |  21 +++
 package/spidermonkey185/0002-secondary-jit.patch   |  22 +++
 package/spidermonkey185/0003-destdir.patch         |  24 ++++
 package/spidermonkey185/0004-537701.patch          |  47 +++++++
 package/spidermonkey185/0005-arm-nosoftfp.patch    |  41 ++++++
 package/spidermonkey185/0006-aarch64.patch         |  61 +++++++++
 package/spidermonkey185/0007-ppc64le.patch         |  56 ++++++++
 package/spidermonkey185/0008-array-recursion.patch | 115 ++++++++++++++++
 package/spidermonkey185/0009-c++11.patch           | 152 +++++++++++++++++++++
 package/spidermonkey185/0010-tag.patch             | 107 +++++++++++++++
 ...11-remove-unused-pkgconfg-nspr-dependency.patch |  19 +++
 package/spidermonkey185/0012-arm5tej.patch         |  24 ++++
 ...heFlush-support-error-on-exotic-platforms.patch |  36 +++++
 package/spidermonkey185/Config.in                  |  16 +++
 package/spidermonkey185/spidermonkey185.hash       |   2 +
 package/spidermonkey185/spidermonkey185.mk         |  36 +++++
 18 files changed, 781 insertions(+)
 create mode 100644 package/spidermonkey185/0001-64bit-big-endian.patch
 create mode 100644 package/spidermonkey185/0002-secondary-jit.patch
 create mode 100644 package/spidermonkey185/0003-destdir.patch
 create mode 100644 package/spidermonkey185/0004-537701.patch
 create mode 100644 package/spidermonkey185/0005-arm-nosoftfp.patch
 create mode 100644 package/spidermonkey185/0006-aarch64.patch
 create mode 100644 package/spidermonkey185/0007-ppc64le.patch
 create mode 100644 package/spidermonkey185/0008-array-recursion.patch
 create mode 100644 package/spidermonkey185/0009-c++11.patch
 create mode 100644 package/spidermonkey185/0010-tag.patch
 create mode 100644 package/spidermonkey185/0011-remove-unused-pkgconfg-nspr-dependency.patch
 create mode 100644 package/spidermonkey185/0012-arm5tej.patch
 create mode 100644 package/spidermonkey185/0013-Avoid-missing-cacheFlush-support-error-on-exotic-platforms.patch
 create mode 100644 package/spidermonkey185/Config.in
 create mode 100644 package/spidermonkey185/spidermonkey185.hash
 create mode 100644 package/spidermonkey185/spidermonkey185.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9df289680..f10476fb3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -300,6 +300,7 @@ F:	package/python-pylru/
 F:	package/python-slob/
 F:	package/rtmpdump/
 F:	package/softether/
+F:	package/spidermonkey185/
 F:	package/taglib/
 F:	package/tinyxml2/
 F:	package/tor/
diff --git a/package/Config.in b/package/Config.in
index 85416afdf..a43a2fcf6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1482,6 +1482,7 @@ endif
 	source "package/shapelib/Config.in"
 	source "package/skalibs/Config.in"
 	source "package/sphinxbase/Config.in"
+	source "package/spidermonkey185/Config.in"
 	source "package/startup-notification/Config.in"
 	source "package/tinycbor/Config.in"
 	source "package/tz/Config.in"
diff --git a/package/spidermonkey185/0001-64bit-big-endian.patch b/package/spidermonkey185/0001-64bit-big-endian.patch
new file mode 100644
index 000000000..9d5142b20
--- /dev/null
+++ b/package/spidermonkey185/0001-64bit-big-endian.patch
@@ -0,0 +1,21 @@
+https://bugzilla.mozilla.org/show_bug.cgi?id=627664
+
+Source:
+https://src.fedoraproject.org/rpms/js/blob/f26/f/js-1.8.5-64bit-big-endian.patch
+
+Patch position #1:
+https://src.fedoraproject.org/rpms/js/blob/master/f/js.spec#_12
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -up xulrunner-2.0/mozilla-central/js/src/jsval.h.64bit-big-endian xulrunner-2.0/mozilla-central/js/src/jsval.h
+--- js-1.8.5/js/src/jsval.h.64bit-big-endian	2011-01-20 15:59:49.000000000 +0100
++++ js-1.8.5/js/src/jsval.h	2011-01-20 16:00:21.000000000 +0100
+@@ -347,6 +347,7 @@ typedef union jsval_layout
+             int32          i32;
+             uint32         u32;
+             JSWhyMagic     why;
++            jsuword        word;
+         } payload;
+     } s;
+     double asDouble;
diff --git a/package/spidermonkey185/0002-secondary-jit.patch b/package/spidermonkey185/0002-secondary-jit.patch
new file mode 100644
index 000000000..a95adf59a
--- /dev/null
+++ b/package/spidermonkey185/0002-secondary-jit.patch
@@ -0,0 +1,22 @@
+https://bugzilla.mozilla.org/show_bug.cgi?id=627668
+
+Source:
+https://src.fedoraproject.org/rpms/js/blob/f26/f/js-1.8.5-secondary-jit.patch
+
+Patch position #2:
+https://src.fedoraproject.org/rpms/js/blob/master/f/js.spec#_13
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -up xulrunner-2.0/mozilla-central/js/src/Makefile.in.big-endian-jit xulrunner-2.0/mozilla-central/js/src/Makefile.in
+--- js-1.8.5/js/src/Makefile.in.big-endian-jit	2010-11-04 21:05:48.000000000 +0100
++++ js-1.8.5/js/src/Makefile.in	2010-11-15 14:17:39.000000000 +0100
+@@ -371,7 +371,7 @@ CPPSRCS += 	checks.cc \
+ # END enclude sources for V8 dtoa
+ #############################################
+ 
+-ifeq (,$(filter-out powerpc sparc,$(TARGET_CPU)))
++ifeq (,$(filter-out powerpc powerpc64 sparc sparc64 s390 s390x,$(TARGET_CPU)))
+ 
+ VPATH +=	$(srcdir)/assembler \
+ 		$(srcdir)/assembler/wtf \
diff --git a/package/spidermonkey185/0003-destdir.patch b/package/spidermonkey185/0003-destdir.patch
new file mode 100644
index 000000000..3cf20a73f
--- /dev/null
+++ b/package/spidermonkey185/0003-destdir.patch
@@ -0,0 +1,24 @@
+Source:
+https://src.fedoraproject.org/rpms/js/blob/f26/f/js185-destdir.patch
+
+Patch position #3:
+https://src.fedoraproject.org/rpms/js/blob/master/f/js.spec#_14
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+# See discussion in https://bugzilla.mozilla.org/show_bug.cgi?id=628723
+# Patch created by Colin Walters <walters@verbum.org>
+
+--- a/js/src/Makefile.in.orig	2011-06-15 19:40:27.447770306 -0400
++++ b/js/src/Makefile.in	2011-06-15 19:40:57.013770299 -0400
+@@ -888,8 +888,8 @@
+ ifeq (,$(HOST_BIN_SUFFIX))
+ 	mv -f $(SHLIB_ANY_VER) $(SHLIB_EXACT_VER)
+ 	@[ ! -h $(SHLIB_ABI_VER) ] || rm -f $(SHLIB_ABI_VER)
+-	ln -s $(SHLIB_EXACT_VER) $(SHLIB_ABI_VER)
+-	ln -s $(SHLIB_ABI_VER) $(SHLIB_ANY_VER)
++	ln -s $(notdir $(SHLIB_EXACT_VER)) $(SHLIB_ABI_VER)
++	ln -s $(notdir $(SHLIB_ABI_VER)) $(SHLIB_ANY_VER)
+ endif
+ endif
+ ifneq (,$(IMPORT_LIBRARY))
diff --git a/package/spidermonkey185/0004-537701.patch b/package/spidermonkey185/0004-537701.patch
new file mode 100644
index 000000000..c8ab58572
--- /dev/null
+++ b/package/spidermonkey185/0004-537701.patch
@@ -0,0 +1,47 @@
+Source:
+https://src.fedoraproject.org/rpms/js/blob/f26/f/js-1.8.5-537701.patch
+
+Patch position #4:
+https://src.fedoraproject.org/rpms/js/blob/master/f/js.spec#_15
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -up js-1.8.5/js/src/jsval.h.pad-the-structs-and-asserts js-1.8.5/js/src/jsval.h
+--- js-1.8.5/js/src/jsval.h.pad-the-structs-and-asserts	2011-11-28 12:46:32.811556132 -0600
++++ js-1.8.5/js/src/jsval.h	2011-11-28 12:46:43.493448233 -0600
+@@ -343,11 +343,11 @@ typedef union jsval_layout
+         uint64             payload47 : 47;
+     } debugView;
+     struct {
++        uint32             padding;
+         union {
+             int32          i32;
+             uint32         u32;
+             JSWhyMagic     why;
+-            jsuword        word;
+         } payload;
+     } s;
+     double asDouble;
+diff -up js-1.8.5/js/src/jsvalue.h.pad-the-structs-and-asserts js-1.8.5/js/src/jsvalue.h
+--- js-1.8.5/js/src/jsvalue.h.pad-the-structs-and-asserts	2011-11-28 12:46:37.246509255 -0600
++++ js-1.8.5/js/src/jsvalue.h	2011-11-28 12:46:43.495448203 -0600
+@@ -291,7 +291,6 @@ JSVAL_EXTRACT_NON_DOUBLE_TAG_IMPL(jsval_
+ }
+ 
+ #ifdef __cplusplus
+-JS_STATIC_ASSERT(offsetof(jsval_layout, s.payload) == 0);
+ JS_STATIC_ASSERT((JSVAL_TYPE_NONFUNOBJ & 0xF) == JSVAL_TYPE_OBJECT);
+ JS_STATIC_ASSERT((JSVAL_TYPE_FUNOBJ & 0xF) == JSVAL_TYPE_OBJECT);
+ #endif
+@@ -729,7 +728,11 @@ class Value
+     }
+ 
+     const jsuword *payloadWord() const {
++#if JS_BITS_PER_WORD == 32
+         return &data.s.payload.word;
++#elif JS_BITS_PER_WORD == 64
++	return &data.asBits;
++#endif
+     }
+ 
+   private:
diff --git a/package/spidermonkey185/0005-arm-nosoftfp.patch b/package/spidermonkey185/0005-arm-nosoftfp.patch
new file mode 100644
index 000000000..2df231007
--- /dev/null
+++ b/package/spidermonkey185/0005-arm-nosoftfp.patch
@@ -0,0 +1,41 @@
+Source:
+https://src.fedoraproject.org/rpms/js/blob/f26/f/js185-arm-nosoftfp.patch
+[Bernd: Removed js/src/configure.in part]
+
+Patch position #5:
+https://src.fedoraproject.org/rpms/js/blob/master/f/js.spec#_16
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -r -U 2 -p a/js/src/configure b/js/src/configure
+--- a/js/src/configure	2011-10-14 18:27:00.000000000 -0400
++++ b/js/src/configure	2011-10-14 18:37:07.264794994 -0400
+@@ -10741,5 +10741,5 @@ _SAVE_CFLAGS="$CFLAGS"
+ if test "$GNU_CC"; then
+   # gcc needs -mfpu=neon to recognize NEON instructions
+-  CFLAGS="$CFLAGS -mfpu=neon -mfloat-abi=softfp"
++  CFLAGS="$CFLAGS -mfpu=neon"
+ fi
+ cat > conftest.$ac_ext <<EOF
+@@ -13407,7 +13407,7 @@ EOF
+ EOF
+ 
+-        CFLAGS="$CFLAGS -march=armv7-a -mthumb -mfloat-abi=softfp $MOZ_ARM_VFP_FLAGS"
+-        CXXFLAGS="$CXXFLAGS -march=armv7-a -mthumb -mfloat-abi=softfp $MOZ_ARM_VFP_FLAGS"
+-        ASFLAGS="$ASFLAGS -march=armv7-a -mthumb -mfloat-abi=softfp $MOZ_ARM_VFP_FLAGS"
++        CFLAGS="$CFLAGS -mthumb $MOZ_ARM_VFP_FLAGS"
++        CXXFLAGS="$CXXFLAGS -mthumb $MOZ_ARM_VFP_FLAGS"
++        ASFLAGS="$ASFLAGS -mthumb $MOZ_ARM_VFP_FLAGS"
+       else
+         { echo "configure: error: --enable-thumb2 is not supported for non-GNU toolchains" 1>&2; exit 1; }
+@@ -13426,7 +13426,7 @@ elif test "$MOZ_ARM_ARCH" = "armv7"; the
+ EOF
+ 
+-        CFLAGS="$CFLAGS -march=armv7-a -marm -mfloat-abi=softfp $MOZ_ARM_VFP_FLAGS"
+-        CXXFLAGS="$CXXFLAGS -march=armv7-a -marm -mfloat-abi=softfp $MOZ_ARM_VFP_FLAGS"
+-        ASFLAGS="$ASFLAGS -march=armv7-a -marm -mfloat-abi=softfp $MOZ_ARM_VFP_FLAGS"
++        CFLAGS="$CFLAGS $MOZ_ARM_VFP_FLAGS"
++        CXXFLAGS="$CXXFLAGS $MOZ_ARM_VFP_FLAGS"
++        ASFLAGS="$ASFLAGS $MOZ_ARM_VFP_FLAGS"
+       else
+         { echo "configure: error: --with-cpu-arch=armv7 is not supported for non-GNU toolchains" 1>&2; exit 1; }
diff --git a/package/spidermonkey185/0006-aarch64.patch b/package/spidermonkey185/0006-aarch64.patch
new file mode 100644
index 000000000..9eae13956
--- /dev/null
+++ b/package/spidermonkey185/0006-aarch64.patch
@@ -0,0 +1,61 @@
+Source:
+https://src.fedoraproject.org/rpms/js/blob/f26/f/aarch64.patch
+[Bernd: patched js/src/configure instead of js/src/configure.in]
+
+Patch position 6:
+https://src.fedoraproject.org/rpms/js/blob/master/f/js.spec#_19
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- js-1.8.5.org/js/src/assembler/jit/ExecutableAllocator.h
++++ js-1.8.5/js/src/assembler/jit/ExecutableAllocator.h
+@@ -391,6 +391,12 @@
+     {
+         CacheRangeFlush(code, size, CACHE_SYNC_ALL);
+     }
++#elif WTF_CPU_AARCH64 && WTF_PLATFORM_LINUX
++    static void cacheFlush(void* code, size_t size)
++    {
++        intptr_t end = reinterpret_cast<intptr_t>(code) + size;
++        __builtin___clear_cache(reinterpret_cast<char*>(code), reinterpret_cast<char*>(end));
++    }
+ #else
+     #error "The cacheFlush support is missing on this platform."
+ #endif
+--- js-1.8.5.org/js/src/assembler/wtf/Platform.h
++++ js-1.8.5/js/src/assembler/wtf/Platform.h
+@@ -292,6 +292,10 @@
+ 
+ #endif /* ARM */
+ 
++/* CPU(AArch64) - 64-bit ARM */
++#if defined(__aarch64__)
++#define WTF_CPU_AARCH64 1
++#endif
+ 
+ 
+ /* Operating systems - low-level dependencies */
+--- js-1.8.5.org/js/src/configure
++++ js-1.8.5/js/src/configure
+@@ -5805,6 +5805,10 @@
+     CPU_ARCH=arm
+     ;;
+ 
++aarch64)
++    CPU_ARCH=aarch64
++    ;;
++
+ mips|mipsel)
+     CPU_ARCH="mips"
+     ;;
+--- js-1.8.5.org/js/src/Makefile.in
++++ js-1.8.5/js/src/Makefile.in
+@@ -382,7 +382,7 @@
+ # END enclude sources for V8 dtoa
+ #############################################
+ 
+-ifeq (,$(filter-out powerpc powerpc64 sparc sparc64 s390 s390x,$(TARGET_CPU)))
++ifeq (,$(filter-out aarch64 powerpc powerpc64 sparc sparc64 s390 s390x,$(TARGET_CPU)))
+ 
+ VPATH +=	$(srcdir)/assembler \
+ 		$(srcdir)/assembler/wtf \
diff --git a/package/spidermonkey185/0007-ppc64le.patch b/package/spidermonkey185/0007-ppc64le.patch
new file mode 100644
index 000000000..41d1b90d9
--- /dev/null
+++ b/package/spidermonkey185/0007-ppc64le.patch
@@ -0,0 +1,56 @@
+Source:
+https://src.fedoraproject.org/rpms/js/blob/f26/f/ppc64le.patch
+[Bernd: patched js/src/configure instead of js/src/configure.in]
+
+Patch position #7:
+https://src.fedoraproject.org/rpms/js/blob/master/f/js.spec#_21
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- js-1.8.5.org/js/src/assembler/wtf/Platform.h
++++ js-1.8.5/js/src/assembler/wtf/Platform.h
+@@ -129,16 +129,22 @@
+    || defined(__POWERPC__) \
+    || defined(_M_PPC)      \
+    || defined(__PPC)
++#if !defined(__ppc64__) && !defined(__PPC64__)
+ #define WTF_CPU_PPC 1
++#endif
++#if !defined(__LITTLE_ENDIAN__)
+ #define WTF_CPU_BIG_ENDIAN 1
+ #endif
++#endif
+ 
+ /* CPU(PPC64) - PowerPC 64-bit */
+ #if   defined(__ppc64__) \
+    || defined(__PPC64__)
+ #define WTF_CPU_PPC64 1
++#if !defined(__LITTLE_ENDIAN__)
+ #define WTF_CPU_BIG_ENDIAN 1
+ #endif
++#endif
+ 
+ /* CPU(SH4) - SuperH SH-4 */
+ #if defined(__SH4__)
+--- js-1.8.5.org/js/src/configure
++++ js-1.8.5/js/src/configure
+@@ -5769,7 +5769,7 @@
+     CPU_ARCH=x86
+     ;;
+ 
+-powerpc64 | ppc64)
++powerpc64 | ppc64 | powerpc64le | ppc64le)
+     CPU_ARCH=ppc64
+     ;;
+ 
+--- js-1.8.5.org/js/src/Makefile.in
++++ js-1.8.5/js/src/Makefile.in
+@@ -382,7 +382,7 @@
+ # END enclude sources for V8 dtoa
+ #############################################
+ 
+-ifeq (,$(filter-out aarch64 powerpc powerpc64 sparc sparc64 s390 s390x,$(TARGET_CPU)))
++ifeq (,$(filter-out aarch64 powerpc powerpc64 powerpc64le sparc sparc64 s390 s390x,$(TARGET_CPU)))
+ 
+ VPATH +=	$(srcdir)/assembler \
+ 		$(srcdir)/assembler/wtf \
diff --git a/package/spidermonkey185/0008-array-recursion.patch b/package/spidermonkey185/0008-array-recursion.patch
new file mode 100644
index 000000000..1e9466259
--- /dev/null
+++ b/package/spidermonkey185/0008-array-recursion.patch
@@ -0,0 +1,115 @@
+Check for overrecursion in functions that might need it.
+
+Reference:
+https://bugzilla.redhat.com/show_bug.cgi?id=1178141
+http://hg.mozilla.org/mozilla-central/rev/a7b220e7425a
+
+Downloaded rebased version from upstream commit from:
+https://src.fedoraproject.org/rpms/js/blob/f26/f/js-1.8.5-array-recursion.patch
+
+Patch position #8:
+https://src.fedoraproject.org/rpms/js/blob/master/f/js.spec#_23
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -ur js-1.8.5.orig/js/src/jsarray.cpp js-1.8.5/js/src/jsarray.cpp
+--- js-1.8.5.orig/js/src/jsarray.cpp	2011-03-31 23:08:36.000000000 +0400
++++ js-1.8.5/js/src/jsarray.cpp	2015-04-15 01:10:10.662544828 +0300
+@@ -1223,8 +1223,6 @@
+ array_toString_sub(JSContext *cx, JSObject *obj, JSBool locale,
+                    JSString *sepstr, Value *rval)
+ {
+-    JS_CHECK_RECURSION(cx, return false);
+-
+     /* Get characters to use for the separator. */
+     static const jschar comma = ',';
+     const jschar *sep;
+@@ -1323,6 +1321,8 @@
+ static JSBool
+ array_toString(JSContext *cx, uintN argc, Value *vp)
+ {
++    JS_CHECK_RECURSION(cx, return false);
++
+     JSObject *obj = ToObject(cx, &vp[1]);
+     if (!obj)
+         return false;
+@@ -1357,6 +1357,8 @@
+ static JSBool
+ array_toLocaleString(JSContext *cx, uintN argc, Value *vp)
+ {
++    JS_CHECK_RECURSION(cx, return false);
++
+     JSObject *obj = ToObject(cx, &vp[1]);
+     if (!obj)
+         return false;
+@@ -1454,6 +1456,8 @@
+ static JSBool
+ array_join(JSContext *cx, uintN argc, Value *vp)
+ {
++    JS_CHECK_RECURSION(cx, return false);
++
+     JSString *str;
+     if (argc == 0 || vp[2].isUndefined()) {
+         str = NULL;
+diff --git a/js/src/tests/ecma_5/extensions/array-toString-recursion.js b/js/src/tests/ecma_5/extensions/array-toString-recursion.js
+new file mode 100644
+--- /dev/null
++++ b/js/src/tests/ecma_5/extensions/array-toString-recursion.js
+@@ -0,0 +1,46 @@
++/*
++ * Any copyright is dedicated to the Public Domain.
++ * http://creativecommons.org/licenses/publicdomain/
++ */
++
++//-----------------------------------------------------------------------------
++var BUGNUMBER = 635389;
++var summary = 'Infinite recursion via [].{toString,toLocaleString,join}';
++
++print(BUGNUMBER + ": " + summary);
++
++/**************
++ * BEGIN TEST *
++ **************/
++
++try
++{
++  var x = [];
++  x.join = Array.prototype.toString;
++  "" + x;
++  throw new Error("should have thrown");
++}
++catch (e)
++{
++  assertEq(e instanceof InternalError, true,
++           "should have thrown for over-recursion");
++}
++
++try
++{
++  var x = { toString: Array.prototype.toString, join: Array.prototype.toString };
++  "" + x;
++  throw new Error("should have thrown");
++}
++catch (e)
++{
++  assertEq(e instanceof InternalError, true,
++           "should have thrown for over-recursion");
++}
++
++/******************************************************************************/
++
++if (typeof reportCompare === "function")
++  reportCompare(true, true);
++
++print("All tests passed!");
+diff -ur js-1.8.5.orig/js/src/tests/ecma_5/extensions/jstests.list js-1.8.5/js/src/tests/ecma_5/extensions/jstests.list
+--- js-1.8.5.orig/js/src/tests/ecma_5/extensions/jstests.list	2011-03-31 23:08:36.000000000 +0400
++++ js-1.8.5/js/src/tests/ecma_5/extensions/jstests.list	2015-04-15 01:15:08.784740028 +0300
+@@ -9,6 +9,7 @@
+ script bug472534.js
+ script bug496985.js
+ script bug566661.js
++script array-toString-recursion.js
+ script eval-native-callback-is-indirect.js
+ script extension-methods-reject-null-undefined-this.js
+ skip-if(!xulRuntime.shell) script function-definition-with.js # needs evaluate()
diff --git a/package/spidermonkey185/0009-c++11.patch b/package/spidermonkey185/0009-c++11.patch
new file mode 100644
index 000000000..29b86aac7
--- /dev/null
+++ b/package/spidermonkey185/0009-c++11.patch
@@ -0,0 +1,152 @@
+Source:
+https://src.fedoraproject.org/rpms/js/blob/f26/f/js-1.8.5-c++11.patch
+
+Patch position #9:
+https://src.fedoraproject.org/rpms/js/blob/master/f/js.spec#_24
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -upr a/js/src/jsapi.cpp b/js/src/jsapi.cpp
+--- a/js/src/jsapi.cpp	2011-03-31 14:08:36.000000000 -0500
++++ b/js/src/jsapi.cpp	2016-02-29 18:10:49.302307353 -0600
+@@ -3985,7 +3985,7 @@ JS_Enumerate(JSContext *cx, JSObject *ob
+     AutoIdVector props(cx);
+     JSIdArray *ida;
+     if (!GetPropertyNames(cx, obj, JSITER_OWNONLY, &props) || !VectorToIdArray(cx, props, &ida))
+-        return false;
++        return NULL;
+     for (size_t n = 0; n < size_t(ida->length); ++n)
+         JS_ASSERT(js_CheckForStringIndex(ida->vector[n]) == ida->vector[n]);
+     return ida;
+diff -upr a/js/src/jsfun.cpp b/js/src/jsfun.cpp
+--- a/js/src/jsfun.cpp	2011-03-31 14:08:36.000000000 -0500
++++ b/js/src/jsfun.cpp	2016-02-29 18:21:45.249674890 -0600
+@@ -2051,7 +2051,7 @@ fun_toStringHelper(JSContext *cx, JSObje
+ 
+     JSString *str = JS_DecompileFunction(cx, fun, indent);
+     if (!str)
+-        return false;
++        return NULL;
+ 
+     if (!indent)
+         cx->compartment->toSourceCache.put(fun, str);
+@@ -2657,7 +2657,7 @@ LookupInterpretedFunctionPrototype(JSCon
+     const Shape *shape = funobj->nativeLookup(id);
+     if (!shape) {
+         if (!ResolveInterpretedFunctionPrototype(cx, funobj))
+-            return false;
++            return NULL;
+         shape = funobj->nativeLookup(id);
+     }
+     JS_ASSERT(!shape->configurable());
+diff -upr a/js/src/jsiter.cpp b/js/src/jsiter.cpp
+--- a/js/src/jsiter.cpp	2011-03-31 14:08:36.000000000 -0500
++++ b/js/src/jsiter.cpp	2016-02-29 18:24:22.494659919 -0600
+@@ -425,7 +425,7 @@ NewIteratorObject(JSContext *cx, uintN f
+          */
+         JSObject *obj = js_NewGCObject(cx, FINALIZE_OBJECT0);
+         if (!obj)
+-            return false;
++            return NULL;
+         obj->init(cx, &js_IteratorClass, NULL, NULL, NULL, false);
+         obj->setMap(cx->compartment->emptyEnumeratorShape);
+         return obj;
+diff -upr a/js/src/jsparse.cpp b/js/src/jsparse.cpp
+--- a/js/src/jsparse.cpp	2011-03-31 14:08:36.000000000 -0500
++++ b/js/src/jsparse.cpp	2016-02-29 18:29:03.997437475 -0600
+@@ -3352,7 +3352,7 @@ Parser::functionDef(JSAtom *funAtom, Fun
+     if (!outertc->inFunction() && bodyLevel && funAtom && !lambda && outertc->compiling()) {
+         JS_ASSERT(pn->pn_cookie.isFree());
+         if (!DefineGlobal(pn, outertc->asCodeGenerator(), funAtom))
+-            return false;
++            return NULL;
+     }
+ 
+     pn->pn_blockid = outertc->blockid();
+diff -upr a/js/src/jsstr.cpp b/js/src/jsstr.cpp
+--- a/js/src/jsstr.cpp	2011-03-31 14:08:36.000000000 -0500
++++ b/js/src/jsstr.cpp	2016-02-29 19:01:45.857779836 -0600
+@@ -1734,7 +1734,7 @@ class RegExpGuard
+         if (flat) {
+             patstr = flattenPattern(cx, fm.patstr);
+             if (!patstr)
+-                return false;
++                return NULL;
+         } else {
+             patstr = fm.patstr;
+         }
+@@ -3400,7 +3400,7 @@ js_InitStringClass(JSContext *cx, JSObje
+                                  UndefinedValue(), NULL, NULL,
+                                  JSPROP_READONLY | JSPROP_PERMANENT | JSPROP_SHARED, 0, 0,
+                                  NULL)) {
+-        return JS_FALSE;
++        return NULL;
+     }
+ 
+     return proto;
+diff -upr a/js/src/jstypedarray.cpp b/js/src/jstypedarray.cpp
+--- a/js/src/jstypedarray.cpp	2011-03-31 14:08:36.000000000 -0500
++++ b/js/src/jstypedarray.cpp	2016-02-29 19:08:53.541136191 -0600
+@@ -1334,7 +1334,7 @@ class TypedArrayTemplate
+         if (size != 0 && count >= INT32_MAX / size) {
+             JS_ReportErrorNumber(cx, js_GetErrorMessage, NULL,
+                                  JSMSG_NEED_DIET, "size and count");
+-            return false;
++            return NULL;
+         }
+ 
+         int32 bytelen = size * count;
+@@ -1668,7 +1668,7 @@ TypedArrayConstruct(JSContext *cx, jsint
+ 
+       default:
+         JS_NOT_REACHED("shouldn't have gotten here");
+-        return false;
++        return NULL;
+     }
+ }
+ 
+diff -upr a/js/src/jsxml.cpp b/js/src/jsxml.cpp
+--- a/js/src/jsxml.cpp	2011-03-31 14:08:36.000000000 -0500
++++ b/js/src/jsxml.cpp	2016-02-29 19:17:10.363279731 -0600
+@@ -282,7 +282,7 @@ NewXMLNamespace(JSContext *cx, JSLinearS
+ 
+     obj = NewBuiltinClassInstanceXML(cx, &js_NamespaceClass);
+     if (!obj)
+-        return JS_FALSE;
++        return NULL;
+     JS_ASSERT(JSVAL_IS_VOID(obj->getNamePrefixVal()));
+     JS_ASSERT(JSVAL_IS_VOID(obj->getNameURIVal()));
+     JS_ASSERT(JSVAL_IS_VOID(obj->getNamespaceDeclared()));
+@@ -431,7 +431,7 @@ ConvertQNameToString(JSContext *cx, JSOb
+         size_t length = str->length();
+         jschar *chars = (jschar *) cx->malloc((length + 2) * sizeof(jschar));
+         if (!chars)
+-            return JS_FALSE;
++            return NULL;
+         *chars = '@';
+         const jschar *strChars = str->getChars(cx);
+         if (!strChars) {
+diff -upr a/js/src/methodjit/InvokeHelpers.cpp b/js/src/methodjit/InvokeHelpers.cpp
+--- a/js/src/methodjit/InvokeHelpers.cpp	2011-03-31 14:08:36.000000000 -0500
++++ b/js/src/methodjit/InvokeHelpers.cpp	2016-02-29 20:34:14.496983346 -0600
+@@ -728,7 +728,7 @@ AtSafePoint(JSContext *cx)
+ {
+     JSStackFrame *fp = cx->fp();
+     if (fp->hasImacropc())
+-        return false;
++        return NULL;
+ 
+     JSScript *script = fp->script();
+     return script->maybeNativeCodeForPC(fp->isConstructing(), cx->regs->pc);
+diff -upr a/js/src/nanojit/NativeX64.cpp b/js/src/nanojit/NativeX64.cpp
+--- a/js/src/nanojit/NativeX64.cpp	2011-03-31 14:08:36.000000000 -0500
++++ b/js/src/nanojit/NativeX64.cpp	2016-02-29 20:19:56.487934808 -0600
+@@ -1899,7 +1899,7 @@ namespace nanojit
+          }
+     }
+ 
+-    static const AVMPLUS_ALIGN16(int64_t) negateMask[] = {0x8000000000000000LL,0};
++    static const AVMPLUS_ALIGN16(int64_t) negateMask[] = {int64_t(0x8000000000000000LL),0};
+ 
+     void Assembler::asm_fneg(LIns *ins) {
+         Register rr, ra;
diff --git a/package/spidermonkey185/0010-tag.patch b/package/spidermonkey185/0010-tag.patch
new file mode 100644
index 000000000..398627bd8
--- /dev/null
+++ b/package/spidermonkey185/0010-tag.patch
@@ -0,0 +1,107 @@
+Source:
+https://src.fedoraproject.org/rpms/js/blob/f26/f/mozjs1.8.5-tag.patch
+
+Patch position 10:
+https://src.fedoraproject.org/rpms/js/blob/master/f/js.spec#_26
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -up js-1.8.5/js/src/jsval.h.tag js-1.8.5/js/src/jsval.h
+--- js-1.8.5/js/src/jsval.h.tag	2017-03-10 16:27:06.000000000 +0100
++++ js-1.8.5/js/src/jsval.h	2017-03-10 16:30:39.000000000 +0100
+@@ -66,7 +66,7 @@ JS_BEGIN_EXTERN_C
+ #endif
+ 
+ #if JS_BITS_PER_WORD == 64
+-# define JSVAL_TAG_SHIFT 47
++# define JSVAL_TAG_SHIFT 48
+ #endif
+ 
+ /*
+@@ -135,7 +135,8 @@ JS_STATIC_ASSERT(sizeof(JSValueTag) == 4
+ /* Remember to propagate changes to the C defines below. */
+ JS_ENUM_HEADER(JSValueTag, uint32)
+ {
+-    JSVAL_TAG_MAX_DOUBLE           = 0x1FFF0,
++    JSVAL_TAG_DUMMY                = 0xFFFFFFFF,  /* Make sure the enums cannot fit 16-bits. */
++    JSVAL_TAG_MAX_DOUBLE           = 0xFFF8,
+     JSVAL_TAG_INT32                = JSVAL_TAG_MAX_DOUBLE | JSVAL_TYPE_INT32,
+     JSVAL_TAG_UNDEFINED            = JSVAL_TAG_MAX_DOUBLE | JSVAL_TYPE_UNDEFINED,
+     JSVAL_TAG_STRING               = JSVAL_TAG_MAX_DOUBLE | JSVAL_TYPE_STRING,
+@@ -196,7 +197,7 @@ typedef uint32 JSValueTag;
+ #elif JS_BITS_PER_WORD == 64
+ 
+ typedef uint32 JSValueTag;
+-#define JSVAL_TAG_MAX_DOUBLE         ((uint32)(0x1FFF0))
++#define JSVAL_TAG_MAX_DOUBLE         ((uint32)(0xFFF8))
+ #define JSVAL_TAG_INT32              (uint32)(JSVAL_TAG_MAX_DOUBLE | JSVAL_TYPE_INT32)
+ #define JSVAL_TAG_UNDEFINED          (uint32)(JSVAL_TAG_MAX_DOUBLE | JSVAL_TYPE_UNDEFINED)
+ #define JSVAL_TAG_STRING             (uint32)(JSVAL_TAG_MAX_DOUBLE | JSVAL_TYPE_STRING)
+@@ -236,8 +237,8 @@ typedef uint64 JSValueShiftedTag;
+ 
+ #elif JS_BITS_PER_WORD == 64
+ 
+-#define JSVAL_PAYLOAD_MASK           0x00007FFFFFFFFFFFLL
+-#define JSVAL_TAG_MASK               0xFFFF800000000000LL
++#define JSVAL_PAYLOAD_MASK           0x0000FFFFFFFFFFFFLL
++#define JSVAL_TAG_MASK               0xFFFF000000000000LL
+ #define JSVAL_TYPE_TO_TAG(type)      ((JSValueTag)(JSVAL_TAG_MAX_DOUBLE | (type)))
+ #define JSVAL_TYPE_TO_SHIFTED_TAG(type) (((uint64)JSVAL_TYPE_TO_TAG(type)) << JSVAL_TAG_SHIFT)
+ 
+@@ -297,8 +298,8 @@ typedef union jsval_layout
+ #if (!defined(_WIN64) && defined(__cplusplus))
+     /* MSVC does not pack these correctly :-( */
+     struct {
+-        uint64             payload47 : 47;
+-        JSValueTag         tag : 17;
++        uint64             payload48 : 48;
++        JSValueTag         tag : 16;
+     } debugView;
+ #endif
+     struct {
+@@ -339,8 +340,8 @@ typedef union jsval_layout
+ {
+     uint64 asBits;
+     struct {
+-        JSValueTag         tag : 17;
+-        uint64             payload47 : 47;
++        JSValueTag         tag : 16;
++        uint64             payload48 : 48;
+     } debugView;
+     struct {
+         uint32             padding;
+diff -up js-1.8.5/js/src/jsvalue.h.tag js-1.8.5/js/src/jsvalue.h
+--- js-1.8.5/js/src/jsvalue.h.tag	2017-03-10 16:27:06.000000000 +0100
++++ js-1.8.5/js/src/jsvalue.h	2017-03-10 16:27:06.000000000 +0100
+@@ -255,7 +255,7 @@ JSVAL_SAME_TYPE_IMPL(jsval_layout lhs, j
+ {
+     uint64 lbits = lhs.asBits, rbits = rhs.asBits;
+     return (lbits <= JSVAL_TAG_MAX_DOUBLE && rbits <= JSVAL_TAG_MAX_DOUBLE) ||
+-           (((lbits ^ rbits) & 0xFFFF800000000000LL) == 0);
++           (((lbits ^ rbits) & 0xFFFF000000000000LL) == 0);
+ }
+ 
+ static JS_ALWAYS_INLINE jsval_layout
+@@ -277,7 +277,7 @@ JSVAL_TO_PRIVATE_UINT32_IMPL(jsval_layou
+ static JS_ALWAYS_INLINE JSValueType
+ JSVAL_EXTRACT_NON_DOUBLE_TYPE_IMPL(jsval_layout l)
+ {
+-   uint64 type = (l.asBits >> JSVAL_TAG_SHIFT) & 0xF;
++   uint64 type = (l.asBits >> JSVAL_TAG_SHIFT) & 0x7;
+    JS_ASSERT(type > JSVAL_TYPE_DOUBLE);
+    return (JSValueType)type;
+ }
+diff -up js-1.8.5/js/src/methodjit/MethodJIT.cpp.tag js-1.8.5/js/src/methodjit/MethodJIT.cpp
+--- js-1.8.5/js/src/methodjit/MethodJIT.cpp.tag	2011-03-31 21:08:36.000000000 +0200
++++ js-1.8.5/js/src/methodjit/MethodJIT.cpp	2017-03-10 16:27:06.000000000 +0100
+@@ -186,8 +186,8 @@ JS_STATIC_ASSERT(sizeof(VMFrame) % 16 ==
+ JS_STATIC_ASSERT(offsetof(VMFrame, savedRBX) == 0x58);
+ JS_STATIC_ASSERT(offsetof(VMFrame, regs.fp) == 0x38);
+ 
+-JS_STATIC_ASSERT(JSVAL_TAG_MASK == 0xFFFF800000000000LL);
+-JS_STATIC_ASSERT(JSVAL_PAYLOAD_MASK == 0x00007FFFFFFFFFFFLL);
++JS_STATIC_ASSERT(JSVAL_TAG_MASK == 0xFFFF000000000000LL);
++JS_STATIC_ASSERT(JSVAL_PAYLOAD_MASK == 0x0000FFFFFFFFFFFFLL);
+ 
+ asm volatile (
+ ".text\n"
diff --git a/package/spidermonkey185/0011-remove-unused-pkgconfg-nspr-dependency.patch b/package/spidermonkey185/0011-remove-unused-pkgconfg-nspr-dependency.patch
new file mode 100644
index 000000000..24738830d
--- /dev/null
+++ b/package/spidermonkey185/0011-remove-unused-pkgconfg-nspr-dependency.patch
@@ -0,0 +1,19 @@
+From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+
+Remove the dependency on nspr.
+
+This dependency was removed when spidermonkey was extracted from the
+mozilla code base.  This is probably a left-over, since it is not used.
+
+Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- spidermonkey185-1.0.0/js/src/mozjs185.pc.in	2016-05-23 13:41:28.430466213 +0200
++++ spidermonkey185-1.0.0/js/src/mozjs185.pc.in	2016-05-23 13:42:00.727558977 +0200
+@@ -5,6 +5,5 @@
+ Name: SpiderMonkey 1.8.5
+ Description: The Mozilla library for JavaScript 1.8.5
+ Version: %MOZILLA_VERSION%
+-Requires: nspr >= 4.7
+ Libs: -L${libdir} -lmozjs185
+ Cflags: -I${includedir}/js
diff --git a/package/spidermonkey185/0012-arm5tej.patch b/package/spidermonkey185/0012-arm5tej.patch
new file mode 100644
index 000000000..8ed6ddf3e
--- /dev/null
+++ b/package/spidermonkey185/0012-arm5tej.patch
@@ -0,0 +1,24 @@
+Fix support for armv5
+
+Fixes build error with BR2_GCC_TARGET_CPU="arm926ej-s" because
+spidermonkey does not recognize __ARM_ARCH_5TEJ__:
+
+./nanojit/njconfig.cpp:103:18:
+ error: invalid conversion from 'const char*' to 'uint8_t {aka unsigned char}' [-fpermissive]
+         arm_arch = NJ_COMPILER_ARM_ARCH;
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr js-1.8.5.org/js/src/nanojit/njcpudetect.h js-1.8.5/js/src/nanojit/njcpudetect.h
+--- js-1.8.5.org/js/src/nanojit/njcpudetect.h	2011-03-31 21:08:36.000000000 +0200
++++ js-1.8.5/js/src/nanojit/njcpudetect.h	2017-08-05 16:01:35.444779038 +0200
+@@ -87,7 +87,8 @@
+ #elif   defined(__ARM_ARCH_5__) || \
+         defined(__ARM_ARCH_5T__) || \
+         defined(__ARM_ARCH_5E__) || \
+-        defined(__ARM_ARCH_5TE__)
++        defined(__ARM_ARCH_5TE__) || \
++        defined(__ARM_ARCH_5TEJ__)
+ 
+     #define NJ_COMPILER_ARM_ARCH 5
+ 
diff --git a/package/spidermonkey185/0013-Avoid-missing-cacheFlush-support-error-on-exotic-platforms.patch b/package/spidermonkey185/0013-Avoid-missing-cacheFlush-support-error-on-exotic-platforms.patch
new file mode 100644
index 000000000..1bb2ab25e
--- /dev/null
+++ b/package/spidermonkey185/0013-Avoid-missing-cacheFlush-support-error-on-exotic-platforms.patch
@@ -0,0 +1,36 @@
+
+# HG changeset patch
+# User Mike Hommey <mh+mozilla@glandium.org>
+# Date 1303461188 -7200
+# Node ID 59771590e9203d48ef8cbcd7eaf2f8ae45dbb1c1
+# Parent  c4b82ec27d6d6e1c02ef0abb3b6e805bfdd092ec
+Bug 638056 - Avoid "The cacheFlush support is missing on this platform" error on exotic platforms. r=cdleary
+
+[nicolas.cavallari at green-communications.fr: refresh patch]
+Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+[Bernd: rebased against Fedora patch series]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff --git a/js/src/Makefile.in b/js/src/Makefile.in
+--- a/js/src/Makefile.in
++++ b/js/src/Makefile.in
+@@ -377,17 +377,17 @@ CPPSRCS += 	checks.cc \
+ 		platform.cc \
+ 		utils.cc \
+ 		$(NONE)
+ 
+ #
+ # END enclude sources for V8 dtoa
+ #############################################
+ 
+-ifeq (,$(filter-out aarch64 powerpc powerpc64 powerpc64le sparc sparc64 s390 s390x,$(TARGET_CPU)))
++ifeq (,$(filter arm %86 x86_64,$(TARGET_CPU)))
+ 
+ VPATH +=	$(srcdir)/assembler \
+ 		$(srcdir)/assembler/wtf \
+ 		$(srcdir)/yarr/pcre \
+ 		$(NULL)
+ 
+ CPPSRCS += 	pcre_compile.cpp \
+                 pcre_exec.cpp \
+
diff --git a/package/spidermonkey185/Config.in b/package/spidermonkey185/Config.in
new file mode 100644
index 000000000..d1d02bf2e
--- /dev/null
+++ b/package/spidermonkey185/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_SPIDERMONKEY185
+	bool "spidermonkey (1.8.5)"
+	depends on BR2_USE_MMU # fork in executable tools.
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # needs pthread_getattr_np()
+	help
+	  SpiderMonkey is Mozilla's JavaScript engine written in C/C++. It is
+	  used in various Mozilla products, including Firefox.
+
+	  This is the old 1.8.5 branch, used in Firefox 4.
+
+comment "Spider monkey (1.8.5) need a toolchain with C++, dynamic library, NPTL"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/spidermonkey185/spidermonkey185.hash b/package/spidermonkey185/spidermonkey185.hash
new file mode 100644
index 000000000..bd651d780
--- /dev/null
+++ b/package/spidermonkey185/spidermonkey185.hash
@@ -0,0 +1,2 @@
+# Locally generated.
+sha256	5d12f7e1f5b4a99436685d97b9b7b75f094d33580227aa998c406bbae6f2a687	js185-1.0.0.tar.gz
diff --git a/package/spidermonkey185/spidermonkey185.mk b/package/spidermonkey185/spidermonkey185.mk
new file mode 100644
index 000000000..4787a6309
--- /dev/null
+++ b/package/spidermonkey185/spidermonkey185.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# Spidermonkey (1.8.5)
+#
+################################################################################
+
+SPIDERMONKEY185_VERSION = 1.0.0
+SPIDERMONKEY185_SITE = http://ftp.mozilla.org/pub/js
+SPIDERMONKEY185_SOURCE = js185-$(SPIDERMONKEY185_VERSION).tar.gz
+SPIDERMONKEY185_SUBDIR = js/src
+SPIDERMONKEY185_LICENSE = MPL-1.1 or GPL-2.0+ or LGPL-2.1+
+SPIDERMONKEY185_INSTALL_STAGING = YES
+SPIDERMONKEY185_DEPENDENCIES = host-python host-perl
+
+# To detect endianess a host binary is built from jscpucfg.cpp which is
+# not cross-compile friendly, so we force endianess.
+# HOST_CFLAGS are forced to avoid problems when detecting host gcc
+# because configure would pass TARGET_CFLAGS to the host gcc.
+SPIDERMONKEY185_CONF_ENV = \
+	HOST_CFLAGS="$(HOST_CFLAGS)" \
+	HOST_CXXFLAGS="$(HOST_CXXFLAGS) -DFORCE_$(BR2_ENDIAN)_ENDIAN" \
+	$(if $(BR2_powerpc)$(BR2_x86_64),ac_cv_va_val_copy=no)
+
+# Mozilla mixes up target, host and build.  See the comment in configure.in
+# around line 360.  Also, nanojit fails to build on sparc64 with
+# #error "unknown nanojit architecture", so disable the JIT.
+# Disable JIT for armv4 because this CPU does not support the asm code
+# used in spidermonkey.
+SPIDERMONKEY185_CONF_OPTS = \
+	--target=$(GNU_TARGET_NAME) \
+	--build=$(GNU_TARGET_NAME) \
+	--host=$(GNU_HOST_NAME) \
+	$(if $(BR2_ARM_CPU_ARMV4),--disable-methodjit) \
+	$(if $(BR2_sparc64),--disable-tracejit)
+
+$(eval $(autotools-package))
-- 
2.11.0
