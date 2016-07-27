From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2016 21:29:07 +0200
Subject: [Buildroot] [git commit] libarchive: add selection of bsdcat
Message-ID: <20160727193107.2030D81E50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ff00b2ad3cd05ba74422e53b1a2d8fb92a18614
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libarchive builds three commandline utilities: bsdtar, bsdcpio, and
bsdcat. This change adds control over the third utility to the list of
configuration options.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libarchive/Config.in     |  6 ++++++
 package/libarchive/libarchive.mk | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/package/libarchive/Config.in b/package/libarchive/Config.in
index 81b5936..fd429ac 100644
--- a/package/libarchive/Config.in
+++ b/package/libarchive/Config.in
@@ -24,4 +24,10 @@ config BR2_PACKAGE_LIBARCHIVE_BSDCPIO
 	  The 'bsdcpio' program is a different interface to
 	  essentially the same functionality as 'bsdtar'.
 
+config BR2_PACKAGE_LIBARCHIVE_BSDCAT
+	bool "bsdcat"
+	help
+	  The 'bsdcat' program is a simple replacement tool
+	  for zcat, bzcat, xzcat, and such.
+
 endif
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 30a2318..bcf92f9 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -30,6 +30,16 @@ else
 LIBARCHIVE_CONF_OPTS += --disable-bsdcpio
 endif
 
+ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDCAT),y)
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBARCHIVE_CONF_OPTS += --enable-bsdcat=static
+else
+LIBARCHIVE_CONF_OPTS += --enable-bsdcat=shared
+endif
+else
+LIBARCHIVE_CONF_OPTS += --disable-bsdcat
+endif
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 LIBARCHIVE_DEPENDENCIES += acl
 else
@@ -105,6 +115,7 @@ HOST_LIBARCHIVE_DEPENDENCIES = host-zlib
 HOST_LIBARCHIVE_CONF_OPTS = \
 	--disable-bsdtar \
 	--disable-bsdcpio \
+	--disable-bsdcat \
 	--disable-acl \
 	--disable-xattr \
 	--without-bz2lib \
