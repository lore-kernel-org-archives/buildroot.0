From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 19 May 2020 08:53:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/vboot-utils: fix -fno-common build
 failure
Message-ID: <20200519065322.16403-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added upstream patch for fixing build failure when using GCC10 as a host
compiler (-fno-common is now default).

Fixes:
http://autobuild.buildroot.net/results/aca662d9fd7052f3b361b731cd266edb3b6c41b0
http://autobuild.buildroot.net/results/6546b284cf306a2fde3c69d67daf9aacffa9e143
http://autobuild.buildroot.net/results/db20bb3c11a1a9558a5d8021015c6915f99097c8

Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 ...-Make-vboot_version-extern-in-header.patch | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/vboot-utils/0007-Make-vboot_version-extern-in-header.patch

diff --git a/package/vboot-utils/0007-Make-vboot_version-extern-in-header.patch b/package/vboot-utils/0007-Make-vboot_version-extern-in-header.patch
new file mode 100644
index 0000000000..6a3929f3c0
--- /dev/null
+++ b/package/vboot-utils/0007-Make-vboot_version-extern-in-header.patch
@@ -0,0 +1,50 @@
+From df4d2000a22db673a788b8e57e8e7c0cc3cee777 Mon Sep 17 00:00:00 2001
+From: Leonard Chan <leonardchan@google.com>
+Date: Thu, 3 Oct 2019 18:53:04 -0700
+Subject: [PATCH] Make vboot_version extern in header
+
+When enabling `-fno-common` in Fuchsia, we get a bunch of linker errors
+when linking futility:
+
+```
+ld.lld: error: duplicate symbol: vboot_version
+>>> defined at futility.h:43 (../../third_party/vboot_reference/futility/futility.h:43)
+>>>            host_x63-asan_no_detect_leaks/obj/third_party/vboot_reference/futility/futility.cmd_bdb.c.o:(vboot_version)
+>>> defined at futility.h:43 (../../third_party/vboot_reference/futility/futility.h:43)
+>>>            host_x64-asan_no_detect_leaks/obj/third_party/vboot_reference/futility/futility.cmd_create.c.o:(.bss.vboot_version+0x0)
+```
+
+and think this is because -fno-common places vboot_version for
+unitialized global variables in the BSS section of each object file.
+Making it extern instead resolves each reference to its definition in
+futility/misc.c.
+
+Change-Id: I591f07abd1f975a8a9d078bb4366e2e0861390b4
+Reviewed-on: https://chromium-review.googlesource.com/c/chromiumos/platform/vboot_reference/+/1839207
+Reviewed-by: Julius Werner <jwerner@chromium.org>
+Reviewed-by: Joel Kitching <kitching@chromium.org>
+Commit-Queue: Julius Werner <jwerner@chromium.org>
+Tested-by: Julius Werner <jwerner@chromium.org>
+
+Patch taken from upstream: https://chromium.googlesource.com/chromiumos/platform/vboot_reference/+/df4d2000a22db673a788b8e57e8e7c0cc3cee777
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ futility/futility.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/futility/futility.h b/futility/futility.h
+index 3bce1106..5dc426dd 100644
+--- a/futility/futility.h
++++ b/futility/futility.h
+@@ -41,7 +41,7 @@ enum vboot_version  {
+ };
+ 
+ /* What's our preferred API & data format? */
+-enum vboot_version vboot_version;
++extern enum vboot_version vboot_version;
+ 
+ /* Here's a structure to define the commands that futility implements. */
+ struct futil_cmd_t {
+-- 
+2.20.1
+
-- 
2.20.1
