From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 31 Jan 2009 10:18:25 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/alsa-lib
Message-ID: <20090131101825.7DC5376219@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-31 10:18:23 +0000 (Sat, 31 Jan 2009)
New Revision: 25175

Log:
Workaround for AVR32 compiler issue affecting inlining, causing alsa-lib to break, feedback to AVR32 compiler team will be sent

Added:
   trunk/buildroot/package/multimedia/alsa-lib/alsa-lib-1.0.18-avr32-bad-inline.patch

Modified:
   trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk


Changeset:
Added: trunk/buildroot/package/multimedia/alsa-lib/alsa-lib-1.0.18-avr32-bad-inline.patch
===================================================================
--- trunk/buildroot/package/multimedia/alsa-lib/alsa-lib-1.0.18-avr32-bad-inline.patch	                        (rev 0)
+++ trunk/buildroot/package/multimedia/alsa-lib/alsa-lib-1.0.18-avr32-bad-inline.patch	2009-01-31 10:18:23 UTC (rev 25175)
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

Modified: trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk
===================================================================
--- trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2009-01-31 01:07:05 UTC (rev 25174)
+++ trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2009-01-31 10:18:23 UTC (rev 25175)
@@ -12,11 +12,17 @@
 ALSA_LIB_TARGET_BINARY:=usr/lib/$(ALSA_LIB_BINARY)
 
 ifeq ($(BR2_arm),y)
-ALSA_LIB_ABI:=-mabi=aapcs-linux
+ALSA_LIB_ABI+=-mabi=aapcs-linux
 else
-ALSA_LIB_ABI:=
+ALSA_LIB_ABI+=
 endif
 
+ifeq ($(BR2_avr32),y)
+ALSA_LIB_ABI+=-DAVR32_INLINE_BUG
+else
+ALSA_LIB_ABI+=
+endif
+
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PYTHON),y)
 ALSA_LIB_CONFIGURE_OPTS += --with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR)
 ALSA_LIB_DEPS = libpython
@@ -77,6 +83,8 @@
 
 alsa-lib: uclibc $(ALSA_LIB_DEPS) $(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY)
 
+alsa-lib-unpacked: $(ALSA_LIB_DIR)/.unpacked
+
 alsa-lib-source: $(DL_DIR)/$(ALSA_LIB_SOURCE)
 
 alsa-lib-clean:
