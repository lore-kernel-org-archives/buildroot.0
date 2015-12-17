From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 22:47:34 +0100
Subject: [Buildroot] [git commit] coreutils: disable stdbuf for static builds
Message-ID: <20151217214809.44A44825B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc3b03dcdc9a8c7b763103297fc19929357c1ca7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When stdbuf is enabled, it builds a shared library, but it will fail
in a static-only scenario.

Fixes:

  http://autobuild.buildroot.org/results/974/9741cc9841fa95f7430a91f585c4464ee2c9311b/

Signed-off-by: David du Colombier <0intro@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/coreutils/coreutils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 60455ac..d8e2ee6 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -109,6 +109,10 @@ endef
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CLEANUP_BIN
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+COREUTILS_CONF_OPTS += --enable-no-install-program=stdbuf
+endif
+
 define COREUTILS_CLEANUP
 	# link for archaic shells
 	ln -fs test $(TARGET_DIR)/usr/bin/[
