From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 15:58:10 +0200
Subject: [Buildroot] [git commit] python-sip: allow package to be built
	using Qt5
Message-ID: <20160902142936.D88D5822FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9ca6963095ee64f0be943a34a972f024fa0e893
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Manuel V??gele <develop@manuel-voegele.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-sip/Config.in     | 7 ++++++-
 package/python-sip/python-sip.mk | 4 ++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/python-sip/Config.in b/package/python-sip/Config.in
index 45e48ad..1f8961d 100644
--- a/package/python-sip/Config.in
+++ b/package/python-sip/Config.in
@@ -2,12 +2,17 @@ comment "python-sip needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
+comment "python-sip needs qt or qt5"
+	depends on BR2_USE_MMU
+	depends on BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
+
 config BR2_PACKAGE_PYTHON_SIP
 	bool "python-sip"
 	depends on BR2_INSTALL_LIBSTDCPP # qt
 	depends on BR2_TOOLCHAIN_HAS_THREADS # qt
 	depends on BR2_USE_MMU # qt
-	select BR2_PACKAGE_QT
+	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
 	help
 	  SIP is a tool that makes it very easy to create Python
 	  bindings for C and C++ libraries. It was originally
diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index d13801f..0c0a947 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -10,7 +10,11 @@ PYTHON_SIP_SITE = http://downloads.sourceforge.net/project/pyqt/sip/sip-$(PYTHON
 PYTHON_SIP_LICENSE = SIP license or GPLv2 or GPLv3
 PYTHON_SIP_LICENSE_FILES = LICENSE LICENSE-GPL2 LICENSE-GPL3
 
+ifeq ($(BR2_PACKAGE_QT5),y)
+PYTHON_SIP_DEPENDENCIES = qt5base
+else
 PYTHON_SIP_DEPENDENCIES = qt
+endif
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 PYTHON_SIP_DEPENDENCIES += python
