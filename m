From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 1 Sep 2013 21:35:47 +0200
Subject: [Buildroot] [git commit] neon: disable webdav when no XML support
	is available
Message-ID: <20130901194715.70A8B9B6B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7573464a9857c9480f7ee358ab6766f7349571ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 9169810a9bd97c99d8b7a0e8aadabdcca3883e99 ("neon: replace
'choice' for XML library with two options") the option
BR2_PACKAGE_NEON_NOXML no longer exists. However, it was not taken
into account properly within neon.mk, as this option was still used to
disable webdav support when no XML library has been selected.

Fixes:

  http://autobuild.buildroot.org/results/7ed/7ed657570d83b28389dd8c01ffdd895d2e8d145f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/neon/neon.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 1915e6c..2edc6b2 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -42,7 +42,7 @@ else
 NEON_CONF_OPT += --with-libxml2=no
 endif
 
-ifeq ($(BR2_PACKAGE_NEON_NOXML),y)
+ifeq ($(BR2_PACKAGE_NEON_EXPAT)$(BR2_PACKAGE_NEON_LIBXML2),)
 # webdav needs xml support
 NEON_CONF_OPT += --disable-webdav
 endif
