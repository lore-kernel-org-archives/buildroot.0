From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 03 Jun 2017 02:59:01 +0000
Subject: [Buildroot] [Bug 9936] New: Host QEMU does not build with SDL
 support because of pkg-config
Message-ID: <bug-9936-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9936

            Bug ID: 9936
           Summary: Host QEMU does not build with SDL support because of
                    pkg-config
           Product: buildroot
           Version: 2017.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ciro.santilli at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I enable:

BR2_PACKAGE_HOST_QEMU=y
BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE=y
BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
BR2_PACKAGE_HOST_QEMU_VDE2=y

on the config.

Host QEMU builds and works with VNC, but "-display sdl" is not available.

The configuration logs say:

SDL support       no

However, if I do ./configure directly from host on the QEMU tree, SDL support
is available, and builds with it, since I do have the libsdl2-dev package
installed in Ubuntu 17.04.

I think the problem is the:

PKG_CONFIG="/home/ciro/bak/git/linux-kernel-module-cheat/buildroot/output/host/usr/bin/pkg-config"

and:

/home/ciro/bak/git/linux-kernel-module-cheat/buildroot/output/host/usr/bin/pkg-config
sdl2

is wrongly false, while on host:

pkg-config sdl2

is true.

A dirty workaround is:

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 66efcba..1e09ea4 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -74,6 +74,7 @@ HOST_QEMU_SYS_ARCH ?= $(HOST_QEMU_ARCH)

 ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)
 HOST_QEMU_TARGETS += $(HOST_QEMU_SYS_ARCH)-softmmu
+HOST_QEMU_OPTS += --enable-sdl --with-sdlabi=2.0
 HOST_QEMU_OPTS += --enable-system --enable-fdt
 HOST_QEMU_DEPENDENCIES += host-dtc
 else

-- 
You are receiving this mail because:
You are on the CC list for the bug.
