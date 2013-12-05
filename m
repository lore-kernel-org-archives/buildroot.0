From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  5 Dec 2013 19:41:09 +0100
Subject: [Buildroot] [PATCH] manual: do not generate .pyc files
Message-ID: <1386268869-17353-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Python saves a pre-compiled support/scripts/kconfiglib.pyc file
side-to-side with the corresponding .py file.

This does not work if the Buildroot source tree is read-only (but
this is not an error for Python, which keep going OK).

But this may cause  issues for out-of-tree builds in case the same
Buildroot source tree is shared by many builds.

Also, 'make clean' currently does not clean this file, and out-of-tree
builds can remove it either, at the risk of causing issues for other
out-of-tree builds running at the same time.

Just tell Python not to generate .pyc files:
  - call the script via python, don;t use the sha-bang
  - thus, make the script non-executable, and remove the sha-bang

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/manual.mk               | 2 +-
 support/scripts/gen-manual-lists.py | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)
 mode change 100755 => 100644 support/scripts/gen-manual-lists.py

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 0926566..f0bbff8 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -1,7 +1,7 @@
 manual-update-lists: manual-check-dependencies-lists
 	$(Q)$(call MESSAGE,"Updating the manual lists...")
 	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(O)/docs/manual/.build \
-		$(TOPDIR)/support/scripts/gen-manual-lists.py
+		python -B $(TOPDIR)/support/scripts/gen-manual-lists.py
 
 # we can't use suitable-host-package here because that's not available in
 # the context of 'make release'
diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
old mode 100755
new mode 100644
index 4546e07..4562d7e
--- a/support/scripts/gen-manual-lists.py
+++ b/support/scripts/gen-manual-lists.py
@@ -1,5 +1,3 @@
-#!/usr/bin/env python
-##
 ## gen-manual-lists.py
 ##
 ## This script generates the following Buildroot manual appendices:
-- 
1.8.1.2
