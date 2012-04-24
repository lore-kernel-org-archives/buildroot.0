From: Qais Yousef <qais.yousef@imgtec.com>
Date: Tue, 24 Apr 2012 17:51:21 +0100
Subject: [Buildroot] [PATCH v2] new package: bellagio
Message-ID: <1335286281-8642-1-git-send-email-qais.yousef@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---

I haven't seen the v1 committed, so I am sending v2 here which
includes the following additions:

	- Add a patch to fix a runtime error when using dynamicloader.
	- Add a patch to fix when building in parallel.
	- Set AUTORECONF to YES as we modify the Makefile.am

All patches have been sent to relevant upstream mailing list.

Hope this looks alright! :-)

 package/multimedia/Config.in                       |    1 +
 package/multimedia/bellagio/Config.in              |   14 +++++++
 .../bellagio-0.9.3-dynamicloader-linking.patch     |   16 ++++++++
 .../bellagio/bellagio-0.9.3-parallel-build.patch   |   16 ++++++++
 ...-0.9.3-segfault-on-removeFromWaitResource.patch |   37 ++++++++++++++++++++
 package/multimedia/bellagio/bellagio.mk            |   12 ++++++
 6 files changed, 96 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/bellagio/Config.in
 create mode 100644 package/multimedia/bellagio/bellagio-0.9.3-dynamicloader-linking.patch
 create mode 100644 package/multimedia/bellagio/bellagio-0.9.3-parallel-build.patch
 create mode 100644 package/multimedia/bellagio/bellagio-0.9.3-segfault-on-removeFromWaitResource.patch
 create mode 100644 package/multimedia/bellagio/bellagio.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index a05d1d9..7e18bcb 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -2,6 +2,7 @@ menu "Audio and video libraries and applications"
 source "package/multimedia/alsa-lib/Config.in"
 source "package/multimedia/alsa-utils/Config.in"
 source "package/multimedia/aumix/Config.in"
+source "package/multimedia/bellagio/Config.in"
 source "package/multimedia/faad2/Config.in"
 source "package/multimedia/flac/Config.in"
 source "package/multimedia/ffmpeg/Config.in"
