From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Aug 2019 15:00:50 +0200
Subject: [Buildroot] [git commit] package/harfbuzz: fix build on m68k
Message-ID: <20190815130258.1EEA18E9E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a6f0409791541168eae34475d5257e94a9cb211
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/b54/b54cf80fb8f09c6d4837e987657254d902a90ac1/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-pool-Fix-alignment-assertion.patch        | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/harfbuzz/0001-pool-Fix-alignment-assertion.patch b/package/harfbuzz/0001-pool-Fix-alignment-assertion.patch
new file mode 100644
index 0000000000..4dd3e14a46
--- /dev/null
+++ b/package/harfbuzz/0001-pool-Fix-alignment-assertion.patch
@@ -0,0 +1,30 @@
+From aade9b70aabd8a97dd8a28cda2cf4d0694dd7350 Mon Sep 17 00:00:00 2001
+From: Behdad Esfahbod <behdad@behdad.org>
+Date: Tue, 13 Aug 2019 16:09:20 -0700
+Subject: [PATCH] [pool] Fix alignment assertion
+
+I *think* it should fix https://github.com/harfbuzz/harfbuzz/issues/1901
+
+Ie. if on a system, alignof(void*) < sizeof(void*)...
+
+Downloaded from upstream commit
+https://github.com/harfbuzz/harfbuzz/commit/aade9b70aabd8a97dd8a28cda2cf4d0694dd7350
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/hb-pool.hh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/hb-pool.hh b/src/hb-pool.hh
+index ff0ee194c..2dd84968e 100644
+--- a/src/hb-pool.hh
++++ b/src/hb-pool.hh
+@@ -77,7 +77,7 @@ struct hb_pool_t
+ 
+   static_assert (ChunkLen > 1, "");
+   static_assert (sizeof (T) >= sizeof (void *), "");
+-  static_assert (alignof (T) % sizeof (void *) == 0, "");
++  static_assert (alignof (T) % alignof (void *) == 0, "");
+ 
+   struct chunk_t
+   {
