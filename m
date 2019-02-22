From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 22 Feb 2019 21:46:02 +0100
Subject: [Buildroot] [PATCH v3,1/1] package/reaver: fix build on m68k
Message-ID: <20190222204602.17088-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/935c038b921ffa0f185571de41223e4c201e964b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Thomas Petazzoni):
 - Remove static from title

Changes v1 -> v2 (after review of Peter Korsgaard):
 - Use upstream patch

 package/reaver/0001-fix-271.patch | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/reaver/0001-fix-271.patch

diff --git a/package/reaver/0001-fix-271.patch b/package/reaver/0001-fix-271.patch
new file mode 100644
index 0000000000..9f6b395120
--- /dev/null
+++ b/package/reaver/0001-fix-271.patch
@@ -0,0 +1,32 @@
+From c7040da3a9ff98cd8063b9d5b5a7721374186391 Mon Sep 17 00:00:00 2001
+From: rofl0r <retnyg@gmx.net>
+Date: Fri, 22 Feb 2019 17:38:24 +0000
+Subject: [PATCH] fix #271
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/t6x/reaver-wps-fork-t6x/commit/c7040da3a9ff98cd8063b9d5b5a7721374186391]
+---
+ src/wps/wps_attr_parse.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/wps/wps_attr_parse.c b/src/wps/wps_attr_parse.c
+index 30b0e79..d681b70 100644
+--- a/src/wps/wps_attr_parse.c
++++ b/src/wps/wps_attr_parse.c
+@@ -443,12 +443,12 @@ int wps_parse_msg(const struct wpabuf *msg, struct wps_parse_attr *attr)
+ 			 * Mac OS X 10.6 seems to be adding 0x00 padding to the
+ 			 * end of M1. Skip those to avoid interop issues.
+ 			 */
+-			int i;
+-			for (i = 0; i < end - pos; i++) {
++			uintptr_t i, left = end - pos;
++			for (i = 0; i < left; i++) {
+ 				if (pos[i])
+ 					break;
+ 			}
+-			if (i == end - pos) {
++			if (i == left) {
+ 				wpa_printf(MSG_DEBUG, "WPS: Workaround - skip "
+ 					   "unexpected message padding");
+ 				break;
-- 
2.14.1
