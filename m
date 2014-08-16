From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Aug 2014 09:29:59 +0200
Subject: [Buildroot] [git commit] Makefile: unconditionally include
	pkg-utils.mk
Message-ID: <20140816073245.137419D44D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ed0eada71d4cb937d1f68c9af011aea5bff0e02
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, pkg-utils.mk (included via package/Makefile.in) is only included
when a configuration file already exists. This means that none of the
utilities it defines are available without .config.

In particular:
- the MESSAGE macro, causing pretty build output. Since some make targets
  can be run even without .config, like 'make manual', not having this
  pretty printing is odd.

- pkgname, pkgdir: in a subsequent patch, these functions will be used for
  the generation of the manual, and since this should work also without
  .config, we need these functions to be available.

This patch moves the include of pkg-utils.mk from package/Makefile.in to
Makefile, outside of the check for .config.

This is a quick fix. The full solution involves to minimize the amount of
Makefile code that is guarded by a check on .config. This approach will be
taken in the 2014.11 release cycle.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile            |    2 ++
 package/Makefile.in |    1 -
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 5d84c4b..0b6e597 100644
--- a/Makefile
+++ b/Makefile
@@ -271,6 +271,8 @@ unexport DESTDIR
 # Causes breakage with packages that needs host-ruby
 unexport RUBYOPT
 
+include package/pkg-utils.mk
+
 ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 ################################################################################
diff --git a/package/Makefile.in b/package/Makefile.in
index 60816b4..7d9943c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -385,7 +385,6 @@ else
 SHARED_STATIC_LIBS_OPTS = --enable-static --enable-shared
 endif
 
-include package/pkg-utils.mk
 include package/pkg-download.mk
 include package/pkg-autotools.mk
 include package/pkg-cmake.mk
