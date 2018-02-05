From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  5 Feb 2018 23:42:13 +0100
Subject: [Buildroot] [PATCH-2017.11.x] refpolicy: add upstream patch fixing
 compile error related to implicit-fallthrough
Message-ID: <20180205224213.2036-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/958/958ff318cdbedb5b8641b376223491b85a75f084/
http://autobuild.buildroot.net/results/54e/54e240243aba31da33a2cbecdcc234b44f24dcf7/

fc-sort is a host utility compiled with -Werror, and for modern (>= 7.x) gcc
versions, Werror implies -Werror=implicit-fallthrough.

And an upstream patch fixing this issue.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-fc_sort-avoid-compiler-warning-error.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/refpolicy/0001-fc_sort-avoid-compiler-warning-error.patch

diff --git a/package/refpolicy/0001-fc_sort-avoid-compiler-warning-error.patch b/package/refpolicy/0001-fc_sort-avoid-compiler-warning-error.patch
new file mode 100644
index 0000000000..403daedd0d
--- /dev/null
+++ b/package/refpolicy/0001-fc_sort-avoid-compiler-warning-error.patch
@@ -0,0 +1,45 @@
+From 89b53fafa9904ba7a3df2ad94d01a485eae5366f Mon Sep 17 00:00:00 2001
+From: Guido Trentalancia <guido@trentalancia.net>
+Date: Tue, 6 Jun 2017 00:08:13 +0200
+Subject: [PATCH] fc_sort: avoid compiler warning/error
+
+Fix a "-Werror=implicit-fallthrough" compiler warning/error on
+the switch statement.
+
+This third version (v3) fixes a bug introduced in the first
+version and improves the style over the second version.
+
+Signed-off-by: Guido Trentalancia <guido@trentalancia.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ support/fc_sort.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/support/fc_sort.c b/support/fc_sort.c
+index 5561288a..66cdf39f 100644
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
+2.11.0
+
-- 
2.11.0
