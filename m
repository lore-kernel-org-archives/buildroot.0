From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 17 Mar 2013 14:40:23 +0100
Subject: [Buildroot] [git commit] <pkg>-rsync: exclude version control files
Message-ID: <20130317134124.D38629B0BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b681efa4c2910c020662c1510efb4ee17008a17
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-generic.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 57b0fd0..8d964a1 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -62,7 +62,7 @@ $(BUILD_DIR)/%/.stamp_extracted:
 $(BUILD_DIR)/%/.stamp_rsynced:
 	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
-	rsync -au $(SRCDIR)/ $(@D)
+	rsync -au --cvs-exclude $(SRCDIR)/ $(@D)
 	$(Q)touch $@
 
 # Handle the SOURCE_CHECK and SHOW_EXTERNAL_DEPS cases for rsynced
