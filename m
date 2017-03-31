From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 09:12:23 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] system: do not overwrite
	/bin/sh Busybox symlink
Message-ID: <20170331071607.706F0826C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1244b189543a11f1d712caf12efb7ee8703eba97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The BR2_SYSTEM_BIN_SH hidden option defines to what binary the /bin/sh
symlinks should point to. If busybox is chosen, then /bin/sh is created
to point to /bin/busybox.

This works fine with the default installation mode of Busybox, but it
fails with the upcoming "individual binaries" mode, in which each applet
is installed as its own binary, and /bin/busybox doesn't exist: we get
/bin/sh as a broken symlink to /bin/busybox.

Since Busybox already installs its own /bin/sh symlink, properly
pointing to /bin/ash or /bin/hush depending on the selected shell, it
doesn't make sense for the BR2_SYSTEM_BIN_SH logic to override
this. Just let Busybox install its own /bin/sh by making
BR2_SYSTEM_BIN_SH empty when Busybox shell is selected as /bin/sh.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit fc91501e6b32ef1b015ac9b0fbf6d64aa1ce0162)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/skeleton/skeleton.mk | 2 ++
 system/Config.in             | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 1000161..9940944 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -203,10 +203,12 @@ define SKELETON_BIN_SH
 	rm -f $(TARGET_DIR)/bin/sh
 endef
 else
+ifneq ($(SKELETON_TARGET_GENERIC_BIN_SH),)
 define SKELETON_BIN_SH
 	ln -sf $(SKELETON_TARGET_GENERIC_BIN_SH) $(TARGET_DIR)/bin/sh
 endef
 endif
+endif
 TARGET_FINALIZE_HOOKS += SKELETON_BIN_SH
 
 ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
diff --git a/system/Config.in b/system/Config.in
index 3ddf843..b47ae43 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -298,7 +298,6 @@ endchoice # /bin/sh
 
 config BR2_SYSTEM_BIN_SH
 	string
-	default "busybox" if BR2_SYSTEM_BIN_SH_BUSYBOX
 	default "bash"    if BR2_SYSTEM_BIN_SH_BASH
 	default "dash"    if BR2_SYSTEM_BIN_SH_DASH
 	default "mksh"    if BR2_SYSTEM_BIN_SH_MKSH
