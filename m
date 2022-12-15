Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E0DC4332F
	for <buildroot@archiver.kernel.org>; Thu, 15 Dec 2022 10:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E773560BE7;
	Thu, 15 Dec 2022 10:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E773560BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j_oGfOCPD0Gj; Thu, 15 Dec 2022 10:07:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40B1560BCA;
	Thu, 15 Dec 2022 10:07:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40B1560BCA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10A201BF360
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 10:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF168418DD
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 10:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF168418DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TWrci3cQYceH for <buildroot@lists.busybox.net>;
 Thu, 15 Dec 2022 10:06:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55770418D0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55770418D0
 for <buildroot@buildroot.org>; Thu, 15 Dec 2022 10:06:53 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id bx10so2549963wrb.0
 for <buildroot@buildroot.org>; Thu, 15 Dec 2022 02:06:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J7Jz5o7OOmTh9tKVd4n6wEYR/x9vjGaqjCQr173M9og=;
 b=VNh2N9cPnYlB03DS7JGVuY2mQUG2sotUXxHg6MleXaSWz1Kecn90fVw/16m4NbjgPE
 2RdT1UnLnUu/IMEhekg4SFm1uTnTcIVXUM5SfcvG/dm9mQjyMNAqJtFMS+Mu5yWVz3UE
 /4uBHdQ73WjrFUzNsTxg3UaAwwMNAwPyYcpVblVZDh2/LmETLbogG0JIFiR7mj+pWiqE
 2YGj+EqlpTapATi8Y05RCkGxOdrmM+vL+vJ3BCKQXtql7TI55jDZnc69gtqR7vMi8neR
 4ed8msrhQ/FpVpCn3yafKF35zJDu2lqu+S/9ialTMyAo1Y9JsKA32ZgQh/Tlzj69qNYD
 afYQ==
X-Gm-Message-State: ANoB5plYFOb0if43zASMlYva+tQiSBewweQkVcfLCfPwSE1Q3rtFd8kB
 881FR9KL1LEwFYvsPOBeumyc6RHCo+bUos6I
X-Google-Smtp-Source: AA0mqf7vasQHJRptZkUU4z5uZgTj/iJb4Hp08WZyM1Qj8VoISR7pY9iuS89FGEMl88SL+/TNAMTRWA==
X-Received: by 2002:a5d:4e04:0:b0:242:4f41:2efc with SMTP id
 p4-20020a5d4e04000000b002424f412efcmr27977591wrt.35.1671098811292; 
 Thu, 15 Dec 2022 02:06:51 -0800 (PST)
Received: from debian.barco.com (d528f5fd5.static.telenet.be. [82.143.95.213])
 by smtp.gmail.com with ESMTPSA id
 by10-20020a056000098a00b002368f6b56desm6827388wrb.18.2022.12.15.02.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 02:06:50 -0800 (PST)
From: Dennis Van Hoorick <dennis.van.hoorick@gmail.com>
X-Google-Original-From: Dennis Van Hoorick <dennis.vanhoorick@barco.com>
To: buildroot@buildroot.org
Date: Thu, 15 Dec 2022 11:06:36 +0100
Message-Id: <20221215100636.930-2-dennis.vanhoorick@barco.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221215100636.930-1-dennis.vanhoorick@barco.com>
References: <20221215100636.930-1-dennis.vanhoorick@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J7Jz5o7OOmTh9tKVd4n6wEYR/x9vjGaqjCQr173M9og=;
 b=AU/UpNb9iEMPrClWmJX4xwqZ4OZKbeswvd5EgcAxWzigcKvbSRu22qv1s+dnaE1bEP
 OE7KuId9TQhCjcOO4ypIxc6ZDoNy435cgPrLUM98OLzN3VIinxTCkN85+SmT4pRWFlTP
 bZts74o7M4ru2zeXPCtHSGoa1sN+8jcvyzoI4BhcPdwNu1MEELdP4+mUp4rzmjMyt2zT
 P0cVDb/+XxqAS6d75aOgUl6gj1/lwFiLTLzAbGE33yI/HQAhXHlMgNyXACkJd0nAoi+3
 EpmM6jlfL/zQZ/hAgZh6HKLNv1i4gfigS8Cn/BNd1fCwwqXT8PDcsNdFSL+LkmW6ewkO
 wQYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AU/UpNb9
Subject: [Buildroot] [PATCH 2/2] package/ncurses: ignore CVE-2022-29458
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
Cc: Dennis Van Hoorick <dennis.vanhoorick@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixed in patch 20220416

Signed-off-by: Dennis Van Hoorick <dennis.vanhoorick@barco.com>
---
 package/ncurses/ncurses.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 79593d8084..4d93a992e4 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -12,6 +12,8 @@ NCURSES_LICENSE = MIT with advertising clause
 NCURSES_LICENSE_FILES = COPYING
 NCURSES_CPE_ID_VENDOR = gnu
 NCURSES_CONFIG_SCRIPTS = ncurses$(NCURSES_LIB_SUFFIX)6-config
+# patch 20220416
+NCURSES_IGNORE_CVES += CVE-2022-29458
 NCURSES_PATCH = \
 	$(addprefix https://invisible-mirror.net/archives/ncurses/$(NCURSES_VERSION)/, \
 		ncurses-6.3-20211026.patch.gz \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
