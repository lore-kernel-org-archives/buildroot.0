From: Martin Bark <martin@barkynet.com>
Date: Sat, 27 Jun 2015 03:01:34 +0100
Subject: [Buildroot] [v2 2/6] package/nodejs: Update to allow selecting
	node.js version
In-Reply-To: <1435370498-25473-1-git-send-email-martin@barkynet.com>
References: <1435370498-25473-1-git-send-email-martin@barkynet.com>
Message-ID: <1435370498-25473-2-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changes v1 -> v2
 - Updated to node.js v0.10.39

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 .../{ => 0.10.39}/0001-remove-python-bz2-dependency.patch  |  0
 .../0002-gyp-force-link-command-to-use-CXX.patch           |  0
 .../nodejs/{ => 0.10.39}/0003-use-python-variable.patch    |  0
 .../0004-fix-build-error-without-OpenSSL-support.patch     |  0
 package/nodejs/Config.in                                   | 14 ++++++++++++++
 package/nodejs/nodejs.mk                                   |  2 +-
 6 files changed, 15 insertions(+), 1 deletion(-)
 rename package/nodejs/{ => 0.10.39}/0001-remove-python-bz2-dependency.patch (100%)
 rename package/nodejs/{ => 0.10.39}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
 rename package/nodejs/{ => 0.10.39}/0003-use-python-variable.patch (100%)
 rename package/nodejs/{ => 0.10.39}/0004-fix-build-error-without-OpenSSL-support.patch (100%)

diff --git a/package/nodejs/0001-remove-python-bz2-dependency.patch b/package/nodejs/0.10.39/0001-remove-python-bz2-dependency.patch
similarity index 100%
rename from package/nodejs/0001-remove-python-bz2-dependency.patch
rename to package/nodejs/0.10.39/0001-remove-python-bz2-dependency.patch
diff --git a/package/nodejs/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/0.10.39/0002-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/0.10.39/0002-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/0003-use-python-variable.patch b/package/nodejs/0.10.39/0003-use-python-variable.patch
similarity index 100%
rename from package/nodejs/0003-use-python-variable.patch
rename to package/nodejs/0.10.39/0003-use-python-variable.patch
diff --git a/package/nodejs/0004-fix-build-error-without-OpenSSL-support.patch b/package/nodejs/0.10.39/0004-fix-build-error-without-OpenSSL-support.patch
similarity index 100%
rename from package/nodejs/0004-fix-build-error-without-OpenSSL-support.patch
rename to package/nodejs/0.10.39/0004-fix-build-error-without-OpenSSL-support.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 3140683..61419fd 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -22,6 +22,20 @@ comment "nodejs needs a toolchain w/ C++, threads"
 
 if BR2_PACKAGE_NODEJS
 
+choice
+	prompt "Node.js Version"
+	default BR2_BR2_PACKAGE_NODEJS_0_10_39
+	help
+	  Select the version of Node.js you wish to use.
+
+	config BR2_BR2_PACKAGE_NODEJS_0_10_39
+		bool "v0.10.39"
+
+endchoice
+
+config BR2_PACKAGE_NODEJS_VERSION_STRING
+	string
+	default "0.10.39"	if BR2_BR2_PACKAGE_NODEJS_0_10_39
 menu "Module Selection"
 
 config BR2_PACKAGE_NODEJS_NPM
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 4293c70..59e03b0 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 0.10.39
+NODEJS_VERSION = $(call qstrip,$(BR2_PACKAGE_NODEJS_VERSION_STRING))
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
-- 
2.1.4
