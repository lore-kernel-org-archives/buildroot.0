From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jul 2016 23:55:49 +0200
Subject: [Buildroot] [PATCH] core: do not remove dl/ directory on distclean
Message-ID: <1468187749-3955-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, if the dl/ directory is the default location, it is removed
on distclean.

However, the dl/ directory is a precious location: it contains all the
tarballs downloaded so far, and some can be relatively huge, taking some
previous time to re-download, especially on slowish links.

Don't remove it on distclean. If the user really needs to regain some
space, leave it to him to clean this directory up manually.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Makefile b/Makefile
index 027f21c..5d840f6 100644
--- a/Makefile
+++ b/Makefile
@@ -901,9 +901,6 @@ clean:
 		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
 
 distclean: clean
-ifeq ($(DL_DIR),$(TOPDIR)/dl)
-	rm -rf $(DL_DIR)
-endif
 ifeq ($(O),output)
 	rm -rf $(O)
 endif
-- 
2.7.4
