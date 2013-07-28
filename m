From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 16:20:11 +0200
Subject: [Buildroot] [git commit] tcl: make the libtcl writable in order to
	be stripped
Message-ID: <20130728142001.366089AD30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9444180c15ed7c6f302f1e9361f589c28189816c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libtcl is installed with 0555 and that prevents it from being
stripped.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tcl/tcl.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index c145f57..f1193d3 100644
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
