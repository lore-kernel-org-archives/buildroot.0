From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 23:18:21 +0200
Subject: [Buildroot] [git commit] xlib_libXdmcp: add missing dependency on
 host-pkgconf
Message-ID: <20180925211756.C929D88E79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a517df56d641e1b3d4ce5988eb5d1747cd78a69a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libXdmcp configure script uses pkg-config, but the Buildroot
package does not depend on host-pkgconf. This is not seen by the
autobuilders most likely because another package that is always built
before libXdmcp builds pkg-config.

However, running:

$ make xlib_libXdmcp

triggers the following build failure:

checking pkg-config is at least version 0.9.0... ./configure: line 12323: /home/thomas/projets/buildroot/output/host/bin/pkg-config: No such file or directory
no
[...]
checking for XDMCP... configure: error: in `/home/thomas/projets/buildroot/output/build/xlib_libXdmcp-1.1.2':
configure: error: The pkg-config script could not be found or is too old.  Make sure it
is in your PATH or set the PKG_CONFIG environment variable to the full
path to pkg-config.

This was detected using per-package target/host folders, because with
this, only the dependencies explicitly expressed by a package are
available to the package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index 179234e73f..44a6f00543 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -10,8 +10,8 @@ XLIB_LIBXDMCP_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXDMCP_LICENSE = MIT
 XLIB_LIBXDMCP_LICENSE_FILES = COPYING
 XLIB_LIBXDMCP_INSTALL_STAGING = YES
-XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xorgproto
-HOST_XLIB_LIBXDMCP_DEPENDENCIES = host-xutil_util-macros host-xorgproto
+XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xorgproto host-pkgconf
+HOST_XLIB_LIBXDMCP_DEPENDENCIES = host-xutil_util-macros host-xorgproto host-pkgconf
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
