From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 22:22:56 +0200
Subject: [Buildroot] [git commit] package/nginx: fix error is nginx.service
Message-ID: <20160505204505.93445801A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=851376149380a47cc34d34227f7333a576e3cd72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using systemd nginx fails to start with the error

    /usr/bin/mkdir: invalid option -- 't'

This is due to a missing space before the semicolon in nginx.service.
For systemd to handle multiple commands in ExecStartPre it requires the
semicolon to be a separate word or the use of multiple ExecStartPre.

This commit splits the multiple commands into two ExecStartPre lines
which fixes the error and improves readability.

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
