From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  6 Feb 2019 15:10:45 +0100
Subject: [Buildroot] [PATCH 03/16] package/python-sip: remove qt4 support
In-Reply-To: <20190206141058.24155-1-peter@korsgaard.com>
References: <20190206141058.24155-1-peter@korsgaard.com>
Message-ID: <20190206141058.24155-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-pyqt has been removed and qt4 support is about to be dropped, so
remove the support from python-sip as well.

Adjust the dependencies to match the dependencies of qt5, and ensure that
qt5base is selected.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-sip/Config.in     | 14 ++++++++------
 package/python-sip/python-sip.mk |  4 ----
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/package/python-sip/Config.in b/package/python-sip/Config.in
index 1f8961d0df..4ce4f89b2a 100644
--- a/package/python-sip/Config.in
+++ b/package/python-sip/Config.in
@@ -2,17 +2,19 @@ comment "python-sip needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
-comment "python-sip needs qt or qt5"
+comment "python-sip needs qt5"
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
+	depends on !BR2_PACKAGE_QT5
 
 config BR2_PACKAGE_PYTHON_SIP
 	bool "python-sip"
-	depends on BR2_INSTALL_LIBSTDCPP # qt
-	depends on BR2_TOOLCHAIN_HAS_THREADS # qt
-	depends on BR2_USE_MMU # qt
-	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
+	depends on BR2_INSTALL_LIBSTDCPP # qt5
+	depends on BR2_USE_WCHAR # qt5
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # qt5
+	depends on !BR2_STATIC_LIBS # qt5
+	depends on BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE
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
-- 
2.11.0
