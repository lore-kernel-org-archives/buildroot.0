From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 Mar 2011 13:19:19 -0300
Subject: [Buildroot] [PATCH 1/3] tslib: add lowpass filter
Message-ID: <1298996361-760-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the lowpass filter plugin from OpenMoko.
See http://docs.openmoko.org/trac/ticket/1194

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tslib/tslib_add_lowpass_filter.patch |  227 ++++++++++++++++++++++++++
 1 files changed, 227 insertions(+), 0 deletions(-)
 create mode 100644 package/tslib/tslib_add_lowpass_filter.patch

diff --git a/package/tslib/tslib_add_lowpass_filter.patch b/package/tslib/tslib_add_lowpass_filter.patch
new file mode 100644
index 0000000..6c26223
--- /dev/null
+++ b/package/tslib/tslib_add_lowpass_filter.patch
@@ -0,0 +1,227 @@
+diff -Nura tslib-860d69ca/configure.ac tslib-lowpass/configure.ac
+--- tslib-860d69ca/configure.ac	2010-12-21 12:19:51.000000000 -0300
++++ tslib-lowpass/configure.ac	2011-02-21 15:47:21.373313497 -0300
+@@ -51,6 +51,7 @@
+ 
+ # filters
+ TSLIB_CHECK_MODULE([linear], [yes], [Enable building of linear scaling])
++TSLIB_CHECK_MODULE([lowpass], [yes], [Enable building of lowpass filter])
+ TSLIB_CHECK_MODULE([dejitter], [yes], [Enable building of dejitter filter])
+ TSLIB_CHECK_MODULE([linear-h2200], [yes], [Enable building of linearizing filter for iPAQ h2200])
+ TSLIB_CHECK_MODULE([variance], [yes], [Enable building of variance filter])
+diff -Nura tslib-860d69ca/plugins/Makefile.am tslib-lowpass/plugins/Makefile.am
+--- tslib-860d69ca/plugins/Makefile.am	2010-12-21 12:19:51.000000000 -0300
++++ tslib-lowpass/plugins/Makefile.am	2011-02-23 09:16:46.756364384 -0300
+@@ -48,6 +48,12 @@
+ UCB1X00_MODULE =
+ endif
+ 
++if ENABLE_LOWPASS_MODULE
++LOWPASS_MODULE = lowpass.la
++else
++LOWPASS_MODULE =
++endif
++
+ if ENABLE_CORGI_MODULE
+ CORGI_MODULE = corgi.la
+ else
+@@ -104,6 +110,7 @@
+ 
+ pluginexec_LTLIBRARIES = \
+ 	$(LINEAR_MODULE) \
++	$(LOWPASS_MODULE) \
+ 	$(DEJITTER_MODULE) \
+ 	$(VARIANCE_MODULE) \
+ 	$(PTHRES_MODULE) \
+@@ -130,6 +137,10 @@
+ linear_la_LDFLAGS	= -module $(LTVSN)
+ linear_la_LIBADD	= $(top_builddir)/src/libts.la
+ 
++lowpass_la_SOURCES	= lowpass.c
++lowpass_la_LDFLAGS	= -module $(LTVSN)
++lowpass_la_LIBADD	= $(top_builddir)/src/libts.la
++
+ pthres_la_SOURCES	= pthres.c
+ pthres_la_LDFLAGS	= -module $(LTVSN)
+ pthres_la_LIBADD	= $(top_builddir)/src/libts.la
+diff -Nura tslib-860d69ca/plugins/lowpass.c tslib-lowpass/plugins/lowpass.c
+--- tslib-860d69ca/plugins/lowpass.c	1969-12-31 21:00:00.000000000 -0300
++++ tslib-lowpass/plugins/lowpass.c	2011-02-23 09:09:09.182850897 -0300
+@@ -0,0 +1,166 @@
++/*
++ * This file is placed under the LGPL.  Please see the file
++ * COPYING for more details.
++ * 
++ * Very stupid lowpass dejittering filter
++ */
++#include <errno.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <limits.h>
++
++#include "tslib.h"
++#include "tslib-filter.h"
++
++struct tslib_lowpass {
++	struct tslib_module_info module;
++        struct ts_sample last;
++        struct ts_sample ideal;
++	float factor;
++	unsigned int flags;
++	unsigned char threshold;
++#define VAR_PENUP		0x00000001
++};
++
++
++
++static int lowpass_read(struct tslib_module_info *info, struct ts_sample *samp, int nr)
++{
++	struct tslib_lowpass *var = (struct tslib_lowpass *)info;
++	struct ts_sample current;
++	int count = 0;
++	int delta;
++
++	while (count < nr) {
++		if (info->next->ops->read(info->next, &current, 1) < 1)
++			return count;
++
++		if (current.pressure == 0) {
++			var->flags |= VAR_PENUP;
++			samp [count++] = current;
++		} else if (var->flags & VAR_PENUP) {
++			var->flags &= ~VAR_PENUP;
++			var->last = current;
++			samp [count++] = current;
++		} else {
++			var->ideal = current;
++
++			var->ideal.x = var->last.x;
++			delta = current.x - var->last.x;
++			if (delta <= var->threshold && 
++					delta >= -var->threshold)
++				delta = 0;
++			delta *= var->factor;
++			var->ideal.x += delta;
++			
++			var->ideal.y = var->last.y;
++			delta = current.y - var->last.y;
++			if (delta <= var->threshold && 
++					delta >= -var->threshold)
++				delta = 0;
++			delta *= var->factor;
++			var->ideal.y += delta;
++
++			var->last = var->ideal;
++			samp [count++] = var->ideal;
++		}
++	}
++	return count;
++}
++
++static int lowpass_fini(struct tslib_module_info *info)
++{
++	free(info);
++        return 0;
++}
++
++static const struct tslib_ops lowpass_ops =
++{
++	.read	= lowpass_read,
++	.fini	= lowpass_fini,
++};
++
++static int lowpass_factor(struct tslib_module_info *inf, char *str, void *data)
++{
++	struct tslib_lowpass *var = (struct tslib_lowpass *)inf;
++	long double v;
++	int err = errno;
++
++	v = strtod(str, NULL);
++
++	if (v > 1 || v < 0)
++		return -1;
++
++	errno = err;
++	switch ((int)data) {
++	case 1:
++		var->factor = v;
++		break;
++
++	default:
++		return -1;
++	}
++	return 0;
++}
++
++static int lowpass_threshold(struct tslib_module_info *inf, char *str, 
++		void *data)
++{
++	struct tslib_lowpass *var = (struct tslib_lowpass *)inf;
++	long result;
++	int err = errno;
++
++	result = strtol(str,NULL,0);
++	if (errno == ERANGE)
++	       return -1;
++
++	errno = err;
++
++	switch ((int)data) {
++	case 1:
++		printf("threshold is now %d\n",result);
++		var->threshold = result;
++		break;
++	default:
++		return -1;
++	}
++	return 0;
++}
++
++
++static const struct tslib_vars lowpass_vars[] =
++{
++	{ "factor",	(void *)1, lowpass_factor },
++	{ "threshold",  (void*) 1, lowpass_threshold },
++};
++
++#define NR_VARS (sizeof(lowpass_vars) / sizeof(lowpass_vars[0]))
++
++TSAPI struct tslib_module_info *lowpass_mod_init(struct tsdev *dev, const char *params)
++{
++	struct tslib_lowpass *var;
++
++	var = malloc(sizeof(struct tslib_lowpass));
++	if (var == NULL)
++		return NULL;
++
++	memset(var, 0, sizeof *var);
++	var->module.ops = &lowpass_ops;
++
++	var->factor = 0.4;
++	var->threshold = 2;
++	var->flags = VAR_PENUP;
++
++	if (tslib_parse_vars(&var->module, lowpass_vars, NR_VARS, params)) {
++		free(var);
++		return NULL;
++	}
++
++
++	return &var->module;
++}
++
++#ifndef TSLIB_STATIC_LOWPASS_MODULE
++	TSLIB_MODULE_INIT(lowpass_mod_init);
++#endif
+diff -Nura tslib-860d69ca/plugins/plugins.h tslib-lowpass/plugins/plugins.h
+--- tslib-860d69ca/plugins/plugins.h	2010-12-21 12:19:51.000000000 -0300
++++ tslib-lowpass/plugins/plugins.h	2011-02-23 09:09:30.557850884 -0300
+@@ -3,6 +3,7 @@
+ 
+ TSLIB_DECLARE_MODULE(linear);
+ TSLIB_DECLARE_MODULE(dejitter);
++TSLIB_DECLARE_MODULE(lowpass);
+ TSLIB_DECLARE_MODULE(linear_h2200);
+ TSLIB_DECLARE_MODULE(variance);
+ TSLIB_DECLARE_MODULE(pthres);
-- 
1.7.3.4
