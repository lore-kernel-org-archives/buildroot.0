From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 30 Jul 2017 01:49:46 -0300
Subject: [Buildroot] [RFC PATCH 4/4] testing/infra/emulator: remove qemu
	warnings about audio
In-Reply-To: <20170730044946.11999-1-ricardo.martincoski@gmail.com>
References: <20170730044946.11999-1-ricardo.martincoski@gmail.com>
Message-ID: <20170730044946.11999-4-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 support/testing/infra/emulator.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 7f02a01553..fe3da869e7 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -70,7 +70,9 @@ class Emulator(object):
 
         self.logfile.write("> starting qemu with '%s'\n" % " ".join(qemu_cmd))
         self.qemu = pexpect.spawn(qemu_cmd[0], qemu_cmd[1:],
-                                  timeout=5 * self.multiplier)
+                                  timeout=5 * self.multiplier,
+                                  env={"QEMU_AUDIO_DRV": "none"})
+
         # We want only stdout into the log to avoid double echo
         self.qemu.logfile_read = self.logfile
 
-- 
2.13.0
