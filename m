From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 13:14:26 +0100
Subject: [Buildroot] [git commit] gauche: explicitly handle zlib
Message-ID: <20151105121616.BEE3581E4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e477de7df8366ce3d74afc9cb2a69ad1923c398
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-gauche currently fails to build if host-zlib was built before,
because it finds zlib.h, but due to issues in gauche's build system,
the LDFLAGS passed in the configure script (with -L
$(HOST_DIR)/usr/lib) are not passed all the way down to where -lz is
used, causing a build failure.

Since we don't need zlib support in host-gauche, we simply disable it
explicitly.

While we're at it, we make the optional dependency on zlib explicit
for the target variant of the gauche package.

Fixes:

   http://autobuild.buildroot.org/results/426/4269c465312ddcc801289914fa29427798ef7783/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gauche/gauche.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
index c0563b2..b887c6a 100644
--- a/package/gauche/gauche.mk
+++ b/package/gauche/gauche.mk
@@ -11,6 +11,15 @@ GAUCHE_LICENSE = BSD-3c, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)
 GAUCHE_LICENSE_FILES = COPYING
 GAUCHE_DEPENDENCIES = host-gauche
 
+HOST_GAUCHE_CONF_OPTS = --without-zlib
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+GAUCHE_CONF_OPTS += --with-zlib=$(STAGING_DIR)
+GAUCHE_DEPENDENCIES += zlib
+else
+GAUCHE_CONF_OPTS += --without-zlib
+endif
+
 # Detection of c99 support in configure fails without WCHAR. To enable
 # automatic detection of c99 support by configure, we need to enable
 # WCHAR in toolchain. But actually we do not need WCHAR at gauche
