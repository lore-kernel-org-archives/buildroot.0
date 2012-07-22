From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 16:53:24 +0200
Subject: [Buildroot] [git commit branch/next] pkg-download.mk: support
	detection of URI schemes in DOWNLOAD
Message-ID: <20120802195257.E6D168E8F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77e26972187b9cda1a8f22ca74da154687c9ab1a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When using one of the package infrastructures, the DOWNLOAD function
uses $(PKG)_SITE_METHOD to determine the appropriate download method,
which is autodetected based on the URI if none was explicitly set.

When the DOWNLOAD function is called directly, for example when
downloading a toolchain, or from a package that does not use one of
the package infrastructures, the SITE_METHOD is not autodetected,
and thus the download defaults to wget.

This patch adds URI scheme detection directly to the DOWNLOAD method,
in case no SITE_METHOD was detected yet.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index ca5b404..e938759 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -214,7 +214,12 @@ define DOWNLOAD_INNER
 		esac ; \
 	fi ; \
 	if test -n "$(1)" ; then \
-		case "$($(PKG)_SITE_METHOD)" in \
+		if test -z "$($(PKG)_SITE_METHOD)" ; then \
+			scheme="$(call geturischeme,$(1))" ; \
+		else \
+			scheme="$($(PKG)_SITE_METHOD)" ; \
+		fi ; \
+		case "$$scheme" in \
 			git) $($(DL_MODE)_GIT) && exit ;; \
 			svn) $($(DL_MODE)_SVN) && exit ;; \
 			bzr) $($(DL_MODE)_BZR) && exit ;; \
