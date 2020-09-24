From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 24 Sep 2020 23:17:14 +0200
Subject: [Buildroot] [PATCH v2 4/5] package/bellagio: drop package
In-Reply-To: <20200924211715.7433-1-ps.report@gmx.net>
References: <20200924211715.7433-1-ps.report@gmx.net>
Message-ID: <20200924211715.7433-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop bellagio support as the project is no longer maintained (no update
since 2011, see [1]) and the last reference (from gst-omx) is gone.

[1] http://omxil.sourceforge.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 Config.in.legacy                              |  7 +++
 package/Config.in                             |  1 -
 package/bellagio/0001-drop-werror.patch       | 22 -------
 .../bellagio/0002-dynamicloader-linking.patch | 16 ------
 package/bellagio/0003-parallel-build.patch    | 16 ------
 ...4-segfault-on-removeFromWaitResource.patch | 37 ------------
 .../0005-fix-doc-installation-path.patch      | 24 --------
 ...e_resource_manager.-h-c-fix-build-wi.patch | 57 -------------------
 package/bellagio/Config.in                    | 28 ---------
 package/bellagio/bellagio.hash                |  3 -
 package/bellagio/bellagio.mk                  | 16 ------
 11 files changed, 7 insertions(+), 220 deletions(-)
 delete mode 100644 package/bellagio/0001-drop-werror.patch
 delete mode 100644 package/bellagio/0002-dynamicloader-linking.patch
 delete mode 100644 package/bellagio/0003-parallel-build.patch
 delete mode 100644 package/bellagio/0004-segfault-on-removeFromWaitResource.patch
 delete mode 100644 package/bellagio/0005-fix-doc-installation-path.patch
 delete mode 100644 package/bellagio/0006-src-omx_reference_resource_manager.-h-c-fix-build-wi.patch
 delete mode 100644 package/bellagio/Config.in
 delete mode 100644 package/bellagio/bellagio.hash
 delete mode 100644 package/bellagio/bellagio.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 92816e562d..ee0ee1a25d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2020.11"
 
+config BR2_PACKAGE_BELLAGIO
+	bool "bellagio package was removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as it is not maintained anymore
+	  (no release since 2011).
+
 config BR2_PACKAGE_GST1_VALIDATE
 	bool "gst1-validate was moved to gst1-devtools"
 	select BR2_PACKAGE_GST1_DEVTOOLS
diff --git a/package/Config.in b/package/Config.in
index bbaa49f76c..a1d0a404d0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -13,7 +13,6 @@ menu "Audio and video applications"
 	source "package/alsa-utils/Config.in"
 	source "package/atest/Config.in"
 	source "package/aumix/Config.in"
-	source "package/bellagio/Config.in"
 	source "package/bluez-alsa/Config.in"
 	source "package/dvblast/Config.in"
 	source "package/dvdauthor/Config.in"
