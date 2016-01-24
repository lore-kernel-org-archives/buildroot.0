From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 24 Jan 2016 11:19:52 -0200
Subject: [Buildroot] [PATCH v3 1/2] package/libsoil: fix build using old
	versions of patch
In-Reply-To: <1453641593-31129-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1453641593-31129-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <1453641593-31129-2-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Well-formed patch fails to apply
- patch v2.6:
Hunk #1 FAILED at 1.
Hunk #2 FAILED at 23.
- patch v2.6.1:
can't find file to patch at input line 11
Perhaps you used the wrong -p or --strip option?
[snip]
No file to patch.  Skipping patch.
2 out of 2 hunks ignored
Patch failed!  Please fix 0001-fix-makefile.patch!

Old versions of the tool "patch" cannot handle spaces in filenames.
The same does not occur using "patch" v2.7 or any later.

Workaround: when a file with space in the name needs to be patched,
one or two hooks must be used.
A pre-patch or post-extract hook renames the file to replace spaces
with underscores.
The patch file must be generated using diff between two source-trees
that have the file renamed with spaces replaced by underscores.
A post-patch hook could rename the file to its original name if needed.

Fixes:
http://autobuild.buildroot.net/results/8ff/8ff91ab8e52000eb34dd8f662520cf1b31490cf5/
http://autobuild.buildroot.net/results/ea7/ea77d6b23aca0cb1cf527e6c16ddf5eba957a69c/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v2 -> v3:
 - remove quotes (Arnout) (I missed the same suggestion from Thomas P)
 - say "post-extract" instead of "POST_EXTRACT"
 - prefer quotes rather than backslash in the rename hook (Arnout)
 - there is no strong argument to use post-extract instead of pre-patch
   (Arnout)
 - fix minor spelling mistakes

Changes v1 -> v2:
 - use 1 or 2 hooks to rename the file that contains spaces
   (based on the suggestion to use a symlink from Thomas DS)
 - change the patch file to be applied on the renamed file
 - do not use the 2nd rename hook for libsoil (Thomas P)

Symlink and hard link cannot be used because patch unlinks them.
So I renamed the file before patching it.

I hand-edited the patch, but it could also be generated following
the procedure added to the manual by [PATCH v3 2/2]

I tested by inspection of the logs produced by:
for V in 2.5 2.5.4 2.5.9 2.6 2.6.1 2.7 2.7.1 2.7.2 2.7.3 2.7.4 2.7.5 ; do \
 rm -rf build/libsoil-20080707/ ; \
 PATH=/home/ricardo/src/patch-$V:/home/ricardo/src/patch-$V/src:$PATH patch -v | tee loghook-$V ; \
 PATH=/home/ricardo/src/patch-$V:/home/ricardo/src/patch-$V/src:$PATH make libsoil-patch 2>&1 | tee -a loghook-$V ; \
 grep -H fPIC build/libsoil-20080707/projects/makefile/alternate* | tee -a loghook-$V ; \
 echo '----------' ; \
done
---
 package/libsoil/0001-fix-makefile.patch | 6 +++---
 package/libsoil/libsoil.mk              | 8 +++++++-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/libsoil/0001-fix-makefile.patch b/package/libsoil/0001-fix-makefile.patch
index 3b80048..310d264 100644
--- a/package/libsoil/0001-fix-makefile.patch
+++ b/package/libsoil/0001-fix-makefile.patch
@@ -5,9 +5,9 @@ http://anonscm.debian.org/cgit/pkg-games/libsoil.git/tree/debian/patches/linking
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 
-diff -uNr "soil.org/projects/makefile/alternate Makefile.txt" "soil/projects/makefile/alternate Makefile.txt"
---- "soil.org/projects/makefile/alternate Makefile.txt"	2008-07-07 18:13:28.000000000 +0200
-+++ "soil/projects/makefile/alternate Makefile.txt"	2015-11-07 11:15:04.140106336 +0100
+diff -uNr soil.org/projects/makefile/alternate_Makefile.txt soil/projects/makefile/alternate_Makefile.txt
+--- soil.org/projects/makefile/alternate_Makefile.txt	2008-07-07 18:13:28.000000000 +0200
++++ soil/projects/makefile/alternate_Makefile.txt	2015-11-07 11:15:04.140106336 +0100
 @@ -1,8 +1,8 @@
  MAKE = make
 -CC = gcc
diff --git a/package/libsoil/libsoil.mk b/package/libsoil/libsoil.mk
index eb8c2ce..99a47f6 100644
--- a/package/libsoil/libsoil.mk
+++ b/package/libsoil/libsoil.mk
@@ -11,13 +11,19 @@ LIBSOIL_INSTALL_STAGING = YES
 LIBSOIL_DEPENDENCIES = libgl
 LIBSOIL_LICENSE = Public Domain, MIT
 LIBSOIL_LICENSE_FILES = src/stb_image_aug.c src/image_helper.c
-LIBSOIL_MAKEFILE = "../projects/makefile/alternate Makefile.txt"
+LIBSOIL_MAKEFILE = ../projects/makefile/alternate_Makefile.txt
 
 define LIBSOIL_EXTRACT_CMDS
 	$(UNZIP) -d $(@D) $(DL_DIR)/$(LIBSOIL_SOURCE)
 	mv $(@D)/Simple\ OpenGL\ Image\ Library/* $(@D)
 endef
 
+define REMOVE_SPACE_FROM_FILENAME
+	cd $(@D)/projects/makefile/ && \
+		mv "alternate Makefile.txt" alternate_Makefile.txt
+endef
+LIBSOIL_POST_EXTRACT_HOOKS += REMOVE_SPACE_FROM_FILENAME
+
 define LIBSOIL_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -f $(LIBSOIL_MAKEFILE) \
 		-C $(@D)/src
-- 
1.9.1
