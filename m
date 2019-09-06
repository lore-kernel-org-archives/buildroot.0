From: Romain Naour <romain.naour@smile.fr>
Date: Fri,  6 Sep 2019 11:09:42 +0200
Subject: [Buildroot] [PATCH 06/11] package/meson: use TARGET_{CC,
 CXX} instead of TARGET_CROSS
In-Reply-To: <20190906090947.5476-1-romain.naour@smile.fr>
References: <20190906090947.5476-1-romain.naour@smile.fr>
Message-ID: <20190906090947.5476-7-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using TARGET_CROSS expect using GCC compiler, instead use
TARGET_CC and TARGET_CXX for the case where Clang is
used as cross-compiler.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
---
 package/meson/cross-compilation.conf.in | 4 ++--
 package/meson/meson.mk                  | 3 ++-
 package/pkg-meson.mk                    | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
index fc8e27f7eb..86347e9e4e 100644
--- a/package/meson/cross-compilation.conf.in
+++ b/package/meson/cross-compilation.conf.in
@@ -4,8 +4,8 @@
 # - Buildroot's 'target' is Meson's 'host'
 
 [binaries]
-c = '@TARGET_CROSS at gcc'
-cpp = '@TARGET_CROSS at g++'
+c = '@TARGET_CC@'
+cpp = '@TARGET_CXX@'
 ar = '@TARGET_CROSS at ar'
 strip = '@TARGET_CROSS at strip'
 pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 3267581fc6..1f836ef070 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -54,7 +54,8 @@ HOST_MESON_SED_CXXFLAGS = $(if $(strip $(TARGET_CXXFLAGS)),`printf '"%s"$(comma)
 # own flags if they need to.
 define HOST_MESON_INSTALL_CROSS_CONF
 	mkdir -p $(HOST_DIR)/etc/meson
-	sed -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
+	sed -e "s%@TARGET_CC@%$(TARGET_CC)%g" \
+	    -e "s%@TARGET_CXX@%$(TARGET_CXX)%g" \
 	    -e "s%@TARGET_ARCH@%$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
 	    -e "s%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g" \
 	    -e "s%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g" \
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 0b811d1cc0..9821636c28 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -71,7 +71,8 @@ $(2)_MESON_SED_CXXFLAGS = $$(if $$(strip $$($(2)_CXXFLAGS)),`printf '"%s"$$(comm
 define $(2)_CONFIGURE_CMDS
 	rm -rf $$($$(PKG)_SRCDIR)/build
 	mkdir -p $$($$(PKG)_SRCDIR)/build
-	sed -e "s%@TARGET_CROSS@%$$(TARGET_CROSS)%g" \
+	sed -e "s%@TARGET_CC@%$(TARGET_CC)%g" \
+	    -e "s%@TARGET_CXX@%$(TARGET_CXX)%g" \
 	    -e "s%@TARGET_ARCH@%$$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
 	    -e "s%@TARGET_CPU@%$$(GCC_TARGET_CPU)%g" \
 	    -e "s%@TARGET_ENDIAN@%$$(call LOWERCASE,$$(BR2_ENDIAN))%g" \
-- 
2.21.0
