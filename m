From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Wed,  6 Jul 2016 12:24:08 +0200
Subject: [Buildroot] [PATCH v3 1/2] spidermonkey185: New package.
In-Reply-To: <0dc17f18-b259-a618-67f3-099fd6ef0897@green-communications.fr>
References: <0dc17f18-b259-a618-67f3-099fd6ef0897@green-communications.fr>
Message-ID: <1467800649-22119-1-git-send-email-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the old 1.8.5 branch of spidermonkey, used in Firefox 4.
It is rather unmaintained, but some software still depend on it,
such as couchdb.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/Config.in                                  |  1 +
 ...01-remove-unused-pkgconfg-nspr-dependency.patch | 18 +++++
 .../0002-make-shlib-synlink-relative.patch         | 21 +++++
 .../0003-regenerate-configure.patch                | 44 ++++++++++
 ...val_layout-on-64-bit-big-endian-platforms.patch | 91 +++++++++++++++++++++
 ...tatic-assert-fix-strict-aliasing-warnings.patch | 94 ++++++++++++++++++++++
 ...heFlush-support-error-on-exotic-platforms.patch | 34 ++++++++
 package/spidermonkey185/Config.in                  | 14 ++++
 package/spidermonkey185/spidermonkey185.hash       |  2 +
 package/spidermonkey185/spidermonkey185.mk         | 30 +++++++
 10 files changed, 349 insertions(+)
 create mode 100644 package/spidermonkey185/0001-remove-unused-pkgconfg-nspr-dependency.patch
 create mode 100644 package/spidermonkey185/0002-make-shlib-synlink-relative.patch
 create mode 100644 package/spidermonkey185/0003-regenerate-configure.patch
 create mode 100644 package/spidermonkey185/0004-Fix-jsval_layout-on-64-bit-big-endian-platforms.patch
 create mode 100644 package/spidermonkey185/0005-Remove-bad-static-assert-fix-strict-aliasing-warnings.patch
 create mode 100644 package/spidermonkey185/0006-Avoid-missing-cacheFlush-support-error-on-exotic-platforms.patch
 create mode 100644 package/spidermonkey185/Config.in
 create mode 100644 package/spidermonkey185/spidermonkey185.hash
 create mode 100644 package/spidermonkey185/spidermonkey185.mk

v2 -> v3: Addressed Maxime Hadjinlian's comments

v1 -> v2:
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

diff --git a/package/Config.in b/package/Config.in
index 15271a2..fdc3194 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1306,6 +1306,7 @@ endif
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
 	source "package/sphinxbase/Config.in"
+	source "package/spidermonkey185/Config.in"
 	source "package/startup-notification/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
