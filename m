Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E782C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 17:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4637403C8;
	Mon, 12 Dec 2022 17:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4637403C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h4iMt7edN8el; Mon, 12 Dec 2022 17:26:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D91B440165;
	Mon, 12 Dec 2022 17:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D91B440165
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6617A1BF2AB
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 17:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FF9E40357
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 17:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FF9E40357
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oU9040VAn5dl for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 17:26:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B171F4034E
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B171F4034E
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 17:26:19 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 r7-20020a1c4407000000b003d1e906ca23so4638044wma.3
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 09:26:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OHzDlU5OXtX4B7EE1sf0Mxrdf+3hl3d5ghSE5jmGP20=;
 b=q7H6IXKDydpOxdyT1A+vKmHDVYNChItczhN1weYorFtVep0GMNMq42cOhahqM48Ewe
 9S7PUgbYOJABld1bHVVN9zn129WgjuPzolxZBN0bl45UBCNiqQncoHHMzYgdrCYYOHgC
 AaIKjEVssefFyzcvrEx6whcCA8xgL4nYhfzd0PA7P7XRmBDVAvKP6bYzy++XdETQJx0t
 zHq7bZYKl1QsA3e2bH+bGGKPaE5167bS9IICjoxgoAa3ZJcxhDYy9No697uhlN/T8GH9
 FQtmduDMN3vRH59MpUOxUat5YWTQF32g1pX6x4wxR77Hm69q2nIfgsKGnH1n3Uq1lzX9
 79jw==
X-Gm-Message-State: ANoB5pkwPuvoKV2iyunF3LoHc7tU6mA+NKVYL7cpHj0VHfqrIHiIpHN5
 +4xbyV+YMEVRI4VCWrvdWD1TrftIw1A=
X-Google-Smtp-Source: AA0mqf7WgEEVHGCMOHwzufv7zm+Irg/7PPnKRiBQpJv19PFhPfAMQZftdxcSmmP156tMf2EQ/r1NsA==
X-Received: by 2002:a05:600c:539a:b0:3cf:8957:806e with SMTP id
 hg26-20020a05600c539a00b003cf8957806emr13592240wmb.5.1670865977367; 
 Mon, 12 Dec 2022 09:26:17 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 18-20020a05600c22d200b003c6bd12ac27sm9875214wmg.37.2022.12.12.09.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 09:26:16 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 18:26:10 +0100
Message-Id: <20221212172610.3908-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OHzDlU5OXtX4B7EE1sf0Mxrdf+3hl3d5ghSE5jmGP20=;
 b=JgrBkslnRTu/bYHbgIZXVNeqSTbxzt8m017Nc4/BqxM0ZDcNI9ZCtIDHcaMWMjC6pp
 BtK6FEVsh91e2Y9U3pAgfe+sMEjRjOcUW4LtABBWmph8xwljC6Xz1gEJnr1X1fKJ5w4/
 kLsS1M4q1oR6qjggJS68parkkdBcyhRVHLRNCrt3VJNS+rgY8F2Qr1GV3h0UMFwPrlLX
 oaARQyhIQBHCPJftk4EciM075AQ1lIKTvGGZPxRomAObBGj9FqVAjgUcdaMU82K3SxLH
 +pzG3T0avYtDESjuDBSpEEZBXDqdwEJ36lkvECsTqBspL8lXfkAJFMkqbEIjAYlVOCzh
 0zMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JgrBksln
Subject: [Buildroot] [PATCH 1/1] package/davfs2: needs glibc
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

davfs2 unconditionally uses fstab.h since
https://git.savannah.nongnu.org/cgit/davfs2.git/commit/?id=6e2053cd7f44b0ca58af09905c044c178df34497
resulting in the following build failure since bump to version 1.7.0 in
commit 76423bd3a657f0ca197e2301bbb21e4fc9eee992:

mount_davfs.c:78:10: fatal error: fstab.h: No such file or directory
   78 | #include <fstab.h>
      |          ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/793c71e4f731a18e203d6eaa3ac8b6e2a9620c27

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/davfs2/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/davfs2/Config.in b/package/davfs2/Config.in
index 162753be3e..31a680563c 100644
--- a/package/davfs2/Config.in
+++ b/package/davfs2/Config.in
@@ -1,10 +1,10 @@
-comment "davfs2 needs a glibc or uClibc toolchain"
+comment "davfs2 needs a glibc toolchain"
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_DAVFS2
 	bool "davfs2"
-	depends on !BR2_TOOLCHAIN_USES_MUSL # error.h
+	depends on BR2_TOOLCHAIN_USES_GLIBC # fstab.h
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NEON
 	select BR2_PACKAGE_NEON_XML
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
