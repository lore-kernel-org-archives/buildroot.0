From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Nov 2017 14:04:16 +0100
Subject: [Buildroot] [git commit] package/glibc: switch to downloading a
 tarball
Message-ID: <20171114125733.D2C7D812D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d84397ab79e20a51d44a11db7d5572d0423f15b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we do a full git clone of the repository, which takes quite
some time, especially on slow networks.

This was done like that because the initial patch was using the official
repository as the source of the download, and that repository did not
offer remotely-generated tarballs.

But now we've switched to using a mirror on github, which does provide
such a tarball, which provides faster downloads.

Use that.

However, the tarball from github differs from the one we were generating
locally, because the paths inside are different. WE used to create a
archive with paths starting with glibc-glibc-2.26-73-g4b692dfb95[...],
while github does away with the git-describe prefix, and generates paths
that start with just glibc-4b692dffb95[...]. The content are exactly
identicall (checked with a diff), though.

Update the hash accordingly.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.hash | 2 +-
 package/glibc/glibc.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 5910dda..4e5bc7f 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,4 +1,4 @@
 # Locally calculated (fetched from Github)
-sha256  f1f2566fea1518dd7244d322882242bbd654eb215fba51a7ab001b8fd2c9bcbe     glibc-glibc-2.26-73-g4b692dffb95ac4812b161eb6a16113d7e824982e.tar.gz
+sha256  d66b3702961c846ead2bacf17a9b5239cc1e8a43ca6e322f3637e99f276efec1     glibc-glibc-2.26-73-g4b692dffb95ac4812b161eb6a16113d7e824982e.tar.gz
 # Locally calculated (fetched from Github)
 sha256  5aa9adeac09727db0b8a52794186563771e74d70410e9fd86431e339953fd4bb     glibc-arc-2017.09-release.tar.gz
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 5911dfe..d99b524 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -18,8 +18,7 @@ GLIBC_VERSION = glibc-2.26-73-g4b692dffb95ac4812b161eb6a16113d7e824982e
 # When updating the version, check it on the official repository;
 # *NEVER* decide on a version string by looking at the mirror.
 # Then check that the mirror has been synced already (happens once a day.)
-GLIBC_SITE = https://github.com/bminor/glibc.git
-GLIBC_SITE_METHOD = git
+GLIBC_SITE = $(call github,bminor,glibc,$(GLIBC_VERSION))
 endif
 
 GLIBC_SRC_SUBDIR = .
