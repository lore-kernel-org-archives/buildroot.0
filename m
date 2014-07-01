From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 14:56:51 +0200
Subject: [Buildroot] [git commit] libffi: remove some header files installed
	in /usr/lib in the target
Message-ID: <20140701125921.9AB1B9CDAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5573e723695a830c05ae7a2649d811abc6b5061
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some reason, libffi installs some header files in
/usr/lib/libffi-<version>/include, which is a non-standard location
and therefore they do not get removed automatically by the
target-finalize logic. This commit adds a post-install hook in
libffi.mk to get rid of these unneeded headers on the target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libffi/libffi.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index dc7132d..1377b8f 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -22,6 +22,12 @@ endef
 
 LIBFFI_POST_INSTALL_STAGING_HOOKS += LIBFFI_MOVE_STAGING_HEADERS
 
+# Remove headers that are not at the usual location from the target
+define LIBFFI_REMOVE_TARGET_HEADERS
+	$(RM) -rf $(TARGET_DIR)/usr/lib/libffi-$(LIBFFI_VERSION)
+endef
+
+LIBFFI_POST_INSTALL_TARGET_HOOKS += LIBFFI_REMOVE_TARGET_HEADERS
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
