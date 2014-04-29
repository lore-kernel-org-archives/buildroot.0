From: Parsa Panahi <panahi.parsa@paravisioner.com>
Date: Tue, 29 Apr 2014 16:14:33 +0430
Subject: [Buildroot] mail list details
Message-ID: <5e9a4c7fa18c7e6418033c8468ac0679@paravisioner.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 

Hi I want to become familiar with buildroot daily mails which comes to
me everyday. 

I receive many emails in this format that is changing some packages with
some config file. for example the following is about a change to opencv
package to support qt5.. but I don't know how to apply it to my config
file, so it become updated ... 

Thanks 

changes v1 -> v2:
- rebase
- update threads support dependency for qt5
---
 package/opencv/Config.in | 43
++++++++++++++++++++++++++++++++-----------
 package/opencv/opencv.mk | 4 ++--
 2 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 2f47869..8825060 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -181,17 +181,38 @@ config BR2_PACKAGE_OPENCV_WITH_PNG
 Use shared libpng from the target system.

 config BR2_PACKAGE_OPENCV_WITH_QT
- bool "qt backend support"
- depends on BR2_INSTALL_LIBSTDCPP
- depends on !BR2_avr32 # qt
- depends on BR2_USE_MMU # qt
- select BR2_PACKAGE_QT
- select BR2_PACKAGE_QT_STL
- select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_OPENCV_LIB_HIGHGUI
- select BR2_PACKAGE_QT_TEST if BR2_PACKAGE_OPENCV_LIB_HIGHGUI
- default y
- help
- Use Qt with QtTest module and STL support
+ bool "qt support"
+ depends on (BR2_PACKAGE_QT && !BR2_avr32) || 
+ (BR2_PACKAGE_QT5 && BR2_USE_MMU && BR2_INET_IPV6 && 
+ BR2_TOOLCHAIN_HAS_THREADS_NPTL)
+ select BR2_PACKAGE_QT_STL if BR2_PACKAGE_QT
+ select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT && 
+ BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+ select BR2_PACKAGE_QT_TEST if BR2_PACKAGE_QT && 
+ BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+ select BR2_PACKAGE_QT5BASE if BR2_PACKAGE_QT5
+ select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5
+ select BR2_PACKAGE_QT5BASE_TEST if BR2_PACKAGE_QT5
+ select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
+ select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5
+ help
+ Enable Qt support for OpenCV.
+
+ If Qt4 is already enabled, then use Qt4 with QtTest module and STL
+ support.
+
+ If Qt5 is already enabled, then use Qt5 with the following components:
+ base, concurrent, test, gui and widgets.
+
+if !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
+comment "qt support with Qt4 needs qt"
+
+comment "qt support with Qt5 needs qt5"
+ depends on BR2_USE_MMU && BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS
+
+comment "qt support with Qt5 needs a toolchain w/ wchar, IPv6, theads"
+ depends on !BR2_USE_MMU || !BR2_INET_IPV6 ||
!BR2_TOOLCHAIN_HAS_THREADS_NPTL
+endif

 config BR2_PACKAGE_OPENCV_WITH_TIFF
 bool "tiff support"
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index c4aa967..58bc5c0 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -207,8 +207,8 @@ OPENCV_CONF_OPT += -DWITH_PNG=OFF
 endif

 ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
-OPENCV_CONF_OPT += -DWITH_QT=4
-OPENCV_DEPENDENCIES += qt
+OPENCV_CONF_OPT += -DWITH_QT=$(if $(BR2_PACKAGE_QT),4,5)
+OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_QT),qt,qt5base)
 else
 OPENCV_CONF_OPT += -DWITH_QT=OFF
 endif
-- 
1.9.2

-- 

-- 

Parsa Panahi
D?partement de g?nie ?lectrique
?tudiant de l'?lectronique num?rique
Sharif Universit? de Technologie - T?h?ran - Iran

 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140429/45e8f101/attachment.html>
