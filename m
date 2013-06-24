From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 24 Jun 2013 10:40:55 +0200
Subject: [Buildroot] [PATCHv3 4/5] tcl: add a tclsh symlink
In-Reply-To: <1372063256-23292-1-git-send-email-richard.genoud@gmail.com>
References: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
 <1372063256-23292-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <1372063256-23292-5-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tclsh is installed with its version number (tclshx.y) but scripts (like
usb_modeswitch_dispatcher) are calling tclsh, not tclshx.y.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/tcl/tcl.mk |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 83d74ec..3fd4047 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -35,6 +35,11 @@ define TCL_REMOVE_TCLSH
 	rm -f $(TARGET_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)
 endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_TCLSH
+else
+define TCL_SYMLINK_TCLSH
+	ln -s tclsh$(TCL_VERSION_MAJOR) $(TARGET_DIR)/usr/bin/tclsh
+endef
+TCL_POST_INSTALL_TARGET_HOOKS += TCL_SYMLINK_TCLSH
 endif
 
 $(eval $(autotools-package))
-- 
1.7.10.4
