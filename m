From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 10:20:57 +0100
Subject: [Buildroot] [git commit] package/sysklogd: allow customisation in
 systemd service
Message-ID: <20210124091901.0421580257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9fe509a01659478da7dc425e617d740d62b4aab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As is done with the init script, parse the system-level customisation
file, if it exists, from the systemd service unit, to allow users to
provide extra arguments passed to the daemon.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
[yann.morin.1998 at free.fr; offload to its own commit]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sysklogd/syslogd.service | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sysklogd/syslogd.service b/package/sysklogd/syslogd.service
index 1bf1bb3bd9..c7e724e13b 100644
--- a/package/sysklogd/syslogd.service
+++ b/package/sysklogd/syslogd.service
@@ -3,7 +3,8 @@ Description=System Logging Service
 Requires=syslog.socket
 
 [Service]
-ExecStart=/sbin/syslogd -m 0 -F
+EnvironmentFile=-/etc/default/syslogd
+ExecStart=/sbin/syslogd -m 0 -F $SYSLOGD_ARGS
 StandardOutput=null
 Restart=on-failure
 
