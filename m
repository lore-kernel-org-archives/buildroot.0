From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Feb 2021 20:29:50 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/busybox: Fix
 check for IPv6 default route in udhcpc
Message-ID: <20210203191001.796527FB5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=beb6c737b1c100c60f05709782f4f0f8a87e8ee5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The check for a default route is inverted, causing the script to wait
for the timeout even when a default IPv6 route is available. Fix this up
so that it exits early as expected.

Reported-by: Bhattiprolu RaviKumar <ravikumar.bhattiprolu@gmail.com>
Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 09ad6f392fca86dc220f0ba3129512ab4f3469e1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/udhcpc.script | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index 0196351cd5..d375b34c42 100755
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
