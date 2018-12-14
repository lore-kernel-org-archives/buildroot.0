From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Dec 2018 21:28:48 +0100
Subject: [Buildroot] [git commit] kmod: fix build with pkgconf 1.5.3
Message-ID: <20181214202637.A260284659@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=295379641007abb672398c9a32ce4bfaa1612d2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

kmod uses the completionsdir variable from bash-completions.pc to decide
where to install things. Since DESTDIR is prepended to the install
destination, this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the appdefaultdir to
use explicitly instead of relying on bash-completions.pc.

Fixes:
 - http://autobuild.buildroot.org/results/f8a1f956333062027294e766ff0ddab5c35d5887

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kmod/kmod.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index c165ea3020..ea5d291133 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -28,6 +28,10 @@ KMOD_CONF_OPTS = --disable-static --enable-shared
 KMOD_CONF_OPTS += --disable-manpages
 HOST_KMOD_CONF_OPTS = --disable-manpages
 
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+KMOD_CONF_OPTS += --with-bashcompletiondir=/usr/share/bash-completion/completions
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 KMOD_DEPENDENCIES += zlib
 KMOD_CONF_OPTS += --with-zlib
