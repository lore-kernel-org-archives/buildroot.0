From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Apr 2016 23:22:13 +0200
Subject: [Buildroot] [git commit] links: fix static link with directfb
Message-ID: <20160412220141.401AB7FA20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88a807296da62a42937ee6a8f4d6c6fcd0db729f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The AC_HAVE_FUNCS autoconf macro uses gcc to check for function existence.
This breaks when the library depends on libstdc++, like directfb. Add this
dependency externally.

Fixes:
http://autobuild.buildroot.net/results/548/548019b71c7db649f20d2c479bb8fb3612162d4a/
http://autobuild.buildroot.net/results/c94/c9495f54db388bde9d64325bb57fc4e58741f7a7/
http://autobuild.buildroot.net/results/9b8/9b883d42bff3633f16447d76d2eb4ddf68013788/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/links/links.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/links/links.mk b/package/links/links.mk
index 62f91a3..ab2b583 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -22,6 +22,9 @@ LINKS_CONF_OPTS += --without-x
 endif
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
 LINKS_CONF_ENV = ac_cv_path_DIRECTFB_CONFIG=$(STAGING_DIR)/usr/bin/directfb-config
+ifeq ($(BR2_STATIC_LIBS),y)
+LINKS_CONF_ENV += LIBS=-lstdc++
+endif
 LINKS_CONF_OPTS += --with-directfb
 LINKS_DEPENDENCIES += directfb
 else
