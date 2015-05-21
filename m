From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 May 2015 00:00:05 +0200
Subject: [Buildroot] [git commit] portaudio: fix static linking issue with
	portaudio
Message-ID: <20150521220835.A573B81DF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dea306c78b5d4c571555c50512e212a725b594b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/25f/25f8088ecb276ff4559a56fcc4f1b92d11f7deac/

As opposed to the other audio backends, the configure script does NOT use
pkg-config to figure out how to link with portaudio, breaking static linking
as portaudio uses pthreads.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index c2d7b1f..c9acb6b 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -52,6 +52,9 @@ ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
 MPG123_AUDIO += portaudio
 MPG123_CONF_OPTS += --with-default-audio=portaudio
 MPG123_DEPENDENCIES += portaudio
+# configure script does NOT use pkg-config to figure out how to link
+# with portaudio, breaking static linking as portaudio uses pthreads
+MPG123_CONF_ENV += LIBS='$(shell $(PKG_CONFIG_HOST_BINARY) --libs portaudio-2.0)'
 endif
 
 ifeq ($(BR2_PACKAGE_SDL),y)
