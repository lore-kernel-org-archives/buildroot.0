Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C73C27C5F
	for <buildroot@archiver.kernel.org>; Mon, 10 Jun 2024 18:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89008607E2;
	Mon, 10 Jun 2024 18:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CvYDWgNh51lX; Mon, 10 Jun 2024 18:35:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 830D16067B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 830D16067B;
	Mon, 10 Jun 2024 18:35:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CFB3A1BF3ED
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 18:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B64C181FD5
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 18:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDF12i2sMsl3 for <buildroot@lists.busybox.net>;
 Mon, 10 Jun 2024 18:35:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.146;
 helo=smtpcmd13146.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2BFB981FD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BFB981FD1
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BFB981FD1
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 18:35:49 +0000 (UTC)
Received: from [192.168.50.121] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Gjrvsliva8U42GjrvslGSr; Mon, 10 Jun 2024 20:35:47 +0200
Message-ID: <d99de7e0-4775-4bd9-b60c-4ba79c513708@benettiengineering.com>
Date: Mon, 10 Jun 2024 20:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan Brattlof <bb@ti.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
References: <20240610-k3-mainline-v1-0-57ec7cfa0bfb@ti.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240610-k3-mainline-v1-0-57ec7cfa0bfb@ti.com>
X-CMAE-Envelope: MS4xfJI/ZPxofmmZKcAFFCsaItEKYR8FNuRvRFkrCfVJ6XTu2YpG4uF5A3EiQW0kifDa+E+9l7Gvoxi7CcAFzG9YS1P4hw7PZ/IoIz2Cw5CH0COdUtSHiqjc
 8Z5ZLm8DINkMYUeZfD4o2xEKQ7QhQmVWmpHNIMSjXyEvtRsjIeMpO8zA9LiKMyvXyHRyRYwZ6v0OA536us2mvUqYCvyaLCHKDSViNk8K3L3hsxCutSwqoEIv
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1718044547; bh=neXcbKE7iJRgldvApZjBvZqRMkpI88wOYznjAdSusN0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=DlXjDNYjXaA7kz3X5l+nx+OzzVNMCeawtfETb5OaqEEhLf/oqZZQF+hYgj/PxvayP
 qRQ5QWxPE+/j8cYF8gvt5Ag1prdSWPkOV1ofHZ5tHvQwmnH7UJ7hOp4gPtZ0fwcfcS
 bf3/Z4UBIDzTP19GRtc9QaG3GQpJ6kfpg9rf06wZtq0UfrBGXIpGCAR1d3qxQsdU0N
 iteMxMVFYZ+8xTU1tTqFwg7ub4GofKBrVQzNtP76MiV6Gozzd9qYq3yD14rsLFQpfz
 MW3UhS2+g3rUF2vaEPGusN9ME1bWPVMN5WAoAmLiTcLn3B74AwnBfjulTHCRvxahPr
 VC6Qu6+O0foOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=DlXjDNYj
Subject: Re: [Buildroot] [PATCH -next 0/2] configs/ti_am6*: move to mainline
 Linux
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bryan,

On 10/06/24 20:20, Bryan Brattlof via buildroot wrote:
> Hello everyone,
> 
> TI heavily encourages developers internally to work with the open source
> community to enable all our SoCs there rather than develop these
> features on our vendor trees. Because of this there are very few
> features or bug fixes in our vendor trees that haven't been sent to the
> project's source.
> 
> So for the next Buildroot release I would like to migrate TI's reference
> boards to track the latest Linux release to ensure we will always have
> the latest features and bug fixes for the reference boards and SoCs.
> 
> This small series moves the AM62x and AM64x to the latest Linux release.

You can't keep defconfigs without predetermined linux versions. The 2 TI 
defconfigs already point to mainline Linux. This is done for
reproducibility. I don't know how  you can achieve what you mean to be 
honest.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering

> 
> Thanks for reviewing,
> ~Bryan
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
> Bryan Brattlof (2):
>        configs/ti_am62x_sk_defconfig: track mainline Linux
>        configs/ti_am64x_sk_defconfig: track mainline Linux
> 
>   configs/ti_am62x_sk_defconfig | 3 ---
>   configs/ti_am64x_sk_defconfig | 5 +----
>   2 files changed, 1 insertion(+), 7 deletions(-)
> ---
> base-commit: 035651209f4a975cb5413b3911f5598db73e4822
> change-id: 20240610-k3-mainline-8540a440765d
> 
> Best regards,

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
