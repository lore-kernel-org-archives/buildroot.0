From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:13 +0200
Subject: [Buildroot] [PATCH 17/34] reproducibility/libnspr: override build
	timestamps
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-17-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

with SOURCE_DATE_EPOCH
---
 package/libnspr/0003-honor-SOURCE_DATE_EPOCH.patch | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 package/libnspr/0003-honor-SOURCE_DATE_EPOCH.patch

diff --git a/package/libnspr/0003-honor-SOURCE_DATE_EPOCH.patch b/package/libnspr/0003-honor-SOURCE_DATE_EPOCH.patch
new file mode 100644
index 0000000..1a0fb7c
--- /dev/null
+++ b/package/libnspr/0003-honor-SOURCE_DATE_EPOCH.patch
@@ -0,0 +1,71 @@
+--- libnspr-4.10.10/nspr/lib/libc/src/Makefile.in~	2015-10-16 15:22:19.000000000 +0200
++++ libnspr-4.10.10/nspr/lib/libc/src/Makefile.in	2016-02-27 16:11:13.745483215 +0100
+@@ -103,7 +103,7 @@ ECHO = echo
+ TINC = $(OBJDIR)/_pl_bld.h
+ PROD = $(notdir $(SHARED_LIBRARY))
+ NOW = $(MOD_DEPTH)/config/$(OBJDIR)/now
+-SH_DATE = $(shell date "+%Y-%m-%d %T")
++SH_DATE = $(shell date `test -n "$$SOURCE_DATE_EPOCH" && echo -d @$$SOURCE_DATE_EPOCH` "+%Y-%m-%d %T")
+ SH_NOW = $(shell $(NOW))
+ 
+ ifeq ($(NS_USE_GCC)_$(OS_ARCH),_WINNT)
+--- libnspr-4.10.10/nspr/lib/ds/Makefile.in~	2015-10-16 15:22:19.000000000 +0200
++++ libnspr-4.10.10/nspr/lib/ds/Makefile.in	2016-02-27 16:11:28.115738828 +0100
+@@ -101,7 +101,7 @@ ECHO = echo
+ TINC = $(OBJDIR)/_pl_bld.h
+ PROD = $(notdir $(SHARED_LIBRARY))
+ NOW = $(MOD_DEPTH)/config/$(OBJDIR)/now
+-SH_DATE = $(shell date "+%Y-%m-%d %T")
++SH_DATE = $(shell date `test -n "$$SOURCE_DATE_EPOCH" && echo -d @$$SOURCE_DATE_EPOCH` "+%Y-%m-%d %T")
+ SH_NOW = $(shell $(NOW))
+ 
+ ifeq ($(NS_USE_GCC)_$(OS_ARCH),_WINNT)
+--- libnspr-4.10.10/nspr/lib/prstreams/Makefile.in~	2015-10-16 15:22:19.000000000 +0200
++++ libnspr-4.10.10/nspr/lib/prstreams/Makefile.in	2016-02-27 16:11:39.799279987 +0100
+@@ -105,7 +105,7 @@ ECHO = echo
+ TINC = $(OBJDIR)/_pl_bld.h
+ PROD = $(notdir $(SHARED_LIBRARY))
+ NOW = $(MOD_DEPTH)/config/$(OBJDIR)/now
+-SH_DATE = $(shell date "+%Y-%m-%d %T")
++SH_DATE = $(shell date `test -n "$$SOURCE_DATE_EPOCH" && echo -d @$$SOURCE_DATE_EPOCH` "+%Y-%m-%d %T")
+ SH_NOW = $(shell $(NOW))
+ 
+ ifeq ($(OS_ARCH), WINNT)
+--- libnspr-4.10.10/nspr/pr/src/Makefile.in~	2015-10-16 15:22:19.000000000 +0200
++++ libnspr-4.10.10/nspr/pr/src/Makefile.in	2016-02-27 16:18:55.560364508 +0100
+@@ -315,7 +315,7 @@ PROD = $(notdir $(SHARED_LIBRARY))
+ endif
+ 
+ NOW = $(MOD_DEPTH)/config/$(OBJDIR)/now
+-SH_DATE = $(shell date "+%Y-%m-%d %T")
++SH_DATE = $(shell date `test -n "$$SOURCE_DATE_EPOCH" && echo -d @$$SOURCE_DATE_EPOCH` "+%Y-%m-%d %T")
+ SH_NOW = $(shell $(NOW))
+ 
+ ifeq ($(NS_USE_GCC)_$(OS_ARCH),_WINNT)
+--- libnspr-4.10.10/nspr/config/now.c~	2015-10-16 15:22:19.000000000 +0200
++++ libnspr-4.10.10/nspr/config/now.c	2016-02-27 16:29:53.862069883 +0100
+@@ -4,6 +4,7 @@
+  * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
+ 
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <time.h>
+ 
+ int main(int argc, char **argv)
+@@ -27,10 +28,15 @@ int main(int argc, char **argv)
+     now = (1000000i64) * sec;
+     fprintf(stdout, "%I64d", now);
+ #else
++    const char *source_date_epoch = getenv("SOURCE_DATE_EPOCH");
+     long long now;
+     time_t sec;
+ 
+-    sec = time(NULL);
++    if (!source_date_epoch)
++      sec = time(NULL);
++    else
++      sec = (time_t)atoll(source_date_epoch);
++
+     now = (1000000LL) * sec;
+     fprintf(stdout, "%lld", now);
+ #endif
-- 
2.7.4
