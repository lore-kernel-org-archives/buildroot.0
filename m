From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 21 Mar 2017 01:07:12 +0100
Subject: [Buildroot] [PATCH 16/16] pkg-download: enable hash check for git
	downloads
In-Reply-To: <20170321000712.26500-1-arnout@mind.be>
References: <20170321000712.26500-1-arnout@mind.be>
Message-ID: <20170321000712.26500-17-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For a while already, our git downloaded tarballs are reproducible, so
we can actually check the hash for them.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Tested 'make pkg-source' for all git-downloaded packages (with and
without hash files).
---
 package/pkg-download.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index cfc550e77b..fbbc2d7391 100644
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
-- 
2.11.0
