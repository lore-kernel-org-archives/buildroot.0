From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 15:37:39 +0100
Subject: [Buildroot] [git commit] package/python-sip: remove qt4 support
Message-ID: <20190206145216.BD0307F952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78449f011c221a56a5a10bbd0e18c11a3646a951
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-pyqt has been removed and qt4 support is about to be dropped, so
remove the support from python-sip as well.

The comments and dependencies are not how we normally do things: the
dependency on Qt5 is obvious for a package which is essentially python
bindings for Qt5, and the other dependencies are implied by Qt5. So
remove all that and limit to a single dependency on Qt5.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Arnout: further simplify dependencies and comments]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-sip/Config.in     | 14 +-------------
 package/python-sip/python-sip.mk |  4 ----
 2 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/package/python-sip/Config.in b/package/python-sip/Config.in
index 1f8961d0df..8a43b8b17f 100644
--- a/package/python-sip/Config.in
+++ b/package/python-sip/Config.in
@@ -1,18 +1,6 @@
-comment "python-sip needs a toolchain w/ C++, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "python-sip needs qt or qt5"
-	depends on BR2_USE_MMU
-	depends on BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
-
 config BR2_PACKAGE_PYTHON_SIP
 	bool "python-sip"
-	depends on BR2_INSTALL_LIBSTDCPP # qt
-	depends on BR2_TOOLCHAIN_HAS_THREADS # qt
-	depends on BR2_USE_MMU # qt
-	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT5
 	help
 	  SIP is a tool that makes it very easy to create Python
 	  bindings for C and C++ libraries. It was originally
diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 76d7d04187..69019f5f19 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -10,11 +10,7 @@ PYTHON_SIP_SITE = http://downloads.sourceforge.net/project/pyqt/sip/sip-$(PYTHON
 PYTHON_SIP_LICENSE = SIP license or GPL-2.0 or GPL-3.0
 PYTHON_SIP_LICENSE_FILES = LICENSE LICENSE-GPL2 LICENSE-GPL3
 
-ifeq ($(BR2_PACKAGE_QT5),y)
 PYTHON_SIP_DEPENDENCIES = qt5base
-else
-PYTHON_SIP_DEPENDENCIES = qt
-endif
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 PYTHON_SIP_DEPENDENCIES += python
