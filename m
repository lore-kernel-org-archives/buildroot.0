From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 16:30:14 +0100
Subject: [Buildroot] [git commit] core/sdk: don't mangle symlinks with '.'
 or '..' at start
Message-ID: <20190206152854.632F381569@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8fed1629878bfe620c533558ae3959a76588aec6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current transform changes any '.' at the start of a filename to
$(BR2_SDK_PREFIX). This also applies to the target of a symlink, when
it is relative.

We thus might end up with something like:
    $(BR2_SDK_PREFIX)/bin/aarch64-linux-gnu-ar ->
    $(BR2_SDK_PREFIX)./opt/ext-toolchain/bin/aarch64-linux-gnu-ar

when it should be:
    $(BR2_SDK_PREFIX)/bin/aarch64-linux-gnu-ar ->
    ../opt/ext-toolchain/bin/aarch64-linux-gnu-ar

We fix that by making sure we always remove a known prefix, i.e. we
remove the path to host dir. The obvious solution would be to cd into
$(HOST_DIR)/.. , then tar ./host/ and finally use a --transfrom pattern
as 's,^\./$(notdir $(HOST_DIR)),$(BR2_SDK_PREFIX)'.

Since $(HOST_DIR) can point to a user-supplied location, we don't know
very well how the pattern may patch.

Instead, we cd into / and tar the full path to $(HOST_DIR).

Since tar removes any leading '/', it would spurr a warning message,
which is annoying. So we explicitly remove the leading '/' from
$(HOST_DIR) when we tar it.

Finally, we transform all filenames to replace a leading $(HOST_DIR)
(without a leading /) to the prefix to use.

Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
[yann.morin.1998 at free.fr:
  - use a single transform pattern
  - use full HOST_DIR path as pattern to replace
  - update commit log accordingly
]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 50a9f623b2..bba7d650ab 100644
--- a/Makefile
+++ b/Makefile
@@ -608,8 +608,8 @@ sdk: prepare-sdk $(BR2_TAR_HOST_DEPENDENCY)
 	$(Q)mkdir -p $(BINARIES_DIR)
 	$(TAR) czf "$(BINARIES_DIR)/$(BR2_SDK_PREFIX).tar.gz" \
 		--owner=0 --group=0 --numeric-owner \
-		--transform='s#^\.#$(BR2_SDK_PREFIX)#' \
-		-C $(HOST_DIR) "."
+		--transform='s#^$(patsubst /%,%,$(HOST_DIR))#$(BR2_SDK_PREFIX)#' \
+		-C / $(patsubst /%,%,$(HOST_DIR))
 
 RSYNC_VCS_EXCLUSIONS = \
 	--exclude .svn --exclude .git --exclude .hg --exclude .bzr \
