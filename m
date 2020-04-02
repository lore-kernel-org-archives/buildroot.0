From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Apr 2020 23:59:03 +0200
Subject: [Buildroot] [git commit] package/cegui: fix invalid cast
Message-ID: <20200402215429.A5CC88A60F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0affe4710b46c8700ae8190f9b7aa54ed04b9a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
- http://autobuild.buildroot.net/results/a76/a76e88d1805c836bf095b9b6ed5fb52aa0fcdc0a
- http://autobuild.buildroot.net/results/d24/d24ebb999215a23e0743c29ca137745417316bc4
- http://autobuild.buildroot.net/results/37b/37b46d25a98a17ead9133cba9fd6c8ebe8996d60

and many many more...

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
[Peter: drop number from patch subject]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...convStringTranscoder.cpp-use-cast-notatio.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/cegui/0002-cegui-src-IconvStringTranscoder.cpp-use-cast-notatio.patch b/package/cegui/0002-cegui-src-IconvStringTranscoder.cpp-use-cast-notatio.patch
new file mode 100644
index 0000000000..f30438b986
--- /dev/null
+++ b/package/cegui/0002-cegui-src-IconvStringTranscoder.cpp-use-cast-notatio.patch
@@ -0,0 +1,34 @@
+From 4561bac9dddad8fd79e746ea1ddd89c20647a162 Mon Sep 17 00:00:00 2001
+From: Bartosz Bilas <b.bilas@grinn-global.com>
+Date: Thu, 2 Apr 2020 18:04:28 +0200
+Subject: [PATCH] cegui/src/IconvStringTranscoder.cpp: use cast notation
+ instead of reinterpret_cast
+
+Fixes:
+	IconvStringTranscoder.cpp:50:49: error: invalid cast from type 'int' to
+	type 'iconv_t' {aka 'long int'}
+         if (d_cd == reinterpret_cast<iconv_t>(-1))
+
+Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
+---
+ Upstream status: https://github.com/cegui/cegui/pull/1194
+
+ cegui/src/IconvStringTranscoder.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cegui/src/IconvStringTranscoder.cpp b/cegui/src/IconvStringTranscoder.cpp
+index 1a5df2995..f6b5aa816 100644
+--- a/cegui/src/IconvStringTranscoder.cpp
++++ b/cegui/src/IconvStringTranscoder.cpp
+@@ -47,7 +47,7 @@ public:
+         d_toCode(tocode),
+         d_cd(iconv_open(d_toCode.c_str(), d_fromCode.c_str()))
+     {
+-        if (d_cd == reinterpret_cast<iconv_t>(-1))
++        if (d_cd == (iconv_t)(-1))
+             CEGUI_THROW(InvalidRequestException(String(
+                 "Failed to create conversion descriptor from \"") +
+                 d_fromCode.c_str() + "\" to \"" + d_toCode.c_str() + "\"."));
+-- 
+2.26.0
+
