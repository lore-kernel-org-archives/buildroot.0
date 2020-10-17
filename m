From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 18 Oct 2020 00:17:43 +0200
Subject: [Buildroot] [PATCH v2 4/4] package/glibc: force -fno-lto
In-Reply-To: <20201017221743.160029-1-nolange79@gmail.com>
References: <20201017221743.160029-1-nolange79@gmail.com>
Message-ID: <20201017221743.160029-4-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glibc requires compilation barriers between files, and will
fail with LTO enabled.
So force LTO off by appending -fno-lto to the flags, but only
if the GCC version is recent enough that an LTO build would
be possible.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/glibc/glibc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 4721177d83..6d07495edc 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -67,6 +67,11 @@ ifeq ($(BR2_ENABLE_DEBUG),y)
 GLIBC_EXTRA_CFLAGS += -g
 endif
 
+# glibc explicitly requires compile barriers between files
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
+GLIBC_EXTRA_CFLAGS += -fno-lto
+endif
+
 # The stubs.h header is not installed by install-headers, but is
 # needed for the gcc build. An empty stubs.h will work, as explained
 # in http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html. The same trick
-- 
2.28.0
