From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 25 Jul 2017 21:28:15 +0300
Subject: [Buildroot] [PATCH] squashfs: fix build with gcc 7
Message-ID: <51890a64ced8a223b72a52bdb0e98fc31f539a30.1501007295.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc 7 with -Os (optimize for size) takes the liberty to remove the code of
inline function entirely. This leads to undefined function references at link
time. Restore gcc original inline behaviour to fix this issue.

Fixes:
http://autobuild.buildroot.net/results/3c5/3c5b1d799dce3ba361d618330c242bf4eba76019/
http://autobuild.buildroot.net/results/09f/09f350b62e2486404b78222dce211400bb233000/
http://autobuild.buildroot.net/results/693/693960ed7c01622c756dcc929e83b3b713c16ccc/

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
The gcc doc[1] doesn't mention that feature of C99. A gcc bug, maybe?

[1] https://gcc.gnu.org/onlinedocs/gcc/Inline.html
---
 package/squashfs/squashfs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index db3f27648eb6..9599d892b261 100644
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
-- 
2.13.2
