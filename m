Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A73C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 09:30:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C11A760F6D
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 09:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C11A760F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D69C8330B;
	Sat,  9 Oct 2021 09:30:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id stBtU0Do9Hpw; Sat,  9 Oct 2021 09:30:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05CEE8333E;
	Sat,  9 Oct 2021 09:30:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 030E21BF27A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 09:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E723940634
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 09:29:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hRGbTxHQpGdc for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 09:29:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4562940624
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 09:29:55 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id j21so31537558lfe.0
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 02:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rp5LlWPTu2C1+lPvpSBFWuSSV1f9LpuTiq6yJwCaGRg=;
 b=Ac/wWIYnf6AtgKasrdqz5SfB4yBZTgOx9FD6NLnlN0VshMhBp5Z/HeOpYTaj5oIC2Q
 gE9Jo4B5GpPVR/X7ADplos8PvR3JCs/Fm7ELIyJFf3X6QRsRbTs1dYncQpsFQ2eUD5fv
 heu7w6n1xDmYPDWJo/9iFpLZGA7j+ROjJH+gdyuAOXUsb4VdNUGekb13pzKz4hvzbocb
 fB+TBoPuHGCrULA+MuhIE7jgIaW77vToujxhUn5ZDOX6wjt/Rb7M7cp9L2H9pItxlcqc
 RPZa5En8W0VIwEgXvSr7P5Osd3qQ5zOaEED3nGJpiwYiwP9q5p+VC26683OzhjHlUQQM
 0AOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rp5LlWPTu2C1+lPvpSBFWuSSV1f9LpuTiq6yJwCaGRg=;
 b=4GubNgfolhHquzTEIH9xDkA8HX2x7dnZKhtExVkGJ7PwIMfgDbSdCulbBfYCFqhQcm
 JnswBlfFlfpipcCm8pM0Qb4i0pbRg5hBaslvtV0j59ik62iAngIySZxBiy3ry0j1io8x
 wwJxpWlBGUiTGyYbOQw/Sn/a1t1O+Wy/8kU6dY7wP+iq/ESz9ULU3Bo6Ir5GLZEJoBc4
 K616OE2H9LAubyZrf8xQEM+Q9l5lT85umjGESPijcZfll9a+LBKA64Kazo9oj1OYSMdY
 toSh2+eMLyeCCoQCw6+cfDUo3ZQ6ad34ylkSE9pB/yYscDsyXfMA33fe2q3RPptbbRSa
 APYA==
X-Gm-Message-State: AOAM533j9YHAFKGk3Z3uOhrYYaGR6GSFl1Elt0tCIxwt1V+NGOtMK6BN
 TRlu7+9ALR2j+se2ABufwsmhIV1vcYg=
X-Google-Smtp-Source: ABdhPJwzmjt9U+r80NLS47Eyfw8VZ31xcExRKOE56ccsE8nfo/06gNtK6rr63H0/1uI3zONAr6ms9A==
X-Received: by 2002:a05:6512:33c9:: with SMTP id
 d9mr15264984lfg.18.1633771792943; 
 Sat, 09 Oct 2021 02:29:52 -0700 (PDT)
Received: from localhost.localdomain ([94.254.51.197])
 by smtp.gmail.com with ESMTPSA id g5sm170026ljm.74.2021.10.09.02.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 02:29:52 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 11:28:58 +0200
Message-Id: <20211009092858.89370-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211009092858.89370-1-troglobit@gmail.com>
References: <20211009092858.89370-1-troglobit@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: adopt package/libite
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since I'm the upstream maintainer and we use it for $DAYJOB, I'll adopt.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6dc2e68e42..7ebfc9234b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1330,6 +1330,7 @@ F:	package/rtty/
 N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
 F:	board/globalscale/espressobin/
+F:	package/libite/
 F:	package/mg/
 F:	package/netcalc/
 F:	package/ssdp-responder/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
