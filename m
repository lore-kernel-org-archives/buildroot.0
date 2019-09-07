From: Romain Naour <romain.naour@smile.fr>
Date: Sat,  7 Sep 2019 11:40:21 +0200
Subject: [Buildroot] [PATCH v2 06/12] package/meson: use TARGET_{CC,
 CXX} instead of TARGET_CROSS for cc and cpp
In-Reply-To: <20190907094027.9537-1-romain.naour@smile.fr>
References: <20190907094027.9537-1-romain.naour@smile.fr>
Message-ID: <20190907094027.9537-7-romain.naour@smile.fr>
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
v2: fix pkg-meson (missing $) and keep TARGET_CROSS in sed command for other tools (as etc).
---
 package/meson/cross-compilation.conf.in | 4 ++--
 package/meson/meson.mk                  | 2 ++
 package/pkg-meson.mk                    | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)

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
index 3267581fc6..6b4491d24f 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -55,6 +55,8 @@ HOST_MESON_SED_CXXFLAGS = $(if $(strip $(TARGET_CXXFLAGS)),`printf '"%s"$(comma)
 define HOST_MESON_INSTALL_CROSS_CONF
 	mkdir -p $(HOST_DIR)/etc/meson
 	sed -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
+	    -e "s%@TARGET_CC@%$(TARGET_CC)%g" \
+	    -e "s%@TARGET_CXX@%$(TARGET_CXX)%g" \
 	    -e "s%@TARGET_ARCH@%$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
 	    -e "s%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g" \
 	    -e "s%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g" \
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 0b811d1cc0..e035dd1722 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -72,6 +72,8 @@ define $(2)_CONFIGURE_CMDS
 	rm -rf $$($$(PKG)_SRCDIR)/build
 	mkdir -p $$($$(PKG)_SRCDIR)/build
 	sed -e "s%@TARGET_CROSS@%$$(TARGET_CROSS)%g" \
+	    -e "s%@TARGET_CC@%$$(TARGET_CC)%g" \
+	    -e "s%@TARGET_CXX@%$$(TARGET_CXX)%g" \
 	    -e "s%@TARGET_ARCH@%$$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
 	    -e "s%@TARGET_CPU@%$$(GCC_TARGET_CPU)%g" \
 	    -e "s%@TARGET_ENDIAN@%$$(call LOWERCASE,$$(BR2_ENDIAN))%g" \
-- 
2.21.0
