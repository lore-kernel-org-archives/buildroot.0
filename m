From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Nov 2014 08:25:58 +0100
Subject: [Buildroot] [git commit] qt: Script Module needs a toolchain with
	NPTL
Message-ID: <20141128072657.9A22A7FF07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89207cc06d2952741ffe391260e0a73a126da6fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qt Script Module uses pthread_getattr_np() which is implemented in
toolchains with NPTL. Otherwise the compilation will fail showing this
error message:

../3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp: In
function ???void* QTJSC::currentThreadStackBase()???:
../3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp:692:42:
error: ???pthread_getattr_np??? was not declared in this scope

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grantlee/Config.in |    5 +++++
 package/qt/Config.in       |    5 +++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/grantlee/Config.in b/package/grantlee/Config.in
index ce1342c..365209a 100644
--- a/package/grantlee/Config.in
+++ b/package/grantlee/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GRANTLEE
 	bool "grantlee"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # Qt Script
 	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 	depends on BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_STL
@@ -9,3 +10,7 @@ config BR2_PACKAGE_GRANTLEE
 	  Qt implemantation of the Django template framework
 
 	  http://www.grantlee.org
+
+comment "grantlee needs a toolchain with NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
diff --git a/package/qt/Config.in b/package/qt/Config.in
index da159b4..2a4bf4e 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -402,11 +402,16 @@ config BR2_PACKAGE_QT_OPENSSL
 config BR2_PACKAGE_QT_SCRIPT
 	bool "Script Module"
 	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # needs pthread_getattr_np()
 	default y
 	help
 	  Build the Qt Script module.
 	  if unsure, say y.
 
+comment "Script Module needs a toolchain with NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
+
 config BR2_PACKAGE_QT_SCRIPTTOOLS
 	bool "Script Tools Module"
 	depends on BR2_PACKAGE_QT_SCRIPT
