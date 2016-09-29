From: Martin Bark <martin@barkynet.com>
Date: Thu, 29 Sep 2016 20:12:46 +0100
Subject: [Buildroot] [PATCH 2/2] package/nodejs: bump version to 6.7.0
In-Reply-To: <1475176366-30034-1-git-send-email-martin@barkynet.com>
References: <1475176366-30034-1-git-send-email-martin@barkynet.com>
Message-ID: <1475176366-30034-2-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://nodejs.org/en/blog/release/v6.7.0/

The patches from 6.2.1 have been copied to 6.7.0 with the following
changes:

- Add 0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
  to disable the new V8 inspector when openssl is not included.

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 .../0001-gyp-force-link-command-to-use-CXX.patch   |  0
 ...-don-t-build-when-ssl-support-is-disabled.patch | 35 ++++++++++++++++++++++
 package/nodejs/Config.in                           |  2 +-
 package/nodejs/nodejs.hash                         |  4 +--
 4 files changed, 38 insertions(+), 3 deletions(-)
 rename package/nodejs/{6.2.1 => 6.7.0}/0001-gyp-force-link-command-to-use-CXX.patch (100%)
 create mode 100644 package/nodejs/6.7.0/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch

diff --git a/package/nodejs/6.2.1/0001-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/6.7.0/0001-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/6.2.1/0001-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/6.7.0/0001-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/6.7.0/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch b/package/nodejs/6.7.0/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
new file mode 100644
index 0000000..c07cbf8
--- /dev/null
+++ b/package/nodejs/6.7.0/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
@@ -0,0 +1,35 @@
+From 7fa541f6c0a31e3ddcab6ea85040b531bbaa4651 Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Tue, 12 Jul 2016 19:03:28 +0100
+Subject: [PATCH] inspector: don't build when ssl support is disabled
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ node.gyp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/node.gyp b/node.gyp
+index 8a8bd00..fdccd60 100644
+--- a/node.gyp
++++ b/node.gyp
+@@ -302,7 +302,7 @@
+             'deps/v8/src/third_party/vtune/v8vtune.gyp:v8_vtune'
+           ],
+         }],
+-        [ 'v8_inspector=="true"', {
++        [ 'v8_inspector=="true" and node_use_openssl =="true"', {
+           'defines': [
+             'HAVE_INSPECTOR=1',
+             'V8_INSPECTOR_USE_STL=1',
+@@ -828,7 +828,7 @@
+       ],
+ 
+       'conditions': [
+-        ['v8_inspector=="true"', {
++        ['v8_inspector=="true" and node_use_openssl =="true"', {
+           'sources': [
+             'src/inspector_socket.cc',
+             'test/cctest/test_inspector_socket.cc'
+-- 
+2.7.4
+
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index b591b59..976be50 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -43,7 +43,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "6.2.1"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	default "6.7.0"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	default "0.10.47"
 
 config BR2_PACKAGE_NODEJS_NPM
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 97f2755..f334a47 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.47/SHASUMS256.txt
 sha256  335bdf4db702885a8acaf2c9f241c70cabd62497361da81aca65c8e8a8e7ff09  node-v0.10.47.tar.xz
 
-# From upstream URL: http://nodejs.org/dist/v6.2.1/SHASUMS256.txt
-sha256  dbaeb8fb68a599e5164b17c74f66d24f424ee4ab3a25d8de8a3c6808e5b42bfb  node-v6.2.1.tar.xz
+# From upstream URL: http://nodejs.org/dist/v6.7.0/SHASUMS256.txt
+sha256  ceb028324aab1ee8c7ea6a62026f036f3ea71f5ef5212593d0f833f999dd3be5  node-v6.7.0.tar.xz
-- 
2.7.4
