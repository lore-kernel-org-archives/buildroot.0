From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Jun 2017 10:15:30 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] nodejs: bump 6.x version
	to 6.11.0
Message-ID: <20170629081540.7468E81E76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25368f9bcc845f0cf8c15b5c0c3f12cf45364d91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

6.11.0 is the latest release in the LTS series, fixing a number of issues:

https://nodejs.org/en/blog/release/v6.11.0/

Building without openssl is broken in 6.11.0, so add an upstream patch to
fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-gyp-force-link-command-to-use-CXX.patch   |  0
 ...-don-t-build-when-ssl-support-is-disabled.patch |  0
 ...-HAVE_OPENSSL-directive-to-openssl_config.patch | 49 ++++++++++++++++++++++
 package/nodejs/Config.in                           |  2 +-
 package/nodejs/nodejs.hash                         |  4 +-
 5 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/6.10.3/0001-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/6.11.0/0001-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/6.10.3/0001-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/6.11.0/0001-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/6.10.3/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch b/package/nodejs/6.11.0/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
similarity index 100%
rename from package/nodejs/6.10.3/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
rename to package/nodejs/6.11.0/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
diff --git a/package/nodejs/6.11.0/0003-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch b/package/nodejs/6.11.0/0003-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch
new file mode 100644
index 0000000..f07fdc2
--- /dev/null
+++ b/package/nodejs/6.11.0/0003-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch
@@ -0,0 +1,49 @@
+From e1d8899c28997613505d288d22bfb95470d606a1 Mon Sep 17 00:00:00 2001
+From: Daniel Bevenius <daniel.bevenius@gmail.com>
+Date: Tue, 28 Feb 2017 20:04:12 +0100
+Subject: [PATCH] src: add HAVE_OPENSSL directive to openssl_config
+
+Currently when building with the following configuration options:
+$ ./configure --without-ssl && make
+
+The following link error is reported:
+
+Undefined symbols for architecture x86_64:
+  "node::openssl_config", referenced from:
+      node::Init(int*, char const**, int*, char const***) in node.o
+ld: symbol(s) not found for architecture x86_64
+clang: error: linker command failed with exit code 1 (use -v to see
+invocation)
+
+Adding an HAVE_OPENSSL directive around this code allows the build to
+pass.
+
+PR-URL: https://github.com/nodejs/node/pull/11618
+Reviewed-By: Anna Henningsen <anna@addaleax.net>
+Reviewed-By: James M Snell <jasnell@gmail.com>
+Reviewed-By: Colin Ihrig <cjihrig@gmail.com>
+Reviewed-By: Ben Noordhuis <info@bnoordhuis.nl>
+Reviewed-By: Sam Roberts <vieuxtech@gmail.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/node.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/node.cc b/src/node.cc
+index 57415bba41..ec78339d89 100644
+--- a/src/node.cc
++++ b/src/node.cc
+@@ -4233,8 +4233,10 @@ void Init(int* argc,
+   if (config_warning_file.empty())
+     SafeGetenv("NODE_REDIRECT_WARNINGS", &config_warning_file);
+ 
++#if HAVE_OPENSSL
+   if (openssl_config.empty())
+     SafeGetenv("OPENSSL_CONF", &openssl_config);
++#endif
+ 
+   // Parse a few arguments which are specific to Node.
+   int v8_argc;
+-- 
+2.11.0
+
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 5fafa8f..be20af5 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -43,7 +43,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "6.10.3"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	default "6.11.0"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	default "0.10.48"
 
 config BR2_PACKAGE_NODEJS_NPM
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 8cc6927..ac010ab 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.48/SHASUMS256.txt
 sha256  365a93d9acc076a0d93f087d269f376abeebccad599a9dab72f2f6ed96c8ae6e  node-v0.10.48.tar.xz
 
-# From upstream URL: http://nodejs.org/dist/v6.10.3/SHASUMS256.txt
-sha256  82262a703e61164e09170a14d88b1726720651b0c7ee87a277654247b21b5388  node-v6.10.3.tar.xz
+# From upstream URL: http://nodejs.org/dist/v6.11.0/SHASUMS256.txt
+sha256  02ba35391edea2b294c736489af01954ce6e6c39d318f4423ae6617c69ef0a51  node-v6.11.0.tar.xz
