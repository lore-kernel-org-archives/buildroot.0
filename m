From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:47 -0000
Subject: [Buildroot] [git commit] package/openocd: bump to 0.11.0
Message-ID: <20210607144657.0C598814AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62f71720ee848b7450a91c4e30f1e4c6bbc4b467
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream patches.

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...04-Prevent-some-forms-of-Cross-Protocol-S.patch | 50 ----------------------
 .../0003-bitbang-Fix-FTBFS-with-GCC-10.patch       | 37 ----------------
 package/openocd/openocd.hash                       |  7 ++-
 package/openocd/openocd.mk                         |  2 +-
 4 files changed, 4 insertions(+), 92 deletions(-)

diff --git a/package/openocd/0002-CVE-2018-5704-Prevent-some-forms-of-Cross-Protocol-S.patch b/package/openocd/0002-CVE-2018-5704-Prevent-some-forms-of-Cross-Protocol-S.patch
deleted file mode 100644
index ba19bf5735..0000000000
--- a/package/openocd/0002-CVE-2018-5704-Prevent-some-forms-of-Cross-Protocol-S.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 3a223ca3ebc7ac24d7726a0cd58e5695bc813657 Mon Sep 17 00:00:00 2001
-From: Andreas Fritiofson <andreas.fritiofson@gmail.com>
-Date: Sat, 13 Jan 2018 21:00:47 +0100
-Subject: [PATCH] CVE-2018-5704: Prevent some forms of Cross Protocol Scripting
- attacks
-
-OpenOCD can be targeted by a Cross Protocol Scripting attack from
-a web browser running malicious code, such as the following PoC:
-
-var x = new XMLHttpRequest();
-x.open("POST", "http://127.0.0.1:4444", true);
-x.send("exec xcalc\r\n");
-
-This mitigation should provide some protection from browser-based
-attacks and is based on the corresponding fix in Redis:
-
-https://github.com/antirez/redis/blob/8075572207b5aebb1385c4f233f5302544439325/src/networking.c#L1758
-
-
-Upstream-status: Under review: http://openocd.zylin.com/#/c/4335/
-Change-Id: Ia96ebe19b74b5805dc228bf7364c7971a90a4581
-Signed-off-by: Andreas Fritiofson <andreas.fritiofson@gmail.com>
-Reported-by: Josef Gajdusek <atx@atx.name>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/server/startup.tcl | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/src/server/startup.tcl b/src/server/startup.tcl
-index 64ace407..dd1b31e4 100644
---- a/src/server/startup.tcl
-+++ b/src/server/startup.tcl
-@@ -8,3 +8,14 @@ proc ocd_gdb_restart {target_id} {
- 	# one target
- 	reset halt
- }
-+
-+proc prevent_cps {} {
-+	echo "Possible SECURITY ATTACK detected."
-+	echo "It looks like somebody is sending POST or Host: commands to OpenOCD."
-+	echo "This is likely due to an attacker attempting to use Cross Protocol Scripting"
-+	echo "to compromise your OpenOCD instance. Connection aborted."
-+	exit
-+}
-+
-+proc POST {args} { prevent_cps }
-+proc Host: {args} { prevent_cps }
--- 
-2.11.0
-
diff --git a/package/openocd/0003-bitbang-Fix-FTBFS-with-GCC-10.patch b/package/openocd/0003-bitbang-Fix-FTBFS-with-GCC-10.patch
deleted file mode 100644
index cf83515247..0000000000
--- a/package/openocd/0003-bitbang-Fix-FTBFS-with-GCC-10.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From c60252ac2b636c4d99b766a574b9df0966151696 Mon Sep 17 00:00:00 2001
-From: Andreas Fritiofson <andreas.fritiofson@gmail.com>
-Date: Fri, 17 Apr 2020 13:49:28 +0200
-Subject: [PATCH] bitbang: Fix FTBFS with GCC 10
-
-GCC 10 defaults to -fno-common which breaks the sharing of bitbang_swd
-struct between bitbang drivers due to a missing extern.
-
-Change-Id: I2b4122f7939cec91a72284006748f99a23548324
-Signed-off-by: Andreas Fritiofson <andreas.fritiofson@gmail.com>
-Reviewed-on: http://openocd.zylin.com/5592
-Tested-by: jenkins
-Reviewed-by: Antonio Borneo <borneo.antonio@gmail.com>
-Reviewed-by: Jonathan McDowell <noodles-openocd@earth.li>
-
-Patch taken from upstream: https://github.com/ntfreak/openocd/commit/c60252ac2b636c4d99b766a574b9df0966151696
-Signed-off-by: Heiko Thiery <heiko.thiery@gmailcom>
----
- src/jtag/drivers/bitbang.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/jtag/drivers/bitbang.h b/src/jtag/drivers/bitbang.h
-index edb779ca..bbbc693d 100644
---- a/src/jtag/drivers/bitbang.h
-+++ b/src/jtag/drivers/bitbang.h
-@@ -56,7 +56,7 @@ struct bitbang_interface {
- 	void (*swdio_drive)(bool on);
- };
- 
--const struct swd_driver bitbang_swd;
-+extern const struct swd_driver bitbang_swd;
- 
- extern bool swd_mode;
- 
--- 
-2.20.1
-
diff --git a/package/openocd/openocd.hash b/package/openocd/openocd.hash
index 3fb817b4a2..91eb56d930 100644
--- a/package/openocd/openocd.hash
+++ b/package/openocd/openocd.hash
@@ -1,4 +1,3 @@
-# From http://sourceforge.net/projects/openocd/files/openocd/0.10.0/
-sha1 3245d43d60a1a93f8b0f6b1ce20b53e38cab7a4a  openocd-0.10.0.tar.bz2
-md5 b412bdef0481a3859c6585eb69f6f6ba  openocd-0.10.0.tar.bz2
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+# From http://sourceforge.net/projects/openocd/files/openocd/0.11.0/
+sha256  43a3ce734aff1d3706ad87793a9f3a5371cb0e357f0ffd0a151656b06b3d1e7d  openocd-0.11.0.tar.bz2
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 7887f3a6dc..1460495a88 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENOCD_VERSION = 0.10.0
+OPENOCD_VERSION = 0.11.0
 OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
 OPENOCD_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
 OPENOCD_LICENSE = GPL-2.0+
