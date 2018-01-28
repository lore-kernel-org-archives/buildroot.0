From: Petr Kulhavy <brain@jikos.cz>
Date: Sun, 28 Jan 2018 17:00:21 +0100
Subject: [Buildroot] [PATCH 3/3] package: linuxptp: workaround for system
 crash if PHY is not initialized
In-Reply-To: <1517155221-19399-1-git-send-email-brain@jikos.cz>
References: <1517155221-19399-1-git-send-email-brain@jikos.cz>
Message-ID: <1517155221-19399-3-git-send-email-brain@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some systems (tested on i.MX6 with Freescale kernel 4.1) the system freezes
if phc2sys starts before the PHY is initialized (phc2sys opens /dev/ptp0).

Unfortunately systemd network.target does not guarantee the PHY to be initialized.
This workaround pulls in the network-online.target dependency, which postpones
the phc2sys start after the link is up.

Signed-off-by: Petr Kulhavy <brain@jikos.cz>
---
 package/linuxptp/linuxptp-system-clock.service | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/linuxptp/linuxptp-system-clock.service b/package/linuxptp/linuxptp-system-clock.service
index a4436a3..0c73983 100644
--- a/package/linuxptp/linuxptp-system-clock.service
+++ b/package/linuxptp/linuxptp-system-clock.service
@@ -2,6 +2,10 @@
 Description=Precision Time Protocol system clock synchronization
 After=linuxptp.service
 
+# workaround for crashing Freescale PHY if initialized after /dev/ptp0 is open
+After=network-online.target
+Wants=network-online.target
+
 [Service]
 ExecStart=/usr/sbin/phc2sys -s /dev/ptp0 -c CLOCK_REALTIME -w -S 1.0
 Restart=always
-- 
2.7.4
