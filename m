Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815C8C43458
	for <buildroot@archiver.kernel.org>; Tue, 30 Jun 2026 19:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46B5F606EA;
	Tue, 30 Jun 2026 19:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aa4ZckIPDycC; Tue, 30 Jun 2026 19:44:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DE5360854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782848646;
	bh=0e+64n/oVGC67Ea1Wd7UnHlh22SMaawtESMwEwNOTTU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s4L3xNmbbK+HqTUN3ICZ/D90NddLPivoudFIVW380zzT2Ug9y2VJigsFQMkjTVKpM
	 GiFoIQphVHbaL7wCecQ4gXefpWBgN6CZB6cq/X9FVHIrARQvwC/7ovh2dpWFf8OnrI
	 AqldY//MHJOoOvd+mBbesOHdsQeU4qdG8rGZyYApoPL2OhwCiHBCznCOqP5YhYfAar
	 HskWPDxN+wLVNtUrfyBewpSbD0KUdnaNJ0ikGahXpuuaEcuMkbHsmGbhrrqREm6w4j
	 +oQY6n1CRZ2p/O8V4DGnVg4FX/OGd++AL8Omf6eiFivKQkZ9qcBGqH+VN9ikvO21SR
	 m8AkEN75I2e7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DE5360854;
	Tue, 30 Jun 2026 19:44:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CAAA9149
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 19:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B10B24005B
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 19:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYRbMOxoT7Yq for <buildroot@buildroot.org>;
 Tue, 30 Jun 2026 19:44:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB23C40061
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB23C40061
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB23C40061
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 19:44:03 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4720f3bf164so588057f8f.1
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 12:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782848642; x=1783453442;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+Rz+s4VfZ6Ia9/1Wgsnq47A1b9IDHx+kWX0GyGHimg4=;
 b=Beuo/vtf2d/f/JiN3u9oMw9zuHiasU0RILr0UkkQQOdmwycfZ9opkyseLRONuVZr4t
 apFsGW2mCSnCexgSCByi+/BnenKM3FDTzX0hFST311i/VgrXvw4YbBBCH4vTVtE3rgjv
 jar23qTibufN+Yh2N7n9zbtQMFiKlh5D20ZTjvZYtKL/kT2c2X5C2e0dwjt6CPuizLBT
 AZEE/IGj14OTbyJdSR8baGm3RFSpmUmXwTSIinzlpiN9V8vyDTgAgE5NykpSSTSe+MLO
 4yqw+fItxBnMHCNLXPZNQp7onxAU+zMHhlHOS45sieyDuDDEJ3XEIkWZV8LcWs81SjCd
 qJYQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq+ys5fofhHAYN63SgjISM6Kuj4y783L2CVqAaLpUOm2QvBl8dPx3EW3qVIQdgy6AL9UtaP7Ww41Y4=@buildroot.org
X-Gm-Message-State: AOJu0Yx6EyJbGJF9Kj5j+PlLfTwiht1xyaNoIqyC4ARluyx+iX845V1p
 vdKn32GJ4Dj2qaJYz1Rsh9bMEqTAmVGOWuu0SXvLx9MJy2Vd5y4yIWSK5+VqbfOttb4TrZ6hBYx
 LINIy
X-Gm-Gg: AfdE7cl7Ovyps9Arb9MjYAj8BUTdRSvxBCYH6rBLhd2zCFitAPEbQVzICgFVH/lVr1M
 akxth9xSV6KqH04wB/NFi1k+F6GsheDqZi3G8iWDBVimJTdPAofWvrQ7ll3Ro3aUS1AwjX2uBxz
 3bwIVQyuwOBzctQyzV1wGc3bD9/ooqzMPjffwTf3DyE+OMcX/WEcUL8Q/PkfAYh9acTjr1HqT+W
 0Nc3sYTCo6p0ts3jqJCdDZHx4yb9kPb3PdVcHELaRZCYvDE4ozdq7t64aUttzHeEr9f0a90Dej8
 ZuM8qKZUkj/+F4t4rWOrsxf5t9rs73xDgccALSyRCl9t99HObx7gKusX4qne9A8U/0GoLjZTXTI
 b9lrGML0lpAUcjOQMXD0628Yyii20fL8z+UXY9CY/jIV6uK/2eKlRtVnjDcoaJjzaaFR7iDQi44
 QkTZd7/dH1OVamNhw=
X-Received: by 2002:a05:6000:2386:b0:46e:65ac:cfb3 with SMTP id
 ffacd0b85a97d-475f4fb4c75mr4511523f8f.1.1782848641744; 
 Tue, 30 Jun 2026 12:44:01 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4756636d2cfsm11306661f8f.17.2026.06.30.12.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 12:44:00 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Tue, 30 Jun 2026 21:44:00 +0200
Message-ID: <20260630194400.250881-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <4baec67b-bd02-4cd1-8292-33a759c838f6@gmx.de>
References: <4baec67b-bd02-4cd1-8292-33a759c838f6@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782848642; x=1783453442; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Rz+s4VfZ6Ia9/1Wgsnq47A1b9IDHx+kWX0GyGHimg4=;
 b=JSW7QGb3TPRtKcmP1q2etMeNK+ATBQyA87OVVP/UeOGqCSLYDfXBsvHMHK/kauZn9R
 Be4ZPH28v0WSdUS+tZx2Khla4CzlHt2iYmwZMfjzKMaomDAVB+97fM034slnsQxW+VkE
 JzTY2HQcZbk6/BvM2yw9THWnzHMukpf9VVfwkqukoURXiGnPs3+p2FX2qgEcoqQ40oK4
 bG/gHBbr5Ce/9C8p/7Mv1+aH079KENG18b1nC3IbQimuMFwn6kEAkom2JYxI1Vk1qQ8e
 /d8BPgjTJ0thXwuwxZ6MyRly9uwkILVS3I39lH7q4I5v+GMuZLtSX42TyNN/jy9sY0P9
 RYsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JSW7QGb3
Subject: Re: [Buildroot] [PATCH 2/2] package/libssh2: backport upstream
 patch for CVE-2026-55200
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

Hi,

In reply of:
> Am 29.06.26 um 23:00 schrieb Thomas Perale via buildroot:
> > - CVE-2026-55200:
> >      libssh2 through 1.11.1, fixed in commit 7acf3df contains an out-of-
> >      bounds write vulnerability in ssh2_transport_read() that fails to
> >      enforce upper bounds on packet_length field. Remote attackers can send
> >      crafted SSH packets with excessively large packet_length values to
> >      corrupt heap memory and achieve remote code execution.
> > > For more information, see:
> >    - https://www.cve.org/CVERecord?id=CVE-2026-55200
> >    - https://github.com/uclouvain/openjpeg/commit/839936aa33eb8899bbbd80fda02796bb65068951
> 
> I think there's a mixup here with the openjpeg security patch you sent? I assume the URL should be: https://github.com/libssh2/libssh2/commit/97acf3dfda80c91c3a8c9f2372546301d4a1a7a8
> 
> And it seems the CVE description also has a typo, missing the 9 at the beginning of the commit ID, but that's in the CVE directory, too. Not sure if we should fix that or add a "[sic!]"?

Good catch, I've sent a v2 with those corrected. I've just corrected the
message, I do sometime change those description from cve.org to be less
verbose.

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
