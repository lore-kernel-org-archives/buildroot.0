From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Dec 2010 16:06:03 -0300
Subject: [Buildroot] [PATCH 07/13] toolchain: move sysroot to host dir
In-Reply-To: <1292353569-30172-1-git-send-email-gustavo@zacarias.com.ar>
References: <1292353569-30172-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1292353569-30172-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Drop the BR2_STAGING_DIR option
* Hardcode STAGING_DIR to $(HOST_DIR)/usr/TUPLE/sysroot

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in |   13 -------------
 Makefile  |    4 ++--
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/Config.in b/Config.in
index f6e894e..c1bfa5c 100644
--- a/Config.in
+++ b/Config.in
@@ -73,19 +73,6 @@ config BR2_DL_DIR
 
 	  The default is $(TOPDIR)/dl
 
-config BR2_STAGING_DIR
-	string "Toolchain and header file location?"
-	default "$(BASE_DIR)/staging"
-	help
-	  This is the location where the toolchain will be installed.  The
-	  toolchain will not work if it is moved from this location.
-	  Therefore, if you wish to package up a uClibc toolchain, it is
-	  important that is is set to the final location where the toolchain
-	  will be used.
-
-	  Most people will leave this set to the default value of
-	  "$(BASE_DIR)/staging".
-
 source	"target/device/Config.in.mirrors"
 
 config BR2_JLEVEL
diff --git a/Makefile b/Makefile
index f6ab07e..d7d6f8d 100644
--- a/Makefile
+++ b/Makefile
@@ -268,8 +268,6 @@ TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
 GNU_TARGET_SUFFIX:=-$(call qstrip,$(BR2_GNU_TARGET_SUFFIX))
 
-STAGING_DIR:=$(call qstrip,$(BR2_STAGING_DIR))
-
 # packages compiled for the host goes here
 HOST_DIR:=$(BASE_DIR)/host
 
@@ -294,6 +292,8 @@ endif
 include toolchain/Makefile.in
 include package/Makefile.in
 
+STAGING_DIR:=$(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sysroot
+
 #############################################################
 #
 # You should probably leave this stuff alone unless you know
-- 
1.7.2.2
