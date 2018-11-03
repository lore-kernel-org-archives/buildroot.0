From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 3 Nov 2018 11:49:00 +0100
Subject: [Buildroot] [git commit] gcc: Don't mess with test-suite exclusion
Message-ID: <20181103105628.359C48817C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=545ca6a0f2f4e0d8b3812949476ac2856264b83c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We used to exclude GCC's test-suite for quite some time now
mostly for the sake of space reduction.

But:
 1. On each GCC version bump we need to revise that functionality
    as we need to accommodate changes in GCC sources and this
    couldn't be automated

 2. The space reduction is significant, but not huge. The two test
    suites together take up 290MB, out of 660MB total for GCC (each of
    them times two because there is the -initial and -final copy).
    However, whenever we build GCC, we also have kernel headers (about
    900MB) and a libc (e.g. glibc is 250MB). So at best, it saves less
    than 20%.

 3. It doesn't really save on build time either.
    Below are timings of 2 runs on my laptop:

    a) Vanilla master:
    --------------------->8---------------------
    time make host-gcc-final
    real	7m15.114s
    user	19m36.611s
    sys 	2m26.927s
    --------------------->8---------------------

    b) master + testsuite:
    --------------------->8---------------------
    time make host-gcc-final
    real	7m59.860s
    user	20m21.668s
    sys 	2m36.618s
    --------------------->8---------------------

    From figures above it's seen that difference is ~45 seconds
    or ~10%. On both host-gcc-initial and -final we may save ~1.5
    minutes... but these are not the only components we build and
    compared to a total toolchain build time IMHO it is not that
    much time to care especially traded for maintenance costs
    on GCC version bumps.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
