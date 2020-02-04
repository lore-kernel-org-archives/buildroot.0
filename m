From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue,  4 Feb 2020 14:31:57 +0100
Subject: [Buildroot] [PATCH 2/2] package/norm: make wscript Python3
 compatible
In-Reply-To: <20200204133157.10824-1-titouan.christophe@railnova.eu>
References: <20200204133157.10824-1-titouan.christophe@railnova.eu>
Message-ID: <20200204133157.10824-3-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This makes slight modifications to the waf build definition files
that make possible to compile norm with Waf running on Python3.

This has been tested on my experimental Python3 waf-package
infrastructure, and still works with the actual Py2 setup.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 ...ction-call-for-Python3-compatibility.patch | 29 +++++++++++++
 ...ixed-tabs-spaces-in-protolib-wscript.patch | 41 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 package/norm/0002-Use-print-as-function-call-for-Python3-compatibility.patch
 create mode 100644 package/norm/0003-Fix-mixed-tabs-spaces-in-protolib-wscript.patch

diff --git a/package/norm/0002-Use-print-as-function-call-for-Python3-compatibility.patch b/package/norm/0002-Use-print-as-function-call-for-Python3-compatibility.patch
new file mode 100644
index 0000000000..945a9df48c
--- /dev/null
+++ b/package/norm/0002-Use-print-as-function-call-for-Python3-compatibility.patch
@@ -0,0 +1,29 @@
+From 8c02c2cbc6f07ddaef23e6bf2f6b9a269ed85ff4 Mon Sep 17 00:00:00 2001
+From: Titouan Christophe <titouan.christophe@railnova.eu>
+Date: Tue, 4 Feb 2020 11:59:07 +0100
+Subject: [PATCH] Use print as function call for Python3 compatibility
+
+A similar patch has already been applied upstream, in commit
+ada15125a1cbb3b1718d6eef78512a36ed327fcc, which will therefore be
+available in the next norm release
+
+Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
+---
+ wscript | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wscript b/wscript
+index 8428899..0fdae96 100644
+--- a/wscript
++++ b/wscript
+@@ -32,7 +32,7 @@ for line in vfile.readlines():
+     if "#define" == line[0] and "VERSION" == line[1]:
+         VERSION = line[2].strip('"')
+ if VERSION is None:
+-    print "Warning: NORM VERSION not found!?"
++    print("Warning: NORM VERSION not found!?")
+ 
+ # So you don't need to do ./waf configure if you are just using the defaults
+ waflib.Configure.autoconfig = True
+-- 
+2.24.1
diff --git a/package/norm/0003-Fix-mixed-tabs-spaces-in-protolib-wscript.patch b/package/norm/0003-Fix-mixed-tabs-spaces-in-protolib-wscript.patch
new file mode 100644
index 0000000000..e99f292d22
--- /dev/null
+++ b/package/norm/0003-Fix-mixed-tabs-spaces-in-protolib-wscript.patch
@@ -0,0 +1,41 @@
+From 0ff75628845d3c86974c31b50ecd60c0b0144c6d Mon Sep 17 00:00:00 2001
+From: Titouan Christophe <titouan.christophe@railnova.eu>
+Date: Tue, 4 Feb 2020 13:44:27 +0100
+Subject: [PATCH] Fix mixed tabs/spaces in protolib wscript
+
+This fixes the following error when using waf in Python3:
+    TabError: inconsistent use of tabs and spaces in indentation
+
+The upstream file has since diverged, but with similar issues.
+[Upstream status: https://github.com/USNavalResearchLaboratory/protolib/pull/6]
+
+Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
+---
+ protolib/wscript | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/protolib/wscript b/protolib/wscript
+index 155a660..97dda93 100644
+--- a/protolib/wscript
++++ b/protolib/wscript
+@@ -120,7 +120,7 @@ def configure(ctx):
+     # Compiler-specific flags
+     if ctx.options.debug:
+         #ctx.env.DEFINES_BUILD_PROTOLIB += ['PROTO_DEBUG', 'DEBUG', '_DEBUG']
+-		ctx.env.DEFINES_BUILD_PROTOLIB += ['PROTO_DEBUG', 'DEBUG']
++        ctx.env.DEFINES_BUILD_PROTOLIB += ['PROTO_DEBUG', 'DEBUG']
+     else:
+         ctx.env.DEFINES_BUILD_PROTOLIB += ['NDEBUG', "PROTO_DEBUG"]
+ 
+@@ -139,7 +139,7 @@ def configure(ctx):
+             ctx.env.CFLAGS += ['/Od', '/RTC1', '/ZI']
+         else:
+             ctx.env.CXXFLAGS += ['/Ox', '/DNDEBUG']
+-        	#ctx.env.CXXFLAGS += ['/Ox', '/DNDEBUG', '/DWINVER=0x0501']
++            #ctx.env.CXXFLAGS += ['/Ox', '/DNDEBUG', '/DWINVER=0x0501']
+         ctx.env.CFLAGS
+ 
+ def build(ctx):
+-- 
+2.24.1
+
-- 
2.24.1
