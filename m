From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 3 Aug 2019 17:17:29 +0200
Subject: [Buildroot] [git commit] check-package: ignore external.mk
Message-ID: <20190803152016.B81E28D4FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75d6c2ba96bcfd796210f7ad73f71543996c4a04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The external.mk file in a br2-external usually contains raw makefile
targets. This file is common code and not a package recipe so it should
not be tested against the code-style of a package .mk file.

When using this script to check files in a br2-external tree, usually
the user is responsible for not passing files that check-package do not
understand. But external.mk is special because it is part of the
br2-external structure, so it is likely someone expects it to be
checkable by an in-tree script.

Instead of adding another blob to the manual, just ignore this file.
Only do that when a br2-external is being tested (so with option -b
passed to the script) and also check that it is on the root path of the
br2-external to allow someone to have a package called external.

Reported on bug #11271.

Reported-by: Vitaliy Lotorev <lotorev@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Arnout: wrap at 80 columns]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/check-package | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/check-package b/utils/check-package
index f09aaeea03..52317e02f4 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -73,6 +73,10 @@ def get_lib_from_filename(fname):
             return None
         if DO_NOT_CHECK_INTREE.match(fname):
             return None
+    else:
+        if os.path.basename(fname) == "external.mk" and \
+           os.path.exists(fname[:-2] + "desc"):
+            return None
     if CONFIG_IN_FILENAME.search(fname):
         return checkpackagelib.lib_config
     if fname.endswith(".hash"):
