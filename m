From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 20 Aug 2014 19:04:47 +0400
Subject: [Buildroot] [PATCH v2] gstreamer{,
	1}: fix unaligned access detection for arc
Message-ID: <1408547087-31816-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the same issue as reported for microblaze here
http://autobuild.buildroot.net/results/f49/f4914bb3999c8a7a0c0a2afdac5de40fb9058372/

Similar to the existing handling for avr32, microblaze and xtensa.
Also add it for gstreamer1 for good measure as it was missing there as well.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Baruch Siach <baruch@tkos.co.il>
---
Compared to v1 this patch adds ARC to other architectures that don't support
unaligend access instead of addition of ARC-specific ifdefs.

Kudos to Baruch Siach for his attention to details!
---
 package/gstreamer/gstreamer/gstreamer.mk    | 2 +-
 package/gstreamer1/gstreamer1/gstreamer1.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
index 4696876..3f8643d 100644
--- a/package/gstreamer/gstreamer/gstreamer.mk
+++ b/package/gstreamer/gstreamer/gstreamer.mk
@@ -12,7 +12,7 @@ GSTREAMER_INSTALL_STAGING = YES
 # Checking if unaligned memory access works correctly cannot be done when cross
 # compiling. For the following architectures there is no information available
 # in the configure script.
-ifeq ($(BR2_avr32)$(BR2_xtensa)$(BR2_microblaze),y)
+ifeq ($(BR2_arc)$(BR2_avr32)$(BR2_xtensa)$(BR2_microblaze),y)
 GSTREAMER_CONF_ENV = as_cv_unaligned_access=no
 endif
 ifeq ($(BR2_aarch64),y)
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index bf23582..338a722 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -14,7 +14,7 @@ GSTREAMER1_LICENSE = LGPLv2+ LGPLv2.1+
 # Checking if unaligned memory access works correctly cannot be done when cross
 # compiling. For the following architectures there is no information available
 # in the configure script.
-ifeq ($(BR2_avr32)$(BR2_xtensa)$(BR2_microblaze),y)
+ifeq ($(BR2_arc)$(BR2_avr32)$(BR2_xtensa)$(BR2_microblaze),y)
 GSTREAMER1_CONF_ENV = as_cv_unaligned_access=no
 endif
 ifeq ($(BR2_aarch64),y)
-- 
1.9.3
