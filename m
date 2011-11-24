From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 24 Nov 2011 23:07:09 +0100
Subject: [Buildroot] [git commit] lsof: fix permission of extracted files
Message-ID: <20111124221422.42C2F8F617@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f930d2d7f6ca80d9ccc9a38e631704c1b931f43
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #4369

Default tar permissiong make it impossible to apply patches to some of
the files.

Change extraction command to skip permissions by using "-O" tar option
and a pipe tar chain.

Solution suggested by: Arnout Vandecappelle <arnout@mind.be>

[Peter: rework to use define as suggested by Thomas]
Signed-off-by: Damian Kaczmarek <damian@veritymedical.co.uk>
Tested-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    4 ++++
 package/lsof/lsof.mk |    9 ++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 289a6b2..9fbfe9f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,6 +9,10 @@
 	Updated/fixed packages: busybox, freetype, mplayer, opencv,
 	rsyslog, xapp_xf86dga
 
+	Issues resolved (http://bugs.uclibc.org):
+
+	#4369: Fix permissions on untared lsof archive
+
 2011.11-rc2, Released November 18th, 2011:
 
 	Fixes all over the tree and new features.
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index ff76f92..c07fb2d 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -33,13 +33,12 @@ endef
 endif
 
 # The .tar.bz2 contains another .tar, which contains the source code.
-define LSOF_EXTRACT_TAR
-	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -xf $(@D)/lsof_$(LSOF_VERSION)_src.tar -C $(@D)
-	rm -f $(@D)/lsof_$(LSOF_VERSION)_src.tar
+define LSOF_EXTRACT_CMDS
+        $(INFLATE.bz2) $(DL_DIR)/$(LSOF_SOURCE) | \
+                $(TAR) -O $(TAR_OPTIONS) - lsof_$(LSOF_VERSION)/lsof_$(LSOF_VERSION)_src.tar | \
+        $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LSOF_DIR) $(TAR_OPTIONS) -
 endef
 
-LSOF_POST_EXTRACT_HOOKS += LSOF_EXTRACT_TAR
-
 define LSOF_CONFIGURE_CMDS
 	(cd $(@D) ; \
 		echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" \
