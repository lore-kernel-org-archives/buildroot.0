From: Qais Yousef <qais.yousef@imgtec.com>
Date: Wed, 21 Mar 2012 13:11:59 +0000
Subject: [Buildroot] [PATCH] new package: bellagio
Message-ID: <1332335519-31492-1-git-send-email-qais.yousef@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/bellagio/Config.in              |   14 +++++++
 ...-0.9.3-segfault-on-removeFromWaitResource.patch |   37 ++++++++++++++++++++
 package/multimedia/bellagio/bellagio.mk            |   11 ++++++
 4 files changed, 63 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/bellagio/Config.in
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
index 0000000..3be7e55
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
+	http://omxil.sourceforge.net/
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
index 0000000..3987a20
--- /dev/null
+++ b/package/multimedia/bellagio/bellagio.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# bellagio
+#
+#############################################################
+BELLAGIO_VERSION = 0.9.3
+BELLAGIO_SOURCE = libomxil-bellagio-$(BELLAGIO_VERSION).tar.gz
+BELLAGIO_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/omxil
+BELLAGIO_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.1
