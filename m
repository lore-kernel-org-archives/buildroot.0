From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jan 2014 10:06:39 +0100
Subject: [Buildroot] [git commit] ltris2: needs gettext on uClibc toolchains
	w/ locale
Message-ID: <20140112090843.471DB9BF61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=454a41016f2f074b69e2c677f4749c213c653e86
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/599/599554ea08aafed20c487a25fcbf641eb9ac2e5f/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltris/Config.in |    1 +
 package/ltris/ltris.mk  |    5 +++++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/ltris/Config.in b/package/ltris/Config.in
index 1ce52da..b4e0ccf 100644
--- a/package/ltris/Config.in
+++ b/package/ltris/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LTRIS
 	bool "LTris"
 	select BR2_PACKAGE_SDL
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  LTris as a tetris clone, using SDL. It optionally requires
 	  SDL_mixer for audio support.  A display with minimum 640x480
diff --git a/package/ltris/ltris.mk b/package/ltris/ltris.mk
index e26bf45..008f0d7 100644
--- a/package/ltris/ltris.mk
+++ b/package/ltris/ltris.mk
@@ -21,4 +21,9 @@ else
 LTRIS_CONF_OPT += --disable-audio
 endif
 
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+LTRIS_DEPENDENCIES += gettext
+LTRIS_CONF_ENV += LIBS=-lintl
+endif
+
 $(eval $(autotools-package))
