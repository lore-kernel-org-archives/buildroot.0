From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 22:50:35 +0200
Subject: [Buildroot] [git commit] binutils: fix makeinfo related issue
Message-ID: <20160911205047.8571A81E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5033dd7facaec3cd8d0d129b1f457a2f55f6d7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest version of binutils, 2.27, added in commit
b700157db40410907d6a07582eacbb5030fd919e, fails to build on systems
that don't have makeinfo installed. This commit therefore applies the
same fixup as the one used for binutils 2.26, which consists in
touching all the .info files, so that they don't get rebuilt.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 71ea2b0..ad3a0d8 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -33,10 +33,10 @@ BINUTILS_DEPENDENCIES += host-flex host-bison host-texinfo
 HOST_BINUTILS_DEPENDENCIES += host-flex host-bison host-texinfo
 endif
 
-# The .info files in the 2.26 tarball have an incorrect timestamp, so
-# binutils tries to re-generate them. In order to avoid the dependency
-# on host-texinfo, we simply update the timestamps.
-ifeq ($(BR2_BINUTILS_VERSION_2_26_X),y)
+# The .info files in the >= 2.26 tarball have an incorrect timestamp,
+# so binutils tries to re-generate them. In order to avoid the
+# dependency on host-texinfo, we simply update the timestamps.
+ifeq ($(BR2_BINUTILS_VERSION_2_26_X)$(BR2_BINUTILS_VERSION_2_27_X),y)
 define BINUTILS_FIXUP_INFO_TIMESTAMPS
 	find $(@D) -name '*.info' -exec touch {} \;
 endef
