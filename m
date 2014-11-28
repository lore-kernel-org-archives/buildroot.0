From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Nov 2014 08:26:14 +0100
Subject: [Buildroot] [git commit] qt: Webkit Module needs a toolchain with
	NPTL
Message-ID: <20141128072657.A5AB07F97E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3f96b17916276c148382a346853518bdac219ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qt Webkit Module uses pthread_getattr_np() which is implemented in
toolchains with NPTL. Otherwise the compilation will fail showing this
error message:

wtf/StackBounds.cpp: In member function ???void
WTF::StackBounds::initialize()???:
wtf/StackBounds.cpp:172:38: error: ???pthread_getattr_np??? was not declared
in this scope

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 2a4bf4e..665725e 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -375,12 +375,14 @@ config BR2_PACKAGE_QT_WEBKIT
 	depends on BR2_PACKAGE_QT_GUI_MODULE
 	depends on BR2_PACKAGE_QT_NETWORK
 	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # needs pthread_getattr_np()
 	help
 	  Build the WebKit module.
 	  If unsure, say n.
 
-comment "WebKit needs shared library/gui/network support"
+comment "WebKit needs shared library/NPTL toolchain/gui/network support"
 	depends on !(BR2_PACKAGE_QT_SHARED && BR2_PACKAGE_QT_GUI_MODULE && BR2_PACKAGE_QT_NETWORK)
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 
 config BR2_PACKAGE_QT_STL
