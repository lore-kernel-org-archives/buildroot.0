From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 May 2018 22:32:01 +0200
Subject: [Buildroot] [git commit] libnss: backport upstream patch to fix
 build with gcc 8.x
Message-ID: <20180517203159.7ED998A455@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45cf64ca0c0070151e4321e218e20cae5d730797
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit backports upstream patch
https://github.com/nss-dev/nss/commit/f0ce70989526fc9a0223398c99ea0d09777ea5df
to our libnss package to fix the build with gcc 8.x.

Fixes:

  http://autobuild.buildroot.net/results/1ca35171200286fa032b24606aaa50de6a2d449e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-Avoid-stringop-truncation-warning-r-fran.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/libnss/0004-Bug-1438426-Avoid-stringop-truncation-warning-r-fran.patch b/package/libnss/0004-Bug-1438426-Avoid-stringop-truncation-warning-r-fran.patch
new file mode 100644
index 0000000000..c14880b117
--- /dev/null
+++ b/package/libnss/0004-Bug-1438426-Avoid-stringop-truncation-warning-r-fran.patch
@@ -0,0 +1,33 @@
+From f0ce70989526fc9a0223398c99ea0d09777ea5df Mon Sep 17 00:00:00 2001
+From: Martin Thomson <martin.thomson@gmail.com>
+Date: Thu, 15 Feb 2018 16:34:02 +1100
+Subject: [PATCH] Bug 1438426 - Avoid stringop-truncation warning, r=franziskus
+
+--HG--
+extra : rebase_source : 4ea1630d0da0ce3523309e3da33ee50961682242
+
+Upstream-commit: https://github.com/nss-dev/nss/commit/f0ce70989526fc9a0223398c99ea0d09777ea5df
+[Thomas: edited after git format-patch to add the nss/ prefix needed
+for the patch to apply properly on the source code extracted by the
+tarball.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ nss/coreconf/nsinstall/pathsub.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nss/coreconf/nsinstall/pathsub.c b/nss/coreconf/nsinstall/pathsub.c
+index a42a9f30a..c31a946f0 100644
+--- a/nss/coreconf/nsinstall/pathsub.c
++++ b/nss/coreconf/nsinstall/pathsub.c
+@@ -212,7 +212,7 @@ reversepath(char *inpath, char *name, int len, char *outpath)
+ 	    xchdir("..");
+ 	} else {
+ 	    cp -= 3;
+-	    strncpy(cp, "../", 3);
++	    memcpy(cp, "../", 3);
+ 	    xchdir(buf);
+ 	}
+     }
+-- 
+2.14.3
+
