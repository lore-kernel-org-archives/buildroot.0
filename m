From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:48 -0000
Subject: [Buildroot] [git commit branch/next] pkg-download: handle
	interrupted wget downloads
Message-ID: <20120802195247.4AD178C999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96885ca7eb4a05e65986334d6138e1fe6afa46fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When a wget download is interrupted, the downloaded file is still created.
It will therefore not be re-downloaded in the next build, and the
extraction will fail.

To avoid this, download to a temporary file first and rename when the
download is successful.

The existing mechanism doesn't work for interrupted downloads because the
whole sub-shell is interrupted, so the rm-part never gets executed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-download.mk |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 7d1e543..7983706 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -158,11 +158,14 @@ endef
 # Download a file using wget. Only download the file if it doesn't
 # already exist in the download directory. If the download fails,
 # remove the file (because wget -O creates a 0-byte file even if the
-# download fails).
+# download fails).  To handle an interrupted download as well, download
+# to a temporary file first.  The temporary file will be overwritten
+# the next time the download is tried.
 define DOWNLOAD_WGET
 	test -e $(DL_DIR)/$(2) || \
-	$(WGET) -O $(DL_DIR)/$(2) '$(call qstrip,$(1))' || \
-	(rm -f $(DL_DIR)/$(2) ; exit 1)
+	($(WGET) -O $(DL_DIR)/$(2).tmp '$(call qstrip,$(1))' && \
+	 mv $(DL_DIR)/$(2).tmp $(DL_DIR)/$(2)) || \
+	(rm -f $(DL_DIR)/$(2).tmp ; exit 1)
 endef
 
 define SOURCE_CHECK_WGET
