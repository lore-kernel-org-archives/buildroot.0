From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 14 Mar 2020 23:27:06 -0300
Subject: [Buildroot] [PATCH] package/sysklogd: fix installation path of the
 daemons
Message-ID: <20200315022706.20107-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Use "--exec-prefix=/" to install syslogd and klogd at /sbin, as required
by the init scripts. This also ensures that the BusyBox counterparts are
not installed.

Update the systemd unit files, accordingly.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
CC: Peter Korsgaard <peter@korsgaard.com>

Peter, this applies to 2019.11.x and later.
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
 
-- 
2.18.2
