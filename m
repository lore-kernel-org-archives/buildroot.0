From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Wed, 25 Apr 2018 08:45:15 +0200
Subject: [Buildroot] [PATCH 1/4] package/Makefile.in: Do not use CPPFLAGS
 for hardening options
Message-ID: <20180425064518.31797-1-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The hardening options are compiler flags, not pure pre-processor flags, so
put them in CFLAGS, not CPPFLAGS.

This fixes build errors where -D_FORTIFY_SOURCE=2 whas put in CPPFLAGS and
then applied to configure tests which could fail since the required -O2 is
only in CFLAGS.

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/Makefile.in | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 4325f7b3a9..d72a5494ab 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -147,29 +147,29 @@ TARGET_CFLAGS_RELRO_FULL = -Wl,-z,now $(TARGET_CFLAGS_RELRO)
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
 ifeq ($(BR2_SSP_REGULAR),y)
-TARGET_CPPFLAGS += -fstack-protector
+TARGET_HARDENED += -fstack-protector
 else ifeq ($(BR2_SSP_STRONG),y)
-TARGET_CPPFLAGS += -fstack-protector-strong
+TARGET_HARDENED += -fstack-protector-strong
 else ifeq ($(BR2_SSP_ALL),y)
-TARGET_CPPFLAGS += -fstack-protector-all
+TARGET_HARDENED += -fstack-protector-all
 endif
 
 ifeq ($(BR2_RELRO_PARTIAL),y)
-TARGET_CPPFLAGS += $(TARGET_CFLAGS_RELRO)
+TARGET_HARDENED += $(TARGET_CFLAGS_RELRO)
 TARGET_LDFLAGS += $(TARGET_CFLAGS_RELRO)
 else ifeq ($(BR2_RELRO_FULL),y)
-TARGET_CPPFLAGS += -fPIE $(TARGET_CFLAGS_RELRO_FULL)
+TARGET_HARDENED += -fPIE $(TARGET_CFLAGS_RELRO_FULL)
 TARGET_LDFLAGS += -pie
 endif
 
 ifeq ($(BR2_FORTIFY_SOURCE_1),y)
-TARGET_CPPFLAGS += -D_FORTIFY_SOURCE=1
+TARGET_HARDENED += -D_FORTIFY_SOURCE=1
 else ifeq ($(BR2_FORTIFY_SOURCE_2),y)
-TARGET_CPPFLAGS += -D_FORTIFY_SOURCE=2
+TARGET_HARDENED += -D_FORTIFY_SOURCE=2
 endif
 
 TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
+TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_HARDENED)
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 
-- 
2.14.3
