From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 24 Jun 2013 10:40:56 +0200
Subject: [Buildroot] [PATCHv3 5/5] tcl: make the libtcl writable in order to
	be stripped
In-Reply-To: <1372063256-23292-1-git-send-email-richard.genoud@gmail.com>
References: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
 <1372063256-23292-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <1372063256-23292-6-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libtcl is installed with 0555 and that prevents it from being
stripped.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/tcl/tcl.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 3fd4047..9f766e0 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -42,5 +42,12 @@ endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_SYMLINK_TCLSH
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
