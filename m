From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 22:50:29 +0200
Subject: [Buildroot] [git commit branch/next] python-pygame: bump version to
	fix Python 3 byte-compilation issue
Message-ID: <20160517205049.1158A7F922@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9ec96e545102ae5ccd4280323d35360b0a5072d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The current version of python-pygame in Buildroot does not
byte-compile properly with Python 3. Commit 22efec0b44da from upstream
fixes the problem, so we take this opportunity to bump the pygame
version.

Fixing byte-compilation is necessary as we will soon enable a
mechanism that aborts the build in case of error during the
byte-compilation process (while they are today considered as
warnings).

In order for the bump to work, we explicitly disable freetype support,
as the package doesn't handle the freetype dependency for the moment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pygame/python-pygame.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
index 995f80a..1ef2bdf 100644
--- a/package/python-pygame/python-pygame.mk
+++ b/package/python-pygame/python-pygame.mk
@@ -6,7 +6,7 @@
 
 # stable 1.9.1 release requires V4L which has been wiped out of recent Linux
 # kernels, so use latest mercurial revision until next stable release is out.
-PYTHON_PYGAME_VERSION = f0bb4a4b365d
+PYTHON_PYGAME_VERSION = d61ea8eabd56
 PYTHON_PYGAME_SOURCE = pygame-$(PYTHON_PYGAME_VERSION).tar.gz
 PYTHON_PYGAME_SITE = https://bitbucket.org/pygame/pygame
 PYTHON_PYGAME_SITE_METHOD = hg
@@ -66,6 +66,10 @@ define PYTHON_PYGAME_UNCONFIGURE_SCRAP
 endef
 endif
 
+define PYTHON_PYGAME_UNCONFIGURE_FREETYPE
+	$(SED) 's/^_freetype/#_freetype/' $(@D)/Setup
+endef
+
 PYTHON_PYGAME_SDL_FLAGS = `$(STAGING_DIR)/usr/bin/sdl-config --cflags`
 PYTHON_PYGAME_SDL_FLAGS += `$(STAGING_DIR)/usr/bin/sdl-config --libs`
 
@@ -82,6 +86,7 @@ define PYTHON_PYGAME_CONFIGURE_CMDS
 	$(PYTHON_PYGAME_UNCONFIGURE_SURFARRAY)
 	$(PYTHON_PYGAME_UNCONFIGURE_MOVIE)
 	$(PYTHON_PYGAME_UNCONFIGURE_SCRAP)
+	$(PYTHON_PYGAME_UNCONFIGURE_FREETYPE)
 endef
 
 define PYTHON_PYGAME_REMOVE_DOC
