From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Sep 2011 21:38:53 +0200
Subject: [Buildroot] [git commit] kernel-headers: fix 3.0 header exports for
	headers with __packed
Message-ID: <20110920194159.CA38B8D739@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ca82530b837542a56a4aa728331d97639f6e533
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes E.G. mtd/ubi-user.h, which otherwise breaks busybox 1.9 builds
with ubi applets.

Upstream post 3.0 and discussed here: https://lkml.org/lkml/2011/6/22/25

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...tall-fix-__packed-in-exported-kernel-head.patch |   46 ++++++++++++++++++++
 1 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/toolchain/kernel-headers/linux-3.0.4-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.4-headers_install-fix-__packed-in-exported-kernel-head.patch
new file mode 100644
index 0000000..8777b71
--- /dev/null
+++ b/toolchain/kernel-headers/linux-3.0.4-headers_install-fix-__packed-in-exported-kernel-head.patch
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
+ /usr/include/mtd/ubi-user.h:330:3: error: conflicting types for ???__packed???
+ /usr/include/mtd/ubi-user.h:314:3: note: previous declaration of ???__packed??? was here
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
