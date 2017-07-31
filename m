From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 19:28:52 +0200
Subject: [Buildroot] [git commit] squashfs: fix build with gcc 7
Message-ID: <20170731172603.2224F80404@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f308e4420fde3d14d00f8d44f8ca376b232f57cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/squashfs/squashfs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index db3f276..9599d89 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -59,7 +59,7 @@ HOST_SQUASHFS_MAKE_ARGS = \
 define SQUASHFS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) \
 		CC="$(TARGET_CC)" \
-		EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
+		EXTRA_CFLAGS="$(TARGET_CFLAGS) -fgnu89-inline" \
 		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
 		$(SQUASHFS_MAKE_ARGS) \
 		-C $(@D)/squashfs-tools/
