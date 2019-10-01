From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2019 11:49:08 +0200
Subject: [Buildroot] [git commit branch/2019.05.x]
 package/libtorrent-rasterbar: work around gcc bug 85180
Message-ID: <20191001094436.E7FED864A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c95a4dcbb0ba7bbf5b636e83bb702156efc9d41d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

On Microblaze, building libtorrent-rasterbar with gcc version < 8.x
and optimization enabled causes gcc to enter an infinite loop and
hangs the build.

This is due to gcc bug 85180
(https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180).

The bug shows up when building libtorrent-rasterbar with optimization
but not when building with -O0. To work around this, if
BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we force using -O0.

Fixes:
http://autobuild.buildroot.net/results/410/410e75676abc6bbabe9029ecda969e3d909f3e18/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 81dcff92e623445f2a25a17cff67b78999b070f1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtorrent-rasterbar/libtorrent-rasterbar.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
index 012e972f1d..1d132382e1 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
@@ -21,6 +21,10 @@ ifeq ($(BR2_m68k_cf),y)
 LIBTORRENT_RASTERBAR_CXXFLAGS += -fno-defer-pop
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+LIBTORRENT_RASTERBAR_CXXFLAGS += -O0
+endif
+
 LIBTORRENT_RASTERBAR_CONF_OPTS += CXXFLAGS="$(LIBTORRENT_RASTERBAR_CXXFLAGS)"
 
 ifeq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV),y)
