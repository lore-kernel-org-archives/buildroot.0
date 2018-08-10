From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 22:30:42 +0200
Subject: [Buildroot] [git commit branch/next] package/Makefile.in: Do not
 use CPPFLAGS for hardening options
Message-ID: <20180810202429.ADE638B8B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4f5801027f3329fb6c2cd096f3396d3cd067390
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The hardening options are compiler flags, not pure pre-processor flags, so
put them in CFLAGS, not CPPFLAGS.

This fixes build errors where -D_FORTIFY_SOURCE=2 whas put in CPPFLAGS and
then applied to configure tests which could fail since the required -O2 is
only in CFLAGS.

Originally submitted as
http://patchwork.ozlabs.org/patch/904057/

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Makefile.in | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index f2962767cc..5e0ff8c841 100644
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
 
