From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Jun 2015 16:24:54 +0200
Subject: [Buildroot] [git commit] Remove --{enable,
	disable}-debug configure flags.
Message-ID: <20150605142606.D469081E5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0552a367dbdc27a211daaac3359d81dd537e384f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding this flag when BR2_ENABLE_DEBUG is activated make several
packages to produce binaries that do not work as expected (e.g., dhcp,
lame, nano). Moreover, the help message of BR2_ENABLE_DEBUG does not
say it is adding this flag. It is supposed to build packages with
debugging symbols enabled. So, let it do that only.

* package/Makefile.in: Do not add --{enable,disable}-debug flags.
* package/pkg-autotools.mk: Remove ENABLE_DEBUG as it is not set
  anymore.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in      |    6 ------
 package/pkg-autotools.mk |    1 -
 2 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index a0c5a7a..c02d31f 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -373,12 +373,6 @@ ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 TARGET_CONFIGURE_OPTS += CXX=false
 endif
 
-ifeq ($(BR2_ENABLE_DEBUG),y)
-ENABLE_DEBUG := --enable-debug
-else
-ENABLE_DEBUG := --disable-debug
-endif
-
 ifeq ($(BR2_STATIC_LIBS),y)
 SHARED_STATIC_LIBS_OPTS = --enable-static --disable-shared
 TARGET_CFLAGS += -static
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 9dea08a..1d694f0 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -202,7 +202,6 @@ define $(2)_CONFIGURE_CMDS
 		--disable-dependency-tracking \
 		--enable-ipv6 \
 		$$(DISABLE_NLS) \
-		$$(ENABLE_DEBUG) \
 		$$(SHARED_STATIC_LIBS_OPTS) \
 		$$(QUIET) $$($$(PKG)_CONF_OPTS) \
 	)
