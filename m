From: Martin Bark <martin@barkynet.com>
Date: Sun, 14 Jun 2015 17:12:53 +0100
Subject: [Buildroot] [PATCH 1/4] package/nodejs: Update to allow selecting
	node.js version
Message-ID: <1434298376-31893-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 .../{ => 0.10.38}/0001-remove-python-bz2-dependency.patch  |  0
 .../0002-gyp-force-link-command-to-use-CXX.patch           |  0
 .../nodejs/{ => 0.10.38}/0003-use-python-variable.patch    |  0
 .../0004-fix-build-error-without-OpenSSL-support.patch     |  0
 package/nodejs/Config.in                                   | 14 ++++++++++++++
 package/nodejs/nodejs.mk                                   |  2 +-
 6 files changed, 15 insertions(+), 1 deletion(-)
 rename package/nodejs/{ => 0.10.38}/0001-remove-python-bz2-dependency.patch (100%)
 rename package/nodejs/{ => 0.10.38}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
 rename package/nodejs/{ => 0.10.38}/0003-use-python-variable.patch (100%)
 rename package/nodejs/{ => 0.10.38}/0004-fix-build-error-without-OpenSSL-support.patch (100%)

diff --git a/package/nodejs/0001-remove-python-bz2-dependency.patch b/package/nodejs/0.10.38/0001-remove-python-bz2-dependency.patch
similarity index 100%
rename from package/nodejs/0001-remove-python-bz2-dependency.patch
rename to package/nodejs/0.10.38/0001-remove-python-bz2-dependency.patch
diff --git a/package/nodejs/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/0.10.38/0002-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/0.10.38/0002-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/0003-use-python-variable.patch b/package/nodejs/0.10.38/0003-use-python-variable.patch
similarity index 100%
rename from package/nodejs/0003-use-python-variable.patch
rename to package/nodejs/0.10.38/0003-use-python-variable.patch
diff --git a/package/nodejs/0004-fix-build-error-without-OpenSSL-support.patch b/package/nodejs/0.10.38/0004-fix-build-error-without-OpenSSL-support.patch
similarity index 100%
rename from package/nodejs/0004-fix-build-error-without-OpenSSL-support.patch
rename to package/nodejs/0.10.38/0004-fix-build-error-without-OpenSSL-support.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 3140683..8b0573a 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -22,6 +22,20 @@ comment "nodejs needs a toolchain w/ C++, threads"
 
 if BR2_PACKAGE_NODEJS
 
+choice
+	prompt "Node.js Version"
+	default BR2_BR2_PACKAGE_NODEJS_0_10_38
+	help
+	  Select the version of Node.js you wish to use.
+
+	config BR2_BR2_PACKAGE_NODEJS_0_10_38
+		bool "v0.10.38"
+
+endchoice
+
+config BR2_PACKAGE_NODEJS_VERSION_STRING
+	string
+	default "0.10.38"	if BR2_BR2_PACKAGE_NODEJS_0_10_38
 menu "Module Selection"
 
 config BR2_PACKAGE_NODEJS_NPM
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 5ee7714..59e03b0 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 0.10.38
+NODEJS_VERSION = $(call qstrip,$(BR2_PACKAGE_NODEJS_VERSION_STRING))
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
-- 
2.1.4
