From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 25 May 2021 19:14:30 +0200
Subject: [Buildroot] [PATCH 4/5] package/zstd: Change Build options
In-Reply-To: <20210525171432.819180-1-nolange79@gmail.com>
References: <20210525171432.819180-1-nolange79@gmail.com>
Message-ID: <20210525171432.819180-4-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable the legacy format, these are just needed for
decompressing files created with pre-release version.

Use Buildroot's setting for optimization, zstd's build system
overrides CFLAGS, but MOREFLAGS can override again.
Quick tests show that using -O2 (like buildroot)
is actually a little faster than -O3 on x86_64 Atoms.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/zstd/zstd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index a7a5ba4e50..a9499df4d0 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -13,6 +13,10 @@ ZSTD_CPE_ID_VENDOR = facebook
 ZSTD_CPE_ID_PRODUCT = zstandard
 
 ZSTD_OPTS += PREFIX=/usr
+ZSTD_OPTS += ZSTD_LEGACY_SUPPORT=0
+
+# zstd will append -O3 after $(CFLAGS), use MOREFLAGS to override again
+ZSTD_OPTS_MOREFLAGS += $(TARGET_OPTIMIZATION)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 ZSTD_OPTS += HAVE_THREAD=1
@@ -41,6 +45,8 @@ else
 ZSTD_OPTS += HAVE_LZ4=0
 endif
 
+ZSTD_OPTS += "MOREFLAGS=$(ZSTD_OPTS_MOREFLAGS)"
+
 ZSTD_BUILD_PROG_TARGET := zstd-release
 
 # Since v1.5.0 the dynamic library is built for
-- 
2.30.2
