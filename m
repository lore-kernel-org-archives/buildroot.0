From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 May 2020 21:50:04 +0200
Subject: [Buildroot] [git commit] package/openocd: fix -fno-common build
 failure
Message-ID: <20200517193356.EB36991966@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53158e41fdd4bcc1272bbf4e61b68f58bf9c1527
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added upstream patch for fixing build failure when using GCC10 as a host
compiler (-fno-common is now default)

Fixes:
http://autobuild.buildroot.org/results/0fc/0fcb11a40bcff78e8084335114af390d2fac31e1

Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Tested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0003-bitbang-Fix-FTBFS-with-GCC-10.patch       | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/openocd/0003-bitbang-Fix-FTBFS-with-GCC-10.patch b/package/openocd/0003-bitbang-Fix-FTBFS-with-GCC-10.patch
new file mode 100644
index 0000000000..cf83515247
--- /dev/null
+++ b/package/openocd/0003-bitbang-Fix-FTBFS-with-GCC-10.patch
@@ -0,0 +1,37 @@
+From c60252ac2b636c4d99b766a574b9df0966151696 Mon Sep 17 00:00:00 2001
+From: Andreas Fritiofson <andreas.fritiofson@gmail.com>
+Date: Fri, 17 Apr 2020 13:49:28 +0200
+Subject: [PATCH] bitbang: Fix FTBFS with GCC 10
+
+GCC 10 defaults to -fno-common which breaks the sharing of bitbang_swd
+struct between bitbang drivers due to a missing extern.
+
+Change-Id: I2b4122f7939cec91a72284006748f99a23548324
+Signed-off-by: Andreas Fritiofson <andreas.fritiofson@gmail.com>
+Reviewed-on: http://openocd.zylin.com/5592
+Tested-by: jenkins
+Reviewed-by: Antonio Borneo <borneo.antonio@gmail.com>
+Reviewed-by: Jonathan McDowell <noodles-openocd@earth.li>
+
+Patch taken from upstream: https://github.com/ntfreak/openocd/commit/c60252ac2b636c4d99b766a574b9df0966151696
+Signed-off-by: Heiko Thiery <heiko.thiery@gmailcom>
+---
+ src/jtag/drivers/bitbang.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/jtag/drivers/bitbang.h b/src/jtag/drivers/bitbang.h
+index edb779ca..bbbc693d 100644
+--- a/src/jtag/drivers/bitbang.h
++++ b/src/jtag/drivers/bitbang.h
+@@ -56,7 +56,7 @@ struct bitbang_interface {
+ 	void (*swdio_drive)(bool on);
+ };
+ 
+-const struct swd_driver bitbang_swd;
++extern const struct swd_driver bitbang_swd;
+ 
+ extern bool swd_mode;
+ 
+-- 
+2.20.1
+
