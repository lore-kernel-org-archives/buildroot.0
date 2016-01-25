From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:34:30 +0100
Subject: [Buildroot] [git commit] package/libsoil: fix build using old
	versions of patch
Message-ID: <20160201224702.B8B2E7F90D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8461906db4e5c1af84bf99458e9905a6d4d58c3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
