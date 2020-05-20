From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 20 May 2020 07:16:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: remove hardcoded
 interface from config to args
Message-ID: <20200520051647.18530-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Interface configuration is hard coded in the config file. This will
throw an error when this interace (eth0) is not present.

This patch removes the interface to be used from the config and appends it
to the PTP4L_ARGS. With this the custom arguments can be set via
/etc/defaults/ptp4l.

Cc: Michael Walle <michael@walle.cc>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/linuxptp/S65ptp4l      | 2 +-
 package/linuxptp/linuxptp.cfg  | 2 --
 package/linuxptp/ptp4l.service | 2 +-
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/linuxptp/S65ptp4l b/package/linuxptp/S65ptp4l
index 1b9e3c9300..f888c1026c 100644
--- a/package/linuxptp/S65ptp4l
+++ b/package/linuxptp/S65ptp4l
@@ -7,7 +7,7 @@ DAEMON="ptp4l"
 
 PIDFILE="/var/run/$DAEMON.pid"
 
-PTP4L_ARGS="-f /etc/linuxptp.cfg"
+PTP4L_ARGS="-f /etc/linuxptp.cfg -i eth0"
 
 # shellcheck source=/dev/null
 [ -r "/etc/default/ptp4l" ] && . "/etc/default/ptp4l"
diff --git a/package/linuxptp/linuxptp.cfg b/package/linuxptp/linuxptp.cfg
index f9d02e8d97..376fc85ac7 100644
--- a/package/linuxptp/linuxptp.cfg
+++ b/package/linuxptp/linuxptp.cfg
@@ -15,5 +15,3 @@ delay_mechanism		Auto
 network_transport	UDPv4
 time_stamping		hardware
 step_threshold		1.0
-
-[eth0]
diff --git a/package/linuxptp/ptp4l.service b/package/linuxptp/ptp4l.service
index 07f0b68fad..fb39ee3d94 100644
--- a/package/linuxptp/ptp4l.service
+++ b/package/linuxptp/ptp4l.service
@@ -6,7 +6,7 @@ Wants=time-sync.target
 Wants=phc2sys.service
 
 [Service]
-ExecStart=/usr/sbin/ptp4l -f /etc/linuxptp.cfg
+ExecStart=/usr/sbin/ptp4l -f /etc/linuxptp.cfg -i eth0
 Restart=always
 
 [Install]
-- 
2.20.1
