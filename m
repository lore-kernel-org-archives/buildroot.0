From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sun, 11 Aug 2019 20:01:43 -0300
Subject: [Buildroot] [PATCH] package/ti-gfx: do not use devmem2 in script
Message-ID: <20190811230143.10490-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

ti-gfx may install a debug script that uses devmem2 but does not select
BR2_PACKAGE_DEVMEM2. Use devmem, instead, already provided by Busybox.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
CC: Ciro Santilli <ciro.santilli@gmail.com>
---
Found while investigating https://bugs.busybox.net/show_bug.cgi?id=10171

In the future we may decide to deprecate devmem2.

Tested on QEMU, forging the results of "devmem" 0x56000014", since I
don't have any board with a TI GFX board.
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
-- 
2.18.1
