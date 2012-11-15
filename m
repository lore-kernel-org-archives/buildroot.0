From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 23:58:48 +0100
Subject: [Buildroot] [git commit] manual: update rebuilding-packages.txt
Message-ID: <20121115230538.639CF99E3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df469937a5878fb26de1616c4de7100a4ef3f58a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- update "Understanding how to rebuild packages" section
- add "Understanding when a full rebuild is necessary" section

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/rebuilding-packages.txt |   65 ++++++++++++++++++++++-------------
 1 files changed, 41 insertions(+), 24 deletions(-)

diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
index 824b35c..2225200 100644
--- a/docs/manual/rebuilding-packages.txt
+++ b/docs/manual/rebuilding-packages.txt
@@ -1,5 +1,39 @@
 // -*- mode:doc -*- ;
 
+[[full-rebuild]]
+Understanding when a full rebuild is necessary
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+A full rebuild is achieved by running:
+
+---------------
+$ make clean all
+---------------
+
+In what cases, a full rebuild is mandatory:
+
+* each time the toolchain properties are changed, this includes:
+
+** after changing some toolchain option under the _Toolchain_ menu (if
+   the internal Buildroot backend is used);
+** after running +make ctng-menuconfig+ (if the crosstool-NG backend
+   is used);
+** after running +make uclibc-menuconfig+.
+
+* after removing some libraries from the package selection.
+
+In what cases, a full rebuild is recommended:
+
+* after adding some libraries to the package selection (otherwise,
+  some packages that can be optionally linked against those libraries
+  won't be rebuilt, so they won't support those new available
+  features).
+
+In other cases, it is up to you to decide if you should or not run a
+full rebuild, but you should know what is impacted and understand what
+you are doing anyway.
+
+[[rebuild-pkg]]
 Understanding how to rebuild packages
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -42,27 +76,10 @@ files are relevant:
   Buildroot will trigger the recompilation of the package from the
   compilation step (execution of +make+).
 
-For other packages, an analysis of the specific 'package.mk' file is
-needed. For example, the zlib Makefile used to look like this (before
-it was converted to the generic package infrastructure):
-
------------------
-$(ZLIB_DIR)/.configured: $(ZLIB_DIR)/.patched
-	(cd $(ZLIB_DIR); rm -rf config.cache; \
-		[...]
-	)
-	touch $@
-
-$(ZLIB_DIR)/libz.a: $(ZLIB_DIR)/.configured
-	$(MAKE) -C $(ZLIB_DIR) all libz.a
-	touch -c $@
------------------
-
-If you want to trigger the reconfiguration, you need to remove
-+output/build/zlib-version/.configured+. If you want to trigger only
-the recompilation, you need to remove
-+output/build/zlib-version/libz.a+.
-
-Note that most packages, if not all, will progressively be ported over
-to the generic or autotools infrastructure, making it much easier to
-rebuild individual packages.
+.Notes
+- Since the _Buildroot-2012.11_ release, all packages rely on the
+Buildroot infrastructures.
+- Only toolchain packages remain using custom makefiles (i.e. do not
+use any Buildroot infrastructure).
+- Most packages and toolchain packages, if not all, will progressively
+be ported over to the generic, autotools or CMake infrastructure,
