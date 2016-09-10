From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 10 Sep 2016 13:19:25 +0000
Subject: [Buildroot] [Bug 7892] systemd-journald is broken
In-Reply-To: <bug-7892-163@https.bugs.busybox.net/>
References: <bug-7892-163@https.bugs.busybox.net/>
Message-ID: <bug-7892-163-y22A0VWiXN@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7892

--- Comment #18 from Floris Bos <bos@je-eigen-domein.nl> ---
(In reply to Maxime Hadjinlian from comment #15)
>maybe I need to find some SAMA5 board somewhere, 
>maybe theres' something special about this board, but as is, I really can't reproduce


Minimal steps to reproduce if you do have a Pi 3 laying around:

make raspberrypi3_defconfig
make menuconfig
"toolchain" -> "c library" -> "glibc"
"system configuration" -> "init system" -> "systemd"
"system configuration" -> "getty" -> "TTY port" -> tty1 (the default value
"console" is currently broken with systemd)
"filesystem images" -> enable "initial RAM file system linked into linux
kernel"
make

Copy output/images/zImage output/images/*.dtb output/images/rpi-firmware/* to a
FAT formatted SD card, stick it in the Pi, and boot it
Type "journalctl" and notice that it claims that "No journal files were found."

I would argue that a configuration as simple as this should just work
out-of-the-box, without post-build anything.


In this example config buildroot produces the initramfs. But it also happens if
you have a normal file system, but there is another initramfs that mounts the
root filesystem rw, and passes control over to you with switch_root.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
