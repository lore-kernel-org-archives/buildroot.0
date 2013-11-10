From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Nov 2013 23:49:07 +0100
Subject: [Buildroot] [git commit] qt5webkit: fix build with bison-3.0
Message-ID: <20131110225806.C64369BB60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee8c811fe1856d653e8c6ad2828e5ad124beca8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add host-bison dependency
- Fetch patch from upstream fixing build with bison-3.0
  (already included in the next 5.2 release)

Fixes:
	http://autobuild.buildroot.net/results/283/2831c0d859b035f7d2786f51885833a711b46b80/build-end.log

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...t-0002-ANGLE-doesn-t-build-with-bison-3.0.patch |   38 ++++++++++++++++++++
 package/qt5/qt5webkit/qt5webkit.mk                 |    2 +-
 2 files changed, 39 insertions(+), 1 deletions(-)

diff --git a/package/qt5/qt5webkit/qt5webkit-0002-ANGLE-doesn-t-build-with-bison-3.0.patch b/package/qt5/qt5webkit/qt5webkit-0002-ANGLE-doesn-t-build-with-bison-3.0.patch
new file mode 100644
index 0000000..e69e137
--- /dev/null
+++ b/package/qt5/qt5webkit/qt5webkit-0002-ANGLE-doesn-t-build-with-bison-3.0.patch
@@ -0,0 +1,38 @@
+From 60ba8bd5b3575d0c7740571fbb4e681b21a49a82 Mon Sep 17 00:00:00 2001
+From: Allan Sandfeld Jensen <allan.jensen@digia.com>
+Date: Fri, 16 Aug 2013 18:27:07 +0200
+Subject: [PATCH] ANGLE doesn't build with bison 3.0
+
+https://bugs.webkit.org/show_bug.cgi?id=119798
+
+Reviewed by Antti Koivisto.
+
+Make glslang.y compatible with bison 3.0
+by using %lex-param to set YYLEX_PARAM.
+
+* src/compiler/glslang.y:
+
+git-svn-id: http://svn.webkit.org/repository/webkit/trunk at 154109 268f45cc-cd09-0410-ab3c-d52691b4dbfc
+
+Task-number: QTBUG-32913
+Change-Id: I15505d31f0588c4d558b73befdb9d2358e29c1a3
+Reviewed-by: Jocelyn Turcotte <jocelyn.turcotte@digia.com>
+---
+ Source/ThirdParty/ANGLE/src/compiler/glslang.y | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Source/ThirdParty/ANGLE/src/compiler/glslang.y b/Source/ThirdParty/ANGLE/src/compiler/glslang.y
+index 3cad335..b41e95a 100644
+--- a/Source/ThirdParty/ANGLE/src/compiler/glslang.y
++++ b/Source/ThirdParty/ANGLE/src/compiler/glslang.y
+@@ -47,6 +47,7 @@ WHICH GENERATES THE GLSL ES PARSER (glslang_tab.cpp AND glslang_tab.h).
+ %expect 1 /* One shift reduce conflict because of if | else */
+ %pure-parser
+ %parse-param {TParseContext* context}
++%lex-param {YYLEX_PARAM}
+ 
+ %union {
+     struct {
+-- 
+1.8.4.2
+
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 87b15a9..300b9d9 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -7,7 +7,7 @@
 QT5WEBKIT_VERSION = $(QT5_VERSION)
 QT5WEBKIT_SITE = $(QT5_SITE)
 QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
-QT5WEBKIT_DEPENDENCIES = qt5base sqlite host-ruby host-gperf
+QT5WEBKIT_DEPENDENCIES = qt5base sqlite host-ruby host-gperf host-bison
 QT5WEBKIT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
