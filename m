From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 Mar 2011 13:19:21 -0300
Subject: [Buildroot] [PATCH 3/3] tslib: add skip module
In-Reply-To: <1298996361-760-1-git-send-email-gustavo@zacarias.com.ar>
References: <1298996361-760-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1298996361-760-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the skip module from Nelson Castillo, see...
https://lists.berlios.de/pipermail/tslib-general/2008-December/000150.html

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tslib/tslib_add_skip_module.patch |  273 +++++++++++++++++++++++++++++
 1 files changed, 273 insertions(+), 0 deletions(-)
 create mode 100644 package/tslib/tslib_add_skip_module.patch

diff --git a/package/tslib/tslib_add_skip_module.patch b/package/tslib/tslib_add_skip_module.patch
new file mode 100644
index 0000000..53d4610
--- /dev/null
+++ b/package/tslib/tslib_add_skip_module.patch
@@ -0,0 +1,273 @@
+diff -Nura tslib-860d69ca/configure.ac tslib-skip/configure.ac
+--- tslib-860d69ca/configure.ac	2010-12-21 12:19:51.000000000 -0300
++++ tslib-skip/configure.ac	2011-02-21 15:42:13.430361989 -0300
+@@ -55,6 +55,7 @@
+ TSLIB_CHECK_MODULE([linear-h2200], [yes], [Enable building of linearizing filter for iPAQ h2200])
+ TSLIB_CHECK_MODULE([variance], [yes], [Enable building of variance filter])
+ TSLIB_CHECK_MODULE([pthres], [yes], [Enable building of pthres filter])
++TSLIB_CHECK_MODULE([skip], [yes], [Enable building of skip filter])
+ 
+ # hardware access modules
+ TSLIB_CHECK_MODULE([ucb1x00], [yes], [Enable building of ucb1x00 raw module (UCB1x00 support)])
+diff -Nura tslib-860d69ca/plugins/Makefile.am tslib-skip/plugins/Makefile.am
+--- tslib-860d69ca/plugins/Makefile.am	2010-12-21 12:19:51.000000000 -0300
++++ tslib-skip/plugins/Makefile.am	2011-02-21 15:41:35.733219994 -0300
+@@ -42,6 +42,12 @@
+ PTHRES_MODULE =
+ endif
+ 
++if ENABLE_SKIP_MODULE
++SKIP_MODULE = skip.la
++else
++SKIP_MODULE =
++endif
++
+ if ENABLE_UCB1X00_MODULE
+ UCB1X00_MODULE = ucb1x00.la
+ else
+@@ -107,6 +113,7 @@
+ 	$(DEJITTER_MODULE) \
+ 	$(VARIANCE_MODULE) \
+ 	$(PTHRES_MODULE) \
++	$(SKIP_MODULE) \
+ 	$(UCB1X00_MODULE) \
+ 	$(CORGI_MODULE) \
+ 	$(COLLIE_MODULE) \
+@@ -134,6 +141,9 @@
+ pthres_la_LDFLAGS	= -module $(LTVSN)
+ pthres_la_LIBADD	= $(top_builddir)/src/libts.la
+ 
++skip_la_SOURCES	= skip.c
++skip_la_LDFLAGS	= -module $(LTVSN)
++
+ # hw access
+ corgi_la_SOURCES	= corgi-raw.c
+ corgi_la_LDFLAGS	= -module $(LTVSN)
+diff -Nura tslib-860d69ca/plugins/plugins.h tslib-skip/plugins/plugins.h
+--- tslib-860d69ca/plugins/plugins.h	2010-12-21 12:19:51.000000000 -0300
++++ tslib-skip/plugins/plugins.h	2011-02-22 10:32:26.733378036 -0300
+@@ -6,6 +6,7 @@
+ TSLIB_DECLARE_MODULE(linear_h2200);
+ TSLIB_DECLARE_MODULE(variance);
+ TSLIB_DECLARE_MODULE(pthres);
++TSLIB_DECLARE_MODULE(skip);
+ 
+ TSLIB_DECLARE_MODULE(ucb1x00);
+ TSLIB_DECLARE_MODULE(corgi);
+diff -Nura tslib-860d69ca/plugins/skip.c tslib-skip/plugins/skip.c
+--- tslib-860d69ca/plugins/skip.c	1969-12-31 21:00:00.000000000 -0300
++++ tslib-skip/plugins/skip.c	2011-02-22 11:24:58.441637249 -0300
+@@ -0,0 +1,213 @@
++/*
++ *  tslib/plugins/skip.c
++ *
++ * (C) 2008 by Openmoko, Inc.
++ * Author: Nelson Castillo <arhuaco@freaks-unidos.net>
++ *
++ * This file is placed under the LGPL.  Please see the file
++ * COPYING for more details.
++ *
++ * $Id$
++ *
++ * Skip filter for touchscreen values.
++ *
++ * Problem: With some drivers the first and the last sample is unreliable.
++ *
++ * Solution:
++ *
++ *  - Skip N points after pressure != 0
++ *  - Skip M points before pressure == 0
++ *  - Ignore a click if it has less than N + M + 1 points
++ *
++ * Parameters:
++ *
++ *  - nhead (means N)
++ *  - ntail (means M)
++ *
++ */
++
++#include <errno.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <limits.h>
++
++#include "config.h"
++#include "tslib.h"
++#include "tslib-filter.h"
++
++struct tslib_skip {
++	struct tslib_module_info module;
++
++	int nhead;
++	int N;
++
++	int ntail;
++	int M;
++	struct ts_sample *buf;
++	int sent;
++};
++
++static void reset_skip(struct tslib_skip *s)
++{
++	s->N = 0;
++	s->M = 0;
++	s->sent = 0;
++}
++
++static int skip_read(struct tslib_module_info *info, struct ts_sample *samp,
++		     int nr)
++{
++	struct tslib_skip *skip = (struct tslib_skip *)info;
++	int nread = 0;
++
++	while (nread < nr) {
++		struct ts_sample cur;
++
++		if (info->next->ops->read(info->next, &cur, 1) < 1)
++			return nread;
++
++		/* skip the first N samples */
++		if (skip->N < skip->nhead) {
++			skip->N++;
++			if (cur.pressure == 0)
++				reset_skip(skip);
++			continue;
++		}
++
++		/* We didn't send DOWN -- Ignore UP */
++		if (cur.pressure == 0 && skip->sent == 0) {
++			reset_skip(skip);
++			continue;
++		}
++
++		/* Just accept the sample if ntail is zero */
++		if (skip->ntail == 0) {
++			samp[nread++] = cur;
++			skip->sent = 1;
++			if (cur.pressure == 0)
++				reset_skip(skip);
++			continue;
++		}
++
++		/* ntail > 0,  Queue current point if we need to */
++		if (skip->sent == 0 && skip->M < skip->ntail) {
++			skip->buf[skip->M++] = cur;
++			continue;
++		}
++
++		/* queue full, accept one, queue one */
++
++		if (skip->M >= skip->ntail)
++			skip->M = 0;
++
++		if (cur.pressure == 0)
++			skip->buf[skip->M].pressure = 0;
++
++		samp[nread++] = skip->buf[skip->M];
++
++#ifdef DEBUG
++		fprintf(stderr, "skip---> (X:%d Y:%d) pressure:%d\n",
++			skip->buf[skip->M].x, skip->buf[skip->M].y,
++			skip->buf[skip->M].pressure);
++#endif
++
++		if (cur.pressure == 0) {
++			reset_skip(skip);
++		} else {
++			skip->buf[skip->M++] = cur;
++			skip->sent = 1;
++		}
++	}
++
++	return nread;
++}
++
++static int skip_fini(struct tslib_module_info *info)
++{
++	struct tslib_skip *skip = (struct tslib_skip *)info;
++
++	if (skip->buf)
++		free(skip->buf);
++
++	free(info);
++
++        return 0;
++}
++
++static const struct tslib_ops skip_ops =
++{
++	.read	= skip_read,
++	.fini	= skip_fini,
++};
++
++static int skip_opt(struct tslib_module_info *inf, char *str, void *data)
++{
++	struct tslib_skip *skip = (struct tslib_skip *)inf;
++	unsigned long v;
++	int err = errno;
++
++	v = strtoul(str, NULL, 0);
++
++	if (v == ULONG_MAX && errno == ERANGE)
++		return -1;
++
++	errno = err;
++
++	switch ((int)data) {
++	case 1:
++		skip->nhead = v;
++		break;
++
++	case 2:
++		skip->ntail = v;
++		break;
++
++	default:
++		return -1;
++	}
++	return 0;
++}
++
++static const struct tslib_vars skip_vars[] =
++{
++	{ "nhead",	(void *)1, skip_opt },
++	{ "ntail",	(void *)2, skip_opt },
++};
++
++#define NR_VARS (sizeof(skip_vars) / sizeof(skip_vars[0]))
++
++TSAPI struct tslib_module_info *skip_mod_init(struct tsdev *dev, const char *params)
++{
++	struct tslib_skip *skip;
++
++	skip = malloc(sizeof(struct tslib_skip));
++	if (skip == NULL)
++		return NULL;
++
++	memset(skip, 0, sizeof(struct tslib_skip));
++	skip->module.ops = &skip_ops;
++
++	skip->nhead = 1; /* by default remove the first */
++	skip->ntail = 1; /* by default remove the last */
++	skip->buf = NULL;
++
++	reset_skip(skip);
++
++	if (tslib_parse_vars(&skip->module, skip_vars, NR_VARS, params)) {
++		free(skip);
++		return NULL;
++	}
++	
++	if (skip->ntail &&
++	    !(skip->buf = malloc(sizeof(struct ts_sample) * skip->ntail))) {
++		free(skip);
++		return NULL;
++	}
++
++	return &skip->module;
++}
++
++#ifndef TSLIB_STATIC_SKIP_MODULE
++	TSLIB_MODULE_INIT(skip_mod_init);
++#endif
-- 
1.7.3.4
