From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 17:01:35 +0100
Subject: [Buildroot] [git commit] system: run getty on boot console by
	default
Message-ID: <20150110161019.4D1A6800CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=131300e6f1d0745a1455d246684550e6ecb68549
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We used to specify explicitly serial port with all its settings
for init to instantiate getty.

This limits usecases when the same one rootfs could be used.

For example following cases won't work well with hardcoded
serial console settings:
 * On the same board other serial port is expected to be used
 * The same rootfs is intended to be used on different boards with
   different serial ports (like ttySx vs ttyAMAx or even ttyx)

With this change by default we rely on "console" specified in
kernel's boot command line.

What is important getty will be set on the last console
specified in bootargs.

For example is a kernel comand line:
--->---
bootargs="... console=tty0 console=ttyS3,115200n8..."
--->---

This now will instantiate serial console on ttyS3 but not on tty0.

Tested with both Busybox and SysV init.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index a3b7aff..4d7a4e3 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -263,13 +263,13 @@ if BR2_TARGET_GENERIC_GETTY
 menu "getty options"
 config BR2_TARGET_GENERIC_GETTY_PORT
 	string "TTY port"
-	default "ttyS0"
+	default "console"
 	help
 	  Specify a port to run a getty on.
 
 choice
 	prompt "Baudrate"
-	default BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200
+	default BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP
 	help
 	  Select a baudrate to use.
 
