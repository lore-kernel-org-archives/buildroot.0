Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F530EB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 13:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ADFD81A39;
	Mon, 10 Jul 2023 13:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ADFD81A39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id stUN4dpPHoEr; Mon, 10 Jul 2023 13:58:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2773481CAD;
	Mon, 10 Jul 2023 13:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2773481CAD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F18F31BF418
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 13:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4887415D9
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 13:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4887415D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A7D9fujPGI2Q for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 13:58:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A15F4415C8
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A15F4415C8
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 13:58:05 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id
 d9443c01a7336-1b8bd586086so34197715ad.2
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 06:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688997484; x=1691589484;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ru+4Q+KqKw+zACMeFPqlANbbWNPd9EgTrEdIwO8jWec=;
 b=BAODQvQM5KmuK+ShUoytdzMzlW8SW+PLt5cUqhzeOwRhPG7CGEeAQ9KDVyjzCFD3TB
 PXy8uvDhfbrYK/FysoUtus5iiEUucstsiHP7m78BjUMIQ2moUjZ56lMgSYr8xtvwBqrd
 Dej1tJL27gDHtA0HRCYrwQcMqZrr+rtZ2rePB0glpZwiR+XmLu5v5gnN6cheO1wTghlk
 wQ0+C4RE8/EKt7GqG3xItrzYYDj6D+a4Yv/cojwIvl3mRkEMh60hSWtsQgt40qsrtfmr
 Izt2MyePCNZXUuYl5rdceVYoNoEmd3GH8zCglfYjc/HtKPDj+/PX5Gze/X0/G/6P0QdS
 am0A==
X-Gm-Message-State: ABy/qLYfTOYcNNyzrwJinI7muYvsnIFKnuAyn04IZ4z2mCL9i3HNxr5C
 pB5aUN9ZhOUvlkCt4TUeIvRR8KUfC4TTNE6VrIo=
X-Google-Smtp-Source: APBJJlGb0L6cBg5EPxS2IyOKN3OPtHG5NhuUksN+BEueG1Okx6cbFPFhoGcfOsjTLZOXVQmpcn5k4Q==
X-Received: by 2002:a17:903:41c6:b0:1b2:1a79:147d with SMTP id
 u6-20020a17090341c600b001b21a79147dmr16959865ple.2.1688997484499; 
 Mon, 10 Jul 2023 06:58:04 -0700 (PDT)
Received: from smartcross-dev.lan ([154.17.18.109])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a170902a38900b001b02bd00c61sm8500807pla.237.2023.07.10.06.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 06:58:04 -0700 (PDT)
From: t123yh.xyz@gmail.com
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 21:57:52 +0800
Message-Id: <20230710135752.1849099-1-t123yh.xyz@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688997484; x=1691589484;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ru+4Q+KqKw+zACMeFPqlANbbWNPd9EgTrEdIwO8jWec=;
 b=rVn0QBjO66q3uETdgg7oPRE7D21NxPlToE4AdKaLvPNL+1nJASAbVwdyqKKU8IhRCt
 Tfs9DaALvsWAR/oZyuALU0o/oanxhLxuDiwTl6HQPGp8frN8xVIYqI0Iu8gXyuwu4QHO
 DUwkEWrCqc02GQ2BXY+cPBISR9gv2bC0xRg8mNO8jsuvsPpUbIfOvFhd97RAhQTkQgvq
 r81MZwJNOSIhUjEts5+Ex8T2vwyOP7RAefCta+qB/DhQiQNUubpO3+c1bvfxezwoXKTH
 il13dH+NEckYlR8NO9AT1L9LXbczrcjKcXTbuM/TFrFZjnbw9oHnTZWO19Qf6eCm1F/7
 e9VA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=rVn0QBjO
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: fix AC_CHECK_FILE
 error
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
Cc: Yunhao Tian <t123yh.xyz@gmail.com>, Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yunhao Tian <t123yh.xyz@gmail.com>

Commit [1] in bluez5 introuduces AC_CHECK_FILE against ell library,
which produces the following error when configuring:

  checking for ./ell/ell.h... configure: error: cannot check for file
  existence when cross compiling

As this check is not critical in our use case, this patch removes the
relevant lines in configure.ac and configure to prevent errors.

[1]:
https://github.com/bluez/bluez/commit/1106b28be85ac9586d1758839226e163e9030ee2

Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
---
 .../0001-remove-ell-ac-check-file.patch       | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 package/bluez5_utils/0001-remove-ell-ac-check-file.patch

