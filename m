From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Sep 2017 22:55:51 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] squashfs: fix build with
	gcc 7
Message-ID: <20170904205601.C02248211C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=288d26acd5279218308e69a9989dfc20f1febdf5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

gcc 7 with -Os (optimize for size) takes the liberty to remove the code of
inline function entirely. This leads to undefined function references at link
time. Restore gcc original inline behaviour to fix this issue.

Fixes:
http://autobuild.buildroot.net/results/3c5/3c5b1d799dce3ba361d618330c242bf4eba76019/
http://autobuild.buildroot.net/results/09f/09f350b62e2486404b78222dce211400bb233000/
http://autobuild.buildroot.net/results/693/693960ed7c01622c756dcc929e83b3b713c16ccc/

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit f308e4420fde3d14d00f8d44f8ca376b232f57cb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squashfs/squashfs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 4f84872..e8321ed 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -59,7 +59,7 @@ HOST_SQUASHFS_MAKE_ARGS = \
 define SQUASHFS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE)    \
 		CC="$(TARGET_CC)"           \
-		EXTRA_CFLAGS="$(TARGET_CFLAGS)"   \
+		EXTRA_CFLAGS="$(TARGET_CFLAGS) -fgnu89-inline"   \
 		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
 		$(SQUASHFS_MAKE_ARGS) \
 		-C $(@D)/squashfs-tools/
