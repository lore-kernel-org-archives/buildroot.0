From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Wed, 11 Mar 2020 18:38:33 +0000
Subject: [Buildroot] [PATCH 1/1] meson: Strip quotes from BR2_ENDIAN
Message-ID: <20200311183833.23074-1-glex.spb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Strips the quotes from BR2_ENDIAN because meson expects the value to be
unquoted.

Also uses the same values in target-specific cross-config as in the /etc
one.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 package/meson/meson.mk | 2 +-
 package/pkg-meson.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 29c7ed1800..845ce8fb71 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -13,7 +13,7 @@ MESON_SETUP_TYPE = setuptools
 HOST_MESON_DEPENDENCIES = host-ninja
 HOST_MESON_NEEDS_HOST_PYTHON = python3
 
-HOST_MESON_TARGET_ENDIAN = $(call LOWERCASE,$(BR2_ENDIAN))
+HOST_MESON_TARGET_ENDIAN = $(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN)))
 HOST_MESON_TARGET_CPU = $(GCC_TARGET_CPU)
 
 # https://mesonbuild.com/Reference-tables.html#cpu-families
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 642b715938..2cdcf01bfd 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -69,8 +69,8 @@ define $(2)_CONFIGURE_CMDS
 	mkdir -p $$($$(PKG)_SRCDIR)/build
 	sed -e 's%@TARGET_CROSS@%$$(TARGET_CROSS)%g' \
 	    -e 's%@TARGET_ARCH@%$$(HOST_MESON_TARGET_CPU_FAMILY)%g' \
-	    -e 's%@TARGET_CPU@%$$(GCC_TARGET_CPU)%g' \
-	    -e 's%@TARGET_ENDIAN@%$$(call LOWERCASE,$$(BR2_ENDIAN))%g' \
+	    -e 's%@TARGET_CPU@%$$(HOST_MESON_TARGET_CPU)%g' \
+	    -e 's%@TARGET_ENDIAN@%$$(HOST_MESON_TARGET_ENDIAN)%g' \
 	    -e 's%@TARGET_CFLAGS@%$$(call make-comma-list,$$($(2)_CFLAGS))%g' \
 	    -e 's%@TARGET_LDFLAGS@%$$(call make-comma-list,$$($(2)_LDFLAGS))%g' \
 	    -e 's%@TARGET_CXXFLAGS@%$$(call make-comma-list,$$($(2)_CXXFLAGS))%g' \
-- 
2.20.1
