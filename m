From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 10 Jul 2014 20:25:13 +0400
Subject: [Buildroot] [PATCH] binutils: fix xtensa ld segfault on linking
	linux modules
Message-ID: <1405009513-23772-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes the following build error reproducible with any linux kernel
module built with a recent buildroot toolchain:

  LD [M]  fs/jbd2/jbd2.ko
  /bin/sh: line 1: 12069 Segmentation fault
  buildroot/host/usr/bin/xtensa-buildroot-linux-uclibc-ld -r --no-relax
  -T linux/scripts/module-common.lds --build-id
  -o fs/jbd2/jbd2.ko fs/jbd2/jbd2.o fs/jbd2/jbd2.mod.o

Backported from: e7d17e71cdc10a2e81e454ce3b9637f1b2a587f2
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 ...ix-ld-segfault-when-linking-linux-modules.patch | 47 ++++++++++++++++++++++
 ...ix-ld-segfault-when-linking-linux-modules.patch | 47 ++++++++++++++++++++++
 ...ix-ld-segfault-when-linking-linux-modules.patch | 47 ++++++++++++++++++++++
 3 files changed, 141 insertions(+)
 create mode 100644 package/binutils/2.22/903-xtensa-fix-ld-segfault-when-linking-linux-modules.patch
 create mode 100644 package/binutils/2.23.2/903-xtensa-fix-ld-segfault-when-linking-linux-modules.patch
 create mode 100644 package/binutils/2.24/903-xtensa-fix-ld-segfault-when-linking-linux-modules.patch

