Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E820C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 13:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A9A240434;
	Mon,  3 Jun 2024 13:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1RrDZw3xyhi; Mon,  3 Jun 2024 13:45:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 054CA40A9B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 054CA40A9B;
	Mon,  3 Jun 2024 13:45:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF7C81BF3DE
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 13:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB1024047D
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 13:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ieGH2mGGGszQ for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 13:45:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 425ED40319
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 425ED40319
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 425ED40319
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 13:45:01 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-572c65cea55so7666157a12.0
 for <buildroot@buildroot.org>; Mon, 03 Jun 2024 06:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717422299; x=1718027099;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lMprn8cyl71C6E29rpX4jwvnbcygrZIeh9RoaFmeyzI=;
 b=X07EI5u3sKfpc/QOd16ehJRwKPr1XmY+W4YUNOBQcBklkqvvfm2XdUsVnGe4mRmc2g
 eFH29Kox3XjXa4MXZCelpzZxzACu0LGNtmJ6GQFyH1pKPWE00dyz62913AS5rQm2YBwx
 BOe+qvxCbYTJxjM4zP0dCI90rw1aZu2PCH40g6LJkveCf9AnMYCI/LofmngxsC2IVzBJ
 ETlhwRU37/rv1oqrx8wZrazUcdd+DEEn2oq4WE5ZBrVOKl3acrcB3HbqkgC3vsHM+Fc7
 su7g6pfDDufWqNv/JHenGEf+BraxIjzkZb4I/SNNOo6Sv3R2pY+Mxq3mSPJpvranh5ns
 bhDg==
X-Gm-Message-State: AOJu0YyjB/AAviuQPdgFDDDTII8Pokh2SEJAXfEXiwHDFAn0tFltEGuh
 hQsPOUa2OJV+ROY/sCYNYKJJSjRo2PhrHkFixTdW1I77jIZ60i0ruVNKWA==
X-Google-Smtp-Source: AGHT+IFNcVNP8F0bOY3peTrfHHQrevOS7CNvHsJ8+j3wwUVNH7NSlmd6sxjsJFy6WR+fMpA1m0vjLQ==
X-Received: by 2002:a50:9ea6:0:b0:578:6019:265a with SMTP id
 4fb4d7f45d1cf-57a19f579cemr9960671a12.8.1717422298425; 
 Mon, 03 Jun 2024 06:44:58 -0700 (PDT)
Received: from development2.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a3e776c47sm4737582a12.20.2024.06.03.06.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 06:44:57 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 15:43:58 +0200
Message-Id: <20240603134358.3504092-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1717422299; x=1718027099; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lMprn8cyl71C6E29rpX4jwvnbcygrZIeh9RoaFmeyzI=;
 b=cHk6mKbUZsfYoQp1ruXgoKI3dTZoPXMTdUkeQ6aU7LetStiLB3bfSgp0EW+CA109sV
 quPg32KI+KWFdrlL/gVk/HZx/h/T2yZHRVa7sUICAoeWVx4HbXm/x7oCe0jfvGjdMHuN
 H0cF6IzLB4CYp84oNCw19eqyyEZAY7yTxZuCfcZEf2rffWzeSHAAJID3etk7XkDg5kxv
 wyCc1nOwvxhU6TncYIoNf6PDSOwEbPY7dpwMvxsWAwiH1pfD66vbih7Q9g6pOuQ5Q9rs
 Byn+SW/L3QpPhhK/8wuL+gEQPJPn5dKWe+7zDhp3HyYK3veVkNFv2c9T2tQnudx21xSY
 pHVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cHk6mKbU
Subject: [Buildroot] [PATCH v3] package/ntp: fix build with GCC 14.x
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Bernd Kuhls <bernd@kuhls.net>, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Fix pthread_detach() detection that is broken when building
with GCC 14.x:

checking for pthread_kill... yes
checking for pthread_rwlock_destroy with <pthread.h>... yes
checking for pthread_detach with <pthread.h>... no
configure: error: could not locate pthread_detach()
make[1]: *** [package/pkg-generic.mk:273:
/home/user/buildroot/bsp-barebox/build/ntp-4.2.8p17/.stamp_configured]
Error 1
make: *** [Makefile:82: _all] Error 2

Reference: https://bugs.ntp.org/show_bug.cgi?id=3926

Additionally, refresh patch 0002 to fix the offset of hunk 1.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
 - add upstream reference (Yann E. MORIN)
 - rework 0002 refresh reason (Yann E. MORIN)
 - add error log

Changes v2 -> v3:
 - add proper Upstream tag to the 0003-fix-pthread-detach-check.patch
   file

 package/ntp/0002-ntp-syscalls-fallback.patch  |  9 ++++---
 .../ntp/0003-fix-pthread-detach-check.patch   | 26 +++++++++++++++++++
 2 files changed, 31 insertions(+), 4 deletions(-)
 create mode 100644 package/ntp/0003-fix-pthread-detach-check.patch

diff --git a/package/ntp/0002-ntp-syscalls-fallback.patch b/package/ntp/0002-ntp-syscalls-fallback.patch
index 535fc93dfd..46704b9d3f 100644
--- a/package/ntp/0002-ntp-syscalls-fallback.patch
+++ b/package/ntp/0002-ntp-syscalls-fallback.patch
@@ -8,10 +8,11 @@ Signed-off-by: James Knight <james.knight@rockwellcollins.com>
  configure.ac | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

-diff --git a/configure.ac b/configure.ac
---- a/configure.ac
-+++ b/configure.ac
-@@ -1523,11 +1523,11 @@ AC_CACHE_CHECK(
+Index: ntp-4.2.8p17/configure.ac
+===================================================================
+--- ntp-4.2.8p17.orig/configure.ac
++++ ntp-4.2.8p17/configure.ac
+@@ -1472,11 +1472,11 @@ AC_CACHE_CHECK(
      [ntp_cv_var_ntp_syscalls],
      [
  	ntp_cv_var_ntp_syscalls=no
diff --git a/package/ntp/0003-fix-pthread-detach-check.patch b/package/ntp/0003-fix-pthread-detach-check.patch
new file mode 100644
index 0000000000..894b422f2c
--- /dev/null
+++ b/package/ntp/0003-fix-pthread-detach-check.patch
@@ -0,0 +1,26 @@
+fix pthread_detach check
+
+Upstream: https://bugs.ntp.org/show_bug.cgi?id=3926
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ sntp/m4/openldap-thread-check.m4 |    6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+Index: ntp-4.2.8p17/sntp/m4/openldap-thread-check.m4
+===================================================================
+--- ntp-4.2.8p17.orig/sntp/m4/openldap-thread-check.m4
++++ ntp-4.2.8p17/sntp/m4/openldap-thread-check.m4
+@@ -262,10 +262,8 @@ pthread_rwlock_t rwlock;
+ 				dnl save the flags
+ 				AC_LINK_IFELSE([AC_LANG_PROGRAM([[
+ #include <pthread.h>
+-#ifndef NULL
+-#define NULL (void*)0
+-#endif
+-]], [[pthread_detach(NULL);]])],[ol_cv_func_pthread_detach=yes],[ol_cv_func_pthread_detach=no])
++pthread_t thread;
++]], [[pthread_detach(thread);]])],[ol_cv_func_pthread_detach=yes],[ol_cv_func_pthread_detach=no])
+ 			])
+
+ 			if test $ol_cv_func_pthread_detach = no ; then
--
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
