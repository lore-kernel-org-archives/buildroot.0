From: Martin Bark <martin@barkynet.com>
Date: Tue,  3 May 2016 10:36:53 +0100
Subject: [Buildroot] [PATCH v2 2/6] package/nginx: fix error is nginx.service
In-Reply-To: <1462268217-31545-1-git-send-email-martin@barkynet.com>
References: <1462268217-31545-1-git-send-email-martin@barkynet.com>
Message-ID: <1462268217-31545-2-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using systemd nginx fails to start with the error

    /usr/bin/mkdir: invalid option -- 't'

This is due to a missing space before the semicolon in nginx.service.
For systemd to handle multiple commands in ExecStartPre it requires the
semicolon to be a separate word or the use of multiple ExecStartPre.

This commit splits the multiple commands into two ExecStartPre lines
which fixes the error and improves readability.

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changes v1 -> v2
 - Split single ExecStartPre into two ExecStartPre lines
   (suggested by Thomas Petazzoni)
 - Reorder before bump to 1.10.0 as this happens in 1.8.1 too
---
 package/nginx/nginx.service | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/nginx/nginx.service b/package/nginx/nginx.service
index 619755f..320df9a 100644
--- a/package/nginx/nginx.service
+++ b/package/nginx/nginx.service
@@ -5,7 +5,8 @@ After=syslog.target network.target
 [Service]
 Type=forking
 PIDFile=/var/run/nginx.pid
-ExecStartPre=/usr/bin/mkdir -p /var/log/nginx /var/tmp/nginx; /usr/sbin/nginx -t -q -g 'pid /var/run/nginx.pid; daemon on; master_process on;'
+ExecStartPre=/usr/bin/mkdir -p /var/log/nginx /var/tmp/nginx
+ExecStartPre=/usr/sbin/nginx -t -q -g 'pid /var/run/nginx.pid; daemon on; master_process on;'
 ExecStart=/usr/sbin/nginx -g 'pid /var/run/nginx.pid; daemon on; master_process on;'
 ExecReload=/usr/sbin/nginx -g 'pid /var/run/nginx.pid; daemon on; master_process on;' -s reload
 ExecStop=/usr/sbin/nginx -g 'pid /var/run/nginx.pid;' -s quit
-- 
2.7.4
