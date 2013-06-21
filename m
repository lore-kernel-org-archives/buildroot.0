From: richard.genoud at gmail.com <richard.genoud@gmail.com>
Date: Fri, 21 Jun 2013 13:57:01 +0200
Subject: [Buildroot] [PATCH 5/6] tcl: add a tclsh symlink
In-Reply-To: <1371815822-29453-1-git-send-email-y>
References: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
 <1371815822-29453-1-git-send-email-y>
Message-ID: <51c43fa4.ebbbb40a.0abf.ffffba19@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Richard Genoud <richard.genoud@gmail.com>

tclsh is installed with its version number (tclshx.y) but scripts (like
usb_modeswitch_dispatcher) are calling tclsh, not tclshx.y.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/tcl/tcl.mk |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 90989d0..b50daeb 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -30,7 +30,12 @@ endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_ENCODINGS
 endif
 
-ifneq ($(BR2_PACKAGE_TCL_TCLSH),y)
+ifeq ($(BR2_PACKAGE_TCL_TCLSH),y)
+define TCL_SYMLINK_TCLSH
+	ln -s tclsh$(TCL_VERSION_MAJOR) $(TARGET_DIR)/usr/bin/tclsh
+endef
+TCL_POST_INSTALL_TARGET_HOOKS += TCL_SYMLINK_TCLSH
+else
 define TCL_REMOVE_TCLSH
 	rm -f $(TARGET_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)
 endef
-- 
1.7.10.4