diff --git a/package/multimedia/bellagio/Config.in b/package/multimedia/bellagio/Config.in
new file mode 100644
index 0000000..907709f
--- /dev/null
+++ b/package/multimedia/bellagio/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_BELLAGIO
+	bool "bellagio"
+	help
+	  Bellagio is an opensource implementation of the
+	  OpenMAX IL API.
+
+	  OpenMAX Integration Layer (IL) is a standard API
+	  to access Multimedia Components on mobile platforms.
+	  It has been defined by the Khronos group.
+	  By means of the OpenMAX IL API, multimedia frameworks
+	  can access hardware accelerators on platforms that
+	  provide it.
+
+	  http://omxil.sourceforge.net/
diff --git a/package/multimedia/bellagio/bellagio-0.9.3-dynamicloader-linking.patch b/package/multimedia/bellagio/bellagio-0.9.3-dynamicloader-linking.patch
new file mode 100644
index 0000000..5e4243d
--- /dev/null
+++ b/package/multimedia/bellagio/bellagio-0.9.3-dynamicloader-linking.patch
@@ -0,0 +1,16 @@
+When libomxdynamicloader.so is loaded, it complains that RM_Deinit can't be resolved.
+Link explicitly against omxil-bellagio so that ld.so can find the reference.
+
+Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
+
+--- bellagio-0.9.3/src/dynamic_loader/Makefile.am.old	2012-03-23 15:07:47.379021034 +0000
++++ bellagio-0.9.3/src/dynamic_loader/Makefile.am	2012-03-23 15:08:47.563034818 +0000
+@@ -3,7 +3,7 @@
+ omxdynamicloader_LTLIBRARIES = libomxdynamicloader.la
+ libomxdynamicloader_la_SOURCES = ste_dynamic_component_loader.c ste_dynamic_component_loader.h
+ 
+-libomxdynamicloader_la_LDFLAGS =
++libomxdynamicloader_la_LDFLAGS = -lomxil-bellagio -L$(abs_top_srcdir)/src/.libs
+ libomxdynamicloader_la_CFLAGS = -I$(top_srcdir)/include \
+ 			-I$(top_srcdir)/src \
+ 			-I$(top_srcdir)/src/base \
diff --git a/package/multimedia/bellagio/bellagio-0.9.3-parallel-build.patch b/package/multimedia/bellagio/bellagio-0.9.3-parallel-build.patch
new file mode 100644
index 0000000..767bbeb
--- /dev/null
+++ b/package/multimedia/bellagio/bellagio-0.9.3-parallel-build.patch
@@ -0,0 +1,16 @@
+Fix dependency issue to allow parallel build
+
+Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
+
+Index: bellagio-0.9.3/src/Makefile.am
+===================================================================
+--- bellagio-0.9.3.orig/src/Makefile.am
++++ bellagio-0.9.3/src/Makefile.am
+@@ -8,6 +8,7 @@ omxregister_bellagio_SOURCES = omxregist
+ omxregister_bellagio_CFLAGS = -DOMXILCOMPONENTSPATH=\"$(plugindir)/\" \
+ 			      -I$(top_srcdir)/include
+ omxregister_bellagio_LDFLAGS = -lomxil-bellagio -L$(builddir)
++omxregister_bellagio_DEPENDENCIES = libomxil-bellagio.la
+ 
+ lib_LTLIBRARIES = libomxil-bellagio.la
+ libomxil_bellagio_la_SOURCES = component_loader.h \
diff --git a/package/multimedia/bellagio/bellagio-0.9.3-segfault-on-removeFromWaitResource.patch b/package/multimedia/bellagio/bellagio-0.9.3-segfault-on-removeFromWaitResource.patch
new file mode 100644
index 0000000..f52a2c3
--- /dev/null
+++ b/package/multimedia/bellagio/bellagio-0.9.3-segfault-on-removeFromWaitResource.patch
@@ -0,0 +1,37 @@
+We always access globalComponentList[] at indexComponent=-1 which causes a
+segfault. Use i as the index instead.
+
+Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
+
+--- bellagio-0.9.3/src/omx_reference_resource_manager.c.old	2012-03-13 10:15:25.743940980 +0000
++++ bellagio-0.9.3/src/omx_reference_resource_manager.c	2012-03-13 10:18:02.201971009 +0000
+@@ -485,7 +485,6 @@
+ OMX_ERRORTYPE RM_removeFromWaitForResource(OMX_COMPONENTTYPE *openmaxStandComp) {
+ 	omx_base_component_PrivateType* omx_base_component_Private;
+ 	int i = 0;
+-	int indexComponent = -1;
+ 
+ 	DEBUG(DEB_LEV_FUNCTION_NAME, "In %s\n", __func__);
+ 	omx_base_component_Private = (omx_base_component_PrivateType*)openmaxStandComp->pComponentPrivate;
+@@ -493,16 +492,13 @@
+ 	while(listOfcomponentRegistered[i].component_name != NULL ) {
+ 		if (!strcmp(listOfcomponentRegistered[i].component_name, omx_base_component_Private->name)) {
+ 			// found component in the list of the resource manager
+-			removeElemFromList(&globalComponentList[indexComponent], openmaxStandComp);
+-			break;
++			removeElemFromList(&globalComponentList[i], openmaxStandComp);
++			DEBUG(DEB_LEV_FUNCTION_NAME, "Out of %s\n", __func__);
++			return OMX_ErrorNone;
+ 		}
+ 		i++;
+ 	}
+-	if (indexComponent <0) {
+-		// No resource to be handled
+-		DEBUG(DEB_LEV_ERR, "In %s No resource to be handled\n", __func__);
+-		return OMX_ErrorNone;
+-	}
+-	DEBUG(DEB_LEV_FUNCTION_NAME, "Out of %s\n", __func__);
++	// No resource to be handled
++	DEBUG(DEB_LEV_ERR, "In %s No resource to be handled\n", __func__);
+ 	return OMX_ErrorNone;
+ }
diff --git a/package/multimedia/bellagio/bellagio.mk b/package/multimedia/bellagio/bellagio.mk
new file mode 100644
index 0000000..d013953
--- /dev/null
+++ b/package/multimedia/bellagio/bellagio.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# bellagio
+#
+#############################################################
+BELLAGIO_VERSION = 0.9.3
+BELLAGIO_SOURCE = libomxil-bellagio-$(BELLAGIO_VERSION).tar.gz
+BELLAGIO_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/omxil
+BELLAGIO_AUTORECONF = YES
+BELLAGIO_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.1