[Arnout: add explanation about size impact.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gcc/7.3.0/0900-remove-selftests.patch      | 111 ---------------
 package/gcc/8.2.0/0003-remove-selftests.patch      | 149 ---------------------
 .../gcc/arc-2018.03/0900-remove-selftests.patch    | 111 ---------------
 package/gcc/gcc.mk                                 |   9 +-
 4 files changed, 1 insertion(+), 379 deletions(-)

diff --git a/package/gcc/7.3.0/0900-remove-selftests.patch b/package/gcc/7.3.0/0900-remove-selftests.patch
deleted file mode 100644
index a3bc7a5730..0000000000
--- a/package/gcc/7.3.0/0900-remove-selftests.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-From 63f0917d90eb83d267dc517fdfb6523a74b1917c Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Wed, 3 May 2017 00:37:06 +0200
-Subject: [PATCH] remove selftests
-
-When the gcc archive is extracted by the gcc.mk, the gcc/testsuite
-is excluded:
-
-HOST_GCC_EXCLUDES = \
-	libjava/* libgo/* \
-	gcc/testsuite/* libstdc++-v3/testsuite/*
-
-The new Makefile target from the "Selftest framework" [1] added a dependency
-on the gcc/testsuite/Makefile.
-Revert partially the commit [1] to allow building gcc without selftest.
-
-[1] https://github.com/gcc-mirror/gcc/commit/99b4f3a2d5bf2c137de9731e27b483eb6b462fd9
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gcc/Makefile.in | 46 +++++-----------------------------------------
- 1 file changed, 5 insertions(+), 41 deletions(-)
-
-diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 74d1912..652a554 100644
---- a/gcc/Makefile.in
-+++ b/gcc/Makefile.in
-@@ -1581,14 +1581,13 @@ OBJS = \
- OBJS-libcommon = diagnostic.o diagnostic-color.o diagnostic-show-locus.o \
- 	edit-context.o \
- 	pretty-print.o intl.o \
--	vec.o input.o version.o hash-table.o ggc-none.o memory-block.o \
--	selftest.o
-+	vec.o input.o version.o hash-table.o ggc-none.o memory-block.o
- 
- # Objects in libcommon-target.a, used by drivers and by the core
- # compiler and containing target-dependent code.
- OBJS-libcommon-target = $(common_out_object_file) prefix.o params.o \
- 	opts.o opts-common.o options.o vec.o hooks.o common/common-targhooks.o \
--	hash-table.o file-find.o spellcheck.o selftest.o
-+	hash-table.o file-find.o spellcheck.o
- 
- # This lists all host objects for the front ends.
- ALL_HOST_FRONTEND_OBJS = $(foreach v,$(CONFIG_LANGUAGES),$($(v)_OBJS))
-@@ -1865,10 +1864,10 @@ config.status: $(srcdir)/configure $(srcdir)/config.gcc
- quickstrap: all
- 	cd $(toplevel_builddir) && $(MAKE) all-target-libgcc
- 
--all.internal: start.encap rest.encap doc selftest
-+all.internal: start.encap rest.encap doc
- # This is what to compile if making a cross-compiler.
- all.cross: native gcc-cross$(exeext) cpp$(exeext) specs \
--	libgcc-support lang.all.cross doc selftest @GENINSRC@ srcextra
-+	libgcc-support lang.all.cross doc @GENINSRC@ srcextra
- # This is what must be made before installing GCC and converting libraries.
- start.encap: native xgcc$(exeext) cpp$(exeext) specs \
- 	libgcc-support lang.start.encap @GENINSRC@ srcextra
-@@ -1888,41 +1887,6 @@ endif
- # This does the things that can't be done on the host machine.
- rest.cross: specs
- 
--# GCC's selftests.
--# Specify a dummy input file to placate the driver.
--# Specify -nostdinc to work around missing WIND_BASE environment variable
--# required for *-wrs-vxworks-* targets.
--# Specify -o /dev/null so the output of -S is discarded. More importantly
--# It does not try to create a file with the name "null.s" on POSIX and
--# "nul.s" on Windows. Because on Windows "nul" is a reserved file name.
--# Specify the path to gcc/testsuite/selftests within the srcdir
--# as an argument to -fself-test.
--SELFTEST_FLAGS = -nostdinc -x c /dev/null -S -o /dev/null \
--	-fself-test=$(srcdir)/testsuite/selftests
--
--# Run the selftests during the build once we have a driver and a cc1,
--# so that self-test failures are caught as early as possible.
--# Use "s-selftest" to ensure that we only run the selftests if the
--# driver, cc1, or selftest data change.
--.PHONY: selftest
--selftest: s-selftest
--s-selftest: $(GCC_PASSES) cc1$(exeext) stmp-int-hdrs \
--  $(srcdir)/testsuite/selftests
--	$(GCC_FOR_TARGET) $(SELFTEST_FLAGS)
--	$(STAMP) $@
--
--# Convenience method for running selftests under gdb:
--.PHONY: selftest-gdb
--selftest-gdb: $(GCC_PASSES) cc1$(exeext) stmp-int-hdrs
--	$(GCC_FOR_TARGET) $(SELFTEST_FLAGS) \
--	  -wrapper gdb,--args
--
--# Convenience method for running selftests under valgrind:
--.PHONY: selftest-valgrind
--selftest-valgrind: $(GCC_PASSES) cc1$(exeext) stmp-int-hdrs
--	$(GCC_FOR_TARGET) $(SELFTEST_FLAGS) \
--	  -wrapper valgrind,--leak-check=full
--
- # Recompile all the language-independent object files.
- # This is used only if the user explicitly asks for it.
- compilations: $(BACKEND)
-@@ -2076,7 +2040,7 @@ gcc-nm.c: gcc-ar.c
- 	cp $^ $@
- 
- COLLECT2_OBJS = collect2.o collect2-aix.o tlink.o vec.o ggc-none.o \
--  collect-utils.o file-find.o hash-table.o selftest.o
-+  collect-utils.o file-find.o hash-table.o
- COLLECT2_LIBS = @COLLECT2_LIBS@
- collect2$(exeext): $(COLLECT2_OBJS) $(LIBDEPS)
- # Don't try modifying collect2 (aka ld) in place--it might be linking this.
--- 
-2.9.3
-
diff --git a/package/gcc/8.2.0/0003-remove-selftests.patch b/package/gcc/8.2.0/0003-remove-selftests.patch
deleted file mode 100644
index 83bd9f26db..0000000000
--- a/package/gcc/8.2.0/0003-remove-selftests.patch
+++ /dev/null
@@ -1,149 +0,0 @@
-From dd29f38f3271bad3f0209113158c89dd8738a274 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Wed, 3 May 2017 00:37:06 +0200
-Subject: [PATCH] remove selftests
-
-When the gcc archive is extracted by the gcc.mk, the gcc/testsuite
-is excluded:
-
-HOST_GCC_EXCLUDES = \
-	libjava/* libgo/* \
-	gcc/testsuite/* libstdc++-v3/testsuite/*
-
-The new Makefile target from the "Selftest framework" [1] added a dependency
-on the gcc/testsuite/Makefile.
-Revert partially the commit [1] to allow building gcc without selftest.
-
-[1] https://github.com/gcc-mirror/gcc/commit/99b4f3a2d5bf2c137de9731e27b483eb6b462fd9
-
-[Rebased on gcc 8.1]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gcc/Makefile.in | 83 ++++-----------------------------------------------------
- 1 file changed, 5 insertions(+), 78 deletions(-)
-
-diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 20bee0494b1..1ae5fb382b5 100644
---- a/gcc/Makefile.in
-+++ b/gcc/Makefile.in
-@@ -1610,14 +1610,13 @@ OBJS-libcommon = diagnostic.o diagnostic-color.o diagnostic-show-locus.o \
- 	edit-context.o \
- 	pretty-print.o intl.o \
- 	sbitmap.o \
--	vec.o input.o version.o hash-table.o ggc-none.o memory-block.o \
--	selftest.o selftest-diagnostic.o
-+	vec.o input.o version.o hash-table.o ggc-none.o memory-block.o
- 
- # Objects in libcommon-target.a, used by drivers and by the core
- # compiler and containing target-dependent code.
- OBJS-libcommon-target = $(common_out_object_file) prefix.o params.o \
- 	opts.o opts-common.o options.o vec.o hooks.o common/common-targhooks.o \
--	hash-table.o file-find.o spellcheck.o selftest.o
-+	hash-table.o file-find.o spellcheck.o
- 
- # This lists all host objects for the front ends.
- ALL_HOST_FRONTEND_OBJS = $(foreach v,$(CONFIG_LANGUAGES),$($(v)_OBJS))
-@@ -1894,10 +1893,10 @@ config.status: $(srcdir)/configure $(srcdir)/config.gcc
- quickstrap: all
- 	cd $(toplevel_builddir) && $(MAKE) all-target-libgcc
- 
--all.internal: start.encap rest.encap doc selftest
-+all.internal: start.encap rest.encap doc
- # This is what to compile if making a cross-compiler.
- all.cross: native gcc-cross$(exeext) cpp$(exeext) specs \
--	libgcc-support lang.all.cross doc selftest @GENINSRC@ srcextra
-+	libgcc-support lang.all.cross doc @GENINSRC@ srcextra
- # This is what must be made before installing GCC and converting libraries.
- start.encap: native xgcc$(exeext) cpp$(exeext) specs \
- 	libgcc-support lang.start.encap @GENINSRC@ srcextra
-@@ -1917,78 +1916,6 @@ endif
- # This does the things that can't be done on the host machine.
- rest.cross: specs
- 
--# GCC's selftests.
--# Specify a dummy input file to placate the driver.
--# Specify -nostdinc to work around missing WIND_BASE environment variable
--# required for *-wrs-vxworks-* targets.
--# Specify -o /dev/null so the output of -S is discarded. More importantly
--# It does not try to create a file with the name "null.s" on POSIX and
--# "nul.s" on Windows. Because on Windows "nul" is a reserved file name.
--# Beware that /dev/null is not available to mingw tools, so directly use
--# "nul" instead of "/dev/null" if we're building on a mingw machine.
--# Specify the path to gcc/testsuite/selftests within the srcdir
--# as an argument to -fself-test.
--DEVNULL=$(if $(findstring mingw,$(build)),nul,/dev/null)
--SELFTEST_FLAGS = -nostdinc $(DEVNULL) -S -o $(DEVNULL) \
--	-fself-test=$(srcdir)/testsuite/selftests
--
--C_SELFTEST_FLAGS = -xc $(SELFTEST_FLAGS)
--CPP_SELFTEST_FLAGS = -xc++ $(SELFTEST_FLAGS)
--
--SELFTEST_DEPS = $(GCC_PASSES) stmp-int-hdrs $(srcdir)/testsuite/selftests
--
--C_SELFTEST_DEPS = cc1$(exeext) $(SELFTEST_DEPS)
--CPP_SELFTEST_DEPS = cc1plus$(exeext) $(SELFTEST_DEPS)
--
--# Run the selftests during the build once we have a driver and the frontend,
--# so that self-test failures are caught as early as possible.
--# Use "s-selftest-FE" to ensure that we only run the selftests if the
--# driver, frontend, or selftest data change.
--.PHONY: selftest
--
--# By default, only run the selftests within the C frontend
--selftest: s-selftest-c
--
--# C selftests
--s-selftest-c: $(C_SELFTEST_DEPS)
--	$(GCC_FOR_TARGET) $(C_SELFTEST_FLAGS)
--	$(STAMP) $@
--
--# Convenience methods for running C selftests under gdb:
--.PHONY: selftest-c-gdb
--selftest-c-gdb: $(C_SELFTEST_DEPS)
--	$(GCC_FOR_TARGET) $(C_SELFTEST_FLAGS) \
--	  -wrapper gdb,--args
--
--.PHONY: selftest-gdb
--selftest-gdb: selftest-c-gdb
--
--# Convenience methods for running C selftests under valgrind:
--.PHONY: selftest-c-valgrind
--selftest-c-valgrind: $(C_SELFTEST_DEPS)
--	$(GCC_FOR_TARGET) $(C_SELFTEST_FLAGS) \
--	  -wrapper valgrind,--leak-check=full
--
--.PHONY: selftest-valgrind
--selftest-valgrind: selftest-c-valgrind
--
--# C++ selftests
--s-selftest-c++: $(CPP_SELFTEST_DEPS)
--	$(GCC_FOR_TARGET) $(CPP_SELFTEST_FLAGS)
--	$(STAMP) $@
--
--# Convenience method for running C++ selftests under gdb:
--.PHONY: selftest-c++-gdb
--selftest-c++-gdb: $(CPP_SELFTEST_DEPS)
--	$(GCC_FOR_TARGET) $(CPP_SELFTEST_FLAGS) \
--	  -wrapper gdb,--args
--
--# Convenience method for running C++ selftests under valgrind:
--.PHONY: selftest-c++-valgrind
--selftest-c++-valgrind: $(CPP_SELFTEST_DEPS)
--	$(GCC_FOR_TARGET) $(CPP_SELFTEST_FLAGS) \
--	  -wrapper valgrind,--leak-check=full
--
- # Recompile all the language-independent object files.
- # This is used only if the user explicitly asks for it.
- compilations: $(BACKEND)
-@@ -2142,7 +2069,7 @@ gcc-nm.c: gcc-ar.c
- 	cp $^ $@
- 
- COLLECT2_OBJS = collect2.o collect2-aix.o tlink.o vec.o ggc-none.o \
--  collect-utils.o file-find.o hash-table.o selftest.o
-+  collect-utils.o file-find.o hash-table.o
- COLLECT2_LIBS = @COLLECT2_LIBS@
- collect2$(exeext): $(COLLECT2_OBJS) $(LIBDEPS)
- # Don't try modifying collect2 (aka ld) in place--it might be linking this.
--- 
-2.14.3
-
diff --git a/package/gcc/arc-2018.03/0900-remove-selftests.patch b/package/gcc/arc-2018.03/0900-remove-selftests.patch
deleted file mode 100644
index a3bc7a5730..0000000000
--- a/package/gcc/arc-2018.03/0900-remove-selftests.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-From 63f0917d90eb83d267dc517fdfb6523a74b1917c Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Wed, 3 May 2017 00:37:06 +0200
-Subject: [PATCH] remove selftests
-
-When the gcc archive is extracted by the gcc.mk, the gcc/testsuite
-is excluded:
-
-HOST_GCC_EXCLUDES = \
-	libjava/* libgo/* \
-	gcc/testsuite/* libstdc++-v3/testsuite/*
-
-The new Makefile target from the "Selftest framework" [1] added a dependency
-on the gcc/testsuite/Makefile.
-Revert partially the commit [1] to allow building gcc without selftest.
-
-[1] https://github.com/gcc-mirror/gcc/commit/99b4f3a2d5bf2c137de9731e27b483eb6b462fd9
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gcc/Makefile.in | 46 +++++-----------------------------------------
- 1 file changed, 5 insertions(+), 41 deletions(-)
-
-diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 74d1912..652a554 100644
---- a/gcc/Makefile.in
-+++ b/gcc/Makefile.in
-@@ -1581,14 +1581,13 @@ OBJS = \
- OBJS-libcommon = diagnostic.o diagnostic-color.o diagnostic-show-locus.o \
- 	edit-context.o \
- 	pretty-print.o intl.o \
--	vec.o input.o version.o hash-table.o ggc-none.o memory-block.o \
--	selftest.o
-+	vec.o input.o version.o hash-table.o ggc-none.o memory-block.o
- 
- # Objects in libcommon-target.a, used by drivers and by the core
- # compiler and containing target-dependent code.
- OBJS-libcommon-target = $(common_out_object_file) prefix.o params.o \
- 	opts.o opts-common.o options.o vec.o hooks.o common/common-targhooks.o \
--	hash-table.o file-find.o spellcheck.o selftest.o
-+	hash-table.o file-find.o spellcheck.o
- 
- # This lists all host objects for the front ends.
- ALL_HOST_FRONTEND_OBJS = $(foreach v,$(CONFIG_LANGUAGES),$($(v)_OBJS))
-@@ -1865,10 +1864,10 @@ config.status: $(srcdir)/configure $(srcdir)/config.gcc
- quickstrap: all
- 	cd $(toplevel_builddir) && $(MAKE) all-target-libgcc
- 
--all.internal: start.encap rest.encap doc selftest
-+all.internal: start.encap rest.encap doc
- # This is what to compile if making a cross-compiler.
- all.cross: native gcc-cross$(exeext) cpp$(exeext) specs \
--	libgcc-support lang.all.cross doc selftest @GENINSRC@ srcextra
-+	libgcc-support lang.all.cross doc @GENINSRC@ srcextra
- # This is what must be made before installing GCC and converting libraries.
- start.encap: native xgcc$(exeext) cpp$(exeext) specs \
- 	libgcc-support lang.start.encap @GENINSRC@ srcextra
-@@ -1888,41 +1887,6 @@ endif
- # This does the things that can't be done on the host machine.
- rest.cross: specs
- 
--# GCC's selftests.
--# Specify a dummy input file to placate the driver.
--# Specify -nostdinc to work around missing WIND_BASE environment variable
--# required for *-wrs-vxworks-* targets.
--# Specify -o /dev/null so the output of -S is discarded. More importantly
--# It does not try to create a file with the name "null.s" on POSIX and
--# "nul.s" on Windows. Because on Windows "nul" is a reserved file name.
--# Specify the path to gcc/testsuite/selftests within the srcdir
--# as an argument to -fself-test.
--SELFTEST_FLAGS = -nostdinc -x c /dev/null -S -o /dev/null \
--	-fself-test=$(srcdir)/testsuite/selftests
--
--# Run the selftests during the build once we have a driver and a cc1,
--# so that self-test failures are caught as early as possible.
--# Use "s-selftest" to ensure that we only run the selftests if the
--# driver, cc1, or selftest data change.
--.PHONY: selftest
--selftest: s-selftest
--s-selftest: $(GCC_PASSES) cc1$(exeext) stmp-int-hdrs \
--  $(srcdir)/testsuite/selftests
--	$(GCC_FOR_TARGET) $(SELFTEST_FLAGS)
--	$(STAMP) $@
--
--# Convenience method for running selftests under gdb:
--.PHONY: selftest-gdb
--selftest-gdb: $(GCC_PASSES) cc1$(exeext) stmp-int-hdrs
--	$(GCC_FOR_TARGET) $(SELFTEST_FLAGS) \
--	  -wrapper gdb,--args
--
--# Convenience method for running selftests under valgrind:
--.PHONY: selftest-valgrind
--selftest-valgrind: $(GCC_PASSES) cc1$(exeext) stmp-int-hdrs
--	$(GCC_FOR_TARGET) $(SELFTEST_FLAGS) \
--	  -wrapper valgrind,--leak-check=full
--
- # Recompile all the language-independent object files.
- # This is used only if the user explicitly asks for it.
- compilations: $(BACKEND)
-@@ -2076,7 +2040,7 @@ gcc-nm.c: gcc-ar.c
- 	cp $^ $@
- 
- COLLECT2_OBJS = collect2.o collect2-aix.o tlink.o vec.o ggc-none.o \
--  collect-utils.o file-find.o hash-table.o selftest.o
-+  collect-utils.o file-find.o hash-table.o
- COLLECT2_LIBS = @COLLECT2_LIBS@
- collect2$(exeext): $(COLLECT2_OBJS) $(LIBDEPS)
- # Don't try modifying collect2 (aka ld) in place--it might be linking this.
--- 
-2.9.3
-
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 8b0fec74f1..e47435677e 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -62,14 +62,7 @@ define HOST_GCC_APPLY_PATCHES
 endef
 
 HOST_GCC_EXCLUDES = \
-	libjava/* libgo/* \
-	gcc/testsuite/* libstdc++-v3/testsuite/*
-
-define HOST_GCC_FAKE_TESTSUITE
-	mkdir -p $(@D)/libstdc++-v3/testsuite/
-	echo "all:" > $(@D)/libstdc++-v3/testsuite/Makefile.in
-	echo "install:" >> $(@D)/libstdc++-v3/testsuite/Makefile.in
-endef
+	libjava/* libgo/*
 
 #
 # Create 'build' directory and configure symlink
