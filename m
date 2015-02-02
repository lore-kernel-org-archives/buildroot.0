From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  2 Feb 2015 23:15:39 +0100
Subject: [Buildroot] [PATCH v2] madplay: fix alsa detection/linking using
	host-pkgconf
Message-ID: <1422915339-4306-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]: configure check for libasound failed because of missing
pthread linkage.

[1] http://autobuild.buildroot.net/results/f3a/f3a0b3ff15e729d223c8c8ee6af75c425cd344b6/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - use host-pkgconf for alsa librarys (suggested by Peter Korsgaard)
    instead adding only single library dependencys (e.g. -lpthread)
---
 package/madplay/madplay.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/madplay/madplay.mk b/package/madplay/madplay.mk
index 1907eb5..ff12aa1 100644
--- a/package/madplay/madplay.mk
+++ b/package/madplay/madplay.mk
@@ -15,7 +15,8 @@ MADPLAY_DEPENDENCIES = libmad libid3tag $(if $(BR2_PACKAGE_GETTEXT),gettext)
 # ./configure can find alsa-lib.
 ifeq ($(BR2_PACKAGE_MADPLAY_ALSA),y)
 MADPLAY_CONF_OPTS += --with-alsa
-MADPLAY_DEPENDENCIES += alsa-lib
+MADPLAY_DEPENDENCIES += host-pkgconf alsa-lib
+MADPLAY_CONF_ENV += LIBS="$(shell $(PKG_CONFIG_HOST_BINARY) --libs alsa)"
 endif
 
 $(eval $(autotools-package))
-- 
2.1.4
