From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 Feb 2014 16:07:12 +0100
Subject: [Buildroot] [git commit] madplay: fixes build when toolchain has
	locale support
Message-ID: <20140210150743.0642F9C3C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=35cb43b9d82d9bc1e90a2ed23d21fab357acd873
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise build fails in intl/relocatable.c with:
./relocatable.c: In function 'libintl_relocate':
./relocatable.c:402:40: error: 'INSTALLPREFIX' undeclared (first use in this function)
./relocatable.c:402:40: note: each undeclared identifier is reported only once for each function it appears in

[Peter: drop redundant 'else' part]
Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/madplay/Config.in  |    1 +
 package/madplay/madplay.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/madplay/Config.in b/package/madplay/Config.in
index 3baeaa0..d83fac6 100644
--- a/package/madplay/Config.in
+++ b/package/madplay/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_MADPLAY
 	bool "madplay"
 	select BR2_PACKAGE_LIBMAD
 	select BR2_PACKAGE_LIBID3TAG
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Command-line front-end to libmad, a high-quality MPEG audio decoder.
 	  It currently supports MPEG-1 and the MPEG-2 extension to lower
diff --git a/package/madplay/madplay.mk b/package/madplay/madplay.mk
index 35aa651..3f68dff 100644
--- a/package/madplay/madplay.mk
+++ b/package/madplay/madplay.mk
@@ -9,7 +9,7 @@ MADPLAY_SITE = http://downloads.sourceforge.net/project/mad/madplay/$(MADPLAY_VE
 MADPLAY_LICENSE = GPLv2+
 MADPLAY_LICENSE_FILES = COPYING COPYRIGHT
 MADPLAY_LIBTOOL_PATCH = NO
-MADPLAY_DEPENDENCIES = libmad libid3tag
+MADPLAY_DEPENDENCIES = libmad libid3tag $(if $(BR2_PACKAGE_GETTEXT),gettext)
 
 # Check if ALSA is built, then we should configure after alsa-lib so
 # ./configure can find alsa-lib.
