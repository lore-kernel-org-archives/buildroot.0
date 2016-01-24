From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 24 Jan 2016 11:19:53 -0200
Subject: [Buildroot] [PATCH v3 2/2] docs/manual: patches that change files
	with spaces in the name
In-Reply-To: <1453641593-31129-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1453641593-31129-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <1453641593-31129-3-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a patch changes one or more files with spaces in the name, a
workaround must be applied to ensure the build using old versions of
patch in the host system.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v2 -> v3:
 - say "post-extract" instead of "POST_EXTRACT"
 - there is no strong argument to use post-extract instead of pre-patch
   (Arnout)
 - Arnout suggested to drop the patch to the manual:
   "I think that this situation is so exotic that it doesn't warrant a
   mention in the manual. The manual is already long and complicated
   enough."
   I updated the manual for now because it is a separate patch that can
   be Rejected if others agree with Arnout.

Changes v1 -> v2:
 - update the manual entry
 - use 1 or 2 hooks to rename the file that contains spaces
   (based on the suggestion to use a symlink from Thomas DS)
 - change the patch file to be applied on the renamed file

Symlink and hard link cannot be used because patch unlinks them.
So I renamed the file before patching it.
The file can be renamed back when needed.

Probably this patch will need some rewording.
It's my first patch to the manual.
I tested using 'make manual-html'
---
 docs/manual/patch-policy.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index 0b4604e..8e6b3ee 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -134,6 +134,22 @@ AC_PROG_MAKE_SET
 +AM_CONDITIONAL([CXX_WORKS], [test "x$rw_cv_prog_cxx_works" = "xyes"])
 ---------------
 
+==== Patches that change files with spaces in the name
+
+When a patch changes one or more files with spaces in the name, a workaround
+must be applied to ensure the build using old versions of +patch+ in the
+host system.
+
+. Add a pre-patch or a post-extract hook to rename the file to be patched,
+  replacing spaces with underscores;
+
+. Create the patch file using the usual diff command, but both
+  +package-version.orig/+ and +package-version/+ must have the file renamed
+  to replace the spaces with underscores;
+
+. If the file must keep its name, add a post-patch hook to rename the patched
+  file to its original name;
+
 === Integrating patches found on the Web
 
 When integrating a patch of which you are not the author, you have to
-- 
1.9.1
