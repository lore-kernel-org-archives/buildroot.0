From: Nicolas Pitre <nico@cam.org>
Date: Wed, 03 Dec 2008 15:03:31 -0500 (EST)
Subject: [Buildroot] [PATCH] fix errors with the JFFS2 rootfs target
Message-ID: <alpine.LFD.2.00.0812031503010.14328@xanadu.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


First, the build is stopped because

	rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share

returns an error.  The problem is not that /usr/share is not empty or
the like, but rather that it simply doesn't exist at all in some cases.
So let's ignore the return code in that case.

Also, when BR2_PREFER_STATIC_LIB is set, there is no ldconfig for
the target.

Signed-off-by: Nicolas Pitre <nico@cam.org>

Index: target/jffs2/jffs2root.mk
===================================================================
--- target/jffs2/jffs2root.mk	(revision 24219)
+++ target/jffs2/jffs2root.mk	(working copy)
@@ -58,8 +58,10 @@
 ifneq ($(BR2_HAVE_INFOPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/info
 endif
-	@rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
+	- at rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
+ifneq ($(BR2_PREFER_STATIC_LIB),y)
 	$(if $(TARGET_LDCONFIG),test -x $(TARGET_LDCONFIG) && $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)
+endif
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
