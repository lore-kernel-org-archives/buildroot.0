From: Derrick Lyndon Pallas <derrick@meter.com>
Date: Fri, 23 Oct 2020 06:12:51 +0000
Subject: [Buildroot] [PATCH 1/1] package/meson: fix blank entry in
 cross-compilation.conf
Message-ID: <20201023061251.29900-1-derrick@meter.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without this change, cross-compilation.conf seems to be generated with a
blank cpu entry in the host_machine section.  (Note: what meson calls host,
buildroot calls target.)

The effect is that meson-based packages may fail to detect architectural
features of the target CPU, like SSE support, and either fail to take
advantage of them or just refuse to compile.

This change follows the convention used to emit the `endian` entry in that
section, which comes from [92eca65ddf meson: Strip quotes from BR2_ENDIAN].
To verify: `grep cpu ./output/host/etc/meson/cross-compilation.conf`

Signed-off-by: Derrick Lyndon Pallas <derrick@meter.com>
---
 package/meson/meson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index d39e66cf05..9bccea8fef 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -14,7 +14,7 @@ HOST_MESON_DEPENDENCIES = host-ninja
 HOST_MESON_NEEDS_HOST_PYTHON = python3
 
 HOST_MESON_TARGET_ENDIAN = $(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN)))
-HOST_MESON_TARGET_CPU = $(GCC_TARGET_CPU)
+HOST_MESON_TARGET_CPU = $(call qstrip,$(call LOWERCASE,$(GCC_TARGET_CPU)))
 
 # https://mesonbuild.com/Reference-tables.html#cpu-families
 ifeq ($(BR2_arcle)$(BR2_arceb),y)
-- 
2.29.0
