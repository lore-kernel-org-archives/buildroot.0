From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Oct 2017 13:24:57 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] nodejs: security bump to
	version 6.11.5
Message-ID: <20171026111816.3E9668101B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98bd08f6037d5157a6cd8dff78a2fcd7049531f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-14919 - In zlib v1.2.9, a change was made that causes an
error to be raised when a raw deflate stream is initialized with windowBits
set to 8.  On some versions this crashes Node and you cannot recover from
it, while on some versions it throws an exception.  Node.js will now
gracefully set windowBits to 9 replicating the legacy behavior to avoid a
DOS vector.

For more details, see the announcement:
https://nodejs.org/en/blog/vulnerability/oct-2017-dos/

Drop 0002-inspector-don-t-build-when-ssl-support-is-disabled.patch as that
is now upstream:

https://github.com/nodejs/node/commit/ba23506419

And refresh the other patches.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-don-t-build-when-ssl-support-is-disabled.patch | 35 ----------------------
 .../0001-gyp-force-link-command-to-use-CXX.patch   |  6 ++--
 ...HAVE_OPENSSL-directive-to-openssl_config.patch} |  6 ++--
 package/nodejs/Config.in                           |  2 +-
 package/nodejs/nodejs.hash                         |  4 +--
 5 files changed, 9 insertions(+), 44 deletions(-)

diff --git a/package/nodejs/6.11.1/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch b/package/nodejs/6.11.1/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
deleted file mode 100644
index c07cbf8..0000000
--- a/package/nodejs/6.11.1/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 7fa541f6c0a31e3ddcab6ea85040b531bbaa4651 Mon Sep 17 00:00:00 2001
-From: Martin Bark <martin@barkynet.com>
-Date: Tue, 12 Jul 2016 19:03:28 +0100
-Subject: [PATCH] inspector: don't build when ssl support is disabled
-
-Signed-off-by: Martin Bark <martin@barkynet.com>
----
- node.gyp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/node.gyp b/node.gyp
-index 8a8bd00..fdccd60 100644
---- a/node.gyp
-+++ b/node.gyp
-@@ -302,7 +302,7 @@
-             'deps/v8/src/third_party/vtune/v8vtune.gyp:v8_vtune'
-           ],
-         }],
--        [ 'v8_inspector=="true"', {
-+        [ 'v8_inspector=="true" and node_use_openssl =="true"', {
-           'defines': [
-             'HAVE_INSPECTOR=1',
-             'V8_INSPECTOR_USE_STL=1',
-@@ -828,7 +828,7 @@
-       ],
- 
-       'conditions': [
--        ['v8_inspector=="true"', {
-+        ['v8_inspector=="true" and node_use_openssl =="true"', {
-           'sources': [
-             'src/inspector_socket.cc',
-             'test/cctest/test_inspector_socket.cc'
--- 
-2.7.4
-
diff --git a/package/nodejs/6.11.1/0001-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/6.11.5/0001-gyp-force-link-command-to-use-CXX.patch
similarity index 85%
rename from package/nodejs/6.11.1/0001-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/6.11.5/0001-gyp-force-link-command-to-use-CXX.patch
index 5746582..7b5a994 100644
--- a/package/nodejs/6.11.1/0001-gyp-force-link-command-to-use-CXX.patch
+++ b/package/nodejs/6.11.5/0001-gyp-force-link-command-to-use-CXX.patch
@@ -15,12 +15,12 @@ diff --git a/tools/gyp/pylib/gyp/generator/make.py b/tools/gyp/pylib/gyp/generat
 index b88a433..0a1f2e0 100644
 --- a/tools/gyp/pylib/gyp/generator/make.py
 +++ b/tools/gyp/pylib/gyp/generator/make.py
-@@ -142,7 +142,7 @@ cmd_alink_thin = rm -f $@ && $(AR.$(TOOLSET)) crsT $@ $(filter %.o,$^)
+@@ -147,7 +147,7 @@ cmd_alink_thin = rm -f $@ && $(AR.$(TOOLSET)) crsT $@ $(filter %.o,$^)
  # special "figure out circular dependencies" flags around the entire
  # input list during linking.
  quiet_cmd_link = LINK($(TOOLSET)) $@
--cmd_link = $(LINK.$(TOOLSET)) $(GYP_LDFLAGS) $(LDFLAGS.$(TOOLSET)) -o $@ -Wl,--start-group $(LD_INPUTS) -Wl,--end-group $(LIBS)
-+cmd_link = $(CXX.$(TOOLSET)) $(GYP_LDFLAGS) $(LDFLAGS.$(TOOLSET)) -o $@ -Wl,--start-group $(LD_INPUTS) -Wl,--end-group $(LIBS)
+-cmd_link = $(LINK.$(TOOLSET)) $(GYP_LDFLAGS) $(LDFLAGS.$(TOOLSET)) -o $@ -Wl,--start-group $(LD_INPUTS) $(LIBS) -Wl,--end-group
++cmd_link = $(CXX.$(TOOLSET)) $(GYP_LDFLAGS) $(LDFLAGS.$(TOOLSET)) -o $@ -Wl,--start-group $(LD_INPUTS) $(LIBS) -Wl,--end-group
  
  # We support two kinds of shared objects (.so):
  # 1) shared_library, which is just bundling together many dependent libraries
diff --git a/package/nodejs/6.11.1/0003-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch b/package/nodejs/6.11.5/0002-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch
similarity index 90%
rename from package/nodejs/6.11.1/0003-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch
rename to package/nodejs/6.11.5/0002-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch
index f07fdc2..c22311e 100644
--- a/package/nodejs/6.11.1/0003-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch
+++ b/package/nodejs/6.11.5/0002-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch
@@ -33,9 +33,9 @@ diff --git a/src/node.cc b/src/node.cc
 index 57415bba41..ec78339d89 100644
 --- a/src/node.cc
 +++ b/src/node.cc
-@@ -4233,8 +4233,10 @@ void Init(int* argc,
-   if (config_warning_file.empty())
-     SafeGetenv("NODE_REDIRECT_WARNINGS", &config_warning_file);
+@@ -4389,8 +4389,10 @@ void Init(int* argc,
+   V8::SetFlagsFromString(NODE_V8_OPTIONS, sizeof(NODE_V8_OPTIONS) - 1);
+ #endif
  
 +#if HAVE_OPENSSL
    if (openssl_config.empty())
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 31dcfb6..9ce0230 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -43,7 +43,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "6.11.1"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	default "6.11.5"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	default "0.10.48"
 
 config BR2_PACKAGE_NODEJS_NPM
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 2dbbdc7..319774c 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.48/SHASUMS256.txt
 sha256  365a93d9acc076a0d93f087d269f376abeebccad599a9dab72f2f6ed96c8ae6e  node-v0.10.48.tar.xz
 
-# From upstream URL: http://nodejs.org/dist/v6.11.1/SHASUMS256.txt
-sha256  6f6655b85919aa54cb045a6d69a226849802fcc26491d0db4ce59873e41cc2b8  node-v6.11.1.tar.xz
+# From upstream URL: http://nodejs.org/dist/v6.11.5/SHASUMS256.txt
+sha256  1c6de415216799fbaeca82304b3fef87accc7101ebf2ead7d5c545e0779e8aaf  node-v6.11.5.tar.xz
