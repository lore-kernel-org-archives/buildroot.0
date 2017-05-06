From: Martin Bark <martin@barkynet.com>
Date: Sat,  6 May 2017 14:19:13 +0100
Subject: [Buildroot] [PATCH 2/3] package/nodejs: remove support for
	coffeescript
In-Reply-To: <1494076754-3224-1-git-send-email-martin@barkynet.com>
References: <1494076754-3224-1-git-send-email-martin@barkynet.com>
Message-ID: <1494076754-3224-2-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT has been deprecated.  To continue
using add coffee-script to BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL.

Fixes:
http://autobuild.buildroot.org/results/0e4fb1a615ab9654ad2b4b1274a34583e02aa44e
http://autobuild.buildroot.org/results/fabf2f5f25c62be615fd09e59e6ad9234385645f
http://autobuild.buildroot.org/results/8653d78a190df1e691f52a911d8153104c46226b
http://autobuild.buildroot.org/results/2fc7e5e64ad6ced02a47e5062176d316eed0f43b

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 Config.in.legacy         | 7 +++++++
 package/nodejs/Config.in | 7 -------
 package/nodejs/nodejs.mk | 4 +---
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b0e9254..95c532f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.05"
 
+config BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT
+	bool "CoffeeScript has been removed"
+	select BR2_LEGACY
+	help
+	  Support for CoffeeScript has been removed.  To continue using
+	  add coffee-script to BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL.
+
 config BR2_PACKAGE_NODEJS_MODULES_EXPRESS
 	bool "Express web application framework has been removed"
 	select BR2_LEGACY
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index d5034cc..3022f9c 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -44,13 +44,6 @@ config BR2_PACKAGE_NODEJS_NPM
 
 	  Note that NPM is always built for the buildroot host.
 
-config BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT
-	bool "CoffeeScript"
-	help
-	  CoffeeScript is a little language that compiles into JavaScript.
-
-	  http://www.coffeescript.org
-
 config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL
 	string "Additional modules"
 	help
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index ba6ee4e..84f0e2e 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -139,11 +139,9 @@ define NODEJS_BUILD_CMDS
 endef
 
 #
-# Build the list of modules to install based on the booleans for
-# popular modules, as well as the "additional modules" list.
+# Build the list of modules to install.
 #
 NODEJS_MODULES_LIST= $(call qstrip,\
-	$(if $(BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT),coffee-script) \
 	$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL))
 
 # Define NPM for other packages to use
-- 
2.7.4
