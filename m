From: richard.genoud at gmail.com <richard.genoud@gmail.com>
Date: Fri, 21 Jun 2013 13:57:02 +0200
Subject: [Buildroot] [PATCH 6/6] tcl: make the libtcl writable in order to
	be stripped
In-Reply-To: <1371815822-29453-1-git-send-email-y>
References: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
 <1371815822-29453-1-git-send-email-y>
Message-ID: <51c43fa6.ebbbb40a.0abf.ffffba1d@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Richard Genoud <richard.genoud@gmail.com>

The libtcl is installed with 0555 and that prevents it from being
stripped.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/tcl/tcl.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index b50daeb..55d083a 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -42,5 +42,12 @@ endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_TCLSH
 endif
 
+# library get installed read only, so strip fails
+define TCL_FIXUP_RO_LIB
+	chmod +w $(TARGET_DIR)/usr/lib/libtcl*
+endef
+
+TCL_POST_INSTALL_TARGET_HOOKS += TCL_FIXUP_RO_LIB
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.10.4
