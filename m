Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9665C433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 22:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5461040574;
	Mon, 17 Oct 2022 22:37:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5461040574
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hZe__4NGEcEx; Mon, 17 Oct 2022 22:37:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D549404D8;
	Mon, 17 Oct 2022 22:37:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D549404D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FE171BF3AD
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 22:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E614881831
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 22:36:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E614881831
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xL5YTbJYIDFi for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 22:36:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3894181759
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3894181759
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 22:36:55 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id l4so12087565plb.8
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 15:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LL5iYevGbpxTa6yNJGrE0j7dRtDLP0Oe4cpgamZJ7VM=;
 b=FqeOcjmwvJxho/t+WWCp9XcwuKnEyHrx7vu4Cbz/PBFvmS1K6OC/6yGnznNG+8jjFC
 JBRdVWn66ITqXdo9bdZfQCVfA72kzJQY0TPwSCET+xQaiEoN/TXirItSCnVaolc/oYW8
 g7paumrSkUpi22QaPEvyJqBJS8q8dQPNQh9Pg8nm9JEJD93nkr6fljW6aN/9AFnVS6Pq
 VV+f/R6sGP8Rb8wUR4CXkjN7Hq6TxVWikSFXI3CCxsPTdVxpb16bkh3Pn1X0JkDLolk5
 JWRF/pzck3Mb6wlrRpN8tGp3Np+yNYOW1h3zq/m0059gocb4OpMakkfibi5AW/Elkzxo
 0vmQ==
X-Gm-Message-State: ACrzQf3tMLcyp2NZ0B5QsDhO+m8fguXFH5XfhFGThIBUoHBT9MUP0SRr
 mdZtUFQlN7ySvKnnuZRovAUDnMDkW5fn33KdBLGLmD0R0ZM=
X-Google-Smtp-Source: AMsMyM4HjstGLa5kMARX9yLCDfxRqCAy0Xj4lW3k5bRoMXPOM3ylzFjiZ5UwllJWBrOKqWy0k1BRNHgHS7vf0AgJo64=
X-Received: by 2002:a17:903:210d:b0:184:1881:bfe6 with SMTP id
 o13-20020a170903210d00b001841881bfe6mr125623ple.80.1666046214713; Mon, 17 Oct
 2022 15:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <f66ff517-4b50-95f4-b330-d4cb5963553a@benettiengineering.com>
 <20221017211239.1751923-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20221017211239.1751923-1-giulio.benetti@benettiengineering.com>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 18 Oct 2022 00:36:43 +0200
Message-ID: <CAB1t1Czt16MdSXEoN2DL9zxPrL__EJcdyaiTOk6AWhnJ_krT_g@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LL5iYevGbpxTa6yNJGrE0j7dRtDLP0Oe4cpgamZJ7VM=;
 b=OV8n/Yiul9GT04b0F9mvLmf3l92Yla0gd1fz8XIUsmNApyR80mOkCET/zxa7MnG2vt
 oLzY5QGLwRujaqkz6j0mCE0d7/EBAZqPUnCdHQah9Wqg99GT/r3K5W+3a/hUkJiVvD1R
 kBudZ8gDP8gjHtJ5oRbdIMoSxFH9NrCAmRsZXUj9h6skl1IDmIgVEieSNhDZebo8It4v
 evhi3kdT1q4TOFf34RgZQfUjFaWDD5bj9L89ScDaktRm2yp+4WqzQeOLxzhsXykrlZfd
 TcBK2wViEwHwwfxRMNmhluwAMFh05ECzVmz4qSjAvb+r1dxBa4NHfdJ9U40a4s+KF/mh
 HzwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OV8n/Yiu
Subject: Re: [Buildroot] [PATCH v2] package/rtl8188eu: bump version to fix
 build failure with linux >= 6.0.0
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio, all,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
