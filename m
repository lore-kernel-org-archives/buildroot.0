From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 29 Dec 2017 16:52:42 -0500
Subject: [Buildroot] [PATCH 1/2] meson: fix malformed
 cross-compilation.conf.in
Message-ID: <20171229215243.6273-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, meson will set the c_link_args and the cpp_link_args to the value
of TARGET_LDFLAGS, even when it's not defined.

This creates a malformed array ["",] which will break any package building
using meson/ninja.

Add a small regular expression at the end of the sed command to check for
["", ] and replace it with [] instead.

Credit goes to Yann for the regular expression.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/meson/meson.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 55ce84da07..75b9a1666a 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -26,6 +26,7 @@ define HOST_MESON_INSTALL_CROSS_CONF
 	    -e "s%@TARGET_LDFLAGS@%`printf '"%s", ' $(TARGET_LDFLAGS)`%g" \
 	    -e "s%@TARGET_CXXFLAGS@%`printf '"%s", ' $(TARGET_CXXFLAGS)`%g" \
 	    -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
+	    -e 's/\["", \]/[]/' \
 	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
 	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
 endef
-- 
2.14.3
