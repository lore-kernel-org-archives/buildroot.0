From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:38:39 +0200
Subject: [Buildroot] [PATCH 05/53] Eliminate $(HOST_DIR)/usr
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-6-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We currently use $(HOST_DIR)/usr as the prefix for host packages. That
has a few disadvantages:

- There are some things installed in $(HOST_DIR)/etc and
  $(HOST_DIR)/sbin, which is inconsistent.

- To pack a buildroot-built toolchain into a tarball for use as an
  external toolchain, you have to pack output/host/usr instead of the
  more obvious output/host.

- Because of the above, the internal toolchain wrapper breaks which
  forces us to work around it (call the actual toolchain executable
  directly). This is OK for us, but when used in another build system,
  that's a problem.

- Paths are four characters longer.

To allow us to gradually eliminate $(HOST_DIR)/usr while building
packages, replace it with a symlink to .

The symlinks from $(HOST_DIR)/usr/$(GNU_TARGET_NAME) and
$(HOST_DIR)/usr/lib that were added previously are removed again.

Note that the symlink creation will break when $(HOST_DIR)/usr
already exists as a directory, i.e. when rebuilding in an existing
output directory. This is necessary: if we don't break it now, the
following commits (which remove the usr part from various variables)
_will_ break it.

At the same time as creating this symlink, we have to update the
external toolchain wrapper and the external toolchain symlinks to go
one directory less up. Indeed, $(HOST_DIR) is one level less up than
it was before.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I intended to also move $(HOST_DIR)/usr/bin in a separate patch, but
that turns out to break the internal toolchain: host-gcc-initial uses
relative paths to find cc1 etc. and these will be broken.
---
 Makefile                                               | 7 +++----
 toolchain/toolchain-external/pkg-toolchain-external.mk | 6 +++---
 toolchain/toolchain-wrapper.c                          | 2 +-
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 1cfc5695e3..d78985464b 100644
--- a/Makefile
+++ b/Makefile
@@ -552,16 +552,15 @@ world: target-post-image
 	legal-info legal-info-prepare legal-info-clean printvars help \
 	list-defconfigs target-finalize target-post-image source-check
 
-# When creating HOST_DIR, also symlink usr/lib -> ../lib
+# When creating HOST_DIR, also symlink usr -> .
 $(HOST_DIR):
-	@mkdir -p $@/usr $@/lib
-	@ln -snf ../lib $@/usr/lib
+	@mkdir -p $@
+	@ln -snf . $@/usr
 
 # Populating the staging with the base directories is handled by the skeleton package
 $(STAGING_DIR): | $(HOST_DIR)
 	@mkdir -p $(STAGING_DIR)
 	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
-	@ln -snf ../$(GNU_TARGET_NAME) $(HOST_DIR)/usr/$(GNU_TARGET_NAME)
 
 RSYNC_VCS_EXCLUSIONS = \
 	--exclude .svn --exclude .git --exclude .hg --exclude .bzr \
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 9670350dc0..9dc6e31df3 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -251,18 +251,18 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 		base=$${i##*/}; \
 		case "$$base" in \
 		*-ar|*-ranlib|*-nm) \
-			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
+			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%..%') .; \
 			;; \
 		*cc|*cc-*|*++|*++-*|*cpp|*-gfortran) \
 			ln -sf toolchain-wrapper $$base; \
 			;; \
 		*gdb|*gdbtui) \
 			if test "$(BR2_PACKAGE_HOST_GDB)" != "y"; then \
-				ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
+				ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%..%') .; \
 			fi \
 			;; \
 		*) \
-			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
+			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%..%') .; \
 			;; \
 		esac; \
 	done
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 100aa181c6..3a4455ff82 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -178,7 +178,7 @@ int main(int argc, char **argv)
 			perror(__FILE__ ": malloc");
 			return 2;
 		}
-		sprintf(relbasedir, "%s/../..", argv[0]);
+		sprintf(relbasedir, "%s/..", argv[0]);
 		absbasedir = realpath(relbasedir, NULL);
 	} else {
 		basename = progpath;
-- 
2.11.0
