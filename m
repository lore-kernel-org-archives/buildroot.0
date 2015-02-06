From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Feb 2015 10:29:17 +0100
Subject: [Buildroot] [git commit] rpm: use pkg-config to detect zlib and popt
Message-ID: <20150206092927.DBF4081787@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95c6848e811936c6716a481acc4a7a7a977684a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/98b/98b70ea09ecef214f13a622dcb926e01a6d6f7d9/
http://autobuild.buildroot.net/results/d13/d1343c3be9710d5be3cf6e4369dd5c75102e7b92/
http://autobuild.buildroot.net/results/457/457d3d9231f1422b19ffbac6d4a6ab02c6d6c22f/
http://autobuild.buildroot.net/results/ed8/ed8efe3985e6b423e4c18f9c200aa042ccb9ed23/

And many more.

Using --with-zlib=$(STAGING_DIR) causes the configure script to basically do
a find $(STAGING_DIR) -name zlib.h to figure out the correct include path
for zlib.  That is normally ok, but if botan is enabled and built before
rpm, then it installs a zlib.h header in
$(STAGING_DIR)/usr/include/botan-1.10/botan which confuses this logic and
causes configure to fail.

Fix it by using --with-zlib=external instead which causes the configure
script to use pkg-config to get the CFLAGS/LDFLAGS. Also do it for popt so
we don't end up with a similar issue in the future. We unfortunately cannot
do it for beecrypt as it doesn't install a .pc file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpm/rpm.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 42a3b64..7f346b2 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -7,7 +7,7 @@
 RPM_VERSION_MAJOR = 5.2
 RPM_VERSION = $(RPM_VERSION_MAJOR).0
 RPM_SITE = http://rpm5.org/files/rpm/rpm-$(RPM_VERSION_MAJOR)
-RPM_DEPENDENCIES = zlib beecrypt neon popt openssl
+RPM_DEPENDENCIES = host-pkgconf zlib beecrypt neon popt openssl
 RPM_LICENSE = LGPLv2.1
 RPM_LICENSE_FILES = COPYING.LIB
 
@@ -22,9 +22,9 @@ RPM_CONF_OPTS = \
 	--without-python \
 	--without-perl \
 	--with-openssl=external \
-	--with-zlib=$(STAGING_DIR) \
+	--with-zlib=external \
 	--with-libbeecrypt=$(STAGING_DIR) \
-	--with-popt=$(STAGING_DIR)
+	--with-popt=external
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 RPM_DEPENDENCIES += gettext
