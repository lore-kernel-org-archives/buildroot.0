From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 18 Oct 2020 00:17:41 +0200
Subject: [Buildroot] [PATCH v2 2/4] package/gcc: use binutils wrappers for
 target libs
In-Reply-To: <20201017221743.160029-1-nolange79@gmail.com>
References: <20201017221743.160029-1-nolange79@gmail.com>
Message-ID: <20201017221743.160029-2-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will use gcc-ar, gcc-nm and gcc-ranlib instead of the
normal binutils tools. The difference is that with the
wrappers, gcc plugins will be automatically picked up,
which might be necessary with some flags.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v1->v2:
*   Only set those wrappers if gc 4.7 or newer
---
 package/gcc/gcc.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 114c2887a0..a24ffe3ee2 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -99,6 +99,9 @@ GCC_COMMON_TARGET_CFLAGS += -Wno-error
 endif
 
 # Propagate options used for target software building to GCC target libs
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
+HOST_GCC_COMMON_CONF_ENV += AR_FOR_TARGET=gcc-ar NM_FOR_TARGET=gcc-nm RANLIB_FOR_TARGET=gcc-ranlib
+endif
 HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
 HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
 
-- 
2.28.0
