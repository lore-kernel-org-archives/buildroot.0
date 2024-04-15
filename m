Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12FFC4345F
	for <buildroot@archiver.kernel.org>; Mon, 15 Apr 2024 16:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D02F817A6;
	Mon, 15 Apr 2024 16:23:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id krEbwNU6BXLQ; Mon, 15 Apr 2024 16:23:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FC0A81774
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FC0A81774;
	Mon, 15 Apr 2024 16:23:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CCB71BF298
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 16:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16B68404A6
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 16:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4suxT8tMJpVh for <buildroot@lists.busybox.net>;
 Mon, 15 Apr 2024 16:22:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3418400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3418400FE
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3418400FE
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 16:22:57 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d8b4778f5fso24386791fa.3
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 09:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713198175; x=1713802975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/2PhXelcqlX/zZX5Ov4PrNE+gepbTcmvlJn3IeBQO00=;
 b=hNUWczn07Q/tz+qOSOErK9/6sN+VufyzXj7m67CYqYB/AZ9z1yqb+b6e8fP2yPtsDG
 Ms8SShDmBSe+riVbRjbhHFr8aag6iv3bPh1aRToabNFiX6UwL5rt8oZIg6oZ+NV240BN
 FLTt+wRGF0uT1JspFIobQIieIWx+n1PvjZQ1gHo0rTbHlZ9yprGWz+TSNn+auGhqW7DW
 iChm5g4wET2J6oFQBO/HOsvhf/RjT6YuBjOTz4c1NKcaz8AkuMojLEz8p9flJ0+/ZfJn
 d5wQsZRCua+z7yTnTkiEZqG29+xqs1JwCsttxBt0jXSvqxJlmy5rKquLWNzBNJFNJYmm
 O1Vg==
X-Gm-Message-State: AOJu0YyLjvJoPMYzYWmx01UzBM8Zc39UoiZXubYC4otLHJgR76NXQqm+
 FVz/QKiMpiH7Vien2Kd3UcZSjbnW9THqPzpkf/QtQuLe67OwexIAadzkSp66v8x7Xk43MbHFDIV
 3eIM=
X-Google-Smtp-Source: AGHT+IE6vJ9tVsnpTDHmT3gH8Hc5UicWW6AYOcoHdl6NKKyxNYVKv6Iz0LLwbPsBUx4KckKZ9siz2A==
X-Received: by 2002:a05:6512:41d:b0:518:a55b:b612 with SMTP id
 u29-20020a056512041d00b00518a55bb612mr4243231lfk.54.1713198175166; 
 Mon, 15 Apr 2024 09:22:55 -0700 (PDT)
Received: from localhost.localdomain ([79.132.235.33])
 by smtp.gmail.com with ESMTPSA id
 fl16-20020a05600c0b9000b00418631f91c1sm4302938wmb.28.2024.04.15.09.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 09:22:54 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Mon, 15 Apr 2024 18:22:22 +0200
Message-ID: <20240415162229.1357491-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240415162229.1357491-1-thomas.perale@mind.be>
References: <20240415162229.1357491-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1713198175; x=1713802975; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/2PhXelcqlX/zZX5Ov4PrNE+gepbTcmvlJn3IeBQO00=;
 b=Adf9W+nktvWbe+UGk2cPJt22gwluf4GqRLajbtRqk1H1N1M9h7zDUXARN7wxvRdIFd
 ZLQjoC3pTu5b0jpirOsPuCZzu4P0a96+vRBFCbLeYJLrv7R12QxIJ0ONRYZIrkTFDRxP
 Dv89fhNJ11FsV3GOQemcZ4gW+kcaX+2if8q12Q4ADDYFWRkLl2JMflqLXrjYau9Vt4mB
 ERAscP0qLgrZPcz2stiZX3utLqOqZpb+7NNMp5fcQeaqwH9lyCQLval5z2ucfuYJFPyb
 Eoar24b7REAxW75tiDZYwC8IT8csPV9oQ+m3ri/8Sv4vn9nfgR0GZ571WX6cMlDYO5Bv
 qizw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=Adf9W+nk
Subject: [Buildroot] [PATCH v2 1/6] DEVELOPERS: add Thomas Perale for 'go'
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 399b2931ff..039b803d50 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2979,6 +2979,9 @@ F:	package/frotz/
 F:	package/kvm-unit-tests/
 F:	package/xorcurses/

+N:	Thomas Perale <thomas.perale@mind.be>
+F:	package/go/
+
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
 F:	board/beaglev/
--
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
