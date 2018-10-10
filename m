From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 15:26:28 +0200
Subject: [Buildroot] [git commit] synergy: fix resolving of Buildroot git
 revision
Message-ID: <20181010132520.51501812C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ebe67a96f0d0c79b35b640fb18b37e0045438c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting version v1.10.0-stable, Synergy tries to resolve the git revision in
the build directory. This causes CMake to either detect the Buildroot commit
or fail when no git repo is found.

By manually setting SYNERGY_VERSION_STAGE to another value then snapshot, this
behavior is skipped.

Fixes:
  http://autobuild.buildroot.net/results/5bab942322357bd71901cfc13ed3cff0c17edcce

Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/synergy/synergy.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index 7f1dc79874..46c4fbb1ef 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -10,6 +10,10 @@ SYNERGY_LICENSE = GPL-2.0
 SYNERGY_LICENSE_FILES = LICENSE
 SYNERGY_DEPENDENCIES = xlib_libX11 xlib_libXtst
 
+# Avoid using buildroot commit hash inside cmake/Version.cmake
+# by setting SYNERGY_VERSION_STAGE != snapshot
+SYNERGY_CONF_ENV += SYNERGY_VERSION_STAGE="beta"
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXEXT),y)
 SYNERGY_DEPENDENCIES += xlib_libXext
 endif
