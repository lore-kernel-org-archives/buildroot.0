From: Qais Yousef <Qais.Yousef@imgtec.com>
Date: Tue, 20 Mar 2012 17:04:02 +0000
Subject: [Buildroot] [BUILDROOT][PATCH] Add bellagio package
Message-ID: <0D107966AF6D79418315B7C5549F4B51032EEA04@lemail1.le.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Attached patch adds Bellagio package. Copy pasted below also for
convenience.

Thanks
Qais

diff --git a/package/multimedia/bellagio/Config.in
b/package/multimedia/bellagio/Config.in
new file mode 100644
index 0000000..21998e9
--- /dev/null
+++ b/package/multimedia/bellagio/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_BELLAGIO
+	bool "bellagio"
+	help
+	  Bellagio is an opensource implementation of the OpenMAX IL
API.
+
+	  http://omxil.sourceforge.net/
diff --git
a/package/multimedia/bellagio/bellagio-0.9.3-segfault-on-removeFromWaitR
esource.patch
b/package/multimedia/bellagio/bellagio-0.9.3-segfault-on-removeFromWaitR
esource.patch
new file mode 100644
index 0000000..0716eeb
--- /dev/null
+++
b/package/multimedia/bellagio/bellagio-0.9.3-segfault-on-removeFromWaitR
esource.patch
@@ -0,0 +1,32 @@
+--- bellagio-0.9.3/src/omx_reference_resource_manager.c.old
2012-03-13 10:15:25.743940980 +0000
++++ bellagio-0.9.3/src/omx_reference_resource_manager.c
2012-03-13 10:18:02.201971009 +0000
+@@ -485,7 +485,6 @@
+ OMX_ERRORTYPE RM_removeFromWaitForResource(OMX_COMPONENTTYPE
*openmaxStandComp) {
+ 	omx_base_component_PrivateType* omx_base_component_Private;
+ 	int i = 0;
+-	int indexComponent = -1;
+ 
+ 	DEBUG(DEB_LEV_FUNCTION_NAME, "In %s\n", __func__);
+ 	omx_base_component_Private =
(omx_base_component_PrivateType*)openmaxStandComp->pComponentPrivate;
+@@ -493,16 +492,13 @@
+ 	while(listOfcomponentRegistered[i].component_name != NULL ) {
+ 		if (!strcmp(listOfcomponentRegistered[i].component_name,
omx_base_component_Private->name)) {
+ 			// found component in the list of the resource
manager
+-
removeElemFromList(&globalComponentList[indexComponent],
openmaxStandComp);
+-			break;
++			removeElemFromList(&globalComponentList[i],
openmaxStandComp);
++			DEBUG(DEB_LEV_FUNCTION_NAME, "Out of %s\n",
__func__);
++			return OMX_ErrorNone;
+ 		}
+ 		i++;
+ 	}
+-	if (indexComponent <0) {
+-		// No resource to be handled
+-		DEBUG(DEB_LEV_ERR, "In %s No resource to be handled\n",
__func__);
+-		return OMX_ErrorNone;
+-	}
+-	DEBUG(DEB_LEV_FUNCTION_NAME, "Out of %s\n", __func__);
++	// No resource to be handled
++	DEBUG(DEB_LEV_ERR, "In %s No resource to be handled\n",
__func__);
+ 	return OMX_ErrorNone;
+ }
diff --git a/package/multimedia/bellagio/bellagio.mk
b/package/multimedia/bellagio/bellagio.mk
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
+BELLAGIO_SITE =
http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/omxil
+BELLAGIO_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-bellagio.patch
Type: application/octet-stream
Size: 2740 bytes
Desc: buildroot-bellagio.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120320/311000be/attachment.obj>
