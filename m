From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Nov 2015 14:31:21 +0100
Subject: [Buildroot] [git commit] package/mpg123: fix static linking issue
	with alsa
Message-ID: <20151108133230.8DA4981D82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8dc10951088819e5113bb74414469f08eb33e611
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As opposed to the other audio backends, the configure script does NOT
use pkg-config to figure out how to link with alsa, breaking static
linking as alsa uses pthreads.

This patch uses the same fix from Peter used for portaudio:
http://git.buildroot.net/buildroot/commit/package/mpg123/mpg123.mk?id=dea306c78b5d4c571555c50512e212a725b594b9

Fixes
http://autobuild.buildroot.net/results/796/79613fda3f51e969ecd46ae1151bd4c3316639c3/
http://autobuild.buildroot.net/results/b0a/b0a99ff1516602ed42c0cc14d9d2922a01cdf88f/
http://autobuild.buildroot.net/results/5bd/5bdfd2aa9de568d0f7be27ffb18d4541b0e1be0c/
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpg123/mpg123.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index efd510d..f6bb297 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -67,6 +67,9 @@ ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 MPG123_AUDIO += alsa
 MPG123_CONF_OPTS += --with-default-audio=alsa
 MPG123_DEPENDENCIES += alsa-lib
+# configure script does NOT use pkg-config to figure out how to link
+# with alsa, breaking static linking as alsa uses pthreads
+MPG123_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs alsa`"
 endif
 
 MPG123_CONF_OPTS += --with-audio=$(subst $(space),$(comma),$(MPG123_AUDIO))
