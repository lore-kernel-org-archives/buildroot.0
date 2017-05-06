From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 May 2017 15:54:44 +0200
Subject: [Buildroot] [git commit] package/nodejs: remove support for
	coffeescript
Message-ID: <20170506135507.B1A917FAB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d999a7f249a26714260b37e00f95ce172b3025ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT has been deprecated.  To continue
using add coffee-script to BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL.

Fixes:
http://autobuild.buildroot.org/results/0e4fb1a615ab9654ad2b4b1274a34583e02aa44e
http://autobuild.buildroot.org/results/fabf2f5f25c62be615fd09e59e6ad9234385645f
http://autobuild.buildroot.org/results/8653d78a190df1e691f52a911d8153104c46226b
http://autobuild.buildroot.org/results/2fc7e5e64ad6ced02a47e5062176d316eed0f43b

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy         | 8 ++++++++
 package/nodejs/Config.in | 7 -------
 package/nodejs/nodejs.mk | 4 +---
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 501581c..3e043d4 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.05"
 
+config BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT
+	bool "CoffeeScript option has been removed"
+	select BR2_LEGACY
+	help
+	  The option to enable NodeJS CoffeeScript has been removed.
+	  To continue using it, add "coffee-script" to
+	  BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL.
+
 config BR2_PACKAGE_NODEJS_MODULES_EXPRESS
 	bool "Express web application framework option has been removed"
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
