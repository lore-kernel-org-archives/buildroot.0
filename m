From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Dec 2014 10:36:02 +0100
Subject: [Buildroot] [git commit] package/berkeleydb: fix shared-only build
Message-ID: <20141213112237.D95D2801F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c3f1d510217283d94e888f4fb64fc4964913182
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changeset f1d3e09 (Build shared libraries only as the default) broke the
berkeleydb package.

For some reason, we had a very strange post-configure action in bdb:
        $(SED) 's/\.lo/.o/g' $(@D)/build_unix/Makefile

This means that it is using non-libtool object files. This breaks
building shared-only.

This code has been present almost the whole time we've had a berkeleydb
package, that is:
  - November 2003: use a sed expression instead of perl
  - March 2003   : use a perl program
  - August 2002  : introduce berkeleydb

Getting rid of this sed expression fixes the build, and allows building
the three new static/shared combinations: static only, shared only,
both static and shared.

Fixes numerous build failures:
    http://autobuild.buildroot.net/results/b41/b41e13ec6c13830667770b3731f8990062f202bd/
    http://autobuild.buildroot.net/results/925/925433ef505b190aa5ac83c23e9359afe4b21829/
    http://autobuild.buildroot.net/results/9af/9afa0dd835af079411a2ea5d94e5e4db7c993111/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/berkeleydb/berkeleydb.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index 452c787..30fc518 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -41,7 +41,6 @@ define BERKELEYDB_CONFIGURE_CMDS
 		--with-pic \
 		--enable-o_direct \
 	)
-	$(SED) 's/\.lo/.o/g' $(@D)/build_unix/Makefile
 endef
 
 ifneq ($(BR2_PACKAGE_BERKELEYDB_TOOLS),y)
