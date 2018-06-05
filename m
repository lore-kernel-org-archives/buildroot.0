From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 05 Jun 2018 21:42:56 +0000
Subject: [Buildroot] [Bug 11066] New: x11r7 X11 S40xorg leads to a black
 screen on QEMU x86 but startx works
Message-ID: <bug-11066-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11066

            Bug ID: 11066
           Summary: x11r7 X11 S40xorg leads to a black screen on QEMU x86
                    but startx works
           Product: buildroot
           Version: 2018.02.1
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

I was on 2017.08 happily doing starx manually, when I rebased to
77c47c3ff8601da2fdc8f82f84be117dd636b02c (post 2018.05) and noticed that X11
was starting automatically due to S40xorg
d83eacaaa8f17b5d573d540ca6338390fcfa0ba1

Unfortunately, the screen is then black.

However, if I manually remove S40xorg and go back to my startx method, it still
works (except the mouse doesn't move, as before, do you have a clue about that
as well?)

My precise setup is:
https://github.com/cirosantilli/buildroot/tree/77c47c3ff8601da2fdc8f82f84be117dd636b02c
which does for build:

#!/usr/bin/env bash
unset LD_LIBRARY_PATH
defconfig="${1:-qemu_x86_64_defconfig}"
outdir="output/${defconfig}"
make O="$outdir" "$defconfig"
printf "
BR2_CCACHE=y
BR2_PACKAGE_HOST_QEMU=y
BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE=n
BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
BR2_PACKAGE_HOST_QEMU_VDE2=y

BR2_PACKAGE_XAPP_TWM=y
BR2_PACKAGE_XAPP_XCALC=y
BR2_PACKAGE_XAPP_XCLOCK=y
BR2_PACKAGE_XAPP_XEYES=y
BR2_PACKAGE_XAPP_XINIT=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_CIRRUS=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBDEV=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_VESA=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XTERM=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
${2:-}
" >> "${outdir}/.config"
make O="$outdir" olddefconfig
time make O="$outdir" BR2_JLEVEL="$(nproc)" HOST_QEMU_OPTS='--enable-sdl
--with-sdlabi=2.0'

run:

#!/usr/bin/env bash
outdir="${1:-output/qemu_x86_64_defconfig}"
"${outdir}/host/usr/bin/qemu-system-x86_64" \
  -M pc \
  -append 'root=/dev/vda console=ttyS0' \
  -drive file="${outdir}/images/rootfs.ext2,if=virtio,format=raw" \
  -enable-kvm \
  -kernel "${outdir}/images/bzImage" \
  -m 512 \
  -net nic,model=virtio \
  -net user,hostfwd=tcp::2222-:22 \
  -serial mon:stdio \
;

-- 
You are receiving this mail because:
You are on the CC list for the bug.
