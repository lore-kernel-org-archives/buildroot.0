From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Apr 2016 23:37:19 +0200
Subject: [Buildroot] [git commit] core/pkg-download: ignore hashes from
	mirror for VCS downloads
Message-ID: <20160420213804.3A4A281E1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5652374a0e299d37826ddaab48b857a4b8136c6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a download via a VCS method fails, Buildroot attempts the download
from the backup mirror (if any is set). Such a download is done with the
wget helper.

Given a package that has a .hash file for relase tarballs, which also
allows the user to use a random revision from a VCS, the normal download
wrapper will not check for hashes, on the assumption that maybe they are
not reproducible [*] (or user configurable).

However, when the download fails (for any reason: network error,
upstream removed the revision, old machine with incomplete set of CA
certificates...), the backup download now proceeds over with http (or
https) with the wget wrapper. The wget wrapper *always* checks for
hashes, and when a .hash file is present but no hash is found for the
download, this is considered an error.

However, when we download from the backup mirror for a main download that
should have been done with git/hq/svn/.., we in this situation have no hash
for the download.  Thus, we should not fail on a missing hash for that
download. Same situation if a primary site is used.

Add a test for the site-method in the DOWNLOAD_INNER macro; if it was either
one of the VCS method, pass a one-off BR_NO_CHECK_HASH_FOR variable set to
contain the tarball to download.

Fixes issues like those reported by the Travis build bots:
    https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/123624879

[Peter: Move logic to beginning of DOWNLOAD_INNER so it also applies for BR2_PRIMARY_SITE]
Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-download.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 1332e66..a0f694d 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -212,7 +212,8 @@ define SOURCE_CHECK
 endef
 
 define DOWNLOAD_INNER
-	$(Q)if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
+	$(Q)$(if $(filter bzr cvs git hg svn,$($(PKG)_SITE_METHOD)),export BR_NO_CHECK_HASH_FOR=$(2);) \
+	if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
 		case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
 			file) $(call $(3)_LOCALFILES,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
 			scp) $(call $(3)_SCP,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
