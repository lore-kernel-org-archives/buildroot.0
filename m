From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Mar 2020 22:51:15 +0100
Subject: [Buildroot] [git commit] meson: Strip quotes from BR2_ENDIAN
Message-ID: <20200311213914.1C763909ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92eca65ddf9a27a0919d01d03e441d84740fa7b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The values in the cross-compilation file are expected to be quoted with
single quotes, which we have in our template.

However, the endian value we are injecting comes from Kconfig, so it is
double-quoted, and those quotes end up in the cross-compilation files we
generate (the internal one, and the SDK one):

    endian = '"little"'

So qstrip the value before we inject it.

Propagate the fix to the two generated files by using the same variable
HOST_MESON_TARGET_ENDIAN in both cases, rather than replicating the
(flawed) logic.

While at it, also use the common GCC_TARGET_CPU variable for the SDK
file too.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
index 416129f6fe..a0b467caba 100644
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
