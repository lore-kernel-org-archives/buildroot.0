From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 May 2013 21:54:10 +0200
Subject: [Buildroot] [git commit branch/next] gutenprint: ensure target and
	host variant have the same patch hooks
Message-ID: <20130530195805.54FDA9A69D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b6c61d07f180805c1461754f685ecbd76efa3f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In preparation for the out-of-tree support, it is important that all
packages have the same patch hooks for the host variant and the target
variant (because the source tree will be shared between host and
target variants when doing out-of-tree build).

In the case of gutenprint, the patch hook executed for the target just
creates one directory which is needed for autoreconf to work, and the
host variant is not autoreconf'ed. So there is no harm in also
applying this patch hook to the host variant.

[Peter: autoreconf for host as pointed out by Arnout]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gutenprint/gutenprint.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index 0463771..b5d350d 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -12,6 +12,7 @@ GUTENPRINT_LICENSE_FILES = COPYING
 
 # Needed, as we touch Makefile.am
 GUTENPRINT_AUTORECONF = YES
+HOST_GUTENPRINT_AUTORECONF = YES
 
 GUTENPRINT_DEPENDENCIES = cups host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
@@ -58,6 +59,7 @@ define GUTENPRINT_CREATE_M4_DIR
 	mkdir -p $(@D)/m4local
 endef
 GUTENPRINT_POST_PATCH_HOOKS += GUTENPRINT_CREATE_M4_DIR
+HOST_GUTENPRINT_POST_PATCH_HOOKS += GUTENPRINT_CREATE_M4_DIR
 
 define HOST_GUTENPRINT_POST_BUILD_INSTAL_TMP_HEADER
 	cp $(@D)/src/xml/xmli18n-tmp.h $(HOST_DIR)/usr/include
