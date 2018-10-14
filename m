From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Oct 2018 14:25:43 +0200
Subject: [Buildroot] [PATCH 4/6] core/download: do not hard-code the path to
 hte package hash file
In-Reply-To: <cover.1539519817.git.yann.morin.1998@free.fr>
References: <cover.1539519817.git.yann.morin.1998@free.fr>
Message-ID: <a799fbc04fc1a1fab3567cdb61575b7e32e01cf7.1539519817.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that packges may have hashes for their downloaded files in a
versioned subdir or in the unversioned hash file, we can no longer
hard-code the path to the package hash file anymore.

Instead, we now make use of the per-package variable, that points to the
package hash file.

Note: of the packages for which we offer a version choice, almost none,
but some of the qt5 ones, have a per-version hash file, so we still use
the unversioned hash file for them. As for the few qt5 packages that do
have a per-version hash file for their licensing terms, they've already
been updated to duplicate their download hashes in both the unversioned
and per-version hash files. So, one way or the other, no hash check
would go missing with this change.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/pkg-download.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index bf93b9a08e..73ea2a69f8 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -97,7 +97,7 @@ define DOWNLOAD
 		-d '$($(PKG)_DL_DIR)' \
 		-D '$(DL_DIR)' \
 		-f '$(notdir $(1))' \
-		-H '$(PKGDIR)/$($(PKG)_RAWNAME).hash' \
+		-H '$($(PKG)_HASH_FILE)' \
 		-n '$($(PKG)_BASENAME_RAW)' \
 		-N '$($(PKG)_RAWNAME)' \
 		-o '$($(PKG)_DL_DIR)/$(notdir $(1))' \
-- 
2.14.1
