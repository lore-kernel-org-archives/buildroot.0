From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Sep 2014 22:50:47 +0200
Subject: [Buildroot] [git commit] libarchive: avoid some tools to build
	statically on shared builds
Message-ID: <20140911205338.6BF9C9D668@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9581d0d1177d41cc61501e0f93f6089da3c1d4c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some libarchive tools, like bsdtar, builds statically by default
although libarchive itself is being built dynamically. We can force
those tools to build the same way as libarchive by using the right
configure options.

Fixes:
  http://autobuild.buildroot.net/results/b8f/b8f7a29787ea1cc5c98e4cbd5f47f257f9b306f2/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libarchive/libarchive.mk |   24 +++++++++++++++++++++---
 1 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 8c6951d..979e65c 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -9,9 +9,27 @@ LIBARCHIVE_SITE = http://www.libarchive.org/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_LICENSE = BSD-2c, BSD-3c
 LIBARCHIVE_LICENSE_FILES = COPYING
-LIBARCHIVE_CONF_OPT = --without-lzma \
-	$(if $(BR2_PACKAGE_LIBARCHIVE_BSDTAR),--enable-bsdtar,--disable-bsdtar) \
-	$(if $(BR2_PACKAGE_LIBARCHIVE_BSDCPIO),--enable-bsdcpio,--disable-bsdcpio)
+LIBARCHIVE_CONF_OPT = --without-lzma
+
+ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+LIBARCHIVE_CONF_OPT += --enable-bsdtar=static
+else
+LIBARCHIVE_CONF_OPT += --enable-bsdtar=shared
+endif
+else
+LIBARCHIVE_CONF_OPT += --disable-bsdtar
+endif
+
+ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDCPIO),y)
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+LIBARCHIVE_CONF_OPT += --enable-bsdcpio=static
+else
+LIBARCHIVE_CONF_OPT += --enable-bsdcpio=shared
+endif
+else
+LIBARCHIVE_CONF_OPT += --disable-bsdcpio
+endif
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 LIBARCHIVE_DEPENDENCIES += acl
