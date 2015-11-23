From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:47:55 +0100
Subject: [Buildroot] [PATCH 25/51] package/gcc: add licensing info for host
	variant
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <808466f4e8278fc13ec497f2dc9361e42d4dfe55.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the full licensing terms known for gcc for the host variant.

This has so far no impact on the target variant that is not yet defined.
And in any case, the licensing terms for the target variant will be a
sub-set of those for the host, as only parts of gcc are installed on the
target.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc/gcc.mk | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/gcc/gcc/gcc.mk b/package/gcc/gcc/gcc.mk
index 82db1c2..11f643e 100644
--- a/package/gcc/gcc/gcc.mk
+++ b/package/gcc/gcc/gcc.mk
@@ -8,6 +8,16 @@ HOST_GCC_VERSION = $(HOST_GCC_COMMON_VERSION)
 HOST_GCC_SITE = $(HOST_GCC_COMMON_SITE)
 HOST_GCC_SOURCE = $(HOST_GCC_COMMON_SOURCE)
 
+HOST_GCC_LICENSE = \
+	GPLv2+, GPLv3+, LGPLv2.1+ (w/ exception), LGPv3+ (w/ exception), \
+	BSD-3c, MIT, BSL-1.0
+HOST_GCC_LICENSE_FILES = \
+	COPYING COPYING3 COPYING.LIB COPYING3.LIB COPYING.RUNTIME \
+	libiberty/COPYING.LIB gcc/go/gofrontend/LICENSE \
+	gcc/COPYING gcc/COPYING.LIB gcc/COPYING3 gcc/COPYING3.LIB \
+	libquadmath/COPYING.LIB libsanitizer/LICENSE.TXT libffi/LICENSE \
+	include/COPYING include/COPYING3 zlib/contrib/dotzlib/LICENSE_1_0.txt
+
 HOST_GCC_DEPENDENCIES = \
 	$(HOST_GCC_COMMON_DEPENDENCIES) \
 	$(BR_LIBC)
@@ -16,7 +26,15 @@ HOST_GCC_EXCLUDES = $(HOST_GCC_COMMON_EXCLUDES)
 HOST_GCC_POST_EXTRACT_HOOKS += HOST_GCC_COMMON_FAKE_TESTSUITE
 
 ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
+
 HOST_GCC_POST_EXTRACT_HOOKS += HOST_GCC_COMMON_XTENSA_OVERLAY_EXTRACT
+
+define HOST_GCC_XTENSA_OVERLAY_LEGAL_INFO
+	$(Q)$(call hardlink-copy,$(HOST_GCC_COMMON_XTENSA_OVERLAY_TAR),\
+				 $(HOST_GCC_REDIST_SOURCES_DIR))
+endef
+HOST_GCC_POST_LEGAL_INFO_HOOKS += HOST_GCC_XTENSA_OVERLAY_LEGAL_INFO
+
 endif
 
 HOST_GCC_POST_PATCH_HOOKS += HOST_GCC_COMMON_APPLY_PATCHES
-- 
1.9.1
