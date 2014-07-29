From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 23:54:22 +0200
Subject: [Buildroot] [git commit] flex: delete broken flex++ symlink from
	target
Message-ID: <20140729215747.81E649D333@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd70b3b7531ca8cabb5aadcd52606172bf187e50
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When flex is built for the target without installing the
flex binary, a flex++ symlink installed by flex's Makefile
points to the missing flex executable.  This mod adds
a post target install hook to remove the broken symlink.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flex/flex.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 17f651b..cd92dd7 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -29,6 +29,12 @@ define FLEX_DISABLE_PROGRAM
 endef
 FLEX_POST_PATCH_HOOKS += FLEX_DISABLE_PROGRAM
 
+# flex++ symlink is broken when flex binary is not installed
+define FLEX_REMOVE_BROKEN_SYMLINK
+	rm -f $(TARGET_DIR)/usr/bin/flex++
+endef
+FLEX_POST_INSTALL_TARGET_HOOKS += FLEX_REMOVE_BROKEN_SYMLINK
+
 endif
 
 $(eval $(autotools-package))
