From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Wed, 25 Apr 2018 08:45:17 +0200
Subject: [Buildroot] [PATCH 3/4] package/Makefile.in: Remove RELRO linker
 flags from CFLAGS
In-Reply-To: <20180425064518.31797-1-stefan.sorensen@spectralink.com>
References: <20180425064518.31797-1-stefan.sorensen@spectralink.com>
Message-ID: <20180425064518.31797-3-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The RELRO related flags are for the linker, not the compiler, so they belong
in LDFLAGS.

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/Makefile.in | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 1cbf34e0df..4525b8e79f 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -141,9 +141,6 @@ ifeq ($(BR2_DEBUG_3),y)
 TARGET_DEBUGGING = -g3
 endif
 
-TARGET_CFLAGS_RELRO = -Wl,-z,relro
-TARGET_CFLAGS_RELRO_FULL = -Wl,-z,now $(TARGET_CFLAGS_RELRO)
-
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
 ifeq ($(BR2_SSP_REGULAR),y)
@@ -155,11 +152,10 @@ TARGET_HARDENED += -fstack-protector-all
 endif
 
 ifeq ($(BR2_RELRO_PARTIAL),y)
-TARGET_HARDENED += $(TARGET_CFLAGS_RELRO)
-TARGET_LDFLAGS += $(TARGET_CFLAGS_RELRO)
+TARGET_LDFLAGS += -Wl,-z,relro
 else ifeq ($(BR2_RELRO_FULL),y)
-TARGET_HARDENED += -fPIE $(TARGET_CFLAGS_RELRO_FULL)
-TARGET_LDFLAGS += -pie $(TARGET_CFLAGS_RELRO_FULL)
+TARGET_HARDENED += -fPIE
+TARGET_LDFLAGS += -pie -Wl,-z,now -Wl,-z,relro
 endif
 
 ifeq ($(BR2_FORTIFY_SOURCE_1),y)
-- 
2.14.3
