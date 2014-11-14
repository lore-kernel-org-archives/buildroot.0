From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 14 Nov 2014 10:52:21 +0000
Subject: [Buildroot] [PATCH v2 2/2] qt: Webkit Module needs a toolchain with
	nptl
In-Reply-To: <1415962341-9642-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1415962341-9642-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1415962341-9642-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt Webkit Module uses pthread_getattr_np() which is implemented in
toolchains with nptl. Otherwise the compilation will fail showing this
error message:

wtf/StackBounds.cpp: In member function ?void
WTF::StackBounds::initialize()?:
wtf/StackBounds.cpp:172:38: error: ?pthread_getattr_np? was not declared
in this scope

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2

Depend on BR2_TOOLCHAIN_HAS_THREADS_NPTL instead of BR2_PTHREADS_OLD

 package/qt/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index f4cb6b6..6c421fd 100644
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
+comment "WebKit needs shared library/nptl toolchain/gui/network support"
 	depends on !(BR2_PACKAGE_QT_SHARED && BR2_PACKAGE_QT_GUI_MODULE && BR2_PACKAGE_QT_NETWORK)
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 
 config BR2_PACKAGE_QT_STL
-- 
1.7.1
