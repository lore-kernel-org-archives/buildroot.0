From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Sep 2018 15:49:46 +0200
Subject: [Buildroot] [git commit] libsoup: add patch to fix build on hosts
 without Python 3.x
Message-ID: <20180907111608.025D77FEB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd7e62cf4ed6e760b14d6e34c71ff8db1f214be4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For no reason, the tld-parser.py script was changed from using
"python" to using "python3" in upstream commit
4b924e573da307436169d5ef7e04c0ab85b36ef9. This patch reverts this
change to fix the build of libsoup on systems that don't have Python
3.x installed. It avoids the need to add host-python3 as a dependency.

Furthermore, the tld-parser.py script has anyway been removed
upstream, and replaced by a dependency on a separate library providing
TLD information. Therefore, there is no risk of this particular script
becoming Python 3 only.

Fixes:

  http://autobuild.buildroot.net/results/91c2d6a1ca011787130db06695d6cd9e882f7258
  http://autobuild.buildroot.net/results/a318e595f02937534b3f8698ef4c04194a8b34af

Thanks to Asaf Kahlon <asafka7@gmail.com> for some initial
work/research on this build issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Revert-tld-parser-use-Python-3.patch      | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/libsoup/0001-Revert-tld-parser-use-Python-3.patch b/package/libsoup/0001-Revert-tld-parser-use-Python-3.patch
new file mode 100644
index 0000000000..c27ee986c6
--- /dev/null
+++ b/package/libsoup/0001-Revert-tld-parser-use-Python-3.patch
@@ -0,0 +1,27 @@
+From 015926c80fa3e9704f05cbc1ad17f0a877f8de09 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 1 Sep 2018 15:39:04 +0200
+Subject: [PATCH] Revert "tld-parser: use Python 3"
+
+This reverts commit 4b924e573da307436169d5ef7e04c0ab85b36ef9. The
+script runs just fine with Python 2.x, there is no reason to enforce
+using Python 3.x.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ libsoup/tld-parser.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/tld-parser.py b/libsoup/tld-parser.py
+index a743471a..5d9d2ba5 100755
+--- a/libsoup/tld-parser.py
++++ b/libsoup/tld-parser.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python3
++#!/usr/bin/env python
+ 
+ # Generate tld rules
+ # Copyright (C) 2012 Red Hat, Inc.
+-- 
+2.14.4
+
