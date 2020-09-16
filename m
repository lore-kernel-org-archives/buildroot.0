From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 16 Sep 2020 13:45:04 +0200
Subject: [Buildroot] [PATCH v3 4/8] package/htpdate: use /run for PIDFile
In-Reply-To: <20200915215645.2010-1-buildroot@heine.tech>
References: <20200915215645.2010-1-buildroot@heine.tech>
Message-ID: <20200916114508.3575-5-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- rename pidfile from htpdate to htpdate.pid

Fixes:

PIDFile= references a path below legacy directory /var/run/, updating
/var/run/htpdate.pid ? /run/htpdate.pid; please update the unit file
accordingly.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/htpdate/htpdate.service | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/htpdate/htpdate.service b/package/htpdate/htpdate.service
index 0c77550813..b7f1371b08 100644
--- a/package/htpdate/htpdate.service
+++ b/package/htpdate/htpdate.service
@@ -4,10 +4,10 @@ After=network.target
 
 [Service]
 Type=forking
-PIDFile=/var/run/htpdate
+PIDFile=/run/htpdate.pid
 Environment=HTPDATE_ARGS="-a -s -t https://www.google.com"
 EnvironmentFile=-/etc/default/htpdate
-ExecStart=/usr/bin/htpdate -D -i /var/run/htpdate $HTPDATE_ARGS
+ExecStart=/usr/bin/htpdate -D -i /run/htpdate.pid $HTPDATE_ARGS
 
 [Install]
 WantedBy=multi-user.target
-- 
2.25.1
