From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Jan 2019 14:22:38 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/meson: fix CPU
 familly
Message-ID: <20190118132725.6BA11814CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbe3a5f485395bcf11e71a3d54bbad7e315f0ecc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

As explained in [0], meson recognises a certain set of CPU famillies,
whose names slightly differ from those we know them as.

If we don't pass the proper cpu_familly, meson whines:
    WARNING: Unknown CPU family 'i686', please report this at [...]

Subsequently, packages that use that to decide on what they should build
and how they should build it, fail to build. That is the case for the
upcoming systemd-boot, for example.

Fix that by using the list propvided by the meson documentation [0].

[0] https://mesonbuild.com/Reference-tables.html#cpu-families

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998 at free.fr:
  - split in its own patch
  - imnprove commit log
]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit f3bacda0c0e0adb2ac7f515476f6bb83d1385130)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/meson/meson.mk | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index e1675c21b8..1113bf0e29 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -16,6 +16,35 @@ HOST_MESON_NEEDS_HOST_PYTHON = python3
 HOST_MESON_TARGET_ENDIAN = $(call LOWERCASE,$(BR2_ENDIAN))
 HOST_MESON_TARGET_CPU = $(GCC_TARGET_CPU)
 
+# https://mesonbuild.com/Reference-tables.html#cpu-families
+ifeq ($(BR2_arcle)$(BR2_arceb),y)
+HOST_MESON_TARGET_CPU_FAMILY = arc
+else ifeq ($(BR2_arm)$(BR2_armeb),y)
+HOST_MESON_TARGET_CPU_FAMILY = arm
+else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
+HOST_MESON_TARGET_CPU_FAMILY = aarch64
+else ifeq ($(BR2_i386),y)
+HOST_MESON_TARGET_CPU_FAMILY = x86
+else ifeq ($(BR2_mips)$(BR2_mipsel),y)
+HOST_MESON_TARGET_CPU_FAMILY = mips
+else ifeq ($(BR2_mips64)$(BR2_mips64el),y)
+HOST_MESON_TARGET_CPU_FAMILY = mips64
+else ifeq ($(BR2_powerpc),y)
+HOST_MESON_TARGET_CPU_FAMILY = ppc
+else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
+HOST_MESON_TARGET_CPU_FAMILY = ppc64
+else ifeq ($(BR2_riscv),y)
+HOST_MESON_TARGET_CPU_FAMILY = riscv64
+else ifeq ($(BR2_sparc),y)
+HOST_MESON_TARGET_CPU_FAMILY = sparc
+else ifeq ($(BR2_sparc64),y)
+HOST_MESON_TARGET_CPU_FAMILY = sparc64
+else ifeq ($(BR2_x86_64),y)
+HOST_MESON_TARGET_CPU_FAMILY = x86_64
+else
+HOST_MESON_TARGET_CPU_FAMILY = $(ARCH)
+endif
+
 HOST_MESON_SED_CFLAGS = $(if $(TARGET_CFLAGS),`printf '"%s"$(comma) ' $(TARGET_CFLAGS)`)
 HOST_MESON_SED_LDFLAGS = $(if $(TARGET_LDFLAGS),`printf '"%s"$(comma) ' $(TARGET_LDFLAGS)`)
 HOST_MESON_SED_CXXFLAGS = $(if $(TARGET_CXXFLAGS),`printf '"%s"$(comma) ' $(TARGET_CXXFLAGS)`)
@@ -23,7 +52,7 @@ HOST_MESON_SED_CXXFLAGS = $(if $(TARGET_CXXFLAGS),`printf '"%s"$(comma) ' $(TARG
 define HOST_MESON_INSTALL_CROSS_CONF
 	mkdir -p $(HOST_DIR)/etc/meson
 	sed -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
-	    -e "s%@TARGET_ARCH@%$(ARCH)%g" \
+	    -e "s%@TARGET_ARCH@%$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
 	    -e "s%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g" \
 	    -e "s%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g" \
 	    -e "s%@TARGET_CFLAGS@%$(HOST_MESON_SED_CFLAGS)%g" \