diff --git a/package/bluez5_utils/0001-remove-ell-ac-check-file.patch b/package/bluez5_utils/0001-remove-ell-ac-check-file.patch
new file mode 100644
index 0000000000..32831cf923
--- /dev/null
+++ b/package/bluez5_utils/0001-remove-ell-ac-check-file.patch
@@ -0,0 +1,86 @@
+From 56de22f93ed738aab11c5e75d26259462ea13faa Mon Sep 17 00:00:00 2001
+From: Yunhao Tian <t123yh.xyz@gmail.com>
+Date: Mon, 10 Jul 2023 21:46:28 +0800
+Subject: [PATCH 1/1] configure: remove check ell path
+                                           
+This breaks configure when cross-compiling, so remove it
+                                           
+Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
+Upstream: N/A not fixed yet
+
+diff -ur bbb/configure bluez5_utils-5.68/configure
+--- bbb/configure	2023-07-10 21:33:33.829161104 +0800
++++ bluez5_utils-5.68/configure	2023-07-10 21:33:47.961142717 +0800
+@@ -15959,57 +15959,6 @@
+ 
+ 
+ fi
+-if (test "${enable_external_ell}" != "yes"); then
+-	as_ac_File=`printf "%s\n" "ac_cv_file_${srcdir}/ell/ell.h" | $as_tr_sh`
+-{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for ${srcdir}/ell/ell.h" >&5
+-printf %s "checking for ${srcdir}/ell/ell.h... " >&6; }
+-if eval test \${$as_ac_File+y}
+-then :
+-  printf %s "(cached) " >&6
+-else $as_nop
+-  test "$cross_compiling" = yes &&
+-  as_fn_error $? "cannot check for file existence when cross compiling" "$LINENO" 5
+-if test -r "${srcdir}/ell/ell.h"; then
+-  eval "$as_ac_File=yes"
+-else
+-  eval "$as_ac_File=no"
+-fi
+-fi
+-eval ac_res=\$$as_ac_File
+-	       { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_res" >&5
+-printf "%s\n" "$ac_res" >&6; }
+-if eval test \"x\$"$as_ac_File"\" = x"yes"
+-then :
+-  dummy=yes
+-else $as_nop
+-  as_ac_File=`printf "%s\n" "ac_cv_file_${srcdir}/../ell/ell/ell.h" | $as_tr_sh`
+-{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for ${srcdir}/../ell/ell/ell.h" >&5
+-printf %s "checking for ${srcdir}/../ell/ell/ell.h... " >&6; }
+-if eval test \${$as_ac_File+y}
+-then :
+-  printf %s "(cached) " >&6
+-else $as_nop
+-  test "$cross_compiling" = yes &&
+-  as_fn_error $? "cannot check for file existence when cross compiling" "$LINENO" 5
+-if test -r "${srcdir}/../ell/ell/ell.h"; then
+-  eval "$as_ac_File=yes"
+-else
+-  eval "$as_ac_File=no"
+-fi
+-fi
+-eval ac_res=\$$as_ac_File
+-	       { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_res" >&5
+-printf "%s\n" "$ac_res" >&6; }
+-if eval test \"x\$"$as_ac_File"\" = x"yes"
+-then :
+-  dummy=yes
+-else $as_nop
+-  as_fn_error $? "ELL source is required or use --enable-external-ell" "$LINENO" 5
+-fi
+-
+-fi
+-
+-fi
+  if test "${enable_external_ell}" = "yes" ||
+ 				(test "${enable_btpclient}" != "yes" &&
+ 						test "${enable_mesh}" != "yes"); then
+diff -ur bbb/configure.ac bluez5_utils-5.68/configure.ac
+--- bbb/configure.ac	2023-07-10 21:33:33.829161104 +0800
++++ bluez5_utils-5.68/configure.ac	2023-07-10 21:33:55.465132962 +0800
+@@ -297,11 +297,6 @@
+ 	AC_SUBST(ELL_CFLAGS)
+ 	AC_SUBST(ELL_LIBS)
+ fi
+-if (test "${enable_external_ell}" != "yes"); then
+-	AC_CHECK_FILE(${srcdir}/ell/ell.h, dummy=yes,
+-			AC_CHECK_FILE(${srcdir}/../ell/ell/ell.h, dummy=yes,
+-				AC_MSG_ERROR(ELL source is required or use --enable-external-ell)))
+-fi
+ AM_CONDITIONAL(EXTERNAL_ELL, test "${enable_external_ell}" = "yes" ||
+ 				(test "${enable_btpclient}" != "yes" &&
+ 						test "${enable_mesh}" != "yes"))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
