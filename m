Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71414C27C75
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 11:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FEE3413CF;
	Thu, 13 Jun 2024 11:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fH83ATTc0F5l; Thu, 13 Jun 2024 11:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE4AB4020B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE4AB4020B;
	Thu, 13 Jun 2024 11:40:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E27DD1BF359
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 11:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF8884020B
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 11:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tPYKiyBGbXch for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 11:40:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EDBF0401AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDBF0401AD
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDBF0401AD
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 11:40:27 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57c75464e77so979094a12.0
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 04:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718278825; x=1718883625;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zgbVWsToTTfeoiyLLVINSuejnefPMkymKoXfssgUa3U=;
 b=LH4iKgwgNl04doy/rtKVDnQJEcLuoREdzxRE2ij4wO0Vz1QXHQSPIl6fu+P8tf/tAj
 pQuNQ5PRRQMgimk1uAoII4EbjmSABaWjVwVcUSXHTeJskeJcyZUWSNDawmQQ5iRA6cKs
 acyOycYZsglKiS0GePe+Kqk4As4iKsPqseJFvaYX87BexqfBJwpeJTvP9u11ULZ/QKcv
 dQF7DPZ4gzN8M4Jkkxl2muN+e/wOS/uRYuKEmFjUGUXnzu9YcTjOeOncnLK586HmwnPY
 PoTbS+pFMvF+WNqHcRjSm6vl61NuQteL5MWgtsEcLjo9UrtJEtPaoJrgnHBIwAnYOhs8
 77rg==
X-Gm-Message-State: AOJu0Yw2hknz5lBgdh8cKqSIrTUOkgIqAQh7c2Ip7DRe0/ME0MjUKL4u
 KixyrNXjC0AQ05x0G8gIedviykGa9KX/WvDxQztM28A0b5/IU3dhESXnag==
X-Google-Smtp-Source: AGHT+IHBt/BbcCxiScx1Iq0p4vSUDTDi3wQkvPdiBCMAKmTynxHg9R6apvobkoFG7Wb2E3nKFw9IlA==
X-Received: by 2002:a17:906:34d9:b0:a6f:4b0c:94ba with SMTP id
 a640c23a62f3a-a6f4b0c94f0mr282775466b.29.1718278825005; 
 Thu, 13 Jun 2024 04:40:25 -0700 (PDT)
Received: from development2.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f57b5e7b2sm59559866b.68.2024.06.13.04.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 04:40:24 -0700 (PDT)
From: yegorslists@googlemail.com
To: buildroot@buildroot.org
Date: Thu, 13 Jun 2024 13:39:24 +0200
Message-Id: <20240613113924.3778837-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1718278825; x=1718883625; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zgbVWsToTTfeoiyLLVINSuejnefPMkymKoXfssgUa3U=;
 b=cSDfEBDOQ/BvwQ0NTwHV7xT3cDQCNrqlZFb3ozya3FG4ujR4W3TgzWUunC+d8ZNcYt
 XjzJmQDNllciUBYQcKIoMrWzjQVS8RXPB+7u5zJwlztC+5u62twcb232/v5i+XDc+5L/
 V3hre2ozGOd8m82CUIheECHL4XoASvglT3011tqNIOCoqpipBer55iHg+mrgkgRcbKXn
 B90WqDSbzBN+RGsExQunvfMfqTg7X7j8gCOA10gXhW1X+FgS4HI/100PzateQeA4Qs7q
 jWqYrMrr+USANPXI1y2ITbCkAuU9Qadsqb4pA/A5Z9MHta2hvj5cwzZnj34VCC56pmxn
 3tEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cSDfEBDO
Subject: [Buildroot] [PATCH] package/ncftp: fix GCC 14.x related build errors
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

From: Yegor Yefremov <yegorslists@googlemail.com>

Patches were taken from Gentoo:

https://bugs.gentoo.org/921487
https://gitweb.gentoo.org/repo/gentoo.git/tree/net-ftp/ncftp/files/ncftp-3.2.7-fix-clang.patch

