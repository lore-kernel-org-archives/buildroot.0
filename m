Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32706CD8C9D
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 12:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F3E4841B4;
	Mon,  8 Jun 2026 12:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0Iorx60Y4Um; Mon,  8 Jun 2026 12:48:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA5728414D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780922902;
	bh=dySGjs8oX61RPdjeu9iZPfkwxX+SWQsYIWc3htLANbI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nziyEN0cxzp9ZyefId7bdrb82+uSn16wx4k9HHuUUL0GdgK8N9bty9uVwf28Bm7aQ
	 Qv2l7n0SQWmfbAET2CexpG2gejowCO6wNE9g274AYhKv/8fm7SfUqhdXObP0/5d0KL
	 9IPgL5v5bik5vtBCLo6FQ4XCf9gDOby5yNjyoYjZ5fNFGAQ1kNvtWnwYexGA1pzP+/
	 aoA1rrT2uD7USotIPgQn65BS042DVD0OJNluEhke2XAibnhqXVHOv40fcoZgQuio0b
	 3jidd583r3QkWaRs9/iGF3zjlu9bRUl11eIA18Pgnqad5n1aZWEuW4EiSpIMCslsEw
	 eWDix8Lla8Heg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA5728414D;
	Mon,  8 Jun 2026 12:48:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E3B3187
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 12:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0025340A98
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 12:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Ypb5xO22ZbH for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 12:48:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9003740624
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9003740624
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9003740624
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 12:48:18 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4602e2a0372so2997472f8f.3
 for <buildroot@buildroot.org>; Mon, 08 Jun 2026 05:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780922897; x=1781527697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DLe+VObgfIOWfB3iPbhjsUHg5sGqd58EnvE3QIID2Ts=;
 b=VZW4W/rtbTUv5loTE9g6IlUJm7jrXa8mm1cW4Txqvrzo+Bw/Dhm2/IMq8hWj/5A/IP
 LBllavzYNTbGEPD4Jx9Xo4pqzlhIqZu8Xl7zcP2OfodwVzeUzcRJrRaNv7ZTr+bPvasy
 vgApUIL6t+p4WNo4xgOlpZB8YKj5bG8MMQV7Tpzqe67FfsDmMNqCyUKQ7RL0MJ6GGZAX
 3iiR0DDF3hnCKAcTdJTMNE6pGa0CozXWEUf+5mkIlCMN2G9YIrG+ZedEAyewqPm1QuML
 mmXOqjq1vl6We8zDZPefPK7gGLMG1ZtjsF/Qsk8zpxs5remLvMSgBlDIKdVFAHa/mOrp
 l81A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+zqIR0VcUw5bp12XIvLmr/bEhlKBeKz+yLXOkDSBe9+eF/Ne8cXLgCJJzJiLsyq87uPKaOMjIruGA=@buildroot.org
X-Gm-Message-State: AOJu0YytP4Ax0U3GKVbV+bryMGXqtg5EPgxwDbj64JRGh/1o51Zy/2sJ
 cMXUDd6I/AV7IxqabwZyIOx1SJ04oKEE3Whg9dVDt9N7R0YS2y4kZKS9l9k19u+OGek=
X-Gm-Gg: Acq92OEevu/kOd6IRV2BOcqzzFQNvnH+p0K0e6ZZDr2I4qXg0OB1iC53Bjmk+MhkyzZ
 fGceSh8bSIJq65l32m9+q2n/6J1Jr2Zu7xX497U/mp1e/nSlg7eT+TN9+kZPgF93d5oJsg+fA9D
 76+mhbktxUO1tGiK6F2O2zvF025dVnnYb8M8XVreovvbjsHr/xrsCm3cFSgIBW1FFckQvzc99Kk
 xEcNlMe6K2UbR2eT3LPeWrJUdLcuQuG/EaO7ykN+TIptWmKP8nMirUpKXbpqQIFCoCfPkNFD2q+
 g+ybnIS0P93yMsHpVGRgQlsEQaDg3UjweaR/THvwaJ1dZoOMl866X77trIyL+rOKjtoeTL6v8Jw
 jHRkEfqK7Ljj0LJiDfa9VgKpH4UbUmBtANuxrsCMLpvzxJbkHrTKY77ugyFbiHpLAxvH56s4BOj
 YP3KZHNDlx4Cc4pWYooA0QH/V8L0HVAc6JMqBO6byuV7DUFK/lnv0C7O09lQNczTRriB1kUqq7I
 KvZ+bB9pw==
