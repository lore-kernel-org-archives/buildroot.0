From: Michael Nosthoff <buildroot@heine.tech>
Date: Tue, 15 Sep 2020 23:56:45 +0200
Subject: [Buildroot] [PATCH v2]  package/{bandwithd, dhcpcd, htpdate,
 minidlna, nginx, nss-pam-ldapd,
 openvmtools}: use PIDFile=/run in systemd services
In-Reply-To: <20200915194958.658-1-buildroot@heine.tech>
References: <20200915194958.658-1-buildroot@heine.tech>
Message-ID: <20200915215645.2010-1-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

systemd[1]: /usr/lib/systemd/system/nginx.service:7: PIDFile= references
a path below legacy directory /var/run/, updating /var/run/nginx.pid ?
/run/nginx.pid; please update the unit file accordingly.

Details:
 - https://github.com/systemd/systemd/pull/10712

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/bandwidthd/bandwidthd.service | 2 +-
 package/dhcpcd/dhcpcd.service         | 2 +-
 package/htpdate/htpdate.service       | 2 +-
 package/minidlna/minidlnad.service    | 2 +-
 package/nginx/nginx.service           | 2 +-
 package/nss-pam-ldapd/nslcd.service   | 2 +-
 package/openvmtools/vmtoolsd.service  | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/bandwidthd/bandwidthd.service b/package/bandwidthd/bandwidthd.service
index 9c03d42946..ab7f05a2e8 100644
--- a/package/bandwidthd/bandwidthd.service
+++ b/package/bandwidthd/bandwidthd.service
@@ -5,7 +5,7 @@ After=network.target
 [Service]
 Type=forking
 ExecStart=/usr/bin/bandwidthd
-PIDFile=/var/run/bandwidthd.pid
+PIDFile=/run/bandwidthd.pid
 
 [Install]
 WantedBy=multi-user.target
diff --git a/package/dhcpcd/dhcpcd.service b/package/dhcpcd/dhcpcd.service
index 0552b5c73a..e648092c9b 100644
--- a/package/dhcpcd/dhcpcd.service
+++ b/package/dhcpcd/dhcpcd.service
@@ -5,7 +5,7 @@ After=network.target
 [Service]
 Type=forking
 EnvironmentFile=-/etc/default/dhcpcd
-PIDFile=/var/run/dhcpcd.pid
+PIDFile=/run/dhcpcd.pid
 ExecStart=/sbin/dhcpcd $DAEMON_ARGS
 Restart=always
 
diff --git a/package/htpdate/htpdate.service b/package/htpdate/htpdate.service
index 0c77550813..aedb73eb93 100644
--- a/package/htpdate/htpdate.service
+++ b/package/htpdate/htpdate.service
@@ -4,7 +4,7 @@ After=network.target
 
 [Service]
 Type=forking
-PIDFile=/var/run/htpdate
+PIDFile=/run/htpdate
 Environment=HTPDATE_ARGS="-a -s -t https://www.google.com"
 EnvironmentFile=-/etc/default/htpdate
 ExecStart=/usr/bin/htpdate -D -i /var/run/htpdate $HTPDATE_ARGS
diff --git a/package/minidlna/minidlnad.service b/package/minidlna/minidlnad.service
index f69476b303..4e968d3858 100644
--- a/package/minidlna/minidlnad.service
+++ b/package/minidlna/minidlnad.service
@@ -5,7 +5,7 @@ After=network.target
 [Service]
 Type=forking
 ExecStart=/usr/sbin/minidlnad
-PIDFile=/var/run/minidlna/minidlna.pid
+PIDFile=/run/minidlna/minidlna.pid
 
 [Install]
 WantedBy=multi-user.target
diff --git a/package/nginx/nginx.service b/package/nginx/nginx.service
index 320df9a80e..9fd215fd3e 100644
--- a/package/nginx/nginx.service
+++ b/package/nginx/nginx.service
@@ -4,7 +4,7 @@ After=syslog.target network.target
 
 [Service]
 Type=forking
-PIDFile=/var/run/nginx.pid
+PIDFile=/run/nginx.pid
 ExecStartPre=/usr/bin/mkdir -p /var/log/nginx /var/tmp/nginx
 ExecStartPre=/usr/sbin/nginx -t -q -g 'pid /var/run/nginx.pid; daemon on; master_process on;'
 ExecStart=/usr/sbin/nginx -g 'pid /var/run/nginx.pid; daemon on; master_process on;'
diff --git a/package/nss-pam-ldapd/nslcd.service b/package/nss-pam-ldapd/nslcd.service
index 6c0d71b241..5a000a8e4c 100644
--- a/package/nss-pam-ldapd/nslcd.service
+++ b/package/nss-pam-ldapd/nslcd.service
@@ -4,7 +4,7 @@ After=syslog.target network.target
 
 [Service]
 Type=forking
-PIDFile=/var/run/nslcd/nslcd.pid
+PIDFile=/run/nslcd/nslcd.pid
 ExecStart=/usr/sbin/nslcd
 
 [Install]
diff --git a/package/openvmtools/vmtoolsd.service b/package/openvmtools/vmtoolsd.service
index cb97357ec2..12e28f5923 100644
--- a/package/openvmtools/vmtoolsd.service
+++ b/package/openvmtools/vmtoolsd.service
@@ -5,7 +5,7 @@ ConditionVirtualization=vmware
 
 [Service]
 Type=forking
-PIDFile=/var/run/vmtoolsd.pid
+PIDFile=/run/vmtoolsd.pid
 ExecStart=/usr/bin/vmtoolsd -b /var/run/vmtoolsd.pid
 Restart=on-failure
 KillMode=process
-- 
2.25.1
