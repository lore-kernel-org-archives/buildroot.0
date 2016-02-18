From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 18 Feb 2016 09:05:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: security bump for 0.10.x to
	version 0.10.42
Message-ID: <1455782706-8599-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes security vulnerabilites [1]:
 - CVE-2016-2086
 - CVE-2016-2216

Also switch to the xz compressed tar file now available for v0.10 builds from
v0.10.42 onward.

[1] https://nodejs.org/en/blog/vulnerability/february-2016-security-releases/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../{0.10.41 => 0.10.42}/0001-remove-python-bz2-dependency.patch      | 0
 .../{0.10.41 => 0.10.42}/0002-gyp-force-link-command-to-use-CXX.patch | 0
 package/nodejs/{0.10.41 => 0.10.42}/0003-use-python-variable.patch    | 0
 .../{0.10.41 => 0.10.42}/0004-fix-musl-USE-MISC-build-issue.patch     | 0
 .../nodejs/{0.10.41 => 0.10.42}/0005-Fix-support-for-uClibc-ng.patch  | 0
 package/nodejs/Config.in                                              | 2 +-
 package/nodejs/nodejs.hash                                            | 4 ++--
 package/nodejs/nodejs.mk                                              | 4 ----
 8 files changed, 3 insertions(+), 7 deletions(-)
 rename package/nodejs/{0.10.41 => 0.10.42}/0001-remove-python-bz2-dependency.patch (100%)
 rename package/nodejs/{0.10.41 => 0.10.42}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
 rename package/nodejs/{0.10.41 => 0.10.42}/0003-use-python-variable.patch (100%)
 rename package/nodejs/{0.10.41 => 0.10.42}/0004-fix-musl-USE-MISC-build-issue.patch (100%)
 rename package/nodejs/{0.10.41 => 0.10.42}/0005-Fix-support-for-uClibc-ng.patch (100%)

diff --git a/package/nodejs/0.10.41/0001-remove-python-bz2-dependency.patch b/package/nodejs/0.10.42/0001-remove-python-bz2-dependency.patch
similarity index 100%
rename from package/nodejs/0.10.41/0001-remove-python-bz2-dependency.patch
rename to package/nodejs/0.10.42/0001-remove-python-bz2-dependency.patch
diff --git a/package/nodejs/0.10.41/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/0.10.42/0002-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/0.10.41/0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/0.10.42/0002-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/0.10.41/0003-use-python-variable.patch b/package/nodejs/0.10.42/0003-use-python-variable.patch
similarity index 100%
rename from package/nodejs/0.10.41/0003-use-python-variable.patch
rename to package/nodejs/0.10.42/0003-use-python-variable.patch
diff --git a/package/nodejs/0.10.41/0004-fix-musl-USE-MISC-build-issue.patch b/package/nodejs/0.10.42/0004-fix-musl-USE-MISC-build-issue.patch
similarity index 100%
rename from package/nodejs/0.10.41/0004-fix-musl-USE-MISC-build-issue.patch
rename to package/nodejs/0.10.42/0004-fix-musl-USE-MISC-build-issue.patch
diff --git a/package/nodejs/0.10.41/0005-Fix-support-for-uClibc-ng.patch b/package/nodejs/0.10.42/0005-Fix-support-for-uClibc-ng.patch
similarity index 100%
rename from package/nodejs/0.10.41/0005-Fix-support-for-uClibc-ng.patch
rename to package/nodejs/0.10.42/0005-Fix-support-for-uClibc-ng.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index cdf7705..7324f6d 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -44,7 +44,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
 	default "5.5.0"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
-	default "0.10.41"
+	default "0.10.42"
 
 menu "Module Selection"
 
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index e65f14a..a3faa5a 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From upstream URL: http://nodejs.org/dist/v0.10.41/SHASUMS256.txt
-sha256	79f694e2a5c42543b75d0c69f6860499d7593136d0f6b59e7163b9e66fb2c995  node-v0.10.41.tar.gz
+# From upstream URL: http://nodejs.org/dist/v0.10.42/SHASUMS256.txt
+sha256  9b4cc1b5bc397d80dfe217625b04bb6212a3b5a8b1e0eb36000a30d7ae567b8a  node-v0.10.42.tar.xz
 
 # From upstream URL: http://nodejs.org/dist/v5.5.0/SHASUMS256.txt
 sha256  9c46b4dc9548e43826f71f6571f56e39783c456b9516045b496ea73321731e22  node-v5.5.0.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 37de331..63ae463 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,11 +5,7 @@
 ################################################################################
 
 NODEJS_VERSION = $(call qstrip,$(BR2_PACKAGE_NODEJS_VERSION_STRING))
-ifeq ($(findstring 0.10.,$(NODEJS_VERSION)),)
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
-else
-NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
-endif
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
-- 
2.7.1