diff --git a/package/binutils/2.22/903-xtensa-fix-ld-segfault-when-linking-linux-modules.patch b/package/binutils/2.22/903-xtensa-fix-ld-segfault-when-linking-linux-modules.patch
new file mode 100644
index 0000000..6a0846e
--- /dev/null
+++ b/package/binutils/2.22/903-xtensa-fix-ld-segfault-when-linking-linux-modules.patch
@@ -0,0 +1,47 @@
+From e7d17e71cdc10a2e81e454ce3b9637f1b2a587f2 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Thu, 10 Jul 2014 01:47:33 +0400
+Subject: [PATCH] Fix xtensa ld segfault when linking linux modules
+
+is_inconsistent_linkonce_section makes an assumption that section name
+that starts with ".gnu.linkonce.prop." has one more dot in its suffix.
+However gas generates such section name by insertion of "prop." right
+after ".gnu.linkonce." part of the name of the original section. So, for
+section named ".gnu.linkonce.this_module" corresponding property section
+name does not satisfy the assumption. Such section names are common in
+linux modules. This bug was exposed by the patch "a35d5e8 Fix alignment
+for the first section frag on xtensa", that makes gas produce property
+section for each section that has ".align" directive in it.
+
+Use suffix that immediately follows ".gnu.linkonce.prop." when there are
+no more dots following it.
+
+2014-07-10  Max Filippov  <jcmvbkbc@gmail.com>
+
+ld/
+    * emultempl/xtensaelf.em (is_inconsistent_linkonce_section):
+    correctly handle missing dot in section name after
+    ".gnu.linkonce.prop.".
+---
+Backported from: e7d17e71cdc10a2e81e454ce3b9637f1b2a587f2
+Changes to ld/ChangeLog file are dropped.
+
+ ld/emultempl/xtensaelf.em | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ld/emultempl/xtensaelf.em b/ld/emultempl/xtensaelf.em
+index 151eea4..948d18d 100644
+--- a/ld/emultempl/xtensaelf.em
++++ b/ld/emultempl/xtensaelf.em
+@@ -1310,7 +1310,7 @@ is_inconsistent_linkonce_section (asection *sec)
+      for Tensilica's XCC compiler.  */
+   name = sec_name + linkonce_len;
+   if (CONST_STRNEQ (name, "prop."))
+-    name = strchr (name + 5, '.') + 1;
++    name = strchr (name + 5, '.') ? strchr (name + 5, '.') + 1 : name + 5;
+   else if (name[1] == '.'
+ 	   && (name[0] == 'p' || name[0] == 'e' || name[0] == 'h'))
+     name += 2;
+-- 
+1.8.1.4
+
diff --git a/package/binutils/2.23.2/903-xtensa-fix-ld-segfault-when-linking-linux-modules.patch b/package/binutils/2.23.2/903-xtensa-fix-ld-segfault-when-linking-linux-modules.patch
new file mode 100644
index 0000000..6a0846e
--- /dev/null
+++ b/package/binutils/2.23.2/903-xtensa-fix-ld-segfault-when-linking-linux-modules.patch
@@ -0,0 +1,47 @@
+From e7d17e71cdc10a2e81e454ce3b9637f1b2a587f2 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Thu, 10 Jul 2014 01:47:33 +0400
+Subject: [PATCH] Fix xtensa ld segfault when linking linux modules
+
+is_inconsistent_linkonce_section makes an assumption that section name
+that starts with ".gnu.linkonce.prop." has one more dot in its suffix.
+However gas generates such section name by insertion of "prop." right
+after ".gnu.linkonce." part of the name of the original section. So, for
+section named ".gnu.linkonce.this_module" corresponding property section
+name does not satisfy the assumption. Such section names are common in
+linux modules. This bug was exposed by the patch "a35d5e8 Fix alignment
+for the first section frag on xtensa", that makes gas produce property
+section for each section that has ".align" directive in it.
+
+Use suffix that immediately follows ".gnu.linkonce.prop." when there are
+no more dots following it.
+
+2014-07-10  Max Filippov  <jcmvbkbc@gmail.com>
+
+ld/
+    * emultempl/xtensaelf.em (is_inconsistent_linkonce_section):
+    correctly handle missing dot in section name after
+    ".gnu.linkonce.prop.".
+---
+Backported from: e7d17e71cdc10a2e81e454ce3b9637f1b2a587f2
+Changes to ld/ChangeLog file are dropped.
+
+ ld/emultempl/xtensaelf.em | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ld/emultempl/xtensaelf.em b/ld/emultempl/xtensaelf.em
+index 151eea4..948d18d 100644
+--- a/ld/emultempl/xtensaelf.em
++++ b/ld/emultempl/xtensaelf.em
+@@ -1310,7 +1310,7 @@ is_inconsistent_linkonce_section (asection *sec)
+      for Tensilica's XCC compiler.  */
+   name = sec_name + linkonce_len;
+   if (CONST_STRNEQ (name, "prop."))
+-    name = strchr (name + 5, '.') + 1;
++    name = strchr (name + 5, '.') ? strchr (name + 5, '.') + 1 : name + 5;
+   else if (name[1] == '.'
+ 	   && (name[0] == 'p' || name[0] == 'e' || name[0] == 'h'))
+     name += 2;
+-- 
+1.8.1.4
+
diff --git a/package/binutils/2.24/903-xtensa-fix-ld-segfault-when-linking-linux-modules.patch b/package/binutils/2.24/903-xtensa-fix-ld-segfault-when-linking-linux-modules.patch
new file mode 100644
index 0000000..6a0846e
--- /dev/null
+++ b/package/binutils/2.24/903-xtensa-fix-ld-segfault-when-linking-linux-modules.patch
@@ -0,0 +1,47 @@
+From e7d17e71cdc10a2e81e454ce3b9637f1b2a587f2 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Thu, 10 Jul 2014 01:47:33 +0400
+Subject: [PATCH] Fix xtensa ld segfault when linking linux modules
+
+is_inconsistent_linkonce_section makes an assumption that section name
+that starts with ".gnu.linkonce.prop." has one more dot in its suffix.
+However gas generates such section name by insertion of "prop." right
+after ".gnu.linkonce." part of the name of the original section. So, for
+section named ".gnu.linkonce.this_module" corresponding property section
+name does not satisfy the assumption. Such section names are common in
+linux modules. This bug was exposed by the patch "a35d5e8 Fix alignment
+for the first section frag on xtensa", that makes gas produce property
+section for each section that has ".align" directive in it.
+
+Use suffix that immediately follows ".gnu.linkonce.prop." when there are
+no more dots following it.
+
+2014-07-10  Max Filippov  <jcmvbkbc@gmail.com>
+
+ld/
+    * emultempl/xtensaelf.em (is_inconsistent_linkonce_section):
+    correctly handle missing dot in section name after
+    ".gnu.linkonce.prop.".
+---
+Backported from: e7d17e71cdc10a2e81e454ce3b9637f1b2a587f2
+Changes to ld/ChangeLog file are dropped.
+
+ ld/emultempl/xtensaelf.em | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ld/emultempl/xtensaelf.em b/ld/emultempl/xtensaelf.em
+index 151eea4..948d18d 100644
+--- a/ld/emultempl/xtensaelf.em
++++ b/ld/emultempl/xtensaelf.em
+@@ -1310,7 +1310,7 @@ is_inconsistent_linkonce_section (asection *sec)
+      for Tensilica's XCC compiler.  */
+   name = sec_name + linkonce_len;
+   if (CONST_STRNEQ (name, "prop."))
+-    name = strchr (name + 5, '.') + 1;
++    name = strchr (name + 5, '.') ? strchr (name + 5, '.') + 1 : name + 5;
+   else if (name[1] == '.'
+ 	   && (name[0] == 'p' || name[0] == 'e' || name[0] == 'h'))
+     name += 2;
+-- 
+1.8.1.4
+
-- 
1.8.1.4
