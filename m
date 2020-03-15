From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 22:55:47 +0100
Subject: [Buildroot] [git commit] package/sysklogd: fix installation path of
 the daemons
Message-ID: <20200315214302.13CF3817D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33642d8d95925dc71e8c260aee4b6c9e3de334ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use "--exec-prefix=/" to install syslogd and klogd at /sbin, as required
by the init scripts. This also ensures that the BusyBox counterparts are
not installed.

Update the systemd unit files, accordingly.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sysklogd/klogd.service   | 2 +-
 package/sysklogd/sysklogd.mk     | 1 +
 package/sysklogd/syslogd.service | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/sysklogd/klogd.service b/package/sysklogd/klogd.service
index c66795b449..b5dbb93d7d 100644
--- a/package/sysklogd/klogd.service
+++ b/package/sysklogd/klogd.service
@@ -2,7 +2,7 @@
 Description=Kernel Log Daemon
 
 [Service]
-ExecStart=/usr/sbin/klogd -n
+ExecStart=/sbin/klogd -n
 StandardOutput=null
 Restart=on-failure
 
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 1bd1ec51b5..7a25d0eb6f 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -10,6 +10,7 @@ SYSKLOGD_LICENSE = GPL-2.0+
 SYSKLOGD_LICENSE_FILES = COPYING
 # From git
 SYSKLOGD_AUTORECONF = YES
+SYSKLOGD_CONF_OPTS = --exec-prefix=/
 
 define SYSKLOGD_INSTALL_SAMPLE_CONFIG
 	$(INSTALL) -D -m 0644 package/sysklogd/syslog.conf \
diff --git a/package/sysklogd/syslogd.service b/package/sysklogd/syslogd.service
index 70e4cff27e..adaac679f2 100644
--- a/package/sysklogd/syslogd.service
+++ b/package/sysklogd/syslogd.service
@@ -4,7 +4,7 @@ Requires=syslog.socket
 Wants=klogd.service
 
 [Service]
-ExecStart=/usr/sbin/syslogd -m 0 -n
+ExecStart=/sbin/syslogd -m 0 -n
 StandardOutput=null
 Restart=on-failure
 
