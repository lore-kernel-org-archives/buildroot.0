Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6FBC61DC6
	for <buildroot@archiver.kernel.org>; Sat, 21 Feb 2026 08:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87E2C41A4B;
	Sat, 21 Feb 2026 08:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CBrN1U5foBFI; Sat, 21 Feb 2026 08:15:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB96041A3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771661714;
	bh=v97bNHHrxYlg4WcYmmsKBDwTFDIj1giRFRhc5j7RDZ0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PQ2+/lnfLp1zmnVhHhxN148kHCyvM78ifIVqpeMLBoRmmsQtJyXSMAc+hPkhlSdeJ
	 mJYJS1PgIXZRdbJc440Au4gXDPK5Lv0tVEdqvOq8+O0mIqrrgArb2t52zPcb+9GONw
	 t0iBJmJwRcXv/Se9NhDSUjKlMy4OqaeV8wo/mrLAwqgi8dB9yP2dfeVKRS9bcZqz7c
	 +moXQ7T46Dz/y4Ef36egq4cGJYPZS6lFLCU00g89gNI6biYNaxyIy2BjZinib5i25w
	 sI+mN5fww5lpQU39Mm3B/NUJrWgGr7uJpytE9sGQwBv5m2n/YMwX5Ylu7A7xYXa0Ky
	 Qd7dI1cmgOzBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB96041A3B;
	Sat, 21 Feb 2026 08:15:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ED58E206
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 08:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2AEA406CB
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 08:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6joLsIt-SGkE for <buildroot@buildroot.org>;
 Sat, 21 Feb 2026 08:15:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8E39C406BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E39C406BB
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E39C406BB
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 08:15:12 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-8249aca0affso1511302b3a.3
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 00:15:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771661711; x=1772266511;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LnlLY9HzRXFrVWEvXq493CNHs2FrsHH8UvhlEyMzx/c=;
 b=T1GvMC6nPtcO7oCUNPkhgBOw5Dtan/oPshrgu4oJtY9vKuJ8Hg7GNSWkdqRTFvn1aE
 0tBSXR7/PM2SXQ/ydrJaEh3fXnGAisxV8iUFc3sg5deY1IM+R+EBNPgHS/fp3rirIQHb
 Ybjyj8Yw2kpExzY90VSOzwl98/iNK5XSh8MT5ILy152kPybYM9xMjWXZljaFvAgG1D6X
 Y6tB3SZ62jcfG+DprsJMWpZUATyeWyE5ASrl9EsJLcP6LT0jWCs/deyF0XUdtK+bmd/Q
 U2dVMOmbQbw9I98l5m3moVZCJ7tusYrlpzSB9BivX3AvaoJxPDk3x+PnHAs6BpZQWIQI
 e/9Q==
X-Gm-Message-State: AOJu0Yy6mciGuLaQg9p8qIsefTqSJGxfOnklA8pBkp5jXYDUnF5ORbXF
 0Vue1Z3MRcpX9hLj+Rnv/TxBUPH8xZDpuIpKDqhim9eZTe219BKq9h6l4abnVZdHb7qyrg==
X-Gm-Gg: AZuq6aLJYGQnvMJ9tUbSwLKxETwl8wK9CmtYCb+0JaCXa96evNQHQMSL8CJRNEvhpB/
 UGlw3ur6PKBhulXcR3ZX4H0RXHjSDG2H87Lt4r3RnQli/wWUDMvNrgnlg1yAUtP65WRdjKxX3dS
 2ckGhBTGKD8wVVsLOk+SRTk0D42fe+ST/e3Qpd3jvxWtRlamUUY5B9ZOTwZwuGIQAPYeLc2LTCQ
 VYxNEhWgJ9eSrS7Qw7Jx8qrkfCrw5sHGjqQN+wT4SFUIkPiqeaCZX9t9txj1XRH5VVzsEhOjaaG
 Ikk63N5jcvEEQH1ngPj0qIAZFY+TfJv6lmBme0bm6W9jJxgnjmmicFY6owaQB9uT8lUY2UEhBxg
 ycNqMK4fC+VMesmkv2Ol/dIEufVL5sqNVoUMsRBRhkLdYdxsKOnrt8VIayZfQdt2N3pJAh229Cl
 9OW+UYSuowBBEthFKo73h0j+LZBVqGDskd
X-Received: by 2002:a05:6a00:91cf:b0:824:98ef:dc63 with SMTP id
 d2e1a72fcca58-826daa64432mr2088493b3a.51.1771661710728; 
 Sat, 21 Feb 2026 00:15:10 -0800 (PST)
Received: from fedora ([2409:40e5:1045:f7f3:b903:7ed:3361:c527])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-826dd8ecb2dsm1515784b3a.60.2026.02.21.00.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Feb 2026 00:15:10 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat, 21 Feb 2026 13:44:58 +0530
Message-ID: <20260221081458.865721-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771661711; x=1772266511; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LnlLY9HzRXFrVWEvXq493CNHs2FrsHH8UvhlEyMzx/c=;
 b=UbJ83w+fERb3YdinMTBxK/3Q9peLSqvF1K+pUHtnUMUfvLVvJLFHminISQzgFaQcH7
 q/7Lecrq9aoBZOvDo8Hj1pwldNlrmU6ufFpgGRKvILY88UQYv0FL2OtEQ78G39FoDdJs
 speLLmTFgbp3raxNz7a3CaDeAisRMk2T+Zd7K96QJOvxJdwKugBfPVF5t4tK+RJe8S7c
 w4HRUK2J45VJ5M8NOjv81UZL5JWQ4lgqUmrYPwyeGCbDf9gJIb4ovrNsmcV2ffmVxtJh
 7RVbGTzzJKMemu70R/9HH3scBwPq1PaSIX6mhhJZTvxqC33NEHLsP40tV1vSHutWRhDd
 mSnQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UbJ83w+f
