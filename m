From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 11:38:23 +0200
Subject: [Buildroot] [git commit] Move $(HOST_DIR)/usr/$(GNU_TARGET_NAME)
	one level up.
Message-ID: <20170705095035.8201081DF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82ec49787d39c0883fd8f65f7b21aa00442f01b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a step towards eliminating $(HOST_DIR)/usr. It allows us to
convert all packages installing things into
$(HOST_DIR)/usr/$(GNU_TARGET_NAME) (i.e., binutils and gcc) without
affecting the rest.

To allow compatibility with packages that still use $(HOST_DIR)/usr as
the prefix, create a symlink from usr/$(GNU_TARGET_NAME) to
../$(GNU_TARGET_NAME).

Note that the symlink creation will break when $(HOST_DIR)/usr/lib
already exists as a directory, i.e. when rebuilding in an existing
output directory. This is necessary: if we don't break it now, the
following commits (which remove the usr part from various variables)
_will_ break it.

Effectively, the usr/ part is removed from $(STAGING_SUBDIR) (and
therefore from $(STAGING_DIR)), so update the definition of that
variable right away.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile            | 2 ++
 package/Makefile.in | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index b37171f..a0f9f62 100644
--- a/Makefile
+++ b/Makefile
@@ -556,6 +556,8 @@ world: target-post-image
 $(STAGING_DIR):
 	@mkdir -p $(STAGING_DIR)
 	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
+	@mkdir -p $(HOST_DIR)/usr
+	@ln -snf ../$(GNU_TARGET_NAME) $(HOST_DIR)/usr/$(GNU_TARGET_NAME)
 
 RSYNC_VCS_EXCLUSIONS = \
 	--exclude .svn --exclude .git --exclude .hg --exclude .bzr \
diff --git a/package/Makefile.in b/package/Makefile.in
index b98333f..291108c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -107,7 +107,7 @@ ifeq ($(BR2_arc)$(BR2_ARC_ATOMIC_EXT),yy)
 TARGET_ABI += -matomic
 endif
 
-STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
+STAGING_SUBDIR = $(GNU_TARGET_NAME)/sysroot
 STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)
 
 ifeq ($(BR2_OPTIMIZE_0),y)
