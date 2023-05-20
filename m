Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BCCC77B7C
	for <buildroot@archiver.kernel.org>; Sat, 20 May 2023 21:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1B7160B8D;
	Sat, 20 May 2023 21:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1B7160B8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H3eyefW5jS8b; Sat, 20 May 2023 21:13:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 183E460B65;
	Sat, 20 May 2023 21:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 183E460B65
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4981E1BF3E9
 for <buildroot@lists.busybox.net>; Sat, 20 May 2023 21:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FA9F40143
 for <buildroot@lists.busybox.net>; Sat, 20 May 2023 21:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FA9F40143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fsXypxlRIBej for <buildroot@lists.busybox.net>;
 Sat, 20 May 2023 21:13:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 344CA40017
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 344CA40017
 for <buildroot@buildroot.org>; Sat, 20 May 2023 21:13:03 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-96f50e26b8bso484381666b.2
 for <buildroot@buildroot.org>; Sat, 20 May 2023 14:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684617181; x=1687209181;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FvgImuZGTp+0M095c0cGfaCidmA3jbNdHalDGqBwTok=;
 b=OaZNVHGikkTMmMMLZEwExe4PldPx4PtkWi6r5K93IPhKtRqrrz79GMWxBoy7j0yQS+
 BNADFp9cdAt/2Zetiv/Ka14fcL+VXz62CqFhf/l6s2tlwq/YWn+HgdLteTBc3HP5Kq7n
 Rd1dlqnEQS0ii8d3Jc/Rd/QMA7WyT0/GA9z+WyC7lgu9GHBDB9SIIbzKF5ZsrvvF+AMU
 DfH3KuWGaAyCjW/FF+Yzg6X4H/D9Hkgo9S7PaEMeHFXq7+0qTpDLLFopNWCMVPPTwWhQ
 EVfcDKFYaUF4bVK5lhmXyHabyqD5fXUaeEpezk4N3SMAwHj+VeOtF15sGUZA7eDDx6Tf
 0ybg==
X-Gm-Message-State: AC+VfDxX+Jzf5kshat20wDdBKRoym5cB43GZJ5rNyRmF4TeOdXQ+Gncu
 k0qRl81aAdRrQv7Bm1qN4HF6Bfl2SNyjWpKMd4VaIw==
X-Google-Smtp-Source: ACHHUZ5EYl56jYabe5uv8QlCiEssqog6w597F5AjrjACbO8OZ6PD5w2mF8OhxpVir/tqgzX6j1514A==
X-Received: by 2002:a17:907:7f12:b0:96f:a0ee:1143 with SMTP id
 qf18-20020a1709077f1200b0096fa0ee1143mr2685083ejc.10.1684617180724; 
 Sat, 20 May 2023 14:13:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-40-97-5.business.telecomitalia.it. [79.40.97.5])
 by smtp.gmail.com with ESMTPSA id
 qp24-20020a170907207800b00959b3c30f2csm1156185ejb.222.2023.05.20.14.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 14:13:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 20 May 2023 23:12:46 +0200
Message-Id: <20230520211246.3950131-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1684617181; x=1687209181;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FvgImuZGTp+0M095c0cGfaCidmA3jbNdHalDGqBwTok=;
 b=I/KOZ7oUmmE2YKy/ZvLgv27rT7d/fuRp+A5rykZ08XUAM/7HR55qvjZZhNf/mszuTr
 xCWeilKhpwgIOHIzNC+cKQ6bHYue3rNadBQsTiL+wU7AzrAHPhmq4AJeCblgofnPyWHv
 d72rcmBQVV2rz3Germ5KnGzULkGEJLiFND1w0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=I/KOZ7oU
Subject: [Buildroot] [PATCH 1/1] package/ethtool: fix build failure
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
Cc: dario.binacchi@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When I was fixing a build failure for the libmnl package ([1]), I got
this error for the ethtool compilation:

netlink/rss.c: In function 'rss_reply_cb':
netlink/rss.c:166:3: error: 'for' loop initial declarations are only allowed in C99 mode
   for (unsigned int i = 0; i < get_count(hash_funcs); i++) {
   ^
netlink/rss.c:166:3: note: use option -std=c99 or -std=gnu99 to compile your code

[1] http://autobuild.buildroot.net/results/15f6dc103eec7bdeb5020acbc0ae99dc97c00e4e
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/ethtool/ethtool.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index a35e274bc442..c72d59be3767 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -20,4 +20,6 @@ else
 ETHTOOL_CONF_OPTS += --disable-netlink
 endif
 
+ETHTOOL_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
+
 $(eval $(autotools-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
