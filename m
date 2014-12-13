From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Dec 2014 00:14:40 +0100
Subject: [Buildroot] [git commit] prboom: fix static linking
Message-ID: <20141213231637.CF790803D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f80033bbe7106c9e7447a52bbf83638ac12b8d69
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/97b/97bb50add010e44aca8fcb079d8df9270d3cae45/
http://autobuild.buildroot.net/results/a96/a969fd15a652df96c2414cf0c5f2e345d38e6e6c/
http://autobuild.buildroot.net/results/9ba/9ba92c01b2c6b6eae2dcda60c2b80d66d2002d4b/
http://autobuild.buildroot.net/results/776/776394ba89070ee2fa6e81585078df0a0e2ae3f2/

And many more.

SDL_mixer uses symbols from SDL, but ends up after it on the link cmdline,
breaking static linking. Fix it by forcing the SDL libs at the very end.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/prboom/prboom.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
index c39b5a3..7f9d6a0 100644
--- a/package/prboom/prboom.mk
+++ b/package/prboom/prboom.mk
@@ -15,6 +15,12 @@ ifeq ($(BR2_PACKAGE_LIBPNG),y)
 PRBOOM_DEPENDENCIES += libpng
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+# SDL_mixer uses symbols from SDL, but ends up after it on the link
+# cmdline. Fix it by forcing the SDL libs at the very end
+PRBOOM_CONF_ENV += LIBS="$(shell $(STAGING_DIR)/usr/bin/sdl-config --static-libs)"
+endif
+
 PRBOOM_CONF_OPTS = \
 		--oldincludedir=$(STAGING_DIR)/usr/include \
 		--with-sdl-prefix=$(STAGING_DIR)/usr \
