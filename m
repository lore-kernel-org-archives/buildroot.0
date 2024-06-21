Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E17EC27C4F
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 09:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D289E42DFC;
	Fri, 21 Jun 2024 09:10:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kb_zE84asThs; Fri, 21 Jun 2024 09:10:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3F3A42E2B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3F3A42E2B;
	Fri, 21 Jun 2024 09:10:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40DEF1BF330
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 09:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39DD242E2B
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 09:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3UsxG2Et1Xv for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 09:10:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B3BDA42DFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3BDA42DFC
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3BDA42DFC
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 09:10:17 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-363bbd51050so1307939f8f.0
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 02:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718961015; x=1719565815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zq2wuo56onItQgyK4DmbpDVjHBttb5djXLlFwWQSnUo=;
 b=OVrqIjea+qqZqbv9rJ4eBUGSkHMkdM7qUw5mu86yQVmzkuvm5+UEUdHzassluM8D/R
 3S1wQ5x2aZPBeUC+qGix0ADll5YT/Ij+AcBN/ZuIRN4f9AwLsMBVL3E5RQm6OYWUQc0g
 EyigkCyBy39fdNCReSuXRnGypHYD1Po6hXkWkEBInycXfllaa7NZVRmUD6iyyfWaqUeU
 zuqiRlmxJELks4phrthNY2lL+FXDsw5rPrHKFBOdgN6WMrWtEgEKAKsyWdJXwx+/sk/S
 zURgKf9OT8PCKMMpfYZn8NQdNMmgmWBhPegKcBubbZdd3n7t6y6N7QQyxB2lNkjerTRR
 BW6w==
X-Gm-Message-State: AOJu0YxTVKer/E9foMwGjj1hc7vbtI/RQY+c6rzNGUthgxJDStxdjJaB
 ScIc3VDp4kWRKRm3GOqU1Fm35uv55L6Kp9oXWDyvnL0noqBEhopHwR5KZfYAMisxUJWLpsfoQqj
 p
X-Google-Smtp-Source: AGHT+IG93mXIsAWCpro6yqhyF861JQyg1vYr6pOQxXYAKZeRYM5x6o72MvWWqS+RzgUhV91cJED6jw==
X-Received: by 2002:a5d:464a:0:b0:361:1ef2:a273 with SMTP id
 ffacd0b85a97d-363171e2bfdmr5757529f8f.13.1718961015017; 
 Fri, 21 Jun 2024 02:10:15 -0700 (PDT)
Received: from arnoutx1.berchem.byteflies.com
 (213.211.177.222.static.edpnet.net. [213.211.177.222])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36638d9c158sm1140909f8f.56.2024.06.21.02.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 02:10:14 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 21 Jun 2024 11:10:12 +0200
Message-ID: <20240621091012.7877-2-arnout@mind.be>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240621091012.7877-1-arnout@mind.be>
References: <20240621091012.7877-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1718961015; x=1719565815; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zq2wuo56onItQgyK4DmbpDVjHBttb5djXLlFwWQSnUo=;
 b=Q53i3CeVFtvWfOJC71xzEvuxW/X1Z2MKDyk/lJCYKDH1OzN4ZCjaULVIObW/0kIdvq
 vYtLKk/gBu13nrtutw22QXTjR02GYgX1+2CRa/M2/Xz7Jrj2IZNaIOteaXZ8FgyZxKEN
 LECWoK42JUUQmReYN9vmeCdrfJaS1FmVrk/t1KYknJlZCSDE9ZXy20M923ZzkTvXdIRo
 TNopv1JSt14KXUm3CDHtUASQ9i3RhrgUNFC4JxRWWn3CHU14DQIi2S6EtVo2Om+7Yaoa
 W4PHIFpoBWo1AuXokRjibHHhcDPo8glc1gWwZ2NG5E3qmH0mXzFLv+QqRf1Lxesf+fEi
 kqeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Q53i3CeV
Subject: [Buildroot] [PATCH 2/2] docs/website: update link to mind support
 website
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Mind website changed more than a year ago, and the link on the
support page no longer works. Link to a different page instead.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/website/support.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/website/support.html b/docs/website/support.html
index 0bcf365332..ee1fa5dc5f 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -107,7 +107,7 @@
 	    <a href="https://bootlin.com/engineering/">
 	      <img src="images/bootlin-logo.png" style="max-width:200px; margin-right:40px;"/>
 	    </a>
-	    <a href="https://mind.be/services/buildroot.html">
+	    <a href="https://mind.be/about-us/#anchor-open-source">
 	      <img src="images/mind-logo.png" style="max-width:200px; margin-right:40px;"/>
 	    </a>
 	    <a href="https://www.smile.eu/en/offers/embedded-iot">
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
