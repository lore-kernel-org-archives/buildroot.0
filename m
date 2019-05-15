From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 May 2019 14:20:08 +0200
Subject: [Buildroot] [git commit] package/libtorrent-rasterbar: fix build on
 m68k_cf
Message-ID: <20190515121507.68B9E89177@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79c6dc13328ff0097cc6b4d52985c472da870e81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

An internal compiler error is raised on m68k_cf at dwarf2cfi.c:2802 in
connect_traces. Error can be fixed by adding -fno-defer-pop, see
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58864

Fixes:
 - http://autobuild.buildroot.org/results/746f60fadb40288341c1e5642cfcf6373b70583a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtorrent-rasterbar/libtorrent-rasterbar.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
index fdcc736b47..012e972f1d 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
@@ -13,7 +13,15 @@ LIBTORRENT_RASTERBAR_INSTALL_STAGING = YES
 LIBTORRENT_RASTERBAR_CONF_OPTS = \
 	--with-boost-libdir=$(STAGING_DIR)/usr/lib \
 	--disable-invariant-checks
-LIBTORRENT_RASTERBAR_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+LIBTORRENT_RASTERBAR_CXXFLAGS = $(TARGET_CXXFLAGS) -std=c++11
+
+# Internal error, aborting at dwarf2cfi.c:2802 in connect_traces
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58864
+ifeq ($(BR2_m68k_cf),y)
+LIBTORRENT_RASTERBAR_CXXFLAGS += -fno-defer-pop
+endif
+
+LIBTORRENT_RASTERBAR_CONF_OPTS += CXXFLAGS="$(LIBTORRENT_RASTERBAR_CXXFLAGS)"
 
 ifeq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV),y)
 LIBTORRENT_RASTERBAR_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
