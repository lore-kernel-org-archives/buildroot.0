From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  2 Oct 2018 11:30:15 +0200
Subject: [Buildroot] [PATCH] links: fix X11 library/includes detection
Message-ID: <20181002093015.17431-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/4b0/4b02713ed5c10b58f390f96ea25f2a45c9a47af4/
http://autobuild.buildroot.net/results/ac6/ac668f867b9de7a2c61d263a894480afc181dd9b/
http://autobuild.buildroot.net/results/f02/f0248b3bf4a73210f210f422c8df067a6ea28aa1/

The configure script uses AC_PATH_X, which searches the host for the X11
libraries/headers, causing build failures.

https://www.gnu.org/software/autoconf/manual/autoconf-2.65/html_node/System-Services.html

Fix it by using --x-includes / --x-libraries like we do elsewhere.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/links/links.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/links/links.mk b/package/links/links.mk
index dd6adb29b1..651a089fda 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -15,7 +15,10 @@ ifeq ($(BR2_PACKAGE_LINKS_GRAPHICS),y)
 LINKS_CONF_OPTS += --enable-graphics
 LINKS_DEPENDENCIES += libpng
 ifeq ($(BR2_PACKAGE_XLIB_LIBXT),y)
-LINKS_CONF_OPTS += --with-x
+LINKS_CONF_OPTS += \
+	--with-x \
+	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-libraries=$(STAGING_DIR)/usr/lib
 LINKS_DEPENDENCIES += xlib_libXt
 else
 LINKS_CONF_OPTS += --without-x
-- 
2.11.0
