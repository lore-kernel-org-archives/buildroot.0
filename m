From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 15 May 2016 06:24:00 +0300
Subject: [Buildroot] [PATCH] libinput: fix missing static_assert symbol
Message-ID: <9c014a2f0264db4085efccf537f76e8f1993c27b.1463282640.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

static_assert() in from C++. Don't use it in C code.

Fixes:
http://autobuild.buildroot.net/results/3eb/3eb32c19f90a5fd8d45a0c36676e015e8278a469/
http://autobuild.buildroot.net/results/184/1844890c65615f1676a85c6fac78937249eee9f1/
http://autobuild.buildroot.net/results/3a3/3a3f8c5624e8019a6eababbf6e7440fdd668f85f/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0002-tablet-remove-C-static_assert.patch       | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/libinput/0002-tablet-remove-C-static_assert.patch

diff --git a/package/libinput/0002-tablet-remove-C-static_assert.patch b/package/libinput/0002-tablet-remove-C-static_assert.patch
new file mode 100644
index 000000000000..6998c13437a5
--- /dev/null
+++ b/package/libinput/0002-tablet-remove-C-static_assert.patch
@@ -0,0 +1,39 @@
+From f0a145dea72d1ff2ef6c110c7eaa505bc5ccec02 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sat, 14 May 2016 22:50:38 +0300
+Subject: [PATCH] tablet: remove C++ static_assert
+
+static_assert() is C++ only. Build may fail with:
+
+  CCLD     event-debug
+../src/.libs/libinput.so: undefined reference to `static_assert'
+collect2: error: ld returned 1 exit status
+
+Use just assert() like the rest of the code.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: reported upstream 
+(https://lists.freedesktop.org/archives/wayland-devel/2016-May/028876.html)
+
+ src/evdev-tablet.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/src/evdev-tablet.c b/src/evdev-tablet.c
+index be828d965552..9c81be434d2f 100644
+--- a/src/evdev-tablet.c
++++ b/src/evdev-tablet.c
+@@ -1178,9 +1178,7 @@ static void
+ tablet_mark_all_axes_changed(struct tablet_dispatch *tablet,
+ 			     struct libinput_tablet_tool *tool)
+ {
+-	static_assert(sizeof(tablet->changed_axes) ==
+-			      sizeof(tool->axis_caps),
+-		      "Mismatching array sizes");
++	assert(sizeof(tablet->changed_axes) == sizeof(tool->axis_caps));
+ 
+ 	memcpy(tablet->changed_axes,
+ 	       tool->axis_caps,
+-- 
+2.8.1
+
-- 
2.8.1