Fixes:
http://autobuild.buildroot.net/results/058578eae885ce6e206c25b5a24aa11b625adf88/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .checkpackageignore                           |  2 +
 .../ncftp/0001-ncftp-3.2.7-fix-gcc14.patch    | 17 +++++
 .../ncftp/0002-ncftp-3.2.7-fix-clang.patch    | 70 +++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 package/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch
 create mode 100644 package/ncftp/0002-ncftp-3.2.7-fix-clang.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index dd1fd31e86..52b5090034 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1067,6 +1067,8 @@ package/musl/0001-avoid-kernel-if_ether.h.patch lib_patch.Upstream
 package/musl/0002-package-musl-Make-scheduler-functions-Linux-compatib.patch lib_patch.Upstream
 package/nano/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch lib_patch.Upstream
 package/nanocom/0001-fix-build-with-gcc-10.patch lib_patch.Upstream
+package/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch lib_patch.Upstream
+package/ncftp/0002-ncftp-3.2.7-fix-clang.patch lib_patch.Upstream
 package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch lib_patch.Upstream
 package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch lib_patch.Upstream
 package/ne10/0002-fix-build-without-C.patch lib_patch.Upstream
diff --git a/package/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch b/package/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch
new file mode 100644
index 0000000000..f93abb1142
--- /dev/null
+++ b/package/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch
@@ -0,0 +1,17 @@
+fix select arg detection
+
+Reference:
+ https://bugs.gentoo.org/921487
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+--- a/autoconf_local/aclocal.m4
++++ b/autoconf_local/aclocal.m4
+@@ -4196,7 +4196,7 @@
+ #include <sys/select.h>
+ #endif
+ #include <sys/socket.h>	/* MG: always incl */
+-extern select ($ac_cv_func_select_arg1,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg5);],,dnl
++extern int select ($ac_cv_func_select_arg1,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg5);],,dnl
+         [ac_not_found=no ; break 3],ac_not_found=yes)
+       done
+      done
diff --git a/package/ncftp/0002-ncftp-3.2.7-fix-clang.patch b/package/ncftp/0002-ncftp-3.2.7-fix-clang.patch
new file mode 100644
index 0000000000..8a71fa3284
--- /dev/null
+++ b/package/ncftp/0002-ncftp-3.2.7-fix-clang.patch
@@ -0,0 +1,70 @@
+Fix compilation with clang-16
+
+aclocal.m4 contains code that no longer compiles: missing headers and missing
+return types.
+
+Reference:
+ https://gitweb.gentoo.org/repo/gentoo.git/tree/net-ftp/ncftp/files/ncftp-3.2.7-fix-clang.patch
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+--- a/autoconf_local/aclocal.m4
++++ b/autoconf_local/aclocal.m4
+@@ -3057,6 +3057,7 @@
+ #include <sys/uio.h>
+ #include <sys/socket.h>
+ #include <sys/un.h>
++#include <string.h>
+ ],[
+ struct sockaddr_un uaddr;
+ 
+@@ -3285,6 +3286,7 @@
+ #ifdef HAVE_RESOLV_H
+ #	include <resolv.h>
+ #endif
++#include <string.h>
+ ],[
+ 	/* function-body */
+ 	int len;
+@@ -3363,6 +3365,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ 		 
++			int
+ 			main(int argc, char **argv)
+ 			{
+ 				/* Note:  don't actually call readline,
+@@ -5145,6 +5148,7 @@
+ #ifdef HAVE_STDLIB_H
+ #	include <stdlib.h>
+ #endif
++#include <string.h>
+ 
+ #ifdef HAVE_NCURSES_H
+ #	define NCURSES_OPAQUE 0
+@@ -5176,6 +5180,7 @@
+ #endif
+ 
+  
++int
+ main(int argc, char **argv)
+ {
+ 	/* Note:  don't actually call curses, since it may block;
+@@ -6510,7 +6515,6 @@
+ #endif
+ #endif			/* MG */
+ 
+-int
+ int  main(void)
+ {
+ 	char *data, *data2, *data3;
+@@ -6607,8 +6611,9 @@
+ 	AC_CACHE_CHECK(whether setvbuf arguments are reversed,
+ 	  ac_cv_func_setvbuf_reversed,
+ 	[AC_TRY_RUN([#include <stdio.h>
++	$include <stdlib.h>
+ 	/* If setvbuf has the reversed format, exit 0. */
+-	main () {
++	int main (void) {
+ 	  /* This call has the arguments reversed.
+ 	     A reversed system may check and see that the address of main
+ 	     is not _IOLBF, _IONBF, or _IOFBF, and return nonzero.  */
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
