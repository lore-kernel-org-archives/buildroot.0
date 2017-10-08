From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Oct 2017 10:48:14 +0200
Subject: [Buildroot] [PATCHv2] flex: rework patches to avoid host/target
	difference
Message-ID: <20171008084814.3885-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Currently, the target and host flex packages do not behave the same in
terms of patching: the target variant has a patch hook that disables
building the programs (because they are not needed, and do not build
on no-MMU platforms). However, this hook is obviously not executed for
host-flex, because we really want the host flex binary to be built.

In preparation for the introduction of out-of-tree package build, it
is important that we don't do different things in the patch hooks for
the target and host variant of a given package, because the source
tree will be shared between the target and host builds.

To solve this, we introduce a --disable-program configure option,
through a patch to the flex configure.ac and Makefile.am. This patch
makes the current 0001-flex-disable-documentation.patch no longer
needed.

Furthermore, building the documentation is a PITA: flex.1 depends on
configure.ac and a few other files generated during the build. Touching
flex.1 does not work, because automake will forcibly remove the files
when its prerequisites are too old, but will not generate it.

So, we add a patch that adds a --disable-doc configure option.

Finally, since the target flex only installs a static library, we do not
install the package to TARGET_DIR anymore, only the staging
installation is done.

Fixes:
    http://autobuild.buildroot.org/results/f70/f70b39632535bb9692d0a032166b2f4104532967/
    http://autobuild.buildroot.org/results/525/52567afdfe7992b3518de0e01227ba14aa300f21/
    [...]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[yann.morin.1998 at free.fr:
  - rebase on-top of master,
  - add patch to not build the documentation, because simply touching
    flex.1 is no longer enough.
]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Adrian Perez de Castro <aperez@igalia.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Chamges v1 -> v2:
  - fix commit log  (Thomas)
  - drop spurious indentation cleanup  (Thomas)
  - properly reorder patches (backport first)  (Thomas)
  - fix typoes  (Thomas)

---
Given how welcoming upstream was about the first patch, I haven't even
considered sending the second one. Sigh...
---
 ...AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch} |  0
 package/flex/0001-flex-disable-documentation.patch | 35 ----------
 ...it-possible-to-disable-the-build-of-the-f.patch | 76 ++++++++++++++++++++++
 ...it-possible-to-disable-the-build-of-the-d.patch | 58 +++++++++++++++++
 package/flex/flex.mk                               | 26 ++++----
 5 files changed, 146 insertions(+), 49 deletions(-)
 rename package/flex/{0002-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch => 0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch} (100%)
 delete mode 100644 package/flex/0001-flex-disable-documentation.patch
 create mode 100644 package/flex/0002-build-make-it-possible-to-disable-the-build-of-the-f.patch
 create mode 100644 package/flex/0003-build-make-it-possible-to-disable-the-build-of-the-d.patch

