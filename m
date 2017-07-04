From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 17:40:38 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] mpg123: security bump to
	version 1.25.1
Message-ID: <20170704154817.F277B7FAFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71f4f03536daf68876da7433c6c1843f4d349d55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

From the release notes:

- Avoid memset(NULL, 0, 0) to calm down the paranoid.

- Fix bug 252, invalid read of size 1 in ID3v2 parser due to forgotten
  offset from the frame flag bytes (unnoticed in practice for a long time).
  Fuzzers are in the house again.  This one got CVE-2017-10683.

  https://sourceforge.net/p/mpg123/bugs/252/

- Avoid a mostly harmless conditional jump depending on uninitialised
  fr->lay in compute_bpf() (mpg123_position()) when track is not ready yet.

- Fix undefined shifts on signed long mask in layer3.c (worked in practice,
  never right in theory).  Code might be a bit faster now, even.  Thanks to
  Agostino Sarubbo for reporting.

dlopen() is now directly used to load output modules (and the
--with-modules-suffix option has been removed), so adjust the modules logic
to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b3a0afd47f278ab5dea4f5cbe01da79a2e05ec8c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.hash |  2 +-
 package/mpg123/mpg123.mk   | 11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index fa55809..69fbef3 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	de2303c8ecb65593e39815c0a2f2f2d91f708c43b85a55fdd1934c82e677cf8e	mpg123-1.23.8.tar.bz2
+sha256	0fe7270a4071367f97a7c1fb45fb2ef3cfef73509c205124e080ea569217b05f	mpg123-1.25.1.tar.bz2
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 27c46dc..8eaaa62 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.23.8
+MPG123_VERSION = 1.25.1
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPTS = --disable-lfs-alias
@@ -74,10 +74,11 @@ endif
 
 MPG123_CONF_OPTS += --with-audio=$(subst $(space),$(comma),$(MPG123_AUDIO))
 
-ifeq ($(BR2_PACKAGE_LIBTOOL),y)
-MPG123_DEPENDENCIES += libtool
-# .la files gets stripped , so directly load .so files rather than .la
-MPG123_CONF_OPTS += --with-modules --with-module-suffix=.so
+# output modules are loaded with dlopen()
+ifeq ($(BR2_STATIC_LIBS),y)
+MPG123_CONF_OPTS += --disable-modules
+else
+MPG123_CONF_OPTS += --enable-modules
 endif
 
 $(eval $(autotools-package))
