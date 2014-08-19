From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 19 Aug 2014 20:06:55 +0400
Subject: [Buildroot] [PATCH] gstreamer{,
	1}: fix unaligned access detection for arc
Message-ID: <1408464415-18240-1-git-send-email-abrodkin@synopsys.com>
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
---
 package/gstreamer/gstreamer/gstreamer.mk    | 3 +++
 package/gstreamer1/gstreamer1/gstreamer1.mk | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
index 4696876..8e0b042 100644
--- a/package/gstreamer/gstreamer/gstreamer.mk
+++ b/package/gstreamer/gstreamer/gstreamer.mk
@@ -18,6 +18,9 @@ endif
 ifeq ($(BR2_aarch64),y)
 GSTREAMER_CONF_ENV = as_cv_unaligned_access=yes
 endif
+ifeq ($(BR2_arc),y)
+GSTREAMER_CONF_ENV = as_cv_unaligned_access=no
+endif
 
 GSTREAMER_CONF_OPT = \
 		--disable-examples \
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index bf23582..528351f 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -20,6 +20,9 @@ endif
 ifeq ($(BR2_aarch64),y)
 GSTREAMER1_CONF_ENV = as_cv_unaligned_access=yes
 endif
+ifeq ($(BR2_arc),y)
+GSTREAMER1_CONF_ENV = as_cv_unaligned_access=no
+endif
 
 GSTREAMER1_CONF_OPT = \
 	--disable-examples \
-- 
1.9.3
