Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65D8C52D7B
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 13:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40809817AC;
	Tue, 13 Aug 2024 13:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1dne_7Sh0C3; Tue, 13 Aug 2024 13:17:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 237A18179A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 237A18179A;
	Tue, 13 Aug 2024 13:17:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 839831BF275
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 13:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 723D48179A
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 13:17:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sd4r04AcqHsO for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 13:17:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C1B7F80072
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1B7F80072
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1B7F80072
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 13:17:42 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0B3D535206C8; Tue, 13 Aug 2024 15:17:39 +0200 (CEST)
Date: Tue, 13 Aug 2024 15:17:39 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zrtc85Eh/rXEpune@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723555060; bh=6XI+WEocWym/8boXPUmGX8UcbIjtpB+7LGijjKAQqN8=;
 h=Date:From:To:Subject:From;
 b=WQKlJc636TR8w+qYAxGqtb+8IdN0tqmqZWOE4ndKceQuFX7w591M1ltnmNnOMR+28
 TupyAGXVphpDFOJbkVlB/sahzRmyq9siScf3qxhp+qxJ0P7tuE6oMl6v/D08d3WaYM
 faBHwaP39reoPGsZVXltsU5qY8NbIcO/gvN8/YPOcut6CbWH7QyogLvpIDnPfLWFj+
 mHjFrgseqsfYQ3/yar/6epedR2lWZ4Mp6N/9VenVH9cJcuokie6l/df0jUPWzpP/EP
 0aXEM+jrEvrZ+7E0ED57w2KiGuOVXOGsuK4ntWmmY0bRJwkW1trvIb0zAQZv8Qp4kC
 iEoZsyVlIn2JQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=WQKlJc63
Subject: [Buildroot] [PATCH] package/dc3dd: fix compile issues
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a patch from Debian to fix the autobuild issues.
Furthermore something like ea2f52494c32c53a3def6dc3b0c5b9d5d7c7edf4
from cvs package is required as well.

Fixes:
 - http://autobuild.buildroot.net/results/6a0/6a0c5dc057eb348afcd5e3859cb37059d6bd91c1

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...e.y-compile-on-QNX-and-NetBSD-5-i386.patch | 104 ++++++++++++++++++
 package/dc3dd/dc3dd.mk                        |   2 +
 2 files changed, 106 insertions(+)
 create mode 100644 package/dc3dd/0004-Make-getdate.y-compile-on-QNX-and-NetBSD-5-i386.patch

