From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Aug 2019 22:41:32 +0200
Subject: [Buildroot] [git commit] package/ti-gfx: do not use devmem2 in
 script
Message-ID: <20190812205958.3270A80291@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f6e3eae557c30c97968818e6d3d4e52dc665e9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ti-gfx may install a debug script that uses devmem2 but does not select
BR2_PACKAGE_DEVMEM2. Use devmem, instead, already provided by Busybox.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ti-gfx/esrev.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ti-gfx/esrev.sh b/package/ti-gfx/esrev.sh
index 6220d4477d..8109334b79 100644
--- a/package/ti-gfx/esrev.sh
+++ b/package/ti-gfx/esrev.sh
@@ -48,7 +48,8 @@ case $CPUTYPE in
 	devmem 0x48180900 w 0x2
 	devmem 0x48180920 w 0x2
 
-	ES_REVISION="$(devmem2 0x56000014 | sed -e s:0x00010205:6: -e s:0x00010201:3: -e s:0x00010003:2: | tail -n1 | awk -F': ' '{print $2}')"
+	ES_REVISION="$(devmem 0x56000014 | sed -e s:0x00010205:6: \
+		-e s:0x00010201:3: -e s:0x00010003:2:)"
 	;;
 *)
 	echo Unable to determine SGX hardware
