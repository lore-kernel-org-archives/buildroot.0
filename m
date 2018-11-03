From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat,  3 Nov 2018 01:56:23 -0300
Subject: [Buildroot] [PATCH 4/5] check-package: ignore external.mk
In-Reply-To: <20181103045624.31059-1-ricardo.martincoski@gmail.com>
References: <20181103045624.31059-1-ricardo.martincoski@gmail.com>
Message-ID: <20181103045624.31059-5-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 utils/check-package | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/check-package b/utils/check-package
index aa6993dabd..ebd82cba95 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -71,6 +71,9 @@ def get_lib_from_filename(fname):
             return None
         if DO_NOT_CHECK_INTREE.match(fname):
             return None
+    else:
+        if os.path.basename(fname) == "external.mk" and os.path.exists(fname[:-2] + "desc"):
+            return None
     if CONFIG_IN_FILENAME.search(fname):
         return checkpackagelib.lib_config
     if fname.endswith(".hash"):
-- 
2.17.1
