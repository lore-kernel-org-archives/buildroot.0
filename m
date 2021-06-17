From: Norbert Lange <nolange79@gmail.com>
Date: Thu, 17 Jun 2021 11:14:52 +0200
Subject: [Buildroot] [PATCH v3 3/3] package/zstd: Prefer dynamically linked
 tool
In-Reply-To: <20210617091456.272611-1-nolange79@gmail.com>
References: <20210617091456.272611-1-nolange79@gmail.com>
Message-ID: <20210617091456.272611-3-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the libzstd DSO is available, then link the
tool against it.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v2->v3:
*   Drop config options, just use zstd-dll if possible
---
 package/zstd/zstd.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 54ce4133fe..726c6ae4a4 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -45,7 +45,12 @@ endif
 # zstd will append -O3 after $(CFLAGS), use MOREFLAGS to override again
 ZSTD_OPTS += MOREFLAGS="$(TARGET_OPTIMIZATION)"
 
+# prefer zstd-dll unless no library is available
+ifeq ($(BR2_STATIC_LIBS),y)
 ZSTD_BUILD_PROG_TARGET = zstd-release
+else
+ZSTD_BUILD_PROG_TARGET = zstd-dll
+endif
 
 # Since v1.5.0 the dynamic library is built for
 # multithreading, while the static library is not.
-- 
2.30.2
