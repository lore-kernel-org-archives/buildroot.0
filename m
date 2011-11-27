From: Sven Neumann <s.neumann@raumfeld.com>
Date: Sun, 27 Nov 2011 20:14:45 +0100
Subject: [Buildroot] =?utf-8?q?=5BPATCH_1/2=5D_kernel-headers=3A_update_to?=
	=?utf-8?b?IDMuMS4zIGFuZCAzLjAuMTE=?=
Message-ID: <1322421286-25746-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 toolchain/kernel-headers/Config.in                 |    4 +-
 ...tall-fix-__packed-in-exported-kernel-head.patch |   46 --------------------
 ...tall-fix-__packed-in-exported-kernel-head.patch |   46 ++++++++++++++++++++
 3 files changed, 48 insertions(+), 48 deletions(-)
 delete mode 100644 toolchain/kernel-headers/linux-3.0.10-headers_install-fix-__packed-in-exported-kernel-head.patch
 create mode 100644 toolchain/kernel-headers/linux-3.0.11-headers_install-fix-__packed-in-exported-kernel-head.patch

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index b94d4c0..497a058 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -57,7 +57,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.10"	if BR2_KERNEL_HEADERS_3_0
-	default "3.1.2"		if BR2_KERNEL_HEADERS_3_1
+	default "3.0.11"	if BR2_KERNEL_HEADERS_3_0
+	default "3.1.3"		if BR2_KERNEL_HEADERS_3_1
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.10-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.10-headers_install-fix-__packed-in-exported-kernel-head.patch
deleted file mode 100644
index 8777b71..0000000
--- a/toolchain/kernel-headers/linux-3.0.10-headers_install-fix-__packed-in-exported-kernel-head.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From f210735fe2f17a6225432ee3d1239bcf23a8659c Mon Sep 17 00:00:00 2001
-From: Markus Trippelsdorf <markus@trippelsdorf.de>
-Date: Fri, 24 Jun 2011 15:51:00 +0200
-Subject: [PATCH] headers_install: fix __packed in exported kernel headers
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-checkpatch.pl warns about using __attribute__((packed)) in kernel
-headers: "__packed is preferred over __attribute__((packed))". If one
-follows that advice it could cause problems in the exported header
-files, because the outside world doesn't know about this shortcut.
-
-For example busybox will fail to compile:
- CC      miscutils/ubi_attach_detach.o
- In file included from miscutils/ubi_attach_detach.c:27:0:
- /usr/include/mtd/ubi-user.h:330:3: error: conflicting types for ?__packed?
- /usr/include/mtd/ubi-user.h:314:3: note: previous declaration of ?__packed? was here
-...
-
-Fix the problem by substituting __packed with __attribute__((packed)) in
-the header_install.pl script.
-
-Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
-CC: Joe Perches <joe@perches.com>
-Signed-off-by: Markus Trippelsdorf <markus@trippelsdorf.de>
-Signed-off-by: Michal Marek <mmarek@suse.cz>
----
- scripts/headers_install.pl |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/scripts/headers_install.pl b/scripts/headers_install.pl
-index efb3be1..48462be 100644
---- a/scripts/headers_install.pl
-+++ b/scripts/headers_install.pl
-@@ -35,6 +35,7 @@ foreach my $file (@files) {
- 		$line =~ s/([\s(])__iomem\s/$1/g;
- 		$line =~ s/\s__attribute_const__\s/ /g;
- 		$line =~ s/\s__attribute_const__$//g;
-+		$line =~ s/\b__packed\b/__attribute__((packed))/g;
- 		$line =~ s/^#include <linux\/compiler.h>//;
- 		$line =~ s/(^|\s)(inline)\b/$1__$2__/g;
- 		$line =~ s/(^|\s)(asm)\b(\s|[(]|$)/$1__$2__$3/g;
--- 
-1.7.5.4
-
diff --git a/toolchain/kernel-headers/linux-3.0.11-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.11-headers_install-fix-__packed-in-exported-kernel-head.patch
new file mode 100644
index 0000000..8777b71
--- /dev/null
+++ b/toolchain/kernel-headers/linux-3.0.11-headers_install-fix-__packed-in-exported-kernel-head.patch
@@ -0,0 +1,46 @@
+From f210735fe2f17a6225432ee3d1239bcf23a8659c Mon Sep 17 00:00:00 2001
+From: Markus Trippelsdorf <markus@trippelsdorf.de>
+Date: Fri, 24 Jun 2011 15:51:00 +0200
+Subject: [PATCH] headers_install: fix __packed in exported kernel headers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+checkpatch.pl warns about using __attribute__((packed)) in kernel
+headers: "__packed is preferred over __attribute__((packed))". If one
+follows that advice it could cause problems in the exported header
+files, because the outside world doesn't know about this shortcut.
+
+For example busybox will fail to compile:
+ CC      miscutils/ubi_attach_detach.o
+ In file included from miscutils/ubi_attach_detach.c:27:0:
+ /usr/include/mtd/ubi-user.h:330:3: error: conflicting types for ?__packed?
+ /usr/include/mtd/ubi-user.h:314:3: note: previous declaration of ?__packed? was here
+...
+
+Fix the problem by substituting __packed with __attribute__((packed)) in
+the header_install.pl script.
+
+Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
+CC: Joe Perches <joe@perches.com>
+Signed-off-by: Markus Trippelsdorf <markus@trippelsdorf.de>
+Signed-off-by: Michal Marek <mmarek@suse.cz>
+---
+ scripts/headers_install.pl |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/scripts/headers_install.pl b/scripts/headers_install.pl
+index efb3be1..48462be 100644
+--- a/scripts/headers_install.pl
++++ b/scripts/headers_install.pl
+@@ -35,6 +35,7 @@ foreach my $file (@files) {
+ 		$line =~ s/([\s(])__iomem\s/$1/g;
+ 		$line =~ s/\s__attribute_const__\s/ /g;
+ 		$line =~ s/\s__attribute_const__$//g;
++		$line =~ s/\b__packed\b/__attribute__((packed))/g;
+ 		$line =~ s/^#include <linux\/compiler.h>//;
+ 		$line =~ s/(^|\s)(inline)\b/$1__$2__/g;
+ 		$line =~ s/(^|\s)(asm)\b(\s|[(]|$)/$1__$2__$3/g;
+-- 
+1.7.5.4
+
-- 
1.7.5.4
