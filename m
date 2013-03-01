From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 01 Mar 2013 21:26:38 +0100
Subject: [Buildroot] [PATCH] <pkg>-rsync: exclude version control files
Message-ID: <f9ac20b69b1bfd3f77ef.1362169598@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using rsync to import package sources (typically with
PKG_OVERRIDE_SRCDIR), it often happens that these external sources
are under version control, and contain directories like .git,
.hg, etc.

Depending on the project, these directories can become pretty large
and typically have a lot of files. Moreover, they are not necessary
in the context of building the package. Therefore, this commit adds
the --cvs-exclude option to the rsync call, saving both disk space
and sync time.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-generic.mk |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -62,7 +62,7 @@ endif
 $(BUILD_DIR)/%/.stamp_rsynced:
 	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
-	rsync -au $(SRCDIR)/ $(@D)
+	rsync -au --cvs-exclude $(SRCDIR)/ $(@D)
 	$(Q)touch $@
 
 # Handle the SOURCE_CHECK and SHOW_EXTERNAL_DEPS cases for rsynced
