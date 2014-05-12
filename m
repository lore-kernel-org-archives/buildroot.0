From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 12 May 2014 16:19:27 +0200
Subject: [Buildroot] [PATCH] build log: add message when starting
	target-finalize target
Message-ID: <3230f72b2606158b2575.1399904367@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The target-finalize target does a large number of actions (removing
unnecessary files, stripping objects, etc.) but does not have a header. This
makes it seem that all these actions are done as part of the last action
before target-finalize, for example:
    >>> makedevs undefined Installing to target

To make a clear distinction, add a message to the beginning of
target-finalize:
    >>>   Finalizing target directory

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Makefile |  1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

Note: in system/system.mk there are a number of smaller items that are
executed before target-finalize but do not have any message associated with
them. This includes the adding to securetty, the setting of issue and
hostname, ... Adding a message to each of these small targets is probably
too much, but if we could find an elegant way to add a message to the group
of system/system.mk, that would be nice.
Adding an initial target in system/system.mk just printing a message would
work, but only if there is no top-level parallel build.

diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -533,6 +533,7 @@ endif
 $(TARGETS_ROOTFS): target-finalize
 
 target-finalize: $(TARGETS)
+	@$(call MESSAGE,"Finalizing target directory")
 	$(TARGET_PURGE_LOCALES)
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
