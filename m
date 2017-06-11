From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 14:28:17 +0200
Subject: [Buildroot] [git commit] pkg-download: enable hash check for git
	downloads
Message-ID: <20170611123753.12F66819CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1679b745cb5d9ef15b1a614571dddc8a87d4c31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For a while already, our git downloaded tarballs are reproducible, so
we can actually check the hash for them.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index cfc550e..fbbc2d7 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -77,6 +77,7 @@ define DOWNLOAD_GIT
 	$(EXTRA_ENV) $(DL_WRAPPER) -b git \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
 		$(if $($(PKG)_GIT_SUBMODULES),-r) \
+		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		$(QUIET) \
 		-- \
 		$($(PKG)_SITE) \
@@ -225,7 +226,7 @@ define SOURCE_CHECK
 endef
 
 define DOWNLOAD_INNER
-	$(Q)$(if $(filter bzr cvs git hg svn,$($(PKG)_SITE_METHOD)),export BR_NO_CHECK_HASH_FOR=$(2);) \
+	$(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),export BR_NO_CHECK_HASH_FOR=$(2);) \
 	if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
 		case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
 			file) $(call $(3)_LOCALFILES,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