X-Received: by 2002:a05:600c:818c:b0:490:b0e1:2161 with SMTP id
 5b1f17b1804b1-490c25b39fdmr282376305e9.2.1780922896925; 
 Mon, 08 Jun 2026 05:48:16 -0700 (PDT)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc23394asm389044565e9.0.2026.06.08.05.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 05:48:16 -0700 (PDT)
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  8 Jun 2026 14:48:16 +0200
Message-ID: <20260608124816.52927-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <dda9cedc-20ee-4b00-b912-f807bc24cd3c@cherry.de>
References: <dda9cedc-20ee-4b00-b912-f807bc24cd3c@cherry.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780922897; x=1781527697; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DLe+VObgfIOWfB3iPbhjsUHg5sGqd58EnvE3QIID2Ts=;
 b=aYVepBYSjOsnqnNMePOFDxDanrQLrIW02VSBQqO7qWZJcPpZr29ldkv/Uy0BoZRZsd
 VXm+6t7WIPcVr6dl6FtxJ/oOksqj54r349QZiNqI+G6xjfulF84I6Byc4SABGloqlSFE
 ILwvkKB12YWQdl/Mc6NqekO8G3JfzgDGhWysx4I5i62GDVPPX9uPex/Bw92CNlkkAnzX
 nYwXghmG0ikyupzz2FB6itIL+dHZhanJXgByA/lwVQEFIhg6uNYD3Rd6d/xtl0Y1oSCN
 wSIYNyASrScqAMgwaLuRv8AFnE0mhVM6wDtZaLgBliQUvuuV4UgH8GyyGHIiBvwzdwIH
 SozQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=aYVepBYS
Subject: Re: [Buildroot] [PATCH 2025.02.x 5/5] package/qt5: bump packages to
 latest 5.15 kde submodule version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Quentin,

In reply of:
> Hi Thomas,
> 
> On 4/10/26 12:09 PM, Thomas Perale wrote:
> > Hi Quentin,
> > > In reply of:
> >> Note that I made a mistake in v1 of the series for master that I necessarily made when backporting for 2025.02, see...
> >>
> >> [...]
> >>
> >>> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> >>> index 3ad2bdfc04..0e375e83fe 100644
> >>> --- a/package/qt5/qt5base/qt5base.mk
> >>> +++ b/package/qt5/qt5base/qt5base.mk
> >>> @@ -4,7 +4,7 @@
> >>>    #
> >>>    ################################################################################
> >>>    > -QT5BASE_VERSION = 2b9835f5c9bcfe3105b60a8dd33c1db7d8611378
> >>> +QT5BASE_VERSION = bebdfd54917e25d1c100e6bd9f5dd53c2e645fd8
> >>>    QT5BASE_SITE = $(QT5_SITE)/qtbase
> >>>    QT5BASE_SITE_METHOD = git
> >>>    QT5BASE_CPE_ID_VENDOR = qt
> >>
> >> ... there should be a change to QT5BASE_CPE_ID_VERSION here too. See v2 here: https://lore.kernel.org/buildroot/20260327-qt5-5-15-18-v2-5-4c98e853266a@cherry.de/.
> >>
> >> I already didn't like much sending a backport series for 2025.02 before the series for master was merged so I will refrain from posting a v2 for the backport, but if the series for master gets merged, this one here only needs
> >>
> >> -QT5BASE_CPE_ID_VERSION = 5.15.14
> >> +QT5BASE_CPE_ID_VERSION = 5.15.18
> >>
> >> If you want to modify when applying without going through a v2. Otherwise, lemme know I'll take care of the backport whenever possible.
> > > I will keep this series open on patchwork and do the modification myself when
> > applying so you don't have to bother resending. Thanks for the notice.
> > > When the "master" series is applied feel free to ping me as a reminder for this
> > series.
> > 
> Ping :) Note, the last commit is from the next branch and not master. I'm not sure what's the policy for backports, maybe it really needs to make it to master first, in which case we should probably wait a few more weeks/months before applying.
> 
> bc1a1dfece63 ("package/qt5/qt53d: disable assimp support when BR2_PACKAGE_ASSIMP is not set")
> 79b13f6e675d ("package/qt5/qt53d: force using Buildroot's assimp when selected")
> 11e380fb0300 ("package/qt5/qt53d: always disable assimp support")
> 2deee0c87dfc ("package/qt5/qt5webengine-chromium: fix zlib license hash")
> ff4243147d54 ("package/qt5: bump packages to latest 5.15 kde submodule version")

Thanks for the reminder, this series has been applied on 2025.02.x ... except
for the last commit.

As you noted since the last commit ended up in the next branch I didn't applied
it. But I do think that it should be part of the 2025.02 LTS though.

> Let me know if I can help.

Could you resend a v2 with just the last commit (and with the fix for the CPE
id while we are at it) so I don't forget about it. I will wait for a bit make
sure with the maintainer that there are no blockers to apply it later.

Thanks Quentin,
Best Regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
