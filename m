From: Damian Kaczmarek <damian@veritymedical.co.uk>
Date: Fri, 21 Oct 2011 00:05:23 +0200
Subject: [Buildroot] [PATCH 1/3] lsof: fix permission of extracted files
Message-ID: <1319148323-26856-1-git-send-email-damian@veritymedical.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Default tar permissiong make it impossible to apply patches to some of the files

Change extraction command to skip permissions by using "-O" tar option
and a pipe tar chain. Solution suggested by: Arnout Vandecappelle <arnout@mind.be>
---
 package/lsof/lsof.mk |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index bfdfee3..2de0034 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -33,13 +33,11 @@ endef
 endif
 
 # The .tar.bz2 contains another .tar, which contains the source code.
-define LSOF_EXTRACT_TAR
-	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -xf $(@D)/lsof_$(LSOF_VERSION)_src.tar -C $(@D)
-	chmod +w -R $(@D)
-	rm -f $(@D)/lsof_$(LSOF_VERSION)_src.tar
-endef
+LSOF_EXTRACT_CMDS = \
+        $(INFLATE.bz2) $(DL_DIR)/$(LSOF_SOURCE) | \
+                $(TAR) -O $(TAR_OPTIONS) - lsof_$(LSOF_VERSION)/lsof_$(LSOF_VERSION)_src.tar | \
+        $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LSOF_DIR) $(TAR_OPTIONS) -
 
-LSOF_POST_EXTRACT_HOOKS += LSOF_EXTRACT_TAR
 
 define LSOF_CONFIGURE_CMDS
 	(cd $(@D) ; \
-- 
1.7.3.4
