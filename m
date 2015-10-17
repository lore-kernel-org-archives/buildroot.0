From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 16:32:41 +0200
Subject: [Buildroot] [git commit] ccache: allow for BR2_CCACHE_DIR
	environment override
Message-ID: <20151017143244.CEF1681D36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3901cb515762aee9b6af67216419a9c5b83eec3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow the BR2_CCACHE_DIR .config option to be overriden by the
BR2_CCACHE_DIR env variable.
This is useful for big projects where in some cases the developers home
directory might be a NFS mount (slow) and real production builds aren't.

Update documentation accordingly as well.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                     |    6 ++++--
 docs/manual/common-usage.txt |    3 +++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index c871393..dd8959f 100644
--- a/Makefile
+++ b/Makefile
@@ -183,7 +183,9 @@ endif
 ifneq ($(BR2_DL_DIR),)
 DL_DIR := $(BR2_DL_DIR)
 endif
-
+ifneq ($(BR2_CCACHE_DIR),)
+BR_CACHE_DIR := $(BR2_CCACHE_DIR)
+endif
 
 # Need that early, before we scan packages
 # Avoids doing the $(or...) everytime
@@ -371,7 +373,7 @@ TARGET_DIR_WARNING_FILE = $(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
 
 ifeq ($(BR2_CCACHE),y)
 CCACHE := $(HOST_DIR)/usr/bin/ccache
-BR_CACHE_DIR = $(call qstrip,$(BR2_CCACHE_DIR))
+BR_CACHE_DIR ?= $(call qstrip,$(BR2_CCACHE_DIR))
 export BR_CACHE_DIR
 HOSTCC := $(CCACHE) $(HOSTCC)
 HOSTCXX := $(CCACHE) $(HOSTCXX)
diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 3ae05c7..bca99f4 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -84,6 +84,9 @@ to +make+ or set in the environment:
   configuration interface, so through the Buildroot +.config+ file; this
   is the recommended way of setting it.
   +
+* +BR2_CCACHE_DIR+ to override the directory where
+  Buildroot stores the cached files when using ccache.
+  +
 * +BR2_DL_DIR+ to override the directory in which
   Buildroot stores/retrieves downloaded files
   +
