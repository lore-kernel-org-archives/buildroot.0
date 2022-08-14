Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA109C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DDCF405BF;
	Sun, 14 Aug 2022 23:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DDCF405BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zTLn-Y1uRCq5; Sun, 14 Aug 2022 23:41:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DF00405CF;
	Sun, 14 Aug 2022 23:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DF00405CF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DACC01BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5BFA81C38
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5BFA81C38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L_YZkK_LVwlL for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:39:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBF9581BF5
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBF9581BF5
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:39:37 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id 67so5857937vsv.2
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=yxUcUPUHmJV0mHRCs0zydb8vX0VSk4G3jJauv0rscz4=;
 b=lLOHN/8qM/fneAbAOAxlnA/lZguSstIP/Rn3H1cDnA6z5mqC6rVaCYwMAAeoikX5nT
 WRbVtGmJVviNLXrgTQG2/1oGvvUwzTPi6uSrdOIUS6iNU1wJBjt4cor1MWw1+OpNXyvb
 T1AjA1VKVWHpETvXJpk6rHj1MvKG8LySBu1RLsBwPRJEw5X+AHycnhIFgmrSp3ykMzcZ
 0cstiFVfqGMAdJN1EG4X1jjnnbOZCekY+9DO1G9HaK5umx/1CN2ZxwUS3u9F3QVq6XJ5
 f+O8HFPnexFJFD41cuEM+SnTtgRwa1Q/gclTRQKAkzZPTC/GcNL0m+034b5NJnknsqDx
 fjbQ==
X-Gm-Message-State: ACgBeo2caWZlp2UMJpU205ScdcPLTKdChQiNcF/hCGW9gwLwbjxrI7No
 D5bU1/qfCtSORKG6g5chDccvED0WKS4=
X-Google-Smtp-Source: AA6agR7isoAIc6RJoTPo3AFsrJGFoP6Jw4Xozkxah7l/tHZztF278ZnUsXSjeyZVsm+hMAEEl1cUNQ==
X-Received: by 2002:a67:b84f:0:b0:388:cbb3:25af with SMTP id
 o15-20020a67b84f000000b00388cbb325afmr5104288vsh.52.1660520376800; 
 Sun, 14 Aug 2022 16:39:36 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:39:35 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:20 -0300
Message-Id: <20220814233845.2247022-9-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=yxUcUPUHmJV0mHRCs0zydb8vX0VSk4G3jJauv0rscz4=;
 b=Ex+YSshliOjjkKaFxL9HqxTkSMLqmf/mU58W6e2q4oOShh7usuzH46xkIpJojrrBI2
 0ygpuGKO1Tyay/p4TNykEC8KKpvrrvBl6qjDMM/fwEFR2QFqhPkL3HqewM5/eeldNDV8
 b244mhDJq9rX5t7hiWbtWBL7c7IagIjPH7dh0fr1fQpf92sC95XaWf7TsFoXxVeUvFnU
 jfxjZP/OVMR+fwiyC6kVgmpg0dQw6rOJXL/ccksHOnNoWywEF5BeMdszQH7CCii3OSn8
 CKo0uWEyz8rcwghFwBphvBTaGvp1R2D8+KNa/B2dRGSBWtenuVtxJWEsrlZ19SPqTr+S
 reCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ex+YSshl
Subject: [Buildroot] [PATCH 08/33] package/libvncserver: fix typo on
 BR2_nios2
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From time to time we have a reference added to the inexistent BR2_nios:
$ git log --oneline -G'BR2_nios\>'
726dcc6eee package/libvncserver: needs dynamic library
8cd840b7e8 package/ffmpeg: fix typo "nios" -> "nios2"
bd2544d3d3 package/ffmpeg: simplify BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS logic
de7523259b libplayer: fix typo on BR2_nios2
615d65d3c6 mplayer: add missing reverse dependencies for nios2 and sh2a

Fix the last commit, from 2019, like it was done before.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/libvncserver/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvncserver/Config.in b/package/libvncserver/Config.in
index 6189b379d2..f284894555 100644
--- a/package/libvncserver/Config.in
+++ b/package/libvncserver/Config.in
@@ -27,5 +27,5 @@ endif
 
 comment "libvncserver needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_nios
+	depends on !BR2_nios2
 	depends on BR2_STATIC_LIBS
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
