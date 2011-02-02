From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Feb 2011 22:46:57 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain: introduce HOST_DIR
	option
Message-ID: <20110202214719.E57A68F30C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a2b4f7fbbdbd491c7ed8e87ea0ff2584ab8bde81
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow the user to define HOST_DIR in the config menu.

This way when building an internal toolchain a separate (maybe shared)
output directory may be defined and the toolchain can be used by
multiple users and/or projects.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in |   10 ++++++++++
 Makefile  |    4 ++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 423499a..af26bbe 100644
--- a/Config.in
+++ b/Config.in
@@ -72,6 +72,16 @@ config BR2_DL_DIR
 
 	  The default is $(TOPDIR)/dl
 
+config BR2_HOST_DIR
+	string "Host dir"
+	default "$(BASE_DIR)/host"
+	help
+	  Directory to store all the binary files that are built for the host.
+	  This includes the cross compilation toolchain when building the
+	  internal buildroot toolchain.
+
+	  The default is $(BASE_DIR)/host
+
 menu "Mirrors and Download locations"
 
 config BR2_PRIMARY_SITE
diff --git a/Makefile b/Makefile
index 9563740..914d2ed 100644
--- a/Makefile
+++ b/Makefile
@@ -274,8 +274,8 @@ TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
 GNU_TARGET_SUFFIX:=-$(call qstrip,$(BR2_GNU_TARGET_SUFFIX))
 
-# packages compiled for the host goes here
-HOST_DIR:=$(BASE_DIR)/host
+# packages compiled for the host go here
+HOST_DIR:=$(call qstrip,$(BR2_HOST_DIR))
 
 # stamp (dependency) files go here
 STAMP_DIR:=$(BASE_DIR)/stamps
-- 
1.7.3.4
