From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Feb 2019 22:44:21 +0100
Subject: [Buildroot] [git commit] package/pulseaudio: fix S50pulseaudio init
 script
Message-ID: <20190215214235.A840F8B48E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=597b529927db0b43f9f0d533c27ddfcae4845c9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- fix the following start warnings:

  W: [pulseaudio] main.c: Running in system mode, but --disallow-exit not set.
  W: [pulseaudio] main.c: Running in system mode, but --disallow-module-loading not set.
  N: [pulseaudio] main.c: Running in system mode, forcibly disabling SHM mode.
  N: [pulseaudio] main.c: Running in system mode, forcibly disabling exit idle time.

- fix the following stop error:

  E: [pulseaudio] main.c: Failed to kill daemon: No such process

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pulseaudio/S50pulseaudio | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/pulseaudio/S50pulseaudio b/package/pulseaudio/S50pulseaudio
index c1d88626f4..ea343a716d 100644
--- a/package/pulseaudio/S50pulseaudio
+++ b/package/pulseaudio/S50pulseaudio
@@ -7,12 +7,19 @@
 start() {
 	printf "Starting pulseaudio: "
 	umask 077
-	/usr/bin/pulseaudio --system --daemonize
+	/usr/bin/pulseaudio \
+		--system \
+		--daemonize \
+		--disallow-module-loading \
+		--disallow-exit \
+		--exit-idle-time=-1 \
+		--use-pid-file \
+		--disable-shm
 	echo "OK"
 }
 stop() {
 	printf "Stopping pulseaudio: "
-	pulseaudio --kill
+	PULSE_RUNTIME_PATH=/var/run/pulse /usr/bin/pulseaudio --kill
 	echo "OK"
 }
 restart() {
