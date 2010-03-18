From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 18 Mar 2010 23:09:05 +0100
Subject: [Buildroot] [git commit master] busybox: 1.16.0 beep fix
Message-ID: <20100318220933.D3654776FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bff5db81be28d81d356ee20c54439b6e41ea740e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.16.0-beep.patch |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.16.0-beep.patch

diff --git a/package/busybox/busybox-1.16.0-beep.patch b/package/busybox/busybox-1.16.0-beep.patch
new file mode 100644
index 0000000..68f4179
--- /dev/null
+++ b/package/busybox/busybox-1.16.0-beep.patch
@@ -0,0 +1,17 @@
+diff -urpN busybox-1.16.0/miscutils/beep.c busybox-1.16.0-beep/miscutils/beep.c
+--- busybox-1.16.0/miscutils/beep.c	2010-01-25 01:59:38.000000000 +0100
++++ busybox-1.16.0-beep/miscutils/beep.c	2010-03-14 15:27:24.000000000 +0100
+@@ -79,11 +79,11 @@ int beep_main(int argc, char **argv)
+ 		}
+ 		while (rep) {
+ //bb_info_msg("rep[%d] freq=%d, length=%d, delay=%d", rep, freq, length, delay);
+-			xioctl(speaker, KIOCSOUND, (void*)(long)tickrate_div_freq);
++			xioctl(speaker, KIOCSOUND, (void*)(uintptr_t)tickrate_div_freq);
+ 			usleep(1000 * length);
+ 			ioctl(speaker, KIOCSOUND, (void*)0);
+ 			if (--rep)
+-				usleep(delay);
++				usleep(1000 * delay);
+ 		}
+ 	}
+ 
-- 
1.6.3.3