diff --git a/package/spidermonkey185/0001-remove-unused-pkgconfg-nspr-dependency.patch b/package/spidermonkey185/0001-remove-unused-pkgconfg-nspr-dependency.patch
new file mode 100644
index 0000000..cef1aae
--- /dev/null
+++ b/package/spidermonkey185/0001-remove-unused-pkgconfg-nspr-dependency.patch
@@ -0,0 +1,18 @@
+From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+
+Remove the dependency on nspr.
+
+This dependency was removed when spidermonkey was extracted from the
+mozilla code base.  This is probably a left-over, since it is not used.
+
+Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
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
diff --git a/package/spidermonkey185/0002-make-shlib-synlink-relative.patch b/package/spidermonkey185/0002-make-shlib-synlink-relative.patch
new file mode 100644
index 0000000..c6bdce9
--- /dev/null
+++ b/package/spidermonkey185/0002-make-shlib-synlink-relative.patch
@@ -0,0 +1,21 @@
+From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+
+Fix the creation of the shared library symbolic links.
+
+Do not create absolute symbolic links that references DESTDIR.
+
+Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+
+--- spidermonkey185-1.0.0/js/src/Makefile.in	2016-05-23 13:49:39.535010860 +0200
++++ spidermonkey185-1.0.0/js/src/Makefile.in	2016-05-23 13:50:06.555917036 +0200
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
diff --git a/package/spidermonkey185/0003-regenerate-configure.patch b/package/spidermonkey185/0003-regenerate-configure.patch
new file mode 100644
index 0000000..3d39947
--- /dev/null
+++ b/package/spidermonkey185/0003-regenerate-configure.patch
@@ -0,0 +1,44 @@
+From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+
+Do not force an ARM variant.
+
+Buildroot already passes the correct CFLAGS, so do not meddle with
+them by default.
+
+This patches the configure script directly, because one need to use
+an antique autoconf to regenerate it.  The removed lines
+appears verbatim in configure.in anyway.
+
+Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+
+--- spidermonkey185-1.0.0/js/src/configure	2016-05-25 11:26:19.392163540 +0200
++++ spidermonkey185-1.0.0/js/src/configure	2016-05-25 11:26:28.704477125 +0200
+@@ -13264,11 +13264,6 @@
+ 
+ # Individual module options
+ 
+-case "$target_cpu" in
+-  arm*)
+-    MOZ_ARM_ARCH=armv7
+-  ;;
+-esac
+ # Check whether --enable-thumb2 or --disable-thumb2 was given.
+ if test "${enable_thumb2+set}" = set; then
+   enableval="$enable_thumb2"
+@@ -13337,16 +13332,6 @@
+       { echo "configure: error: --with-cpu-arch=armv7 is not supported for non-ARM CPU architectures" 1>&2; exit 1; }
+     ;;
+   esac
+-else
+-  case "$target_cpu" in
+-    arm*)
+-      if test "$GNU_CC"; then
+-        CFLAGS="$CFLAGS -march=armv5te -mthumb-interwork -msoft-float"
+-        CXXFLAGS="$CXXFLAGS -march=armv5te -mthumb-interwork -msoft-float"
+-        ASFLAGS="$ASFLAGS -march=armv5te -mthumb-interwork -msoft-float"
+-      fi
+-      ;;
+-  esac
+ fi
+ 
+ 
diff --git a/package/spidermonkey185/0004-Fix-jsval_layout-on-64-bit-big-endian-platforms.patch b/package/spidermonkey185/0004-Fix-jsval_layout-on-64-bit-big-endian-platforms.patch
new file mode 100644
index 0000000..9aa4725
--- /dev/null
+++ b/package/spidermonkey185/0004-Fix-jsval_layout-on-64-bit-big-endian-platforms.patch
@@ -0,0 +1,91 @@
+
+# HG changeset patch
+# User Luke Wagner <luke@mozilla.com>
+# Date 1312494575 25200
+# Node ID 1d186a5f3a96e938a253726ac48ecaf00e80c712
+# Parent  cd0106ceb8ce337636875ef7b1f0d143cb33b7a4
+Bug 674522 - Fix jsval_layout on 64-bit big-endian platforms (r=waldo)
+
+[nicolas.cavallari at green-communications.fr: refresh patch]
+Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+
+diff --git a/js/src/jsval.h b/js/src/jsval.h
+--- a/js/src/jsval.h
++++ b/js/src/jsval.h
+@@ -301,17 +301,16 @@ typedef union jsval_layout
+         JSValueTag         tag : 17;
+     } debugView;
+ #endif
+     struct {
+         union {
+             int32          i32;
+             uint32         u32;
+             JSWhyMagic     why;
+-            jsuword        word;
+         } payload;
+     } s;
+     double asDouble;
+     void *asPtr;
+ } jsval_layout;
+ # endif  /* JS_BITS_PER_WORD */
+ #else   /* defined(IS_LITTLE_ENDIAN) */
+ # if JS_BITS_PER_WORD == 32
+@@ -338,28 +337,31 @@ typedef union jsval_layout
+ typedef union jsval_layout
+ {
+     uint64 asBits;
+     struct {
+         JSValueTag         tag : 17;
+         uint64             payload47 : 47;
+     } debugView;
+     struct {
++        uint32             padding;
+         union {
+             int32          i32;
+             uint32         u32;
+             JSWhyMagic     why;
+         } payload;
+     } s;
+     double asDouble;
+     void *asPtr;
+ } jsval_layout;
+ # endif /* JS_BITS_PER_WORD */
+ #endif  /* defined(IS_LITTLE_ENDIAN) */
+ 
++JS_STATIC_ASSERT(sizeof(jsval_layout) == 8);
++
+ #if JS_BITS_PER_WORD == 32
+ 
+ /*
+  * N.B. GCC, in some but not all cases, chooses to emit signed comparison of
+  * JSValueTag even though its underlying type has been forced to be uint32.
+  * Thus, all comparisons should explicitly cast operands to uint32.
+  */
+ 
+diff --git a/js/src/jsvalue.h b/js/src/jsvalue.h
+--- a/js/src/jsvalue.h
++++ b/js/src/jsvalue.h
+@@ -724,17 +724,21 @@ class Value
+     }
+ 
+     JS_ALWAYS_INLINE
+     void *toUnmarkedPtr() const {
+         return data.asPtr;
+     }
+ 
+     const jsuword *payloadWord() const {
+-        return &data.s.payload.word;
++#if JS_BITS_PER_WORD == 32
++        return reinterpret_cast<const jsuword *>(&data.s.payload.word);
++#elif JS_BITS_PER_WORD == 64
++        return reinterpret_cast<const jsuword *>(&data.asBits);
++#endif
+     }
+ 
+   private:
+     void staticAssertions() {
+         JS_STATIC_ASSERT(sizeof(JSValueType) == 1);
+         JS_STATIC_ASSERT(sizeof(JSValueTag) == 4);
+         JS_STATIC_ASSERT(sizeof(JSBool) == 4);
+         JS_STATIC_ASSERT(sizeof(JSWhyMagic) <= 4);
+
diff --git a/package/spidermonkey185/0005-Remove-bad-static-assert-fix-strict-aliasing-warnings.patch b/package/spidermonkey185/0005-Remove-bad-static-assert-fix-strict-aliasing-warnings.patch
new file mode 100644
index 0000000..0fc8e32
--- /dev/null
+++ b/package/spidermonkey185/0005-Remove-bad-static-assert-fix-strict-aliasing-warnings.patch
@@ -0,0 +1,94 @@
+
+# HG changeset patch
+# User Luke Wagner <luke@mozilla.com>
+# Date 1312825636 25200
+# Node ID 6f2c0dbb88d338df44a624041f8808c9de0a9a9b
+# Parent  e605ebcd59845fca46a52555eb1b18e70bb3a37d
+Bug 674522 - Remove bad static assert; fix strict-aliasing warnings (rs=waldo)
+
+[nicolas.cavallari at green-communications.fr: refresh patch]
+Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+
+diff --git a/js/src/jsval.h b/js/src/jsval.h
+--- a/js/src/jsval.h
++++ b/js/src/jsval.h
+@@ -305,16 +305,17 @@ typedef union jsval_layout
+         union {
+             int32          i32;
+             uint32         u32;
+             JSWhyMagic     why;
+         } payload;
+     } s;
+     double asDouble;
+     void *asPtr;
++    jsuword asWord;
+ } jsval_layout;
+ # endif  /* JS_BITS_PER_WORD */
+ #else   /* defined(IS_LITTLE_ENDIAN) */
+ # if JS_BITS_PER_WORD == 32
+ typedef union jsval_layout
+ {
+     uint64 asBits;
+     struct {
+@@ -346,16 +347,17 @@ typedef union jsval_layout
+         union {
+             int32          i32;
+             uint32         u32;
+             JSWhyMagic     why;
+         } payload;
+     } s;
+     double asDouble;
+     void *asPtr;
++    jsuword asWord;
+ } jsval_layout;
+ # endif /* JS_BITS_PER_WORD */
+ #endif  /* defined(IS_LITTLE_ENDIAN) */
+ 
+ JS_STATIC_ASSERT(sizeof(jsval_layout) == 8);
+ 
+ #if JS_BITS_PER_WORD == 32
+ 
+diff --git a/js/src/jsvalue.h b/js/src/jsvalue.h
+--- a/js/src/jsvalue.h
++++ b/js/src/jsvalue.h
+@@ -286,17 +286,16 @@ static JS_ALWAYS_INLINE JSValueTag
+ JSVAL_EXTRACT_NON_DOUBLE_TAG_IMPL(jsval_layout l)
+ {
+     uint64 tag = l.asBits >> JSVAL_TAG_SHIFT;
+     JS_ASSERT(tag > JSVAL_TAG_MAX_DOUBLE);
+     return (JSValueTag)tag;
+ }
+ 
+ #ifdef __cplusplus
+-JS_STATIC_ASSERT(offsetof(jsval_layout, s.payload) == 0);
+ JS_STATIC_ASSERT((JSVAL_TYPE_NONFUNOBJ & 0xF) == JSVAL_TYPE_OBJECT);
+ JS_STATIC_ASSERT((JSVAL_TYPE_FUNOBJ & 0xF) == JSVAL_TYPE_OBJECT);
+ #endif
+ 
+ static JS_ALWAYS_INLINE jsval_layout
+ BOX_NON_DOUBLE_JSVAL(JSValueType type, uint64 *slot)
+ {
+     /* N.B. for 32-bit payloads, the high 32 bits of the slot are trash. */
+@@ -725,19 +724,19 @@ class Value
+ 
+     JS_ALWAYS_INLINE
+     void *toUnmarkedPtr() const {
+         return data.asPtr;
+     }
+ 
+     const jsuword *payloadWord() const {
+ #if JS_BITS_PER_WORD == 32
+-        return reinterpret_cast<const jsuword *>(&data.s.payload.word);
++        return &data.s.payload.word;
+ #elif JS_BITS_PER_WORD == 64
+-        return reinterpret_cast<const jsuword *>(&data.asBits);
++        return &data.asWord;
+ #endif
+     }
+ 
+   private:
+     void staticAssertions() {
+         JS_STATIC_ASSERT(sizeof(JSValueType) == 1);
+         JS_STATIC_ASSERT(sizeof(JSValueTag) == 4);
+         JS_STATIC_ASSERT(sizeof(JSBool) == 4);
+
diff --git a/package/spidermonkey185/0006-Avoid-missing-cacheFlush-support-error-on-exotic-platforms.patch b/package/spidermonkey185/0006-Avoid-missing-cacheFlush-support-error-on-exotic-platforms.patch
new file mode 100644
index 0000000..c12a2ba
--- /dev/null
+++ b/package/spidermonkey185/0006-Avoid-missing-cacheFlush-support-error-on-exotic-platforms.patch
@@ -0,0 +1,34 @@
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
+-ifeq (,$(filter-out powerpc sparc,$(TARGET_CPU)))
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
index 0000000..ed7331f
--- /dev/null
+++ b/package/spidermonkey185/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_SPIDERMONKEY185
+	bool "spidermonkey (1.8.5)"
+	depends on BR2_USE_MMU # fork in executable tools.
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  SpiderMonkey is Mozilla's JavaScript engine written in C/C++. It is
+	  used in various Mozilla products, including Firefox.
+
+	  This is the old 1.8.5 branch, used in Firefox 4.
+
+comment "Spider monkey (1.8.5) need a toolchain with C++, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/spidermonkey185/spidermonkey185.hash b/package/spidermonkey185/spidermonkey185.hash
new file mode 100644
index 0000000..bd651d7
--- /dev/null
+++ b/package/spidermonkey185/spidermonkey185.hash
@@ -0,0 +1,2 @@
+# Locally generated.
+sha256	5d12f7e1f5b4a99436685d97b9b7b75f094d33580227aa998c406bbae6f2a687	js185-1.0.0.tar.gz
diff --git a/package/spidermonkey185/spidermonkey185.mk b/package/spidermonkey185/spidermonkey185.mk
new file mode 100644
index 0000000..fcd8999
--- /dev/null
+++ b/package/spidermonkey185/spidermonkey185.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# Spidermonkey (1.8.5)
+#
+################################################################################
+
+SPIDERMONKEY185_VERSION = 1.0.0
+SPIDERMONKEY185_SITE = http://ftp.mozilla.org/pub/js
+SPIDERMONKEY185_SOURCE = js185-${SPIDERMONKEY185_VERSION}.tar.gz
+SPIDERMONKEY185_SUBDIR = js/src
+
+SPIDERMONKEY185_LICENSE = MPLv1.1 or GPLv2.0+ or LGPLv2.1+
+SPIDERMONKEY185_INSTALL_STAGING = YES
+SPIDERMONKEY185_DEPENDENCIES = host-python host-perl
+
+# This define is used by jscpucfg.cpp which is normally used to runtime-detect
+# the system endianess.
+SPIDERMONKEY185_CONF_ENV = \
+	HOST_CXXFLAGS="$(HOST_CXXFLAGS) -DFORCE_$(BR2_ENDIAN)_ENDIAN"
+
+# Mozilla mixes up target, host and build.  See the comment in configure.in
+# around line 360.  Also, nanojit fails to build on sparc64 with
+# #error "unknown nanojit architecture", so disable the JIT.
+SPIDERMONKEY185_CONF_OPTS = \
+	--target=$(GNU_TARGET_NAME) \
+	--build=$(GNU_TARGET_NAME) \
+	--host=$(GNU_HOST_NAME) \
+	$(if $(BR2_sparc64),--disable-tracejit)
+
+$(eval $(autotools-package))
-- 
2.8.1
