From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 13 Nov 2014 16:49:15 +0000
Subject: [Buildroot] [PATCH 2/2] qt: Disable Webkit Module for old Linux
	threads
In-Reply-To: <1415897355-62758-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1415897355-62758-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1415897355-62758-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt Webkit Module uses pthread_getattr_np() which is not implemented in
the old Linux threads. This causes the following compilation failure:

wtf/StackBounds.cpp: In member function ?void
WTF::StackBounds::initialize()?:
wtf/StackBounds.cpp:172:38: error: ?pthread_getattr_np? was not declared
in this scope

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/qt/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 8161f59..c0ec16b 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -375,13 +375,15 @@ config BR2_PACKAGE_QT_WEBKIT
 	depends on BR2_PACKAGE_QT_GUI_MODULE
 	depends on BR2_PACKAGE_QT_NETWORK
 	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
+	depends on !BR2_PTHREADS_OLD # needs pthread_getattr_np()
 	help
 	  Build the WebKit module.
 	  If unsure, say n.
 
-comment "WebKit needs shared library/gui/network support"
+comment "WebKit needs shared library/new threads/gui/network support"
 	depends on !(BR2_PACKAGE_QT_SHARED && BR2_PACKAGE_QT_GUI_MODULE && BR2_PACKAGE_QT_NETWORK)
 	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
+	depends on BR2_PTHREADS_OLD
 
 config BR2_PACKAGE_QT_STL
 	bool "STL support"
-- 
1.7.1
