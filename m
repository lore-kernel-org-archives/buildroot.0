From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 22:09:00 +0100
Subject: [Buildroot] [git commit] minizip: disable compatibility headers
Message-ID: <20190128210844.8185681062@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc166894b3f257c4cb20d84368c918f3335dadf5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

minizip enables zip.h and unzip.h compatibility headers since version
2.7.2 and
https://github.com/nmoinvaz/minizip/commit/1b2b32c8b8c7ea441b14a2fd827d7e2dc886776c

This is an issue as php fails to build if minizip is built after libzip
because minizip installs a zip.h header without zip_stat, ZIP_CREATE,
ZIP_FL_NOCASE, zip_fopen, etc ...

So until the compatibility headers are enhanced/fixed in minizip, disable them

Fixes:
 - http://autobuild.buildroot.org/results/7b41f4e4a521b1e17aa885aac4419b26e0dd8700

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minizip/minizip.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 7f7a1d277d..a9eea1b1c8 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -11,7 +11,9 @@ MINIZIP_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBBSD),libbsd) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 MINIZIP_INSTALL_STAGING = YES
-MINIZIP_CONF_OPTS = $(if $(BR2_PACKAGE_MINIZIP_DEMOS),-DBUILD_TEST=ON)
+MINIZIP_CONF_OPTS = \
+	$(if $(BR2_PACKAGE_MINIZIP_DEMOS),-DBUILD_TEST=ON) \
+	-DUSE_COMPAT=OFF
 MINIZIP_LICENSE = Zlib
 MINIZIP_LICENSE_FILES = LICENSE
 
