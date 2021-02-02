From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Mon,  1 Feb 2021 17:54:52 -0800
Subject: [Buildroot] [PATCH] package/busybox: Fix check for IPv6 default
 route in udhcpc
Message-ID: <20210202015452.98002-1-sam@mendozajonas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check for a default route is inverted, causing the script to wait
for the timeout even when a default IPv6 route is available. Fix this up
so that it exits early as expected.

Reported-by: Bhattiprolu RaviKumar <ravikumar.bhattiprolu@gmail.com>
Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 package/busybox/udhcpc.script | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index ec4d9f6185..c73ad6c2ef 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -18,7 +18,7 @@ fi
 wait_for_ipv6_default_route() {
 	printf "Waiting for IPv6 default route to appear"
 	while [ $IF_WAIT_DELAY -gt 0 ]; do
-		if [ -z "$(ip -6 route list | grep default)" ]; then
+		if ip -6 route list | grep -q default; then
 			printf "\n"
 			return
 		fi
-- 
2.30.0