Subject: [Buildroot] [PATCH] package/libmpeg2: fix build with GCC 15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

GCC 15 defaults to C23, which no longer allows K&R-style empty parameter
list declarations. Fix getopt(), getopt_long(), getopt_long_only(), and
_getopt_internal() in src/getopt.h and src/getopt.c to use explicit
typed prototypes. Also convert K&R-style function definitions to modern
prototype style and replace the bare getenv() declaration with a proper

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 .../libmpeg2/0005-fix-getopt-modern-c.patch   | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 package/libmpeg2/0005-fix-getopt-modern-c.patch

diff --git a/package/libmpeg2/0005-fix-getopt-modern-c.patch b/package/libmpeg2/0005-fix-getopt-modern-c.patch
new file mode 100644
index 0000000000..a95e443df2
--- /dev/null
+++ b/package/libmpeg2/0005-fix-getopt-modern-c.patch
@@ -0,0 +1,108 @@
+--- a/src/getopt.h
++++ b/src/getopt.h
+@@ -133,7 +133,7 @@
+    errors, only prototype getopt for the GNU C library.  */
+ extern int getopt (int __argc, char *const *__argv, const char *__shortopts);
+ # else /* not __GNU_LIBRARY__ */
+-extern int getopt ();
++extern int getopt (int __argc, char *const *__argv, const char *__shortopts);
+ # endif /* __GNU_LIBRARY__ */
+ 
+ # ifndef __need_getopt
+@@ -150,12 +150,12 @@
+ 			     int __long_only);
+ # endif
+ #else /* not __STDC__ */
+-extern int getopt ();
++extern int getopt (int __argc, char *const *__argv, const char *__shortopts);
+ # ifndef __need_getopt
+-extern int getopt_long ();
+-extern int getopt_long_only ();
++extern int getopt_long (int __argc, char *const *__argv, const char *__shortopts, const struct option *__longopts, int *__longind);
++extern int getopt_long_only (int __argc, char *const *__argv, const char *__shortopts, const struct option *__longopts, int *__longind);
+ 
+-extern int _getopt_internal ();
++extern int _getopt_internal (int __argc, char *const *__argv, const char *__shortopts, const struct option *__longopts, int *__longind, int __long_only);
+ # endif
+ #endif /* __STDC__ */
+ 
+--- a/src/getopt.c
++++ b/src/getopt.c
+@@ -207,24 +207,19 @@
+ /* Avoid depending on library functions or files
+    whose names are inconsistent.  */
+ 
+-#ifndef getenv
+-extern char *getenv ();
+-#endif
++#include <stdlib.h>
+ 
+ static char *
+-my_index (str, chr)
+-     const char *str;
+-     int chr;
++my_index (const char *str, int chr)
+ {
+   while (*str)
+     {
+       if (*str == chr)
+-	return (char *) str;
++        return (char *) str;
+       str++;
+     }
+   return 0;
+ }
+-
+ /* If using GCC, we can safely declare strlen this way.
+    If not using GCC, it is ok not to declare it.  */
+ #ifdef __GNUC__
+@@ -302,8 +297,7 @@
+ #endif
+ 
+ static void
+-exchange (argv)
+-     char **argv;
++exchange (char **argv)
+ {
+   int bottom = first_nonopt;
+   int middle = last_nonopt;
+@@ -387,10 +381,7 @@
+ static const char *_getopt_initialize (int, char *const *, const char *);
+ #endif
+ static const char *
+-_getopt_initialize (argc, argv, optstring)
+-     int argc;
+-     char *const *argv;
+-     const char *optstring;
++_getopt_initialize (int argc, char *const *argv, const char *optstring)
+ {
+   /* Start processing options with ARGV-element 1 (since ARGV-element 0
+      is the program name); the sequence of previously skipped
+@@ -509,13 +500,8 @@
+    long-named options.  */
+ 
+ int
+-_getopt_internal (argc, argv, optstring, longopts, longind, long_only)
+-     int argc;
+-     char *const *argv;
+-     const char *optstring;
+-     const struct option *longopts;
+-     int *longind;
+-     int long_only;
++_getopt_internal (int argc, char *const *argv, const char *optstring,
++                  const struct option *longopts, int *longind, int long_only)
+ {
+   int print_errors = opterr;
+   if (optstring[0] == ':')
+@@ -969,10 +955,7 @@
+ }
+ 
+ int
+-getopt (argc, argv, optstring)
+-     int argc;
+-     char *const *argv;
+-     const char *optstring;
++getopt (int argc, char *const *argv, const char *optstring)
+ {
+   return _getopt_internal (argc, argv, optstring,
+ 			   (const struct option *) 0,
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
