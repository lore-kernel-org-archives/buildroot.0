From: Christian Stewart <christian@paral.in>
Date: Mon,  4 Jul 2016 12:26:22 -0700
Subject: [Buildroot] [PATCH v6 5/5] package/docker-engine: restart - switch
	from ps -p to searching proc
In-Reply-To: <1467660382-6317-1-git-send-email-christian@paral.in>
References: <1467660382-6317-1-git-send-email-christian@paral.in>
Message-ID: <1467660382-6317-5-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Andrew Webster <awebster@arcx.com>

The busybox ps may not support -p, so search procfs instead to
determine if docker is running.

Acked-by: Christian Stewart <christian@paral.in>
Signed-off-by: Andrew Webster <awebster@arcx.com>
Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker.init | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker.init b/package/docker-engine/docker.init
index a751551..36c7786 100644
--- a/package/docker-engine/docker.init
+++ b/package/docker-engine/docker.init
@@ -96,8 +96,9 @@ case "$1" in
        restart)
                docker_pid=`cat "$DOCKER_SSD_PIDFILE" 2>/dev/null`
                [ -n "$docker_pid" ] \
-                       && ps -p $docker_pid > /dev/null 2>&1 \
-                       && $0 stop
+                       && [ -d /proc/$docker_pid ] \
+                       && $0 stop \
+                       && sleep 1
                $0 start
                ;;
 
-- 
2.7.3
