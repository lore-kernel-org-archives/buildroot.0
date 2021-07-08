From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu,  8 Jul 2021 05:16:27 -0600
Subject: [Buildroot] [PATCH 1/1] package/{chrony, ntp,
 openntpd}: turn off DNSSEC validation
Message-ID: <20210708111627.3795182-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We have a chicken and egg problem: validation of DNSSEC signatures
doesn't work without a correct clock, but to set the correct clock we
need to contact NTP servers which requires resolving a hostname, which
would normally require DNSSEC validation.

Let's break the cycle by excluding NTP hostname resolution from
validation for now.

Details:
https://github.com/systemd/systemd/commit/abf4e5c1d3ad767bc0ed67883e8e4d916af095ec

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/chrony/chrony.service | 4 ++++
 package/ntp/ntpd.service      | 4 ++++
 package/openntpd/ntpd.service | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/package/chrony/chrony.service b/package/chrony/chrony.service
index 325b63c492..210122cf5d 100644
--- a/package/chrony/chrony.service
+++ b/package/chrony/chrony.service
@@ -4,6 +4,10 @@ After=syslog.target network.target
 Conflicts=systemd-timesyncd.service
 
 [Service]
+# Turn off DNSSEC validation for hostname look-ups, since those need the
+# correct time to work, but we likely won't acquire that without NTP. Let's
+# break this chicken-and-egg cycle here.
+Environment=SYSTEMD_NSS_RESOLVE_VALIDATE=0
 ExecStart=/usr/sbin/chronyd -n
 Restart=always
 
diff --git a/package/ntp/ntpd.service b/package/ntp/ntpd.service
index 7964c5389b..9a0f4c6dbf 100644
--- a/package/ntp/ntpd.service
+++ b/package/ntp/ntpd.service
@@ -5,6 +5,10 @@ After=network.target
 [Service]
 Type=forking
 PIDFile=/run/ntpd.pid
+# Turn off DNSSEC validation for hostname look-ups, since those need the
+# correct time to work, but we likely won't acquire that without NTP. Let's
+# break this chicken-and-egg cycle here.
+Environment=SYSTEMD_NSS_RESOLVE_VALIDATE=0
 ExecStart=/usr/sbin/ntpd -g -p /run/ntpd.pid
 
 [Install]
diff --git a/package/openntpd/ntpd.service b/package/openntpd/ntpd.service
index a4ffa7318c..c2924b0c5c 100644
--- a/package/openntpd/ntpd.service
+++ b/package/openntpd/ntpd.service
@@ -5,6 +5,10 @@ Conflicts=systemd-timesyncd.service
 
 [Service]
 Type=simple
+# Turn off DNSSEC validation for hostname look-ups, since those need the
+# correct time to work, but we likely won't acquire that without NTP. Let's
+# break this chicken-and-egg cycle here.
+Environment=SYSTEMD_NSS_RESOLVE_VALIDATE=0
 ExecStart=/usr/sbin/ntpd -s -d
 
 [Install]
-- 
2.25.1
