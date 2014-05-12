From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 May 2014 22:22:32 +0200
Subject: [Buildroot] [git commit] build log: add message when starting
	target-finalize target
Message-ID: <20140512204138.A38959CB9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f6a2cfd819dd96e04d942e24612b7ada75773ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The target-finalize target does a large number of actions (removing
unnecessary files, stripping objects, etc.) but does not have a header. This
makes it seem that all these actions are done as part of the last action
before target-finalize, for example:
    >>> makedevs undefined Installing to target

To make a clear distinction, add a message to the beginning of
target-finalize:
    >>>   Finalizing target directory

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 2f18aab..4b06ab5 100644
--- a/Makefile
+++ b/Makefile
@@ -533,6 +533,7 @@ endif
 $(TARGETS_ROOTFS): target-finalize
 
 target-finalize: $(TARGETS)
+	@$(call MESSAGE,"Finalizing target directory")
 	$(TARGET_PURGE_LOCALES)
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
