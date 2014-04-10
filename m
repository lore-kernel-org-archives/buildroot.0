From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Apr 2014 22:27:20 +0200
Subject: [Buildroot] [git commit] gd: fix static build with threads
Message-ID: <20140410204504.2F7F29C483@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c53dd65b2309eedf1302146492f9af7f6a3295f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/4b4/4b4272876385cc21dd06ee946d658b8f9e225d78/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gd/gd.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 60c1c51..146ad6f 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -16,6 +16,11 @@ GD_LICENSE_FILES = COPYING
 GD_CONFIG_SCRIPTS = gdlib-config
 GD_CONF_OPT = --without-x --disable-rpath
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_PREFER_STATIC_LIB),yy)
+# add -pthread when linking executables statically
+GD_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -pthread"
+endif
+
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 GD_DEPENDENCIES += fontconfig
 GD_CONF_OPT += --with-fontconfig
