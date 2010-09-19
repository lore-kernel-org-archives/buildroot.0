From: Martin Banky <martin.banky@gmail.com>
Date: Sat, 18 Sep 2010 19:53:23 -0700
Subject: [Buildroot] [PATCH 01/21] alsa-lib: bump to 1.0.23
In-Reply-To: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
References: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284864823-18993-2-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 .../alsa-lib-1.0.18-avr32-bad-inline.patch         |   91 --------------------
 .../alsa-lib-1.0.23-avr32-bad-inline.patch         |   91 ++++++++++++++++++++
 package/multimedia/alsa-lib/alsa-lib.mk            |    2 +-
 3 files changed, 92 insertions(+), 92 deletions(-)
 delete mode 100644 package/multimedia/alsa-lib/alsa-lib-1.0.18-avr32-bad-inline.patch
 create mode 100644 package/multimedia/alsa-lib/alsa-lib-1.0.23-avr32-bad-inline.patch

diff --git a/package/multimedia/alsa-lib/alsa-lib-1.0.18-avr32-bad-inline.patch b/package/multimedia/alsa-lib/alsa-lib-1.0.18-avr32-bad-inline.patch
deleted file mode 100644
index 568ba40..0000000
--- a/package/multimedia/alsa-lib/alsa-lib-1.0.18-avr32-bad-inline.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-diff -urN alsa-lib-1.0.18-0rig//src/pcm/pcm_local.h alsa-lib-1.0.18/src/pcm/pcm_local.h
---- alsa-lib-1.0.18-0rig//src/pcm/pcm_local.h	2009-01-31 11:02:12.000000000 +0100
-+++ alsa-lib-1.0.18/src/pcm/pcm_local.h	2009-01-31 11:03:24.000000000 +0100
-@@ -611,6 +611,13 @@
- 			   snd_pcm_hw_param_t var);
- int _snd_pcm_hw_param_set(snd_pcm_hw_params_t *params,
- 			  snd_pcm_hw_param_t var, unsigned int val, int dir);
-+
-+#if	defined(AVR32_INLINE_BUG)
-+int _snd_pcm_hw_params_set_format(snd_pcm_hw_params_t *params,
-+						snd_pcm_format_t val);
-+int _snd_pcm_hw_params_set_subformat(snd_pcm_hw_params_t *params,
-+				     snd_pcm_subformat_t val);
-+#else
- static inline int _snd_pcm_hw_params_set_format(snd_pcm_hw_params_t *params,
- 						snd_pcm_format_t val)
- {
-@@ -624,7 +631,7 @@
- 	return _snd_pcm_hw_param_set(params, SND_PCM_HW_PARAM_SUBFORMAT,
- 				     (unsigned long) val, 0);
- }
--
-+#endif
- int _snd_pcm_hw_param_set_min(snd_pcm_hw_params_t *params,
- 			      snd_pcm_hw_param_t var, unsigned int val, int dir);
- int _snd_pcm_hw_param_set_max(snd_pcm_hw_params_t *params,
-diff -urN alsa-lib-1.0.18-0rig//src/pcm/pcm_route.c alsa-lib-1.0.18/src/pcm/pcm_route.c
---- alsa-lib-1.0.18-0rig//src/pcm/pcm_route.c	2009-01-31 11:02:12.000000000 +0100
-+++ alsa-lib-1.0.18/src/pcm/pcm_route.c	2009-01-31 11:03:18.000000000 +0100
-@@ -26,6 +26,7 @@
-  *
-  */
-   
-+
- #include <byteswap.h>
- #include <math.h>
- #include "pcm_local.h"
-@@ -106,6 +107,23 @@
- 
- #endif /* DOC_HIDDEN */
- 
-+
-+#if	defined(AVR32_INLINE_BUG)
-+int _snd_pcm_hw_params_set_format(snd_pcm_hw_params_t *params,
-+						snd_pcm_format_t val)
-+{
-+	return _snd_pcm_hw_param_set(params, SND_PCM_HW_PARAM_FORMAT,
-+				     (unsigned long) val, 0);
-+}
-+
-+int _snd_pcm_hw_params_set_subformat(snd_pcm_hw_params_t *params,
-+				     snd_pcm_subformat_t val)
-+{
-+	return _snd_pcm_hw_param_set(params, SND_PCM_HW_PARAM_SUBFORMAT,
-+				     (unsigned long) val, 0);
-+}
-+#endif
-+
- static void snd_pcm_route_convert1_zero(const snd_pcm_channel_area_t *dst_area,
- 					snd_pcm_uframes_t dst_offset,
- 					const snd_pcm_channel_area_t *src_areas ATTRIBUTE_UNUSED,
-@@ -483,6 +501,8 @@
- 				  snd_pcm_uframes_t frames,
- 				  snd_pcm_route_params_t *params)
- {
-+#if	defined(AVR32_INLINE_BUG)
-+#endif
- 	unsigned int dst_channel;
- 	snd_pcm_route_ttable_dst_t *dstp;
- 	const snd_pcm_channel_area_t *dst_area;
-@@ -551,8 +571,20 @@
- 	_snd_pcm_hw_param_set_mask(sparams, SND_PCM_HW_PARAM_ACCESS,
- 				   &saccess_mask);
- 	if (route->sformat != SND_PCM_FORMAT_UNKNOWN) {
-+#if	defined(AVR32_INLINE_BUG)
-+/* Start of  of problem */
-+#endif
- 		_snd_pcm_hw_params_set_format(sparams, route->sformat);
- 		_snd_pcm_hw_params_set_subformat(sparams, SND_PCM_SUBFORMAT_STD);
-+#if	0
-+		_snd_pcm_hw_param_set(sparams, SND_PCM_HW_PARAM_FORMAT,
-+				     (unsigned long) route->sformat, 0);
-+		_snd_pcm_hw_param_set(sparams, SND_PCM_HW_PARAM_SUBFORMAT,
-+				     (unsigned long) SND_PCM_SUBFORMAT_STD, 0);
-+#endif
-+#if	defined(AVR32_INLINE_BUG)
-+/* End of problem */
-+#endif
- 	}
- 	if (route->schannels >= 0) {
- 		_snd_pcm_hw_param_set(sparams, SND_PCM_HW_PARAM_CHANNELS,
diff --git a/package/multimedia/alsa-lib/alsa-lib-1.0.23-avr32-bad-inline.patch b/package/multimedia/alsa-lib/alsa-lib-1.0.23-avr32-bad-inline.patch
new file mode 100644
index 0000000..568ba40
--- /dev/null
+++ b/package/multimedia/alsa-lib/alsa-lib-1.0.23-avr32-bad-inline.patch
@@ -0,0 +1,91 @@
+diff -urN alsa-lib-1.0.18-0rig//src/pcm/pcm_local.h alsa-lib-1.0.18/src/pcm/pcm_local.h
+--- alsa-lib-1.0.18-0rig//src/pcm/pcm_local.h	2009-01-31 11:02:12.000000000 +0100
++++ alsa-lib-1.0.18/src/pcm/pcm_local.h	2009-01-31 11:03:24.000000000 +0100
+@@ -611,6 +611,13 @@
+ 			   snd_pcm_hw_param_t var);
+ int _snd_pcm_hw_param_set(snd_pcm_hw_params_t *params,
+ 			  snd_pcm_hw_param_t var, unsigned int val, int dir);
++
++#if	defined(AVR32_INLINE_BUG)
++int _snd_pcm_hw_params_set_format(snd_pcm_hw_params_t *params,
++						snd_pcm_format_t val);
++int _snd_pcm_hw_params_set_subformat(snd_pcm_hw_params_t *params,
++				     snd_pcm_subformat_t val);
++#else
+ static inline int _snd_pcm_hw_params_set_format(snd_pcm_hw_params_t *params,
+ 						snd_pcm_format_t val)
+ {
+@@ -624,7 +631,7 @@
+ 	return _snd_pcm_hw_param_set(params, SND_PCM_HW_PARAM_SUBFORMAT,
+ 				     (unsigned long) val, 0);
+ }
+-
++#endif
+ int _snd_pcm_hw_param_set_min(snd_pcm_hw_params_t *params,
+ 			      snd_pcm_hw_param_t var, unsigned int val, int dir);
+ int _snd_pcm_hw_param_set_max(snd_pcm_hw_params_t *params,
+diff -urN alsa-lib-1.0.18-0rig//src/pcm/pcm_route.c alsa-lib-1.0.18/src/pcm/pcm_route.c
+--- alsa-lib-1.0.18-0rig//src/pcm/pcm_route.c	2009-01-31 11:02:12.000000000 +0100
++++ alsa-lib-1.0.18/src/pcm/pcm_route.c	2009-01-31 11:03:18.000000000 +0100
+@@ -26,6 +26,7 @@
+  *
+  */
+   
++
+ #include <byteswap.h>
+ #include <math.h>
+ #include "pcm_local.h"
+@@ -106,6 +107,23 @@
+ 
+ #endif /* DOC_HIDDEN */
+ 
++
++#if	defined(AVR32_INLINE_BUG)
++int _snd_pcm_hw_params_set_format(snd_pcm_hw_params_t *params,
++						snd_pcm_format_t val)
++{
++	return _snd_pcm_hw_param_set(params, SND_PCM_HW_PARAM_FORMAT,
++				     (unsigned long) val, 0);
++}
++
++int _snd_pcm_hw_params_set_subformat(snd_pcm_hw_params_t *params,
++				     snd_pcm_subformat_t val)
++{
++	return _snd_pcm_hw_param_set(params, SND_PCM_HW_PARAM_SUBFORMAT,
++				     (unsigned long) val, 0);
++}
++#endif
++
+ static void snd_pcm_route_convert1_zero(const snd_pcm_channel_area_t *dst_area,
+ 					snd_pcm_uframes_t dst_offset,
+ 					const snd_pcm_channel_area_t *src_areas ATTRIBUTE_UNUSED,
+@@ -483,6 +501,8 @@
+ 				  snd_pcm_uframes_t frames,
+ 				  snd_pcm_route_params_t *params)
+ {
++#if	defined(AVR32_INLINE_BUG)
++#endif
+ 	unsigned int dst_channel;
+ 	snd_pcm_route_ttable_dst_t *dstp;
+ 	const snd_pcm_channel_area_t *dst_area;
+@@ -551,8 +571,20 @@
+ 	_snd_pcm_hw_param_set_mask(sparams, SND_PCM_HW_PARAM_ACCESS,
+ 				   &saccess_mask);
+ 	if (route->sformat != SND_PCM_FORMAT_UNKNOWN) {
++#if	defined(AVR32_INLINE_BUG)
++/* Start of  of problem */
++#endif
+ 		_snd_pcm_hw_params_set_format(sparams, route->sformat);
+ 		_snd_pcm_hw_params_set_subformat(sparams, SND_PCM_SUBFORMAT_STD);
++#if	0
++		_snd_pcm_hw_param_set(sparams, SND_PCM_HW_PARAM_FORMAT,
++				     (unsigned long) route->sformat, 0);
++		_snd_pcm_hw_param_set(sparams, SND_PCM_HW_PARAM_SUBFORMAT,
++				     (unsigned long) SND_PCM_SUBFORMAT_STD, 0);
++#endif
++#if	defined(AVR32_INLINE_BUG)
++/* End of problem */
++#endif
+ 	}
+ 	if (route->schannels >= 0) {
+ 		_snd_pcm_hw_param_set(sparams, SND_PCM_HW_PARAM_CHANNELS,
diff --git a/package/multimedia/alsa-lib/alsa-lib.mk b/package/multimedia/alsa-lib/alsa-lib.mk
index c1a2b1a..7529ccc 100644
--- a/package/multimedia/alsa-lib/alsa-lib.mk
+++ b/package/multimedia/alsa-lib/alsa-lib.mk
@@ -3,7 +3,7 @@
 # alsa-lib
 #
 #############################################################
-ALSA_LIB_VERSION = 1.0.22
+ALSA_LIB_VERSION = 1.0.23
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
 ALSA_LIB_INSTALL_STAGING = YES
-- 
1.7.2.3
