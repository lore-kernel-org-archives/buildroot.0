From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 23:05:07 +0100
Subject: [Buildroot] [git commit] package/meson: fix malformed
 cross-compilation.conf.in
Message-ID: <20180101220515.AB13580FA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=443b9f30755ca0b22ca8f4859c77078274be5f50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, meson will set the c_link_args and the cpp_link_args to the
value of TARGET_LDFLAGS, even when it's not defined.

This creates a malformed array ["",] which will break any package
building using meson/ninja.

We fix that by using an empty replacement when the corresponding values
are empty.

Reported-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
[yann.morin.1998 at free.fr: alternate implementation, suggested by Thomas]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Adam Duskett aduskett at gmail.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/meson/meson.mk | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index a05969c..764c187 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -16,15 +16,19 @@ HOST_MESON_NEEDS_HOST_PYTHON = python3
 HOST_MESON_TARGET_ENDIAN = $(call LOWERCASE,$(BR2_ENDIAN))
 HOST_MESON_TARGET_CPU = $(call qstrip,$(BR2_GCC_TARGET_CPU))
 
+HOST_MESON_SED_CFLAGS = $(if $(TARGET_CFLAGS),`printf '"%s"$(comma) ' $(TARGET_CFLAGS)`)
+HOST_MESON_SED_LDFLAGS = $(if $(TARGET_LDFLAGS),`printf '"%s"$(comma) ' $(TARGET_LDFLAGS)`)
+HOST_MESON_SED_CXXFLAGS = $(if $(TARGET_CXXFLAGS),`printf '"%s"$(comma) ' $(TARGET_CXXFLAGS)`)
+
 define HOST_MESON_INSTALL_CROSS_CONF
 	mkdir -p $(HOST_DIR)/etc/meson
 	sed -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
 	    -e "s%@TARGET_ARCH@%$(ARCH)%g" \
 	    -e "s%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g" \
 	    -e "s%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g" \
-	    -e "s%@TARGET_CFLAGS@%`printf '"%s", ' $(TARGET_CFLAGS)`%g" \
-	    -e "s%@TARGET_LDFLAGS@%`printf '"%s", ' $(TARGET_LDFLAGS)`%g" \
-	    -e "s%@TARGET_CXXFLAGS@%`printf '"%s", ' $(TARGET_CXXFLAGS)`%g" \
+	    -e "s%@TARGET_CFLAGS@%$(HOST_MESON_SED_CFLAGS)%g" \
+	    -e "s%@TARGET_LDFLAGS@%$(HOST_MESON_SED_LDFLAGS)%g" \
+	    -e "s%@TARGET_CXXFLAGS@%$(HOST_MESON_SED_CXXFLAGS)%g" \
 	    -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
 	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
 	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
