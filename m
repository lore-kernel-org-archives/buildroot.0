Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EB5C76196
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 20:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E19882279;
	Tue, 11 Apr 2023 20:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E19882279
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WAwutBg_wMx0; Tue, 11 Apr 2023 20:31:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3536D82276;
	Tue, 11 Apr 2023 20:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3536D82276
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2995D1C3C71
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 20:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1053A41CF0
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 20:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1053A41CF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uSJsPqSkxrWO for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 20:31:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB567400C4
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB567400C4
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 20:31:16 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id o18so8819651wro.12
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 13:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681245075;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rbQFaiEScVp9Xrk20zkczzf70WAE1RwkwZ6STXFlhx0=;
 b=IedZS6+kXhjXTx8DCkJxPQ7/CUeabHwcZkIx807J2DjVnunJ3LJxLwgvyP8/BpQiSW
 tiXIp7TRJbTdvqzzYI4naIoFZovls1PSdvi/J6vW4zipGoseDcDhfUZGdox+yy3GBl46
 RMg8T9wwaSmFEzpXF2+JK1EGKAJBRIuLjwvcrjzhHI9xFbIxFWtSK7GoEvnTzHz+eUX6
 aPlEb+D9v3/6bH3pS/WSfHd5PHd77+Dv0cE4ejlngWiEF4frQCCZetcvyildmB4A7KJD
 dOZBuxl4k/IpcMfYBjGzTiut3R/+Ae4D+EDmUdNwXrK/vgFSzs42jOxF5U16mneuDe3J
 pSaw==
X-Gm-Message-State: AAQBX9fGkhskYcKsQFGS4z495Y7gw5kL07tkebnX4SWTU5hbxD97PnIg
 7a84Kxc0/xK7gLJ8VsQ8yS2lmi9z+CM=
X-Google-Smtp-Source: AKy350aCrVL+WABDtU/OeT/GcnRaCqmFfvYJ998WUFKNoO9+me+NgVxXnf3YfaXHynGjVQf+4VDE1A==
X-Received: by 2002:adf:f20b:0:b0:2d1:e517:4992 with SMTP id
 p11-20020adff20b000000b002d1e5174992mr2700192wro.69.1681245074767; 
 Tue, 11 Apr 2023 13:31:14 -0700 (PDT)
Received: from localhost.localdomain (1-1-22-171.ftth.cust.kwaoo.net.
 [171.22.1.1]) by smtp.gmail.com with ESMTPSA id
 c5-20020a5d4cc5000000b002f2794a6ee6sm4669733wrt.112.2023.04.11.13.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 13:31:14 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 11 Apr 2023 22:31:13 +0200
Message-Id: <20230411203113.1573787-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681245075;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=rbQFaiEScVp9Xrk20zkczzf70WAE1RwkwZ6STXFlhx0=;
 b=NyxzMz+R+u775Q04fipvLY6tJ4egOWOWKwuV0a/97EaRFRIbQL52QKercbCzchOnBH
 6Xusm8Sm/o+wA06POlNaAOWv3fJbOiJ30S5xQvKtZXeNmBQEaKI+VOdMQv6Ku96FsZh2
 bMtOBpt1gLkd+46yg9c+MB9zf8V8cImYTcF9bHS/sWD4SW3uXOiwYr9zt6yAllGc7UgJ
 3THYX8gkGb9BfIzV3AdC61XFci1FIMQAJOd51+hOV7uSP/W6fQsyMdnLDM5JCWYeNXU5
 fOHjxZ/zLQnsxetLJBwyZYG5fXlR6T+d4XYHB20VtQeM/C9PiFQMswWbNTuDHVNi2n24
 AUfA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=NyxzMz+R
Subject: [Buildroot] [PATCH] package/localedef: fix fallout after bump to
 glibc 2.37
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>,
 Romain Naour <romain.naour@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit a379499f7334 (package/glibc: bump to version 2.37) forgot to
update the pach for localedef.

There is no version check for 'as' now, so drop the related hunk.

Fixes: a379499f7334c2a68d375b1cf9dc35cd59884181

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@smile.fr>
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
---
 ...dency-on-GCC-to-4.8-and-binutils-to-2.24.patch | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
index 297c96cc5e..94fccfa856 100644
--- a/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
+++ b/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
@@ -24,6 +24,8 @@ GCC 6.2+
  https://sourceware.org/git/?p=glibc.git;a=commit;h=4dcbbc3b28aaeafe23e1a30db84055aa6f6fa987
 
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+[yann.morin.1998@free.fr: update for 2.37]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 ---
  configure | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
@@ -32,16 +34,7 @@ diff --git a/configure b/configure
 index 9619c10991..0c481d2339 100755
 --- a/configure
 +++ b/configure
-@@ -4651,7 +4651,7 @@ $as_echo_n "checking version of $AS... " >&6; }
-   ac_prog_version=`$AS --version 2>&1 | sed -n 's/^.*GNU assembler.* \([0-9]*\.[0-9.]*\).*$/\1/p'`
-   case $ac_prog_version in
-     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
--    2.1[0-9][0-9]*|2.2[5-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
-+    2.1[0-9][0-9]*|2.2[4-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
-        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
-     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
- 
-@@ -4781,7 +4781,7 @@ $as_echo_n "checking version of $LD... " >&6; }
+@@ -4178,7 +4178,7 @@ $as_echo_n "checking version of $LD... " >&6; }
    ac_prog_version=`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
    case $ac_prog_version in
      '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
@@ -50,7 +43,7 @@ index 9619c10991..0c481d2339 100755
         ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
      *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
  
-@@ -5189,7 +5189,7 @@ int
+@@ -4589,7 +4589,7 @@ int
  main ()
  {
  
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
