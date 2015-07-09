From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Jul 2015 07:58:02 +0200
Subject: [Buildroot] [git commit] pkg-autotools: fix whitespace regex in
	libtool patch hook
Message-ID: <20150709063745.898E28195F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5eb23c9b88001b31a9a5b46d091ceb0c3bb621f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The first sed line for ltmain_version attempts to match whitespace before
VERSION with [ space_character tab_character ]. The second sed line used to
make ltmain_patchlevel has only space characters in the whitespace expression,
possibly due to a smart editor automatically converting tabs to spaces. Make
these lines consistent with each other and more resilient against accidental
loss of tab characters by replacing the tabs with '\t'.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-autotools.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 54f5dcd..c748c78 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -60,9 +60,9 @@ endef
 define LIBTOOL_PATCH_HOOK
 	@$(call MESSAGE,"Patching libtool")
 	$(Q)for i in `find $($(PKG)_SRCDIR) -name ltmain.sh`; do \
-		ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$i | \
+		ltmain_version=`sed -n '/^[ \t]*VERSION=/{s/^[ \t]*VERSION=//;p;q;}' $$i | \
 		sed -e 's/\([0-9]*\.[0-9]*\).*/\1/' -e 's/\"//'`; \
-		ltmain_patchlevel=`sed -n '/^[     ]*VERSION=/{s/^[        ]*VERSION=//;p;q;}' $$i | \
+		ltmain_patchlevel=`sed -n '/^[ \t]*VERSION=/{s/^[ \t]*VERSION=//;p;q;}' $$i | \
 		sed -e 's/\([0-9]*\.[0-9]*\.*\)\([0-9]*\).*/\2/' -e 's/\"//'`; \
 		if test $${ltmain_version} = '1.5'; then \
 			$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
