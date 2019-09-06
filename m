From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Sep 2019 09:05:24 +0200
Subject: [Buildroot] [git commit] package/libdmtx: bump version to 0.7.5
Message-ID: <20190906070237.504928B82B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb06ed189624ce84803203579ed799b3db15e976
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to https://sourceforge.net/projects/libdmtx the project was
moved to https://github.com/dmtx so update project URL in Config.in.

Updated license hash due to upstream commit
https://github.com/dmtx/libdmtx/commit/b65ff367ad90ab29568a5719b2ec07a2c2a6d8e8

Added AUTORECONF because the github tarball does not include a
configure script.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdmtx/Config.in    |  2 +-
 package/libdmtx/libdmtx.hash |  4 ++--
 package/libdmtx/libdmtx.mk   | 13 +++++++++++--
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/libdmtx/Config.in b/package/libdmtx/Config.in
index b81b99c423..20f469148c 100644
--- a/package/libdmtx/Config.in
+++ b/package/libdmtx/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBDMTX
 	  libdmtx is a software library that enables programs to read
 	  and write Data Matrix barcodes of the modern ECC200 variety.
 
-	  http://www.libdmtx.org/
+	  https://github.com/dmtx/libdmtx
diff --git a/package/libdmtx/libdmtx.hash b/package/libdmtx/libdmtx.hash
index 01e4ba4910..98eef9aeeb 100644
--- a/package/libdmtx/libdmtx.hash
+++ b/package/libdmtx/libdmtx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  686bcfb44e50b96345aa53f41e285f2118a2cf87a333b69b74165a2e7ddca492  libdmtx-0.7.4.tar.gz
-sha256  fe6959a664a7abb7d19bf125fa58a045d8757fe3cb3dc41975a54da0e627313d  LICENSE
+sha256  be0c5275695a732a5f434ded1fcc232aa63b1a6015c00044fe87f3a689b75f2e  libdmtx-0.7.5.tar.gz
+sha256  fcc277b7302645322c63de22b9b0bdae2df3dfa7d6cbc0d5bed7a4d3f1a9af79  LICENSE
diff --git a/package/libdmtx/libdmtx.mk b/package/libdmtx/libdmtx.mk
index f718b137b5..39fb8d1a4d 100644
--- a/package/libdmtx/libdmtx.mk
+++ b/package/libdmtx/libdmtx.mk
@@ -4,10 +4,19 @@
 #
 ################################################################################
 
-LIBDMTX_VERSION = 0.7.4
-LIBDMTX_SITE = http://downloads.sourceforge.net/project/libdmtx/libdmtx/$(LIBDMTX_VERSION)
+LIBDMTX_VERSION = 0.7.5
+LIBDMTX_SITE = $(call github,dmtx,libdmtx,v$(LIBDMTX_VERSION))
 LIBDMTX_LICENSE = BSD-2-Clause or Special Permission
 LIBDMTX_LICENSE_FILES = LICENSE
 LIBDMTX_INSTALL_STAGING = YES
+# github tarball does not include configure
+LIBDMTX_AUTORECONF = YES
+
+# Create the m4 directory (missing from the archive).
+# This is required for autoconf.
+define LIBDMTX_CREATE_M4
+	mkdir -p $(@D)/m4
+endef
+LIBDMTX_PRE_CONFIGURE_HOOKS += LIBDMTX_CREATE_M4
 
 $(eval $(autotools-package))
