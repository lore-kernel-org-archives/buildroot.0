From: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Date: Mon, 25 Jun 2018 16:44:07 -0500
Subject: [Buildroot] [PATCH 1/1] patchelf: Add patch to fix relative rpath
 issue on PPC
Message-ID: <20180625214407.12687-1-bryce.ferguson@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a patch to the host package patchelf to fix an
issue with endianness when the --make-rpath-relative option is
specified. Currently, patchelf does not take into account the
architecture of the target ELF when it performs the fixup on the
RPATH. Thus, if it differs from the host in endianness, the RUNPATH
field will be invalid. The patch fixes the bug reported here:

https://bugs.busybox.net/show_bug.cgi?id=11101

Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
---
 ...LF-endianness-before-writing-new-run.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/patchelf/0004-patchelf-Check-ELF-endianness-before-writing-new-run.patch

diff --git a/package/patchelf/0004-patchelf-Check-ELF-endianness-before-writing-new-run.patch b/package/patchelf/0004-patchelf-Check-ELF-endianness-before-writing-new-run.patch
new file mode 100644
index 0000000000..4c528a5908
--- /dev/null
+++ b/package/patchelf/0004-patchelf-Check-ELF-endianness-before-writing-new-run.patch
@@ -0,0 +1,40 @@
+From 8c75599b674c73fbfe9c15afeccad54ae88243f5 Mon Sep 17 00:00:00 2001
+From: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
+Date: Mon, 25 Jun 2018 13:05:07 -0500
+Subject: [PATCH 1/1] patchelf: Check ELF endianness before writing new runpath
+
+This commit modifies the way fields are written in the dynamic
+section in order to account the architecture of the target ELF
+file. Instead of copying the raw data, use the helper functions
+to convert endianness.
+
+Link to upstream PR: https://github.com/NixOS/patchelf/pull/151
+
+Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
+---
+ src/patchelf.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/patchelf.cc b/src/patchelf.cc
+index 35b4a33..a33f644 100644
+--- a/src/patchelf.cc
++++ b/src/patchelf.cc
+@@ -1315,13 +1315,13 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string rootDir, string
+     debug("new rpath is `%s'\n", newRPath.c_str());
+ 
+     if (!forceRPath && dynRPath && !dynRunPath) { /* convert DT_RPATH to DT_RUNPATH */
+-        dynRPath->d_tag = DT_RUNPATH;
++        wri(dynRPath->d_tag, DT_RUNPATH);
+         dynRunPath = dynRPath;
+         dynRPath = 0;
+     }
+ 
+     if (forceRPath && dynRPath && dynRunPath) { /* convert DT_RUNPATH to DT_RPATH */
+-        dynRunPath->d_tag = DT_IGNORE;
++        wri(dynRunPath->d_tag, DT_IGNORE);
+     }
+ 
+     if (newRPath.size() <= rpathSize) {
+-- 
+2.17.0
+
-- 
2.17.0
