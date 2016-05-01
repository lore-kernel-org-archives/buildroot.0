From: Martin Bark <martin@barkynet.com>
Date: Sun,  1 May 2016 20:52:25 +0100
Subject: [Buildroot] [PATCH 5/5] package/nginx: fix error is nginx.service
In-Reply-To: <1462132345-28253-1-git-send-email-martin@barkynet.com>
References: <1462132345-28253-1-git-send-email-martin@barkynet.com>
Message-ID: <1462132345-28253-5-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using systemd nginx fails to start with the error

    /usr/bin/mkdir: invalid option -- 't'

This is due to a missing space before the semicolon in nginx.service.
For systemd to handle multiple commands in ExecStartPre it requires the
semicolon to be a separate word.  This commit adds the missing space.

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nginx/nginx.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nginx/nginx.service b/package/nginx/nginx.service
index 619755f..2ea4ff7 100644
--- a/package/nginx/nginx.service
+++ b/package/nginx/nginx.service
@@ -5,7 +5,7 @@ After=syslog.target network.target
 [Service]
 Type=forking
 PIDFile=/var/run/nginx.pid
-ExecStartPre=/usr/bin/mkdir -p /var/log/nginx /var/tmp/nginx; /usr/sbin/nginx -t -q -g 'pid /var/run/nginx.pid; daemon on; master_process on;'
+ExecStartPre=/usr/bin/mkdir -p /var/log/nginx /var/tmp/nginx ; /usr/sbin/nginx -t -q -g 'pid /var/run/nginx.pid; daemon on; master_process on;'
 ExecStart=/usr/sbin/nginx -g 'pid /var/run/nginx.pid; daemon on; master_process on;'
 ExecReload=/usr/sbin/nginx -g 'pid /var/run/nginx.pid; daemon on; master_process on;' -s reload
 ExecStop=/usr/sbin/nginx -g 'pid /var/run/nginx.pid;' -s quit
-- 
2.7.4
