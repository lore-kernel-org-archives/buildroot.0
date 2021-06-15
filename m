From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 15 Jun 2021 12:35:47 +0200
Subject: [Buildroot] [PATCH v3 2/3] package/zstd: Change Build options
In-Reply-To: <20210615103549.271478-1-nolange79@gmail.com>
References: <20210615103549.271478-1-nolange79@gmail.com>
Message-ID: <20210615103549.271478-2-nolange79@gmail.com>
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
v2->v3:
*   Remove ZSTD_OPTS_MOREFLAGS variable
---
 package/zstd/zstd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 95f25ebfa4..54ce4133fe 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -13,6 +13,7 @@ ZSTD_CPE_ID_VENDOR = facebook
 ZSTD_CPE_ID_PRODUCT = zstandard
 
 ZSTD_OPTS += PREFIX=/usr
+ZSTD_OPTS += ZSTD_LEGACY_SUPPORT=0
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 ZSTD_OPTS += HAVE_THREAD=1
@@ -41,6 +42,9 @@ else
 ZSTD_OPTS += HAVE_LZ4=0
 endif
 
+# zstd will append -O3 after $(CFLAGS), use MOREFLAGS to override again
+ZSTD_OPTS += MOREFLAGS="$(TARGET_OPTIMIZATION)"
+
 ZSTD_BUILD_PROG_TARGET = zstd-release
 
 # Since v1.5.0 the dynamic library is built for
-- 
2.30.2
