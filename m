From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 Mar 2011 13:19:20 -0300
Subject: [Buildroot] =?utf-8?q?=5BPATCH_2/3=5D_tslib=3A_add_median_filter?=
In-Reply-To: <1298996361-760-1-git-send-email-gustavo@zacarias.com.ar>
References: <1298996361-760-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1298996361-760-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the median filter, see..
https://lists.berlios.de/pipermail/tslib-general/2009-October/000241.html

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tslib/tslib_add_median_filter.patch |  273 +++++++++++++++++++++++++++
 1 files changed, 273 insertions(+), 0 deletions(-)
 create mode 100644 package/tslib/tslib_add_median_filter.patch

diff --git a/package/tslib/tslib_add_median_filter.patch b/package/tslib/tslib_add_median_filter.patch
new file mode 100644
index 0000000..91a137f
--- /dev/null
+++ b/package/tslib/tslib_add_median_filter.patch
@@ -0,0 +1,273 @@
+diff -Nura tslib-860d69ca/configure.ac tslib-median/configure.ac
+--- tslib-860d69ca/configure.ac	2010-12-21 12:19:51.000000000 -0300
++++ tslib-median/configure.ac	2011-02-22 10:55:44.678979229 -0300
+@@ -50,6 +50,7 @@
+ AC_CHECK_FUNCS([gettimeofday memmove memset munmap select strcasecmp strchr strdup strtoul])
+ 
+ # filters
++TSLIB_CHECK_MODULE([median], [yes], [Enable building of median filter])
+ TSLIB_CHECK_MODULE([linear], [yes], [Enable building of linear scaling])
+ TSLIB_CHECK_MODULE([dejitter], [yes], [Enable building of dejitter filter])
+ TSLIB_CHECK_MODULE([linear-h2200], [yes], [Enable building of linearizing filter for iPAQ h2200])
+diff -Nura tslib-860d69ca/etc/ts.conf tslib-median/etc/ts.conf
+--- tslib-860d69ca/etc/ts.conf	2010-12-21 12:19:51.000000000 -0300
++++ tslib-median/etc/ts.conf	2011-02-22 10:54:37.689979230 -0300
+@@ -18,6 +18,9 @@
+ 
+ # Uncomment if you're using an IBM Arctic II
+ # module_raw arctic2
++#
++# If your panel is giving spiky signal applying median filter might help.
++# module median depth=5
+ 
+ module pthres pmin=1
+ module variance delta=30
+diff -Nura tslib-860d69ca/plugins/Makefile.am tslib-median/plugins/Makefile.am
+--- tslib-860d69ca/plugins/Makefile.am	2010-12-21 12:19:51.000000000 -0300
++++ tslib-median/plugins/Makefile.am	2011-02-24 19:33:53.039195641 -0300
+@@ -90,6 +90,12 @@
+ INPUT_MODULE =
+ endif
+ 
++if ENABLE_MEDIAN_MODULE
++MEDIAN_MODULE = median.la
++else
++MEDIAN_MODULE =
++endif
++
+ if ENABLE_LINEAR_H2200_MODULE
+ H2200_LINEAR_MODULE = linear_h2200.la
+ else
+@@ -113,6 +119,7 @@
+ 	$(H3600_MODULE) \
+ 	$(MK712_MODULE) \
+ 	$(ARCTIC2_MODULE) \
++	$(MEDIAN_MODULE) \
+ 	$(TATUNG_MODULE) \
+ 	$(H2200_LINEAR_MODULE) \
+ 	$(INPUT_MODULE) \
+@@ -130,6 +137,10 @@
+ linear_la_LDFLAGS	= -module $(LTVSN)
+ linear_la_LIBADD	= $(top_builddir)/src/libts.la
+ 
++median_la_SOURCES	= median.c
++median_la_LDFLAGS	= -module $(LTVSN)
++median_la_LIBADD	= $(top_builddir)/src/libts.la
++
+ pthres_la_SOURCES	= pthres.c
+ pthres_la_LDFLAGS	= -module $(LTVSN)
+ pthres_la_LIBADD	= $(top_builddir)/src/libts.la
+diff -Nura tslib-860d69ca/plugins/median.c tslib-median/plugins/median.c
+--- tslib-860d69ca/plugins/median.c	1969-12-31 21:00:00.000000000 -0300
++++ tslib-median/plugins/median.c	2011-02-22 11:25:33.560187810 -0300
+@@ -0,0 +1,199 @@
++/*
++ *  tslib/plugins/median.c
++ *
++ *  Copyright (C) 2009 Marel ehf
++ *  Author K?ri Dav??sson <karidav@marel.com>
++ *
++ * This file is placed under the LGPL.  Please see the file
++ * COPYING for more details.
++ *
++ * $Id:$
++ *
++ * Media filter incomming data
++ */
++
++#include <errno.h>
++#include <stdio.h>
++#include <limits.h>
++#include <string.h>
++#include <stdlib.h>
++
++#include "config.h"
++#include "tslib.h"
++#include "tslib-filter.h"
++
++#define PREPARESAMPLE( array, context, member ) { int count = context->size; while( count-- ) { array[count] = context->delay[count].member; } }
++
++struct median_context {
++	struct tslib_module_info module;
++    int size;
++    struct ts_sample * delay;
++    int withsamples;
++};
++
++static int comp_int(const void * n1, const void * n2)
++{
++    int * i1 = (int *) n1;
++    int * i2 = (int *) n2;
++
++    return  *i1 < *i2 ? -1 : 1;
++}
++
++static int comp_uint(const void * n1, const void * n2)
++{
++    unsigned int * i1 = (unsigned int *) n1;
++    unsigned int * i2 = (unsigned int *) n2;
++
++    return  *i1 < *i2 ? -1 : 1;
++}
++
++static void printsamples( char * prefix,  int * samples, size_t count )
++{
++#ifdef DEBUG
++    size_t j;
++
++    printf("%s Using %d samples ", prefix, count);
++    for( j = 0; j < count; j++)
++    {
++        printf(" %d", samples[j]);
++    }
++    printf("\n");
++#endif
++}
++
++static void printsample( char * prefix, struct ts_sample * s )
++{
++#ifdef DEBUG
++    printf( "%s using Point@(%d,%d) with pressure %u\n", prefix, s->x, s->y, s->pressure);
++#endif
++}
++
++static int median_read(struct tslib_module_info *inf, struct ts_sample *samp, int nr)
++{
++	struct median_context *c = (struct median_context *)inf;
++    int ret;
++
++	ret = inf->next->ops->read(inf->next, samp, nr);
++    if( ret > 0 ) {
++        int i;
++        struct ts_sample * s;
++
++		for (s = samp, i = 0; i < ret; i++, s++) {
++            int sorted[c->size];
++            unsigned int usorted[c->size];
++            unsigned int cpress;
++
++            cpress = s->pressure;
++
++            memmove( &c->delay[0], &c->delay[1], (c->size - 1) * sizeof( c->delay[0] ) );
++            c->delay[c->size -1] = *s;
++            
++            PREPARESAMPLE( sorted, c, x );
++            printsamples( "X Before", sorted, c->size );
++            qsort( &sorted[0], c->size, sizeof( sorted[0] ), comp_int);
++            s->x = sorted[c->size / 2];
++            printsamples( "X After", sorted, c->size );
++
++            PREPARESAMPLE( sorted, c, y );
++            printsamples( "Y Before", sorted, c->size );
++            qsort( &sorted[0], c->size, sizeof( sorted[0] ), comp_int);
++            s->y = sorted[c->size / 2];
++            printsamples( "Y After", sorted, c->size );
++
++            PREPARESAMPLE( usorted, c, pressure );
++            printsamples( "Pressure Before", usorted, c->size );
++            qsort( &usorted[0], c->size, sizeof( usorted[0] ), comp_uint);
++            s->pressure = usorted[ c->size / 2];
++            printsamples( "Pressure After", usorted, c->size );
++
++            printsample( "", s );
++
++            if( (cpress == 0)  && (c->withsamples != 0) )
++            { /* We have penup */
++                /* Flush the line we now must wait for c->size / 2 samples untill we get valid data again */
++                memset( c->delay, 0, sizeof( struct ts_sample) * c->size );
++                c->withsamples = 0;
++                printf("Pen Up\n");
++                s->pressure = cpress;
++            }
++            else if( (cpress != 0) && (c->withsamples == 0) )
++            { /* We have pen down */
++                c->withsamples = 1;
++                printf("Pen Down\n");
++            }
++        }
++    }
++
++	return ret;
++}
++
++static int median_fini(struct tslib_module_info *inf)
++{
++    struct median_context * c = ( struct median_context *) inf;
++
++    free( c->delay );
++	free(inf);
++
++	return 0;
++}
++
++static const struct tslib_ops __ts_input_ops = {
++	.read	= median_read,
++	.fini	= median_fini,
++};
++
++static int median_depth(struct tslib_module_info *inf, char *str, void *data __attribute__(( unused )) )
++{
++	struct median_context *m = (struct median_context *)inf;
++	unsigned long v;
++	int err = errno;
++
++	v = strtoul(str, NULL, 0);
++
++	if (v == ULONG_MAX && errno == ERANGE)
++		return -1;
++
++	errno = err;
++    m->delay = malloc( sizeof( struct ts_sample ) * v );
++    m->size = v;
++    
++	return 0;
++}
++
++static const struct tslib_vars raw_vars[] =
++{
++	{ "depth", (void *)1, median_depth },
++};
++
++#define NR_VARS (sizeof(raw_vars) / sizeof(raw_vars[0]))
++
++TSAPI struct tslib_module_info *median_mod_init(struct tsdev *dev __attribute__((unused)), const char *params)
++{
++	struct median_context *c;
++
++	c = malloc(sizeof(struct median_context));
++	if (c == NULL)
++		return NULL;
++    
++    memset( c, 0, sizeof( struct median_context ) );
++
++	c->module.ops = &__ts_input_ops;
++
++	if (tslib_parse_vars(&c->module, raw_vars, NR_VARS, params)) {
++		free(c);
++		return NULL;
++	}
++
++    if( c->delay == NULL )
++    {
++        c->delay = malloc( sizeof( struct ts_sample ) * 3 );
++        c->size = 3;
++        printf("Using default size of 3\n");
++    }
++
++	return &(c->module);
++}
++
++#ifndef TSLIB_STATIC_MEDIAN_MODULE
++	TSLIB_MODULE_INIT(median_mod_init);
++#endif
+diff -Nura tslib-860d69ca/plugins/plugins.h tslib-median/plugins/plugins.h
+--- tslib-860d69ca/plugins/plugins.h	2010-12-21 12:19:51.000000000 -0300
++++ tslib-median/plugins/plugins.h	2011-02-22 10:57:43.658979230 -0300
+@@ -2,6 +2,7 @@
+ 	TSAPI struct tslib_module_info *name##_mod_init(struct tsdev *dev, const char *params)
+ 
+ TSLIB_DECLARE_MODULE(linear);
++TSLIB_DECLARE_MODULE(median);
+ TSLIB_DECLARE_MODULE(dejitter);
+ TSLIB_DECLARE_MODULE(linear_h2200);
+ TSLIB_DECLARE_MODULE(variance);
-- 
1.7.3.4
