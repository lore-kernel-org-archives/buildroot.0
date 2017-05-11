From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Thu, 11 May 2017 15:46:57 +0200
Subject: [Buildroot] [PATCH] qwt: fix build when BR2_STATIC_LIBS=y
Message-ID: <20170511134657.8755-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

By default, qwt build a shared library, but when BR2_STATIC_LIBS is set
compilation failed with errors like :
__uClibc_main.c:(.text+0x164): undefined reference to `__fini_array_end'
__uClibc_main.c:(.text+0x168): undefined reference to `__fini_array_start'
__uClibc_main.c:(.text+0x16c): undefined reference to `__fini_array_start'

This patch disable QwtDll to build a static library when BR2_STATIC_LIBS=y.

fix:
http://autobuild.buildroot.net/results/739/739406bb8073d1861933872a47802954d9767634/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/qwt/qwt.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index d4e6d52..b5bdf51 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -41,6 +41,12 @@ else
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtOpenGL.*$$/\# QWT_CONFIG += QwtOpenGL/'
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDll.*$$/\# QWT_CONFIG += QwtDll/'
+else
+QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDll.*$$/\QWT_CONFIG += QwtDll/'
+endif
+
 define QWT_CONFIGURE_CMDS
 	$(SED) $(QWT_CONFIG) $(@D)/qwtconfig.pri
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QWT_QMAKE))
-- 
2.10.2
