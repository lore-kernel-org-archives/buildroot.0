From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 05 Jun 2012 21:22:14 +0200
Subject: [Buildroot] [PATCH 3 of 6] pkg-download.mk: support detection of
 URI schemes in DOWNLOAD
In-Reply-To: <patchbomb.1338924131@beantl019720>
References: <patchbomb.1338924131@beantl019720>
Message-ID: <757d7f291661ade68b50.1338924134@beantl019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
 package/pkg-download.mk |  7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -211,7 +211,12 @@ define DOWNLOAD_INNER
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
