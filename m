From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 28 Sep 2020 13:42:27 +0200
Subject: [Buildroot] [PATCH 2/2] package/zstd: link programs dynamically
 with libzstd to save space
In-Reply-To: <20200928114228.23637-1-patrickdepinguin@gmail.com>
References: <20200928114228.23637-1-patrickdepinguin@gmail.com>
Message-ID: <20200928114228.23637-2-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Even when a shared libzstd is built, the zstd command-line programs are
statically linked with libzstd, causing a large rootfs footprint.

While the cmake backend in zstd already supported a flag
ZSTD_PROGRAMS_LINK_SHARED, the make backend did not.

This commit adds support for ZSTD_PROGRAMS_LINK_SHARED in the make system
and applies it for the target compilation, unless only static libs are
supported.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 ...D_PROGRAMS_LINK_SHARED-to-link-zstd-.patch | 80 +++++++++++++++++++
 package/zstd/zstd.mk                          | 10 +++
 2 files changed, 90 insertions(+)
 create mode 100644 package/zstd/0002-make-support-ZSTD_PROGRAMS_LINK_SHARED-to-link-zstd-.patch

diff --git a/package/zstd/0002-make-support-ZSTD_PROGRAMS_LINK_SHARED-to-link-zstd-.patch b/package/zstd/0002-make-support-ZSTD_PROGRAMS_LINK_SHARED-to-link-zstd-.patch
new file mode 100644
index 0000000000..100cfaba95
--- /dev/null
+++ b/package/zstd/0002-make-support-ZSTD_PROGRAMS_LINK_SHARED-to-link-zstd-.patch
@@ -0,0 +1,80 @@
+From afc368e7247abfe89250def5b7673a9ccb79e0b1 Mon Sep 17 00:00:00 2001
+From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Date: Wed, 5 Aug 2020 15:35:01 +0200
+Subject: [PATCH] make: support ZSTD_PROGRAMS_LINK_SHARED to link zstd with
+ libzstd
+
+zstd allows building via make, cmake, meson, and others, but unfortunately
+the features and flags used for these build systems are inconsistent.
+
+The cmake version respects an option 'ZSTD_PROGRAMS_LINK_SHARED' to let the
+zstd binary link dynamically with its own libzstd. Without it, the zstd
+program uses static linking and thus has a big size.
+
+This option is not provided in the 'make' system. There does exist a target
+'zstd-dll' which intends to do exactly this, but it does not work out of the
+box due to linking issues. These in turn are caused because the lib makefile
+passes '-fvisibility=hidden' to the linker, which hides certain symbols that
+the zstd program needs. The cmake-based compilation does not pass this
+visibility flag, due to which all symbols are visible.
+
+Unfortunately, there is no 'install' rule that will install zstd-dll and
+create the derived programs like zstdless etc.
+
+With the above in mind, when ZSTD_PROGRAMS_LINK_SHARED is set in make
+context:
+- remove '-fvisibility=hidden' from the lib compilation
+- alter the 'zstd' target to not include the lib objects directly but link
+  dynamically with libzstd.
+
+See also https://github.com/facebook/zstd/issues/2261 which reported these
+inconsistencies between make and cmake compilation.
+
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+
+---
+ lib/Makefile      | 5 ++++-
+ programs/Makefile | 8 +++++++-
+ 2 files changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/lib/Makefile b/lib/Makefile
+index 7c6dff02..8f9f36a6 100644
+--- a/lib/Makefile
++++ b/lib/Makefile
+@@ -204,7 +204,10 @@ $(LIBZSTD): $(ZSTD_FILES)
+ else
+ 
+ LIBZSTD = libzstd.$(SHARED_EXT_VER)
+-$(LIBZSTD): LDFLAGS += -shared -fPIC -fvisibility=hidden
++$(LIBZSTD): LDFLAGS += -shared -fPIC
++ifndef ZSTD_PROGRAMS_LINK_SHARED
++$(LIBZSTD): LDFLAGS += -fvisibility=hidden
++endif
+ $(LIBZSTD): $(ZSTD_FILES)
+ 	@echo compiling dynamic library $(LIBVER)
+ 	$(Q)$(CC) $(FLAGS) $^ $(LDFLAGS) $(SONAME_FLAGS) -o $@
+diff --git a/programs/Makefile b/programs/Makefile
+index 418ad4e6..8897dcf9 100644
+--- a/programs/Makefile
++++ b/programs/Makefile
+@@ -169,10 +169,16 @@ $(ZSTDDECOMP_O): CFLAGS += $(ALIGN_LOOP)
+ zstd : CPPFLAGS += $(THREAD_CPP) $(ZLIBCPP) $(LZMACPP) $(LZ4CPP)
+ zstd : LDFLAGS += $(THREAD_LD) $(ZLIBLD) $(LZMALD) $(LZ4LD) $(DEBUGFLAGS_LD)
+ zstd : CPPFLAGS += -DZSTD_LEGACY_SUPPORT=$(ZSTD_LEGACY_SUPPORT)
++ifdef ZSTD_PROGRAMS_LINK_SHARED
++# link dynamically against own library
++zstd : LDFLAGS += -L$(ZSTDDIR) -lzstd
++else
++zstd : $(ZSTDLIB_FILES)
++endif
+ ifneq (,$(filter Windows%,$(OS)))
+ zstd : $(RES_FILE)
+ endif
+-zstd : $(ZSTDLIB_FILES) $(ZSTD_CLI_OBJ)
++zstd : $(ZSTD_CLI_OBJ)
+ 	@echo "$(THREAD_MSG)"
+ 	@echo "$(ZLIB_MSG)"
+ 	@echo "$(LZMA_MSG)"
+-- 
+2.26.2
+
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 35002da332..c7b224b002 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -43,9 +43,19 @@ ZSTD_INSTALL_LIBS = install-static
 else ifeq ($(BR2_SHARED_LIBS),y)
 ZSTD_BUILD_LIBS = libzstd
 ZSTD_INSTALL_LIBS = install-shared
+ZSTD_OPTS += ZSTD_PROGRAMS_LINK_SHARED=1
 else
 ZSTD_BUILD_LIBS = libzstd.a libzstd
 ZSTD_INSTALL_LIBS = install-static install-shared
+ZSTD_OPTS += ZSTD_PROGRAMS_LINK_SHARED=1
+endif
+
+# The HAVE_THREAD flag is read by the 'programs' makefile but not by  the 'lib'
+# one. Building a multi-threaded binary with a library (which defaults to
+# single-threaded) gives a runtime error when compressing files.
+# The 'lib' makefile provides specific '%-mt' targets for this purpose.
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+ZSTD_BUILD_LIBS := $(addsuffix -mt,$(ZSTD_BUILD_LIBS))
 endif
 
 define ZSTD_BUILD_CMDS
-- 
2.26.2
