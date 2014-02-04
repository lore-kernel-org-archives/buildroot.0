From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 15:15:48 +0100
Subject: [Buildroot] [git commit] pkg-download: make sure git downloads fail
	for unknown versions
Message-ID: <20140204141913.7C0CC9C759@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fecf5b522b651f1304fdc8976e98776f3a130830
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current git download helper creates the tarball by doing:

    git archive <version> | gzip -c > <tarball>

Unfortunately, even if "git archive" fails and returns a non-zero
error code, gzip ignores that, compresses nothing, and returns success
(zero error code). The consequence of this behavior is that when the
git version provided in the package is incorrect, we are not failing
during the download step, but later on when trying to extract the
tarball (which was incorrectly created as a result of the failing git
archive).

To fix this, we change the tarball creation logic to:

   git archive -o <tarball>.tmp <version> &&
   gzip -c <tarball>.tmp > <tarball> &&
   rm -f <tarball>.tmp

If the build is interrupted during the "gzip" command, we may leave
the .tmp file behind us, but this also happens with wget downloads,
and is generally not considered a problem, since this temporary file
will be overwritten next time we attempt to do download this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-download.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index c00689b..2641d4e 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -91,8 +91,9 @@ define DOWNLOAD_GIT
 	  (echo "Doing full clone" && \
 	   $(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME))) && \
 	pushd $($(PKG)_BASE_NAME) > /dev/null && \
-	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
-		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
+	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ -o $(DL_DIR)/.$($(PKG)_SOURCE).tmp $($(PKG)_DL_VERSION) && \
+	gzip -c $(DL_DIR)/.$($(PKG)_SOURCE).tmp > $(DL_DIR)/$($(PKG)_SOURCE) && \
+	rm -f $(DL_DIR)/.$($(PKG)_SOURCE).tmp && \
 	popd > /dev/null && \
 	rm -rf $($(PKG)_DL_DIR) && \
 	popd > /dev/null)
