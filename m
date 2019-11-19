From: unixmania at gmail.com <unixmania@gmail.com>
Date: Tue, 19 Nov 2019 09:18:31 -0300
Subject: [Buildroot] [PATCH v3 next] package/tar: bump target version to
 1.32 (host is kept at 1.29)
Message-ID: <20191119121831.2329-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Luc Creti <luc.creti@atos.net>

The host tar is used to create the archives in the VCS download backends
(git, cvs, svn, hg...) and tar 1.30 and forward have changed the way
they generate the archives.

So, all the archives that have been generated before 1.30 was released
are not bit-for-bit reproducible (even though the extracted content
would be), so the hashes we have for those archives would not match.

Hence host-tar must be kept at version 1.29.

For the target variant, this is less important, so bump it to the latest
version.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=12256

Signed-off-by: Luc Creti <luc.creti@atos.net>
Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
Changes v0->v1:
  - Commit message rewritten based on comment from Yann E. MORIN
Changes v1->v2:
  - Title modified to enphasize that host-tar is kept at 1.29
Changes v2->v3
  - Add a comment in the .mk file that explains why the host-tar package
    is kept at 1.29 and not bumped to any higher version
  - Add missing spaces around '='
  - Spell Author name as 'Luc Creti'
---
 package/tar/tar.hash |  2 +-
 package/tar/tar.mk   | 13 +++++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/tar/tar.hash b/package/tar/tar.hash
index 60309bab8f..90beb26094 100644
--- a/package/tar/tar.hash
+++ b/package/tar/tar.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-sha256	402dcfd0022fd7a1f2c5611f5c61af1cd84910a760a44a688e18ddbff4e9f024	tar-1.29.tar.xz
+sha256	d0d3ae07f103323be809bc3eac0dcc386d52c5262499fe05511ac4788af1fdd8	tar-1.32.tar.xz
 sha256	9173f222464dd3676118408840da5990527062b5c7daf6487bed7c396c45bfb1	tar-1.29.cpio.gz
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 6f609d7a02..e79e26f8c4 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -4,7 +4,12 @@
 #
 ################################################################################
 
-TAR_VERSION = 1.29
+# host-tar is used to create the archives in the VCS download backends and tar
+# 1.30 and forward have changed the archive format. So archives generated with
+# earlier versions are not bit-for-bit reproducible and the hashes would not
+# match. Hence host-tar must be kept at version 1.29.
+HOST_TAR_VERSION = 1.29
+TAR_VERSION = 1.32
 TAR_SOURCE = tar-$(TAR_VERSION).tar.xz
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
 # busybox installs in /bin, so we need tar to install as well in /bin
@@ -31,13 +36,13 @@ $(eval $(autotools-package))
 
 # host-tar: use cpio.gz instead of tar.gz to prevent chicken-egg problem
 # of needing tar to build tar.
-HOST_TAR_SOURCE = tar-$(TAR_VERSION).cpio.gz
+HOST_TAR_SOURCE = tar-$(HOST_TAR_VERSION).cpio.gz
 define HOST_TAR_EXTRACT_CMDS
 	mkdir -p $(@D)
 	cd $(@D) && \
 		$(call suitable-extractor,$(HOST_TAR_SOURCE)) $(TAR_DL_DIR)/$(HOST_TAR_SOURCE) | cpio -i --preserve-modification-time
-	mv $(@D)/tar-$(TAR_VERSION)/* $(@D)
-	rmdir $(@D)/tar-$(TAR_VERSION)
+	mv $(@D)/tar-$(HOST_TAR_VERSION)/* $(@D)
+	rmdir $(@D)/tar-$(HOST_TAR_VERSION)
 endef
 
 HOST_TAR_CONF_OPTS = --without-selinux
-- 
2.18.1
