From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 05 May 2021 19:42:02 +0000
Subject: [Buildroot] [Bug 13791] New: The QEMU compiled by Buildroot does
 not support alsa or pulseaudio drivers for soundcard forwarding
Message-ID: <bug-13791-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13791

            Bug ID: 13791
           Summary: The QEMU compiled by Buildroot does not support alsa
                    or pulseaudio drivers for soundcard forwarding
           Product: buildroot
           Version: 2021.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: wzab01 at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8921
  --> https://bugs.busybox.net/attachment.cgi?id=8921&action=edit
The minimalistic Buildroot config that shows the reported problem

I need to emulate the machine (ARM virt 64-bit) which uses the host (Linux
running Debian/testing of Ubuntu 2020.04) soundcard.
Unfortunately, when I try to run the QEMU compiled by the Buildroot, I get:

./qemu-system-aarch64 --audio-help
Environment variable based configuration deprecated.
Please use the new -audiodev option.

Equivalent -audiodev to your current environment variables:
(Since you didn't specify QEMU_AUDIO_DRV, I'll list all possibilities)
-audiodev id=oss,driver=oss
-audiodev id=none,driver=none

When I have modified the audio-drv-list in package/qemu/qemu.mk as below:

define HOST_QEMU_CONFIGURE_CMDS
        unset TARGET_DIR; \
        cd $(@D); $(HOST_CONFIGURE_OPTS) CPP="$(HOSTCC) -E" \
                ./configure \
                --target-list="$(HOST_QEMU_TARGETS)" \
                --prefix="$(HOST_DIR)" \
                --interp-prefix=$(STAGING_DIR) \
                --cc="$(HOSTCC)" \
                --host-cc="$(HOSTCC)" \
                --audio-drv-list="alsa,pa,oss" \
                --extra-cflags="$(HOST_QEMU_CFLAGS)" \
                --extra-ldflags="$(HOST_LDFLAGS) -lrt -lm" \
                --meson=$(HOST_DIR)/bin/meson \
                --ninja=$(HOST_DIR)/bin/ninja \
                --disable-bzip2 \
                --disable-containers \
                --disable-curl \
                --disable-libssh \
                --disable-linux-io-uring \
                --disable-sdl \
                --disable-vhost-user-blk-server \
                --disable-virtiofsd \
                --disable-vnc-jpeg \
                --disable-vnc-png \
                --disable-vnc-sasl \
                --disable-tests \
                $(HOST_QEMU_OPTS)

I get the following error:
Using './build' as the directory for build output

ERROR: alsa check failed
       Make sure to have the alsa libs and headers installed.

I have forced the configure script to print the "pkg_config_exe" variable,
and it appears that it uses the compiled 
buildroot-2021.02.01/output/host/bin/pkg-config

Running it by hand, I have stated that it is not aware of the packages
"libasound2-dev" and "libpulse-dev" that I have installed in my system.

Running it with "--help" option I've got:
[...]
  --keep-system-cflags              keep
-I/tmp/BR/buildroot-2021.02.1/output/host/include entries in cflags output
  --keep-system-libs                keep
-L/tmp/BR/buildroot-2021.02.1/output/host/lib entries in libs output
[...]
So it ignores my system libraries and header files!

What can I do to build the QEMU with 

PS. For Buildroot 2020.02 I managed to create a patch that enforces compilation
of the alsa and pa drivers:
https://github.com/wzab/BR_Internet_Radio/blob/gpio_simple/QemuVirt64/patches/0002-WZab-host-qemu-patched-for-forced-compilation-of-alsa-and-pa-audio.patch
Unfortunately, it doesn't work with the new, meson-based build flow.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
