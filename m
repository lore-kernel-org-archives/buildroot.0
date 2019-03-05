From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  5 Mar 2019 17:06:08 +0100
Subject: [Buildroot] [PATCH] package/systemd: use util-linux' agetty,
 drop patch
Message-ID: <20190305160608.4046-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We currently have a patch that replaces the use of (hard-coded) agetty
in systemd, to use just plain getty. That patch dates back to commit
f4a5eed474c (Add the systemd package), when util-linux was not a
dependency, and we relied on busybox to actually provide getty.

But nowadays, util-linux is a mandatory dependency of systemd anyway.
agetty is about 42, while busybox' getty is around 5KiB (give or
take). That's an extra 50KiB, but it has to be balanced against the rest
of the system: systemd only runs on a glibc system, needs dbus and thus
expat, and kmod, that a ~40KiB overhead is barely noticeable (a miminal
systemd setup with nothing enabled, on ARM, is already ~20MiB)

So, drop our agetty-dropping patch, and forcibly enable agetty in
util-linux.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

---
Note: all 6 run-time tests still pass.
---
 package/systemd/0001-fix-getty-unit.patch | 81 -------------------------------
 package/systemd/Config.in                 |  1 +
 2 files changed, 1 insertion(+), 81 deletions(-)
 delete mode 100644 package/systemd/0001-fix-getty-unit.patch

diff --git a/package/systemd/0001-fix-getty-unit.patch b/package/systemd/0001-fix-getty-unit.patch
deleted file mode 100644
index a12569f493..0000000000
--- a/package/systemd/0001-fix-getty-unit.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 69e440f9b7a0e9a43ef582d4bb521722b448a7c2 Mon Sep 17 00:00:00 2001
-From: Maxime Ripard <maxime.ripard@free-electrons.com>
-Date: Mon, 31 Jul 2017 10:08:46 -0400
-Subject: [PATCH] fix-getty-unit
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Prefer getty to agetty in console setup systemd units
-
-Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-[aduskett at gmail.com: Update for systemd v237]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[J?r?my: replace additional usage of agetty by getty.]
-Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
----
- units/console-getty.service.m4    | 2 +-
- units/container-getty at .service.m4 | 2 +-
- units/getty at .service.m4           | 5 +----
- units/serial-getty at .service.m4    | 2 +-
- 4 files changed, 4 insertions(+), 7 deletions(-)
-
-diff --git a/units/console-getty.service.m4 b/units/console-getty.service.m4
-index 3c553240a..fd5ad9456 100644
---- a/units/console-getty.service.m4
-+++ b/units/console-getty.service.m4
-@@ -23,7 +23,7 @@ ConditionPathExists=/dev/console
- # The '-o' option value tells agetty to replace 'login' arguments with an
- # option to preserve environment (-p), followed by '--' for safety, and then
- # the entered username.
--ExecStart=-/sbin/agetty -o '-p -- \\u' --noclear --keep-baud console 115200,38400,9600 $TERM
-+ExecStart=-/sbin/getty -L console 115200 vt100
- Type=idle
- Restart=always
- UtmpIdentifier=cons
-diff --git a/units/container-getty at .service.m4 b/units/container-getty at .service.m4
-index 087ab7f9b..30f7b66fe 100644
---- a/units/container-getty at .service.m4
-+++ b/units/container-getty at .service.m4
-@@ -28,7 +28,7 @@ Before=rescue.service
- # The '-o' option value tells agetty to replace 'login' arguments with an
- # option to preserve environment (-p), followed by '--' for safety, and then
- # the entered username.
--ExecStart=-/sbin/agetty -o '-p -- \\u' --noclear --keep-baud pts/%I 115200,38400,9600 $TERM
-+ExecStart=-/sbin/getty -L %I 115200 vt100
- Type=idle
- Restart=always
- RestartSec=0
-diff --git a/units/getty at .service.m4 b/units/getty at .service.m4
-index 80e793bb7..385758c61 100644
---- a/units/getty at .service.m4
-+++ b/units/getty at .service.m4
-@@ -35,10 +35,7 @@ ConditionPathExists=/dev/tty0
- 
- [Service]
- # the VT is cleared by TTYVTDisallocate
--# The '-o' option value tells agetty to replace 'login' arguments with an
--# option to preserve environment (-p), followed by '--' for safety, and then
--# the entered username.
--ExecStart=-/sbin/agetty -o '-p -- \\u' --noclear %I $TERM
-+ExecStart=-/sbin/getty -L %I 115200 vt100
- Type=idle
- Restart=always
- RestartSec=0
-diff --git a/units/serial-getty at .service.m4 b/units/serial-getty at .service.m4
-index 757b86ab2..3d60efdb6 100644
---- a/units/serial-getty at .service.m4
-+++ b/units/serial-getty at .service.m4
-@@ -33,7 +33,7 @@ Before=rescue.service
- # The '-o' option value tells agetty to replace 'login' arguments with an
- # option to preserve environment (-p), followed by '--' for safety, and then
- # the entered username.
--ExecStart=-/sbin/agetty -o '-p -- \\u' --keep-baud 115200,38400,9600 %I $TERM
-+ExecStart=-/sbin/getty -L %I 115200 vt100
- Type=idle
- Restart=always
- UtmpIdentifier=%I
--- 
-2.14.4
-
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 920b65db44..490222f376 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -20,6 +20,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_UTIL_LINUX_BINARIES
+	select BR2_PACKAGE_UTIL_LINUX_AGETTY
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
 	select BR2_PACKAGE_UTIL_LINUX_NOLOGIN
 	select BR2_PACKAGE_UTIL_LINUX_FSCK
-- 
2.14.1
