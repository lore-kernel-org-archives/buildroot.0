From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2020 13:32:17 +0100
Subject: [Buildroot] [git commit] package/tar: bump target version to 1.32
 (host is kept at 1.29)
Message-ID: <20200118122425.E40FE811AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e185f62c58f97378785fd46476cc8ec099989230
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
[yann.morin.1998 at free.fr: move all host-related comments and variables]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
index 6f609d7a02..9e0a40e561 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAR_VERSION = 1.29
+TAR_VERSION = 1.32
 TAR_SOURCE = tar-$(TAR_VERSION).tar.xz
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
 # busybox installs in /bin, so we need tar to install as well in /bin
@@ -29,15 +29,20 @@ endif
 
 $(eval $(autotools-package))
 
+# host-tar is used to create the archives in the VCS download backends and tar
+# 1.30 and forward have changed the archive format. So archives generated with
+# earlier versions are not bit-for-bit reproducible and the hashes would not
+# match. Hence host-tar must be kept at version 1.29.
+HOST_TAR_VERSION = 1.29
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
