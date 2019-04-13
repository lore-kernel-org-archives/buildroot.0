From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 13 Apr 2019 15:57:04 +0200
Subject: [Buildroot] [git commit] package/libfreefare: fix static build with
 latomic
Message-ID: <20190413135451.AE6858E1C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c49482604eb8381e7a4a316f2e1dbba178adbacb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use pkg-config to retrieve openssl dependencies such as lz or latomic

Fixes:
 - http://autobuild.buildroot.org/results/9bf69f238a63ea28690f7c0dbb8c30feb0afc5ad

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libfreefare/libfreefare.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
index 13e6f2ad5e..16f15b34e4 100644
--- a/package/libfreefare/libfreefare.mk
+++ b/package/libfreefare/libfreefare.mk
@@ -9,13 +9,9 @@ LIBFREEFARE_SOURCE = libfreefare-$(LIBFREEFARE_VERSION).tar.bz2
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
 LIBFREEFARE_SITE = https://github.com/nfc-tools/libfreefare/releases/download/libfreefare-$(LIBFREEFARE_VERSION)
-LIBFREEFARE_DEPENDENCIES = libnfc openssl
+LIBFREEFARE_DEPENDENCIES = host-pkgconf libnfc openssl
 LIBFREEFARE_LICENSE = LGPL-3.0+ with exception
 LIBFREEFARE_LICENSE_FILES = COPYING
-
-ifeq ($(BR2_STATIC_LIBS),y)
-# openssl needs zlib even if the libfreefare example itself doesn't
-LIBFREEFARE_CONF_ENV += LIBS='-lz'
-endif
+LIBFREEFARE_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 
 $(eval $(autotools-package))
