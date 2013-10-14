From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 14 Oct 2013 21:23:02 +0800
Subject: [Buildroot] [PATCH 3/3] tcl: specify ln -sf to remove existing
	destination file
In-Reply-To: <1381756890.15266.1.camel@phoenix>
References: <1381756890.15266.1.camel@phoenix>
Message-ID: <1381756982.15266.3.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes below build error when executing
"make tcl-dirclean; make tcl-rebuild".

ln -s tclsh8.4 /opt/test/br-x86/buildroot/output/target/usr/bin/tclsh
ln: failed to create symbolic link '/opt/test/br-x86/buildroot/output/target/usr/bin/tclsh': File exists
make: *** [/opt/test/br-x86/buildroot/output/build/tcl-8.4.19/.stamp_target_installed] Error 1

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/tcl/tcl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 3291c1b..58f085a 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -37,7 +37,7 @@ endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_TCLSH
 else
 define TCL_SYMLINK_TCLSH
-	ln -s tclsh$(TCL_VERSION_MAJOR) $(TARGET_DIR)/usr/bin/tclsh
+	ln -sf tclsh$(TCL_VERSION_MAJOR) $(TARGET_DIR)/usr/bin/tclsh
 endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_SYMLINK_TCLSH
 endif
-- 
1.8.1.2
