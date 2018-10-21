From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 21 Oct 2018 23:02:24 +0100
Subject: [Buildroot] [git commit] package: linuxptp: enhance systemd service
Message-ID: <20181021220656.C75E488528@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85519fc6923c9b670350be2909f73da98ee05307
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

linuxptp now pulls in the time-sync.target, which other services can
use to make sure they have a valid time before starting.

phc2sys (linuxptp-system-clock.service) starts after ptp4l
(linuxptp.service) so we have a valid time before writing it to the
hardware clock.

Signed-off-by: Petr Kulhavy <brain@jikos.cz>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/linuxptp/linuxptp-system-clock.service | 2 +-
 package/linuxptp/linuxptp.service              | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/linuxptp/linuxptp-system-clock.service b/package/linuxptp/linuxptp-system-clock.service
index 73272542cd..a4436a34a7 100644
--- a/package/linuxptp/linuxptp-system-clock.service
+++ b/package/linuxptp/linuxptp-system-clock.service
@@ -1,6 +1,6 @@
 [Unit]
 Description=Precision Time Protocol system clock synchronization
-After=syslog.target network.target
+After=linuxptp.service
 
 [Service]
 ExecStart=/usr/sbin/phc2sys -s /dev/ptp0 -c CLOCK_REALTIME -w -S 1.0
diff --git a/package/linuxptp/linuxptp.service b/package/linuxptp/linuxptp.service
index f690430633..14e9814b06 100644
--- a/package/linuxptp/linuxptp.service
+++ b/package/linuxptp/linuxptp.service
@@ -1,6 +1,8 @@
 [Unit]
 Description=Precision Time Protocol daemon
 After=syslog.target network.target
+Before=time-sync.target
+Wants=time-sync.target
 Wants=linuxptp-system-clock.service
 
 [Service]