diff --git a/package/dc3dd/0004-Make-getdate.y-compile-on-QNX-and-NetBSD-5-i386.patch b/package/dc3dd/0004-Make-getdate.y-compile-on-QNX-and-NetBSD-5-i386.patch
new file mode 100644
index 0000000000..6b7344e6e6
--- /dev/null
+++ b/package/dc3dd/0004-Make-getdate.y-compile-on-QNX-and-NetBSD-5-i386.patch
@@ -0,0 +1,104 @@
+From: Bruno Haible <bruno@clisp.org>
+Date: Thu, 17 Sep 2009 22:42:33 +0200
+Subject: Make getdate.y compile on QNX and NetBSD 5 / i386.
+
+Forwarded: https://sourceforge.net/p/dc3dd/bugs/23/
+Origin: https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=a68c9ab3cfc8ac7cf2a709b0c1aa93229f8635e6
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://sources.debian.org/patches/dc3dd/7.3.1-3/Make-getdate.y-compile-on-QNX-and-NetBSD-5-i386.patch/
+---
+ lib/getdate.y | 33 ++++++++++++++++++++++-----------
+ m4/getdate.m4 | 14 ++++++++++++++
+ 2 files changed, 36 insertions(+), 11 deletions(-)
+
+diff --git a/lib/getdate.y b/lib/getdate.y
+index 1deec51..d2c23f2 100644
+--- a/lib/getdate.y
++++ b/lib/getdate.y
+@@ -108,12 +108,21 @@
+ 
+ #define HOUR(x) ((x) * 60)
+ 
+-/* Lots of this code assumes time_t and time_t-like values fit into
+-   long int.  It also assumes that signed integer overflow silently
+-   wraps around, but there's no portable way to check for that at
+-   compile-time.  */
++/* long_time_t is a signed integer type that contains all time_t values.  */
+ verify (TYPE_IS_INTEGER (time_t));
+-verify (LONG_MIN <= TYPE_MINIMUM (time_t) && TYPE_MAXIMUM (time_t) <= LONG_MAX);
++#if TIME_T_FITS_IN_LONG_INT
++typedef long int long_time_t;
++#else
++typedef time_t long_time_t;
++#endif
++
++/* Lots of this code assumes time_t and time_t-like values fit into
++   long_time_t.  */
++verify (TYPE_MINIMUM (long_time_t) <= TYPE_MINIMUM (time_t)
++        && TYPE_MAXIMUM (time_t) <= TYPE_MAXIMUM (long_time_t));
++
++/* FIXME: It also assumes that signed integer overflow silently wraps around,
++   but this is not true any more with recent versions of GCC 4.  */
+ 
+ /* An integer value, and the number of digits in its textual
+    representation.  */
+@@ -146,7 +155,7 @@ typedef struct
+   long int day;
+   long int hour;
+   long int minutes;
+-  long int seconds;
++  long_time_t seconds;
+   long int ns;
+ } relative_time;
+ 
+@@ -1492,20 +1501,22 @@ get_date (struct timespec *result, char const *p, struct timespec const *now)
+ 	time_t t1 = t0 + d1;
+ 	long int d2 = 60 * pc.rel.minutes;
+ 	time_t t2 = t1 + d2;
+-	long int d3 = pc.rel.seconds;
+-	time_t t3 = t2 + d3;
++	long_time_t d3 = pc.rel.seconds;
++	long_time_t t3 = t2 + d3;
+ 	long int d4 = (sum_ns - normalized_ns) / BILLION;
+-	time_t t4 = t3 + d4;
++	long_time_t t4 = t3 + d4;
++	time_t t5 = t4;
+ 
+ 	if ((d1 / (60 * 60) ^ pc.rel.hour)
+ 	    | (d2 / 60 ^ pc.rel.minutes)
+ 	    | ((t1 < t0) ^ (d1 < 0))
+ 	    | ((t2 < t1) ^ (d2 < 0))
+ 	    | ((t3 < t2) ^ (d3 < 0))
+-	    | ((t4 < t3) ^ (d4 < 0)))
++	    | ((t4 < t3) ^ (d4 < 0))
++	    | (t5 != t4))
+ 	  goto fail;
+ 
+-	result->tv_sec = t4;
++	result->tv_sec = t5;
+ 	result->tv_nsec = normalized_ns;
+       }
+     }
+diff --git a/m4/getdate.m4 b/m4/getdate.m4
+index d160329..cfbb86f 100644
+--- a/m4/getdate.m4
++++ b/m4/getdate.m4
+@@ -30,4 +30,18 @@ AC_DEFUN([gl_GETDATE],
+   AC_STRUCT_TIMEZONE
+   AC_REQUIRE([gl_CLOCK_TIME])
+   AC_REQUIRE([gl_TM_GMTOFF])
++  AC_COMPILE_IFELSE(
++    [AC_LANG_SOURCE([[
++#include <time.h> /* for time_t */
++#include <limits.h> /* for CHAR_BIT, LONG_MIN, LONG_MAX */
++#define TYPE_MINIMUM(t) \
++  ((t) ((t) 0 < (t) -1 ? (t) 0 : ~ (t) 0 << (sizeof (t) * CHAR_BIT - 1)))
++#define TYPE_MAXIMUM(t) \
++  ((t) ((t) 0 < (t) -1 ? (t) -1 : ~ (~ (t) 0 << (sizeof (t) * CHAR_BIT - 1))))
++typedef int verify_min[2 * (LONG_MIN <= TYPE_MINIMUM (time_t)) - 1];
++typedef int verify_max[2 * (TYPE_MAXIMUM (time_t) <= LONG_MAX) - 1];
++       ]])],
++    [AC_DEFINE([TIME_T_FITS_IN_LONG_INT], [1],
++       [Define to 1 if all 'time_t' values fit in a 'long int'.])
++    ])
+ ])
diff --git a/package/dc3dd/dc3dd.mk b/package/dc3dd/dc3dd.mk
index f47f34a81a..c31ab9e1f3 100644
--- a/package/dc3dd/dc3dd.mk
+++ b/package/dc3dd/dc3dd.mk
@@ -15,4 +15,6 @@ DC3DD_LICENSE_FILES = COPYING
 DC3DD_AUTORECONF = YES
 DC3DD_AUTOPOINT = YES
 
+DC3DD_CONF_ENV = ac_cv_func_working_mktime=yes
+
 $(eval $(autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
