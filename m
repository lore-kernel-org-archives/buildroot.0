From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  6 Feb 2018 12:16:40 -0500
Subject: [Buildroot] [PATCH v2 1/1] 2017.11.x: fix refpolicy build failure
Message-ID: <20180206171640.12055-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to fix the fallthrough.

Taken from upstream:
https://github.com/TresysTechnology/refpolicy/commit/89b53fafa9904ba7a3df2ad94d01a485eae5366f

Fixes:
http://autobuild.buildroot.net/results/54e240243aba31da33a2cbecdcc234b44f24dcf7
Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Added upstream commit link to the patch notes (Matthew Weber)
  - Changed patch to full upstream patch.

 .../refpolicy/0002-fix-fall-through-error.patch    | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/refpolicy/0002-fix-fall-through-error.patch

diff --git a/package/refpolicy/0002-fix-fall-through-error.patch b/package/refpolicy/0002-fix-fall-through-error.patch
new file mode 100644
index 0000000000..d147507bac
--- /dev/null
+++ b/package/refpolicy/0002-fix-fall-through-error.patch
@@ -0,0 +1,48 @@
+From 60a0fad3daebaa8fda5b79817b1b6e9cb01a1ad1 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Tue, 6 Feb 2018 12:12:36 -0500
+Subject: [PATCH] fc_sort: avoid compiler warning/error
+
+Fix a "-Werror=implicit-fallthrough" compiler warning/error on
+the switch statement.
+
+This third version (v3) fixes a bug introduced in the first
+version and improves the style over the second version.
+
+Upstream Commit:
+https://github.com/TresysTechnology/refpolicy/commit/89b53fafa9904ba7a3df2ad94d01a485eae5366f
+
+Signed-off-by: Guido Trentalancia <guido@trentalancia.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ support/fc_sort.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/support/fc_sort.c b/support/fc_sort.c
+index 5561288..66cdf39 100644
+--- a/support/fc_sort.c
++++ b/support/fc_sort.c
+@@ -292,14 +292,16 @@ void fc_fill_data(file_context_node_t *fc_node)
+ 			/* If a escape character is found,
+ 			 *  skip the next character. */
+ 			c++;
++			break;
+ 		default:
+-			/* If no meta character has been found yet,
+-			 *  add one to the stem length. */
+-			if (!fc_node->meta)
+-				fc_node->stem_len++;
+ 			break;
+ 		}
+ 
++		/* If no meta character has been found yet,
++		 * add one to the stem length. */
++		if (!fc_node->meta)
++			fc_node->stem_len++;
++
+ 		fc_node->str_len++;
+ 		c++;
+ 	}
+-- 
+2.14.3
+
-- 
2.14.3