diff --git a/package/bellagio/0001-drop-werror.patch b/package/bellagio/0001-drop-werror.patch
deleted file mode 100644
index 39baf421bb..0000000000
--- a/package/bellagio/0001-drop-werror.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-[PATCH] don't force -Werror in CFLAGS
-
-Released software shouldn't get built with -Werror.
-
-Signed-of-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- configure.ac |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: libomxil-bellagio-0.9.3/configure.ac
-===================================================================
---- libomxil-bellagio-0.9.3.orig/configure.ac
-+++ libomxil-bellagio-0.9.3/configure.ac
-@@ -5,7 +5,7 @@
- AC_PREREQ([2.59])
- 
- AC_CONFIG_HEADERS([config.h])
--CFLAGS="${CFLAGS} -Wall -Werror"
-+CFLAGS="${CFLAGS} -Wall"
- 
- ################################################################################
- # Set the shared versioning info, according to section 6.3 of the libtool info #
diff --git a/package/bellagio/0002-dynamicloader-linking.patch b/package/bellagio/0002-dynamicloader-linking.patch
deleted file mode 100644
index 5e4243d5e1..0000000000
--- a/package/bellagio/0002-dynamicloader-linking.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-When libomxdynamicloader.so is loaded, it complains that RM_Deinit can't be resolved.
-Link explicitly against omxil-bellagio so that ld.so can find the reference.
-
-Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
-
---- bellagio-0.9.3/src/dynamic_loader/Makefile.am.old	2012-03-23 15:07:47.379021034 +0000
-+++ bellagio-0.9.3/src/dynamic_loader/Makefile.am	2012-03-23 15:08:47.563034818 +0000
-@@ -3,7 +3,7 @@
- omxdynamicloader_LTLIBRARIES = libomxdynamicloader.la
- libomxdynamicloader_la_SOURCES = ste_dynamic_component_loader.c ste_dynamic_component_loader.h
- 
--libomxdynamicloader_la_LDFLAGS =
-+libomxdynamicloader_la_LDFLAGS = -lomxil-bellagio -L$(abs_top_srcdir)/src/.libs
- libomxdynamicloader_la_CFLAGS = -I$(top_srcdir)/include \
- 			-I$(top_srcdir)/src \
- 			-I$(top_srcdir)/src/base \
diff --git a/package/bellagio/0003-parallel-build.patch b/package/bellagio/0003-parallel-build.patch
deleted file mode 100644
index 767bbeb2aa..0000000000
--- a/package/bellagio/0003-parallel-build.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Fix dependency issue to allow parallel build
-
-Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
-
-Index: bellagio-0.9.3/src/Makefile.am
-===================================================================
---- bellagio-0.9.3.orig/src/Makefile.am
-+++ bellagio-0.9.3/src/Makefile.am
-@@ -8,6 +8,7 @@ omxregister_bellagio_SOURCES = omxregist
- omxregister_bellagio_CFLAGS = -DOMXILCOMPONENTSPATH=\"$(plugindir)/\" \
- 			      -I$(top_srcdir)/include
- omxregister_bellagio_LDFLAGS = -lomxil-bellagio -L$(builddir)
-+omxregister_bellagio_DEPENDENCIES = libomxil-bellagio.la
- 
- lib_LTLIBRARIES = libomxil-bellagio.la
- libomxil_bellagio_la_SOURCES = component_loader.h \
diff --git a/package/bellagio/0004-segfault-on-removeFromWaitResource.patch b/package/bellagio/0004-segfault-on-removeFromWaitResource.patch
deleted file mode 100644
index f52a2c33f4..0000000000
--- a/package/bellagio/0004-segfault-on-removeFromWaitResource.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-We always access globalComponentList[] at indexComponent=-1 which causes a
-segfault. Use i as the index instead.
-
-Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
-
---- bellagio-0.9.3/src/omx_reference_resource_manager.c.old	2012-03-13 10:15:25.743940980 +0000
-+++ bellagio-0.9.3/src/omx_reference_resource_manager.c	2012-03-13 10:18:02.201971009 +0000
-@@ -485,7 +485,6 @@
- OMX_ERRORTYPE RM_removeFromWaitForResource(OMX_COMPONENTTYPE *openmaxStandComp) {
- 	omx_base_component_PrivateType* omx_base_component_Private;
- 	int i = 0;
--	int indexComponent = -1;
- 
- 	DEBUG(DEB_LEV_FUNCTION_NAME, "In %s\n", __func__);
- 	omx_base_component_Private = (omx_base_component_PrivateType*)openmaxStandComp->pComponentPrivate;
-@@ -493,16 +492,13 @@
- 	while(listOfcomponentRegistered[i].component_name != NULL ) {
- 		if (!strcmp(listOfcomponentRegistered[i].component_name, omx_base_component_Private->name)) {
- 			// found component in the list of the resource manager
--			removeElemFromList(&globalComponentList[indexComponent], openmaxStandComp);
--			break;
-+			removeElemFromList(&globalComponentList[i], openmaxStandComp);
-+			DEBUG(DEB_LEV_FUNCTION_NAME, "Out of %s\n", __func__);
-+			return OMX_ErrorNone;
- 		}
- 		i++;
- 	}
--	if (indexComponent <0) {
--		// No resource to be handled
--		DEBUG(DEB_LEV_ERR, "In %s No resource to be handled\n", __func__);
--		return OMX_ErrorNone;
--	}
--	DEBUG(DEB_LEV_FUNCTION_NAME, "Out of %s\n", __func__);
-+	// No resource to be handled
-+	DEBUG(DEB_LEV_ERR, "In %s No resource to be handled\n", __func__);
- 	return OMX_ErrorNone;
- }
diff --git a/package/bellagio/0005-fix-doc-installation-path.patch b/package/bellagio/0005-fix-doc-installation-path.patch
deleted file mode 100644
index 06b0743e26..0000000000
--- a/package/bellagio/0005-fix-doc-installation-path.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Makefile.am: fix bogus docdir definition
-
-The definition of the docdir variable uses $(DESTDIR). However,
-automake already prefixes all *dir variables automatically with
-DESTDIR, which causes the documentation to be installed in
-$(DESTDIR)/$(DESTDIR)/usr/share/doc/...
-
-Fix this by removing the $(DESTDIR) part of the docdir definition.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Makefile.am
-===================================================================
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -7,7 +7,7 @@
- pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = libomxil-bellagio.pc
- 
--docdir = $(DESTDIR)$(prefix)/share/doc/@PACKAGE@
-+docdir = $(prefix)/share/doc/@PACKAGE@
- doc_DATA = README \
- 	   ChangeLog \
- 	   TODO
diff --git a/package/bellagio/0006-src-omx_reference_resource_manager.-h-c-fix-build-wi.patch b/package/bellagio/0006-src-omx_reference_resource_manager.-h-c-fix-build-wi.patch
deleted file mode 100644
index 1a2777cb18..0000000000
--- a/package/bellagio/0006-src-omx_reference_resource_manager.-h-c-fix-build-wi.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From be9f72bc5fa05de466f9151ac399c17027b58b24 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 12 Aug 2020 21:38:51 +0200
-Subject: [PATCH] src/omx_reference_resource_manager.{h,c}: fix build with gcc
- 10
-
-Move globalIndex, listOfcomponentRegistered, globalComponentList and
-globalWaitingComponentList from header to source file to fix the build
-with gcc 10 which default to -fno-common:
-https://gcc.gnu.org/gcc-10/porting_to.html
-
-Fixes:
- - http://autobuild.buildroot.org/results/0c02f845eabfbc276ee5989520a3c77fc47289ab
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://sourceforge.net/p/omxil/bugs/63]
----
- src/omx_reference_resource_manager.c | 5 +++++
- src/omx_reference_resource_manager.h | 6 ------
- 2 files changed, 5 insertions(+), 6 deletions(-)
-
-diff --git a/src/omx_reference_resource_manager.c b/src/omx_reference_resource_manager.c
-index ee7766b..5983611 100644
---- a/src/omx_reference_resource_manager.c
-+++ b/src/omx_reference_resource_manager.c
-@@ -30,6 +30,11 @@
- #include "base/omx_base_component.h"
- #include "queue.h"
- 
-+int globalIndex;
-+NameIndexType *listOfcomponentRegistered;
-+ComponentListType **globalComponentList;
-+ComponentListType **globalWaitingComponentList;
-+
- /**
-  * This is the static base pointer of the list
-  */
-diff --git a/src/omx_reference_resource_manager.h b/src/omx_reference_resource_manager.h
-index ba8dad9..75e4f93 100644
---- a/src/omx_reference_resource_manager.h
-+++ b/src/omx_reference_resource_manager.h
-@@ -48,12 +48,6 @@ struct NameIndexType {
- 	int max_components;
- };
- 
--
--int globalIndex;
--NameIndexType *listOfcomponentRegistered;
--ComponentListType **globalComponentList;
--ComponentListType **globalWaitingComponentList;
--
- OMX_ERRORTYPE RM_RegisterComponent(char *name, int max_components);
- OMX_ERRORTYPE addElemToList(ComponentListType **list, OMX_COMPONENTTYPE *openmaxStandComp, int index, OMX_BOOL bIsWaiting);
- OMX_ERRORTYPE removeElemFromList(ComponentListType **list, OMX_COMPONENTTYPE *openmaxStandComp);
--- 
-2.27.0
-
diff --git a/package/bellagio/Config.in b/package/bellagio/Config.in
deleted file mode 100644
index 8ad1867399..0000000000
--- a/package/bellagio/Config.in
+++ /dev/null
@@ -1,28 +0,0 @@
-config BR2_PACKAGE_BELLAGIO
-	bool "bellagio"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_HAS_LIBOPENMAX
-	help
-	  Bellagio is an opensource implementation of the
-	  OpenMAX IL API.
-
-	  OpenMAX Integration Layer (IL) is a standard API
-	  to access Multimedia Components on mobile platforms.
-	  It has been defined by the Khronos group.
-	  By means of the OpenMAX IL API, multimedia frameworks
-	  can access hardware accelerators on platforms that
-	  provide it.
-
-	  http://omxil.sourceforge.net/
-
-if BR2_PACKAGE_BELLAGIO
-
-config BR2_PACKAGE_PROVIDES_LIBOPENMAX
-	default "bellagio"
-
-endif
-
-comment "bellagio needs a toolchain w/ C++, threads, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/bellagio/bellagio.hash b/package/bellagio/bellagio.hash
deleted file mode 100644
index bd95df0f19..0000000000
--- a/package/bellagio/bellagio.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  593c0729c8ef8c1467b3bfefcf355ec19a46dd92e31bfc280e17d96b0934d74c  libomxil-bellagio-0.9.3.tar.gz
-sha256  a3d4e451d72288a4f8819b734ef610926213c2ba97e512add8de2f30843505a6  COPYING
diff --git a/package/bellagio/bellagio.mk b/package/bellagio/bellagio.mk
deleted file mode 100644
index 4e5c6912ec..0000000000
--- a/package/bellagio/bellagio.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# bellagio
-#
-################################################################################
-
-BELLAGIO_VERSION = 0.9.3
-BELLAGIO_SOURCE = libomxil-bellagio-$(BELLAGIO_VERSION).tar.gz
-BELLAGIO_SITE = http://downloads.sourceforge.net/project/omxil/omxil/Bellagio%20$(BELLAGIO_VERSION)
-BELLAGIO_AUTORECONF = YES
-BELLAGIO_INSTALL_STAGING = YES
-BELLAGIO_LICENSE = LGPL-2.1+
-BELLAGIO_LICENSE_FILES = COPYING
-BELLAGIO_PROVIDES = libopenmax
-
-$(eval $(autotools-package))
-- 
2.28.0
