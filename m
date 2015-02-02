From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Feb 2015 00:03:20 +0100
Subject: [Buildroot] [git commit] madplay: fix alsa detection/linking using
	host-pkgconf
Message-ID: <20150202231209.CFB2F80458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc2e91d5bd32047055a611ed0d62f050bc90377c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1]: configure check for libasound failed because of missing
pthread linkage.

[1] http://autobuild.buildroot.net/results/f3a/f3a0b3ff15e729d223c8c8ee6af75c425cd344b6/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/madplay/madplay.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
