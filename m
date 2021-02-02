From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Feb 2021 16:35:56 +0100
Subject: [Buildroot] [git commit] package/busybox: Fix check for IPv6
 default route in udhcpc
Message-ID: <20210202152051.15BD4864D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09ad6f392fca86dc220f0ba3129512ab4f3469e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The check for a default route is inverted, causing the script to wait
for the timeout even when a default IPv6 route is available. Fix this up
so that it exits early as expected.

Reported-by: Bhattiprolu RaviKumar <ravikumar.bhattiprolu@gmail.com>
Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