diff --git a/package/flex/0002-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch b/package/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch
similarity index 100%
rename from package/flex/0002-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch
rename to package/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch
diff --git a/package/flex/0001-flex-disable-documentation.patch b/package/flex/0001-flex-disable-documentation.patch
deleted file mode 100644
index b017b41385..0000000000
--- a/package/flex/0001-flex-disable-documentation.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From a98443c6a72d5821d4e0152311e5c3eb4cdff25c Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Wed, 13 Sep 2017 17:26:48 +0300
-Subject: [PATCH] flex: disable documentation
-
-Since we prevent the flex binary to be built, we also need to prevent
-the documentation to be built, otherwise it will fail like this:
-
-Making all in doc
-make[2]: Entering directory '/br/output/build/flex-2.6.4/doc'
-make[2]: *** No rule to make target '../src/flex', needed by 'flex.1'.
-Stop.
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-[Adrian: patch Makefile.am instead of Makefile.in]
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
----
- Makefile.am | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 638c549..9db3420 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -43,7 +43,6 @@ EXTRA_DIST = \
- 
- SUBDIRS = \
- 	src \
--	doc \
- 	examples \
- 	po \
- 	tests \
--- 
-2.14.1
-
diff --git a/package/flex/0002-build-make-it-possible-to-disable-the-build-of-the-f.patch b/package/flex/0002-build-make-it-possible-to-disable-the-build-of-the-f.patch
new file mode 100644
index 0000000000..19f5a772c5
--- /dev/null
+++ b/package/flex/0002-build-make-it-possible-to-disable-the-build-of-the-f.patch
@@ -0,0 +1,76 @@
+From da21733178b34eea303964db5a05e8a3ee4095b4 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 26 Aug 2017 15:17:06 +0200
+Subject: [PATCH] build: make it possible to disable the build of the flex
+ program
+
+The flex program uses fork(), which isn't available on noMMU
+systems. However, the libfl library does not use fork(), and be used
+by other programs/libraries.
+
+Therefore, it makes sense to provide an option to disable the build of
+the flex program.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Submitted-upstream: https://github.com/westes/flex/pull/256
+Refused. We'll have to adapt when they do a new release...
+---
+ Makefile.am     | 2 ++
+ configure.ac    | 6 ++++++
+ doc/Makefile.am | 4 ++++
+ src/Makefile.am | 3 +++
+ 4 files changed, 15 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index e790e9d..8b57bc9 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -62,8 +62,10 @@ ChangeLog: $(srcdir)/tools/git2cl
+ indent:
+ 	cd src && $(MAKE) $(AM_MAKEFLAGS) indent
+ 
++if ENABLE_PROGRAM
+ install-exec-hook:
+ 	cd $(DESTDIR)$(bindir) && \
+ 		$(LN_S) -f flex$(EXEEXT) flex++$(EXEEXT)
++endif
+ 
+ .PHONY: ChangeLog indent
+diff --git a/configure.ac b/configure.ac
+index 8882016..f49872b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -75,6 +75,12 @@ AC_ARG_ENABLE([libfl],
+   [], [enable_libfl=yes])
+ AM_CONDITIONAL([ENABLE_LIBFL], [test "x$enable_libfl" = xyes])
+ 
++AC_ARG_ENABLE([program],
++  [AS_HELP_STRING([--disable-program],
++                  [do not build the flex program, only the libfl library])],
++  [], [enable_program=yes])
++AM_CONDITIONAL([ENABLE_PROGRAM], [test "x$enable_program" = xyes])
++
+ # --disable-bootstrap is intended only to workaround problems with bootstrap
+ # (e.g. when cross-compiling flex or when bootstrapping has bugs).
+ # Ideally we should be able to bootstrap even when cross-compiling.
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 0d13a5a..c73bc17 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -4,7 +4,10 @@ LIBS = @LIBS@
+ 
+ m4 = @M4@
+ 
++if ENABLE_PROGRAM
+ bin_PROGRAMS = flex
++endif
++
+ if ENABLE_BOOTSTRAP
+ noinst_PROGRAMS = stage1flex
+ endif
+-- 
+2.9.4
+
diff --git a/package/flex/0003-build-make-it-possible-to-disable-the-build-of-the-d.patch b/package/flex/0003-build-make-it-possible-to-disable-the-build-of-the-d.patch
new file mode 100644
index 0000000000..ffe30d367f
--- /dev/null
+++ b/package/flex/0003-build-make-it-possible-to-disable-the-build-of-the-d.patch
@@ -0,0 +1,58 @@
+From b89b8475a5b2f9444c32f7d254b35968da3c8a23 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Fri, 29 Sep 2017 18:03:51 +0200
+Subject: [PATCH] build: make it possible to disable the build of the
+ documentation
+
+When targetting embedded evices, the documentation is not needed.
+
+Building the documentation default to whether the program is built.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.am  | 8 +++++++-
+ configure.ac | 6 ++++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index fce30b2..ee75b64 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -41,9 +41,15 @@ EXTRA_DIST = \
+ 	.indent.pro \
+ 	autogen.sh
+ 
++MAYBE_SUBDIRS =
++
++if ENABLE_DOC
++MAYBE_SUBDIRS += doc
++endif
++
+ SUBDIRS = \
+ 	src \
+-	doc \
++	$(MAYBE_SUBDIRS) \
+ 	examples \
+ 	po \
+ 	tests \
+diff --git a/configure.ac b/configure.ac
+index c54e98f..b3ae450 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -80,6 +80,12 @@ AC_ARG_ENABLE([program],
+   [], [enable_program=yes])
+ AM_CONDITIONAL([ENABLE_PROGRAM], [test "x$enable_program" = xyes])
+ 
++AC_ARG_ENABLE([doc],
++  [AS_HELP_STRING([--disable-doc],
++                  [do not build the documentation])],
++  [], [enable_doc=${enable_program}])
++AM_CONDITIONAL([ENABLE_DOC], [test "x$enable_doc" = xyes -a "x$enable_program" = xyes])
++
+ # --disable-bootstrap is intended only to workaround problems with bootstrap
+ # (e.g. when cross-compiling flex or when bootstrapping has bugs).
+ # Ideally we should be able to bootstrap even when cross-compiling.
+-- 
+2.11.0
+
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index aeac4ada87..5410d1564e 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -7,29 +7,27 @@
 FLEX_VERSION = 2.6.4
 FLEX_SITE = https://github.com/westes/flex/files/981163
 FLEX_INSTALL_STAGING = YES
+# flex only installs a static library
+FLEX_INSTALL_TARGET = NO
 FLEX_LICENSE = FLEX
 FLEX_LICENSE_FILES = COPYING
 FLEX_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-m4
+HOST_FLEX_DEPENDENCIES = host-m4
 
-# 0001-flex-disable-documentation.patch
-# 0002-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch
+# 0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch
+# 0002-build-make-it-possible-to-disable-the-build-of-the-f.patch
+# 0003-build-make-it-possible-to-disable-the-build-of-the-d.patch
 FLEX_AUTORECONF = YES
 FLEX_GETTEXTIZE = YES
 FLEX_CONF_ENV = ac_cv_path_M4=/usr/bin/m4 \
 	ac_cv_func_reallocarray=no
 
-HOST_FLEX_DEPENDENCIES = host-m4
-
-define FLEX_DISABLE_PROGRAM
-	$(SED) 's/^bin_PROGRAMS.*//' $(@D)/src/Makefile.in
-endef
-FLEX_POST_PATCH_HOOKS += FLEX_DISABLE_PROGRAM
-
-# flex++ symlink is broken when flex binary is not installed
-define FLEX_REMOVE_BROKEN_SYMLINK
-	rm -f $(TARGET_DIR)/usr/bin/flex++
-endef
-FLEX_POST_INSTALL_TARGET_HOOKS += FLEX_REMOVE_BROKEN_SYMLINK
+# Don't enable programs, they are not needed on the target, and
+# require MMU support.
+# Don't enable the doc, it's not needed on the target and requires
+# special tools (help2man) to build.
+FLEX_CONF_OPTS = --disable-program --disable-doc
+HOST_FLEX_CONF_OPTS = --disable-doc
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.11.0
