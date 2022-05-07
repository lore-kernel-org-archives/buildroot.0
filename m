Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23029C433F5
	for <buildroot@archiver.kernel.org>; Sat,  7 May 2022 20:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2EBF4017B;
	Sat,  7 May 2022 20:33:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8fCT_mTNHrZl; Sat,  7 May 2022 20:33:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74F98408C4;
	Sat,  7 May 2022 20:33:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F08541BF599
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 20:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD0A58175B
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 20:33:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p6jyQy2E7f7Y for <buildroot@lists.busybox.net>;
 Sat,  7 May 2022 20:33:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3429B814A9
 for <buildroot@buildroot.org>; Sat,  7 May 2022 20:33:05 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id dk23so20139303ejb.8
 for <buildroot@buildroot.org>; Sat, 07 May 2022 13:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CTJF6Xj9i9ghe8YegMo7xCXnxvB6qkTb757Ni887c0c=;
 b=Orhvv/6o08PVyoNiCPSKGxyx9eKvsBq96omr4LX2Z7lr1SL7m4Ij3m/tl+g3Oj5YIv
 UCOZVx7lcImzWTxhbdD/yy0HNUJ0PiiSePDf+vCFQUEoFWJ0pn3uwiczL6hEuKQQjdgo
 ctXnhxd+t0+oYjB0jsqBvUZctJcWAasAgA7/LkBqR15yYASMBlkTsEMR+4P26x93YUNy
 rVgAoXnf0iLXS0HHrYqEo0BGyN2OBrKTZiGVR7tdJ9ZdIW6SA/9MCtmgCvuOjsD5c0zV
 mm4bAUbILu+CXe1o+GXOQAVZNNP0o4Th8cZdePfK2yE0vpk7LZREYbytxIBAnhQI5B+z
 kmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CTJF6Xj9i9ghe8YegMo7xCXnxvB6qkTb757Ni887c0c=;
 b=Jv+Ot/jPRrABN5R7ssZiJ7xiWRPztofeOtmzDdETcB+455z9l1gSMzqnz63EsQueSk
 PxQ8Zs7vR5AwMaNTmbreFeEJlWUE0FQmfROWkemiSK6uBRYE45x7VeDUYknlmxKmNWxP
 AtM3X60OaUYl/ub8T3ArqfmPamvhWywIyjVJ+iwEnZ96DN4oWMbK+o9QACt8bQsXf5ev
 /g1fVSyhCK755GJz4oJAy4sWRzAEtQvJesScSmafCH0C9vXsRlJt+OIZk/8ygwdvJvUF
 k3U8HBCAEWQDGSYquknDO0IAigHanCAivb1J7TKgX/Hnr1Usnf5aWDkXLC8DVYVzktHm
 maNQ==
X-Gm-Message-State: AOAM5318oajEpKH04PZHX3JbXkDvfWCTrB2wKiXYG50MrqkkcvSvtv5y
 W9AKCXstT5RDEomCA1QhufU=
X-Google-Smtp-Source: ABdhPJyq2QI/fjXv+sUIPZLD2XvqVWjMKSIKnpOLySLNBasrliVUfOhOt5GNAGE9wV9oEJlXtyU3aQ==
X-Received: by 2002:a17:907:2cc5:b0:6f9:1fc:ebef with SMTP id
 hg5-20020a1709072cc500b006f901fcebefmr1853502ejc.121.1651955583318; 
 Sat, 07 May 2022 13:33:03 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 gz14-20020a170907a04e00b006f3ef214e62sm3335006ejc.200.2022.05.07.13.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 13:33:02 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: wbx@openadk.org
Date: Sat,  7 May 2022 22:32:56 +0200
Message-Id: <20220507203256.259115-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <YguL6gkGFVEhpb1H@waldemar-brodkorb.de>
References: <YguL6gkGFVEhpb1H@waldemar-brodkorb.de>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/{glibc,
 localedef}: update to 2.35
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
Cc: "Yann E . MORIN" <yann.morin@orange.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Tested-by: Petr Vorel <petr.vorel@gmail.com>

What blocks accepting this?

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
