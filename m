From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed,  2 Apr 2014 16:42:25 +0200
Subject: [Buildroot] [PATCH 1/2] eudev: fix redefinition of usec_t and
	nsec_t.
In-Reply-To: <1396449746-12934-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1396449746-12934-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1396449746-12934-2-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

usec_t and nsec_t are defined twice (src/libudev/{util.h,path-util.h}).
This raises an error when using GCC 4.5, but not with later versions!
This patch fixes the issue by gathering the time-related functions and
definitions to time-util.[ch], as in upstream systemd.

This patch has been sent to upstream.

Fixes http://autobuild.buildroot.net/results/060/0605f279abfdfc837f6973f2898ed7ee39f2b8d1/

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 ...dev-Fix-redefinition-of-usec_t-and-nsec_t.patch |  526 ++++++++++++++++++++
 1 file changed, 526 insertions(+)
 create mode 100644 package/eudev/eudev-0002-libudev-Fix-redefinition-of-usec_t-and-nsec_t.patch

diff --git a/package/eudev/eudev-0002-libudev-Fix-redefinition-of-usec_t-and-nsec_t.patch b/package/eudev/eudev-0002-libudev-Fix-redefinition-of-usec_t-and-nsec_t.patch
new file mode 100644
index 0000000..e53b2c3
--- /dev/null
+++ b/package/eudev/eudev-0002-libudev-Fix-redefinition-of-usec_t-and-nsec_t.patch
@@ -0,0 +1,526 @@
+From dc1aabc85f1ceda5799fe39225fa76f2f77354ea Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Wed, 2 Apr 2014 11:51:40 +0200
+Subject: [PATCH] libudev: Fix redefinition of usec_t and nsec_t.
+
+The type definitions usec_t and nsec_t are defined twice: in
+path-util.h and util.h.
+
+time-util.h and time-util.c now gather the time-related functions and
+definitions (as in upstream systemd).
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+---
+ src/libudev/Makefile.am       |    2 +
+ src/libudev/libudev-private.h |    1 +
+ src/libudev/log.c             |    1 +
+ src/libudev/path-util.h       |    4 +-
+ src/libudev/time-util.c       |  157 +++++++++++++++++++++++++++++++++++++++++
+ src/libudev/time-util.h       |   56 +++++++++++++++
+ src/libudev/util.c            |  132 +---------------------------------
+ src/libudev/util.h            |   39 ----------
+ 8 files changed, 219 insertions(+), 173 deletions(-)
+ create mode 100644 src/libudev/time-util.c
+ create mode 100644 src/libudev/time-util.h
+
+diff --git a/src/libudev/Makefile.am b/src/libudev/Makefile.am
+index 84d018a..683407a 100644
+--- a/src/libudev/Makefile.am
++++ b/src/libudev/Makefile.am
+@@ -47,6 +47,7 @@ libudev_la_SOURCES =\
+ 	strbuf.c \
+ 	strv.c \
+ 	strxcpyx.c  \
++	time-util.c \
+ 	util.c \
+ 	utf8.c
+ 
+@@ -73,6 +74,7 @@ noinst_HEADERS = \
+ 	strbuf.h \
+ 	strv.h \
+ 	strxcpyx.h \
++	time-util.h \
+ 	util.h \
+ 	utf8.h
+ 
+diff --git a/src/libudev/libudev-private.h b/src/libudev/libudev-private.h
+index af0f125..511ec5e 100644
+--- a/src/libudev/libudev-private.h
++++ b/src/libudev/libudev-private.h
+@@ -27,6 +27,7 @@
+ 
+ #include "libudev.h"
+ #include "macro.h"
++#include "time-util.h"
+ #include "util.h"
+ #include "mkdir.h"
+ #include "strxcpyx.h"
+diff --git a/src/libudev/log.c b/src/libudev/log.c
+index 73bba69..a4e1bce 100644
+--- a/src/libudev/log.c
++++ b/src/libudev/log.c
+@@ -30,6 +30,7 @@
+ #include <string.h>
+ 
+ #include "log.h"
++#include "time-util.h"
+ #include "util.h"
+ #include "missing.h"
+ #include "macro.h"
+diff --git a/src/libudev/path-util.h b/src/libudev/path-util.h
+index eea7589..8e55131 100644
+--- a/src/libudev/path-util.h
++++ b/src/libudev/path-util.h
+@@ -18,10 +18,8 @@
+ ***/
+ 
+ #include <stdbool.h>
+-#include <inttypes.h>
+ 
+-typedef uint64_t usec_t;
+-typedef uint64_t nsec_t;
++#include "time-util.h"
+ 
+ char* path_get_file_name(const char *p) _pure_;
+ int path_get_parent(const char *path, char **parent);
+diff --git a/src/libudev/time-util.c b/src/libudev/time-util.c
+new file mode 100644
+index 0000000..f6c24e3
+--- /dev/null
++++ b/src/libudev/time-util.c
+@@ -0,0 +1,157 @@
++/***
++  This file is part of eudev, forked from systemd.
++
++  Copyright 2010 Lennart Poettering
++
++  systemd is free software; you can redistribute it and/or modify it
++  under the terms of the GNU Lesser General Public License as published by
++  the Free Software Foundation; either version 2.1 of the License, or
++  (at your option) any later version.
++
++  systemd is distributed in the hope that it will be useful, but
++  WITHOUT ANY WARRANTY; without even the implied warranty of
++  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
++  Lesser General Public License for more details.
++
++  You should have received a copy of the GNU Lesser General Public License
++  along with systemd; If not, see <http://www.gnu.org/licenses/>.
++***/
++
++#include <stdlib.h>
++#include <stdio.h>
++#include <stdbool.h>
++#include <time.h>
++
++#include "time-util.h"
++#include "macro.h"
++
++usec_t now(clockid_t clock_id) {
++        struct timespec ts;
++
++        assert_se(clock_gettime(clock_id, &ts) == 0);
++
++        return timespec_load(&ts);
++}
++
++usec_t timespec_load(const struct timespec *ts) {
++        assert(ts);
++
++        if (ts->tv_sec == (time_t) -1 &&
++            ts->tv_nsec == (long) -1)
++                return (usec_t) -1;
++
++        if ((usec_t) ts->tv_sec > (UINT64_MAX - (ts->tv_nsec / NSEC_PER_USEC)) / USEC_PER_SEC)
++                return (usec_t) -1;
++
++        return
++                (usec_t) ts->tv_sec * USEC_PER_SEC +
++                (usec_t) ts->tv_nsec / NSEC_PER_USEC;
++}
++
++char *format_timespan(char *buf, size_t l, usec_t t, usec_t accuracy) {
++        static const struct {
++                const char *suffix;
++                usec_t usec;
++        } table[] = {
++                { "y", USEC_PER_YEAR },
++                { "month", USEC_PER_MONTH },
++                { "w", USEC_PER_WEEK },
++                { "d", USEC_PER_DAY },
++                { "h", USEC_PER_HOUR },
++                { "min", USEC_PER_MINUTE },
++                { "s", USEC_PER_SEC },
++                { "ms", USEC_PER_MSEC },
++                { "us", 1 },
++        };
++
++        unsigned i;
++        char *p = buf;
++        bool something = false;
++
++        assert(buf);
++        assert(l > 0);
++
++        if (t == (usec_t) -1)
++                return NULL;
++
++        if (t <= 0) {
++                snprintf(p, l, "0");
++                p[l-1] = 0;
++                return p;
++        }
++
++        /* The result of this function can be parsed with parse_sec */
++
++        for (i = 0; i < ELEMENTSOF(table); i++) {
++                int k;
++                size_t n;
++                bool done = false;
++                usec_t a, b;
++
++                if (t <= 0)
++                        break;
++
++                if (t < accuracy && something)
++                        break;
++
++                if (t < table[i].usec)
++                        continue;
++
++                if (l <= 1)
++                        break;
++
++                a = t / table[i].usec;
++                b = t % table[i].usec;
++
++                /* Let's see if we should shows this in dot notation */
++                if (t < USEC_PER_MINUTE && b > 0) {
++                        usec_t cc;
++                        int j;
++
++                        j = 0;
++                        for (cc = table[i].usec; cc > 1; cc /= 10)
++                                j++;
++
++                        for (cc = accuracy; cc > 1; cc /= 10) {
++                                b /= 10;
++                                j--;
++                        }
++
++                        if (j > 0) {
++                                k = snprintf(p, l,
++                                             "%s%llu.%0*llu%s",
++                                             p > buf ? " " : "",
++                                             (unsigned long long) a,
++                                             j,
++                                             (unsigned long long) b,
++                                             table[i].suffix);
++
++                                t = 0;
++                                done = true;
++                        }
++                }
++
++                /* No? Then let's show it normally */
++                if (!done) {
++                        k = snprintf(p, l,
++                                     "%s%llu%s",
++                                     p > buf ? " " : "",
++                                     (unsigned long long) a,
++                                     table[i].suffix);
++
++                        t = b;
++                }
++
++                n = MIN((size_t) k, l);
++
++                l -= n;
++                p += n;
++
++                something = true;
++        }
++
++        *p = 0;
++
++        return buf;
++}
++
+diff --git a/src/libudev/time-util.h b/src/libudev/time-util.h
+new file mode 100644
+index 0000000..0f7f696
+--- /dev/null
++++ b/src/libudev/time-util.h
+@@ -0,0 +1,56 @@
++/***
++  This file is part of eudev, forked from systemd.
++
++  Copyright 2010 Lennart Poettering
++
++  systemd is free software; you can redistribute it and/or modify it
++  under the terms of the GNU Lesser General Public License as published by
++  the Free Software Foundation; either version 2.1 of the License, or
++  (at your option) any later version.
++
++  systemd is distributed in the hope that it will be useful, but
++  WITHOUT ANY WARRANTY; without even the implied warranty of
++  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
++  Lesser General Public License for more details.
++
++  You should have received a copy of the GNU Lesser General Public License
++  along with systemd; If not, see <http://www.gnu.org/licenses/>.
++***/
++
++#pragma once
++
++#include <inttypes.h>
++
++typedef uint64_t usec_t;
++typedef uint64_t nsec_t;
++
++typedef struct dual_timestamp {
++        usec_t realtime;
++        usec_t monotonic;
++} dual_timestamp;
++
++#define MSEC_PER_SEC  1000ULL
++#define USEC_PER_SEC  1000000ULL
++#define USEC_PER_MSEC 1000ULL
++#define NSEC_PER_SEC  1000000000ULL
++#define NSEC_PER_MSEC 1000000ULL
++#define NSEC_PER_USEC 1000ULL
++
++#define USEC_PER_MINUTE (60ULL*USEC_PER_SEC)
++#define NSEC_PER_MINUTE (60ULL*NSEC_PER_SEC)
++#define USEC_PER_HOUR (60ULL*USEC_PER_MINUTE)
++#define NSEC_PER_HOUR (60ULL*NSEC_PER_MINUTE)
++#define USEC_PER_DAY (24ULL*USEC_PER_HOUR)
++#define NSEC_PER_DAY (24ULL*NSEC_PER_HOUR)
++#define USEC_PER_WEEK (7ULL*USEC_PER_DAY)
++#define NSEC_PER_WEEK (7ULL*NSEC_PER_DAY)
++#define USEC_PER_MONTH (2629800ULL*USEC_PER_SEC)
++#define NSEC_PER_MONTH (2629800ULL*NSEC_PER_SEC)
++#define USEC_PER_YEAR (31557600ULL*USEC_PER_SEC)
++#define NSEC_PER_YEAR (31557600ULL*NSEC_PER_SEC)
++
++#define FORMAT_TIMESPAN_MAX 64
++
++usec_t now(clockid_t clock);
++usec_t timespec_load(const struct timespec *ts);
++char *format_timespan(char *buf, size_t l, usec_t t, usec_t accuracy);
+diff --git a/src/libudev/util.c b/src/libudev/util.c
+index a0d7cac..4796505 100644
+--- a/src/libudev/util.c
++++ b/src/libudev/util.c
+@@ -102,136 +102,6 @@ bool streq_ptr(const char *a, const char *b) {
+         return false;
+ }
+ 
+-usec_t now(clockid_t clock_id) {
+-        struct timespec ts;
+-
+-        assert_se(clock_gettime(clock_id, &ts) == 0);
+-
+-        return timespec_load(&ts);
+-}
+-
+-usec_t timespec_load(const struct timespec *ts) {
+-        assert(ts);
+-
+-        if (ts->tv_sec == (time_t) -1 &&
+-            ts->tv_nsec == (long) -1)
+-                return (usec_t) -1;
+-
+-        if ((usec_t) ts->tv_sec > (UINT64_MAX - (ts->tv_nsec / NSEC_PER_USEC)) / USEC_PER_SEC)
+-                return (usec_t) -1;
+-
+-        return
+-                (usec_t) ts->tv_sec * USEC_PER_SEC +
+-                (usec_t) ts->tv_nsec / NSEC_PER_USEC;
+-}
+-
+-char *format_timespan(char *buf, size_t l, usec_t t, usec_t accuracy) {
+-        static const struct {
+-                const char *suffix;
+-                usec_t usec;
+-        } table[] = {
+-                { "y", USEC_PER_YEAR },
+-                { "month", USEC_PER_MONTH },
+-                { "w", USEC_PER_WEEK },
+-                { "d", USEC_PER_DAY },
+-                { "h", USEC_PER_HOUR },
+-                { "min", USEC_PER_MINUTE },
+-                { "s", USEC_PER_SEC },
+-                { "ms", USEC_PER_MSEC },
+-                { "us", 1 },
+-        };
+-
+-        unsigned i;
+-        char *p = buf;
+-        bool something = false;
+-
+-        assert(buf);
+-        assert(l > 0);
+-
+-        if (t == (usec_t) -1)
+-                return NULL;
+-
+-        if (t <= 0) {
+-                snprintf(p, l, "0");
+-                p[l-1] = 0;
+-                return p;
+-        }
+-
+-        /* The result of this function can be parsed with parse_sec */
+-
+-        for (i = 0; i < ELEMENTSOF(table); i++) {
+-                int k;
+-                size_t n;
+-                bool done = false;
+-                usec_t a, b;
+-
+-                if (t <= 0)
+-                        break;
+-
+-                if (t < accuracy && something)
+-                        break;
+-
+-                if (t < table[i].usec)
+-                        continue;
+-
+-                if (l <= 1)
+-                        break;
+-
+-                a = t / table[i].usec;
+-                b = t % table[i].usec;
+-
+-                /* Let's see if we should shows this in dot notation */
+-                if (t < USEC_PER_MINUTE && b > 0) {
+-                        usec_t cc;
+-                        int j;
+-
+-                        j = 0;
+-                        for (cc = table[i].usec; cc > 1; cc /= 10)
+-                                j++;
+-
+-                        for (cc = accuracy; cc > 1; cc /= 10) {
+-                                b /= 10;
+-                                j--;
+-                        }
+-
+-                        if (j > 0) {
+-                                k = snprintf(p, l,
+-                                             "%s%llu.%0*llu%s",
+-                                             p > buf ? " " : "",
+-                                             (unsigned long long) a,
+-                                             j,
+-                                             (unsigned long long) b,
+-                                             table[i].suffix);
+-
+-                                t = 0;
+-                                done = true;
+-                        }
+-                }
+-
+-                /* No? Then let's show it normally */
+-                if (!done) {
+-                        k = snprintf(p, l,
+-                                     "%s%llu%s",
+-                                     p > buf ? " " : "",
+-                                     (unsigned long long) a,
+-                                     table[i].suffix);
+-
+-                        t = b;
+-                }
+-
+-                n = MIN((size_t) k, l);
+-
+-                l -= n;
+-                p += n;
+-
+-                something = true;
+-        }
+-
+-        *p = 0;
+-
+-        return buf;
+-}
+-
+ char* endswith(const char *s, const char *postfix) {
+         size_t sl, pl;
+ 
+@@ -826,7 +696,7 @@ int execute_command(const char *command, char *const argv[])
+                 } else
+                         log_debug("%s exited successfully.", command);
+ 
+-                return si.si_status; 
++                return si.si_status;
+ 
+         }
+ }
+diff --git a/src/libudev/util.h b/src/libudev/util.h
+index 33e9efb..6510237 100644
+--- a/src/libudev/util.h
++++ b/src/libudev/util.h
+@@ -33,47 +33,12 @@
+ 
+ #include "macro.h"
+ 
+-/* Note: the time definitions are from upstream's
+- * src/shared/time-util.h which I have put here
+- * for now.  We may need to beak these out later.
+- * <blueness@gentoo.org>
+- */
+-typedef uint64_t usec_t;
+-typedef uint64_t nsec_t;
+-
+-typedef struct dual_timestamp {
+-        usec_t realtime;
+-        usec_t monotonic;
+-} dual_timestamp;
+-
+ union dirent_storage {
+         struct dirent de;
+         uint8_t storage[offsetof(struct dirent, d_name) +
+                         ((NAME_MAX + 1 + sizeof(long)) & ~(sizeof(long) - 1))];
+ };
+ 
+-#define MSEC_PER_SEC  1000ULL
+-#define USEC_PER_SEC  1000000ULL
+-#define USEC_PER_MSEC 1000ULL
+-#define NSEC_PER_SEC  1000000000ULL
+-#define NSEC_PER_MSEC 1000000ULL
+-#define NSEC_PER_USEC 1000ULL
+-
+-#define USEC_PER_MINUTE (60ULL*USEC_PER_SEC)
+-#define NSEC_PER_MINUTE (60ULL*NSEC_PER_SEC)
+-#define USEC_PER_HOUR (60ULL*USEC_PER_MINUTE)
+-#define NSEC_PER_HOUR (60ULL*NSEC_PER_MINUTE)
+-#define USEC_PER_DAY (24ULL*USEC_PER_HOUR)
+-#define NSEC_PER_DAY (24ULL*NSEC_PER_HOUR)
+-#define USEC_PER_WEEK (7ULL*USEC_PER_DAY)
+-#define NSEC_PER_WEEK (7ULL*NSEC_PER_DAY)
+-#define USEC_PER_MONTH (2629800ULL*USEC_PER_SEC)
+-#define NSEC_PER_MONTH (2629800ULL*NSEC_PER_SEC)
+-#define USEC_PER_YEAR (31557600ULL*USEC_PER_SEC)
+-#define NSEC_PER_YEAR (31557600ULL*NSEC_PER_SEC)
+-
+-#define FORMAT_TIMESPAN_MAX 64
+-
+ /* What is interpreted as whitespace? */
+ #define WHITESPACE " \t\n\r"
+ #define NEWLINE    "\n\r"
+@@ -93,10 +58,6 @@ union dirent_storage {
+ #define ANSI_HIGHLIGHT_OFF "\x1B[0m"
+ #define ANSI_ERASE_TO_END_OF_LINE "\x1B[K"
+ 
+-usec_t now(clockid_t clock);
+-usec_t timespec_load(const struct timespec *ts);
+-char *format_timespan(char *buf, size_t l, usec_t t, usec_t accuracy);
+-
+ size_t page_size(void);
+ #define PAGE_ALIGN(l) ALIGN_TO((l), page_size())
+ 
+-- 
+1.7.9.5
+
-- 
1.7.9.5
