From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 10 Jun 2019 14:06:56 +0200
Subject: [Buildroot] [PATCH v3,
 1/1] package/weston: fix build with headers < 4.4
Message-ID: <20190610120656.4958-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

weston includes input-event-codes.h since version 5.0.91 and
https://github.com/wayland-project/weston/commit/6e229ca26381bc8191fd9af1e439c311da709aff

input-event-codes.h is available only since kernel 4.4 and
https://github.com/torvalds/linux/commit/f902dd893427eade90f7eaf858e5ff8b150a5a12

To fix this build failure, check for the availability of this header
before including it and fallback to linux/input.h (for EV_KEY) if needed

It should be noted that we could just drop linux/input.h as it is
already pulled in from libevdev/libevdev.h

Fixes:
 - http://autobuild.buildroot.org/results/210c2759900f15ea0030d088f6f45cd8bb199b29

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after upstream review):
 - Always include linux/input.h

Changes v1 -> v2 (after review of Yann E. Morin):
 - Add a patch to drop include on input-event-codes.h instead of
   requiring headers >= 4.4 

 .../0002-Fix-build-with-kernel-4.4.patch      | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/weston/0002-Fix-build-with-kernel-4.4.patch

diff --git a/package/weston/0002-Fix-build-with-kernel-4.4.patch b/package/weston/0002-Fix-build-with-kernel-4.4.patch
new file mode 100644
index 0000000000..89390e0e28
--- /dev/null
+++ b/package/weston/0002-Fix-build-with-kernel-4.4.patch
@@ -0,0 +1,40 @@
+From 137b811ecd566086f7eb42c1e49e7c0cf27fb85e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 10 Jun 2019 12:02:03 +0200
+Subject: [PATCH] Fix build with kernel < 4.4
+
+weston includes input-event-codes.h since version 5.0.91 and
+https://github.com/wayland-project/weston/commit/6e229ca26381bc8191fd9af1e439c311da709aff
+
+input-event-codes.h is available only since kernel 4.4 and
+https://github.com/torvalds/linux/commit/f902dd893427eade90f7eaf858e5ff8b150a5a12
+
+To fix this build failure, replace include on linux/input-event-codes.h
+by linux/input.h
+
+Fixes:
+ - http://autobuild.buildroot.org/results/210c2759900f15ea0030d088f6f45cd8bb199b29
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/wayland/weston/merge_requests/184]
+---
+ compositor/main.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/compositor/main.c b/compositor/main.c
+index 945f99ae..bf4062af 100644
+--- a/compositor/main.c
++++ b/compositor/main.c
+@@ -42,7 +42,7 @@
+ #include <sys/socket.h>
+ #include <libinput.h>
+ #include <libevdev/libevdev.h>
+-#include <linux/input-event-codes.h>
++#include <linux/input.h>
+ #include <sys/time.h>
+ #include <linux/limits.h>
+ 
+-- 
+2.20.1
+
-- 
2.20.1
