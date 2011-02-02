From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Feb 2011 10:05:56 -0300
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce HOST_DIR option
Message-ID: <1296651957-1633-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow the user to define HOST_DIR in the config menu.

This way when building an internal toolchain a separate (maybe shared)
output directory may be defined and the toolchain can be used by
multiple users and/or projects.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in |   10 ++++++++++
 Makefile  |    4 ++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index df0c7ce..af44b89 100644
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
index 3ecc597..7bd49f4 100644
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
