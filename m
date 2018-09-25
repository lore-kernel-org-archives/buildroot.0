From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 22:26:54 +0200
Subject: [Buildroot] [git commit] package/x11r7/xutil_makedepend: add
 missing dependency on host-pkgconf
Message-ID: <20180925202838.3F36388DCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73185f1270b6f86f7d02eefa8c70e568b30dd4cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script of xutil_makedepend uses PKG_CHECK_MODULES(), so
it should depend on host-pkgconf. Otherwise, a "make
host-xutil_makedepend" fails with:

"""
checking for X... configure: error: in `/home/thomas/projets/buildroot/output/build/host-xutil_makedepend-1.0.5':
configure: error: The pkg-config script could not be found or is too old.  Make sure it
is in your PATH or set the PKG_CONFIG environment variable to the full
path to pkg-config.

Alternatively, you may set the environment variables X_CFLAGS
and X_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

To get pkg-config, see <http://pkg-config.freedesktop.org/>.
"""

This was detected using per-package host/target directories, but can
be reproduced without it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xutil_makedepend/xutil_makedepend.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index 8a058efcec..a50320ba93 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -10,8 +10,8 @@ XUTIL_MAKEDEPEND_SITE = http://xorg.freedesktop.org/releases/individual/util
 XUTIL_MAKEDEPEND_LICENSE = MIT
 XUTIL_MAKEDEPEND_LICENSE_FILES = COPYING
 
-XUTIL_MAKEDEPEND_DEPENDENCIES = xorgproto
-HOST_XUTIL_MAKEDEPEND_DEPENDENCIES = host-xorgproto
+XUTIL_MAKEDEPEND_DEPENDENCIES = xorgproto host-pkgconf
+HOST_XUTIL_MAKEDEPEND_DEPENDENCIES = host-xorgproto host-pkgconf
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
