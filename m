From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 21:26:06 +0200
Subject: [Buildroot] [git commit] testing/infra/emulator: remove qemu
	warnings about audio
Message-ID: <20170731192205.8DBAF8013B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8ab6b2b54574a5e5d5818ca3e816d2afd159ad0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default audio backend for qemu is configured at compile time. It
generates annoying warning messages to qemu's stderr when running our
tests, like these:
pulseaudio: set_sink_input_volume() failed
pulseaudio: Reason: Invalid argument
pulseaudio: set_sink_input_mute() failed
pulseaudio: Reason: Invalid argument

Explicitly set the audio backend to "none" at runtime to remove those
messages from our logs. There is no command line argument for this, so
use an environment variable when starting qemu.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/infra/emulator.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 9b079cb..588a92f 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -65,7 +65,8 @@ class Emulator(object):
             qemu_cmd += ["-append", " ".join(kernel_cmdline)]
 
         self.logfile.write("> starting qemu with '%s'\n" % " ".join(qemu_cmd))
-        self.qemu = pexpect.spawn(qemu_cmd[0], qemu_cmd[1:], timeout=5)
+        self.qemu = pexpect.spawn(qemu_cmd[0], qemu_cmd[1:], timeout=5,
+                                  env={"QEMU_AUDIO_DRV": "none"})
         # We want only stdout into the log to avoid double echo
         self.qemu.logfile_read = self.logfile
 
