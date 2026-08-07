Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E43C5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBE1060A46;
	Fri,  7 Aug 2026 11:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNUUwnDeqS6G; Fri,  7 Aug 2026 11:18:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A66F608F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786101524;
	bh=R9REMnZQ97OgF4bOc4AT9H14TPJtpcLERmsbfPVBLN8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EdnZ9y64nEiCKW6+YMWYfGppxBR0kIqeT59fKWF3ss3T8M/1wkKWZ0No1TLImNCkr
	 h/niEEr2pfVRiTAysIfYKNBMPgq7tRnqkxCPjM0HxUhs8sJBov8RMBDCi1UWBCY+ww
	 YPhO9rqjBdwNB9FX+k3jlAYzpV/5v+0vYBIK7oIENieV3lml+yLDFCsZ0eFVTHDQwP
	 LEmafkcSQs7hWMzQhO13bVo5Uk/Ja/VFRO/Slctk2FFkJpRZuDyiupnMo2xCvW83nA
	 VZn0nMgd/QOgY5Wi42ZUQ3QDvBjl3O8R4phz5yEggMobBRiAJCA0i5kozMNDozqtrE
	 qKwvpnBDndhwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A66F608F8;
	Fri,  7 Aug 2026 11:18:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23BAB10E
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21321403F0
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kylnYQjKz2Dc for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:18:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1A7AF403EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A7AF403EE
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A7AF403EE
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:18:41 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4955de8797cso22437045e9.3
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 04:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786101520; x=1786706320;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hI60OXoFktErIe9ND4NxRZ//FfCLvgF/HmQ6k+1rt5Q=;
 b=lHuu9rhZJSI+9Mp/yZkiTwBhhbgBBJmE95hVHBzDhASJ/yyfbiU7RZmFBuIU/eUIaS
 wcmtJhdesC4QX6Vq6d23a2w35pdGw4uFsGHY3jbfNFonLN3OMvS7wufumqC7EJqwCqps
 ulsSUuw4rNkVqy6qEQTD7957T0dcNcQz3n+DwsTF3L32tir99fZtggPQ8avbR4mHNYMF
 MSScDkW2jZABCrDlVM7nbREzTMCnubQrL3BtFnP7f5clw+Hz3n57ofu0lXGERKU8BByn
 iQ+wa6cyZQXGHI94/UC/n2hCHOtaaew1zaxh7/0gnfRuwp2n83buiTrbM4B1TWjSIaW+
 nTZA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpeDwkYBZMoNzEJ3ZTiG7H7QyEnjzzYOeFkT4zoipODVHuO5kEsTLMp32ZxR8rc1fYrQs+l6VpaWlc=@buildroot.org
X-Gm-Message-State: AOJu0YzOHzVeVhrbnf/hfMj5c3sR4PXQ6DlhBy2bkoG4D5oFqtYtfvwt
 w58M1BdAdXVXGY2PurTldYxrY1YukceiM79OfSnZJto1s1bZRl0Ek1q8w92woqTyFf4=
X-Gm-Gg: AR+sD125hS3gB3gKO0tFaPRwrkrgxpoO1snUuG7xwsAVWsBmO9vU1iVxvqlLK2XSxS9
 AjKYYca9bkFx2IC0ZMJx/MkX677WSlWta8l/4J6TbYtc38iv0ouCbrRbsqoAvUXn+Y43pFXjJkT
 7XOFIj6FrmNNXspFH02zKZ+oVlMVKbEa1QiyQTeaEJ1/UyXksfDNkE+WDDABQXxwzWKFFZOwju2
 AhEVe5PD9EoHD7KZjJA7wDFQ94SGpjp7T4BfBoIL7vgmCB1UeNOO3AVQv4XqgtYTqmags6VtV+k
 jlzDfoGQAfpVbMOFkj2AGviTLOQd1RwL5BLOARcpjAakXDz3eAHWqMQmgIYHZF9F/6Z8bc2IRGK
 7fHe+mi3L0mfoxkYC3HSrAPDUGYgEP9JmmH2KfYP0wZUMkFmEtkyjnm63kS+pfKMTAxwLwmQMi8
 0fwq9EqqtQbSsa7oiKKiYfDT2T+KNfgEV/+DyEffYeKy5BqmiMPc9S747gGtXiN3kJMQNfOUpfK
 S5Y9C0iZelXqlAiZEDFg7lraR81TdDtMWW3voOZZcubVX3O
X-Received: by 2002:a05:600c:470a:b0:493:f318:3bc6 with SMTP id
 5b1f17b1804b1-4995e0df176mr34756995e9.13.1786101519838; 
 Fri, 07 Aug 2026 04:18:39 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480021e8cd0sm4808443f8f.17.2026.08.07.04.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:18:39 -0700 (PDT)
Message-ID: <61d5317e-62b9-4763-b2b3-17f509acc9c8@mind.be>
Date: Fri, 7 Aug 2026 13:18:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <20260729202520.1568463-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20260729202520.1568463-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786101520; x=1786706320; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hI60OXoFktErIe9ND4NxRZ//FfCLvgF/HmQ6k+1rt5Q=;
 b=XBvQeQphpmTntIxWlX8N+qtDpTenOzAGYIfJrrmEZCud0S0oOArSjSGZzc9FTx8RyD
 M4CHjC3qMTRYBEdfeo7PHFEJ2o1lKGt8GP6Fsle53791pT7++iFJjM23XtUTBEcteqXK
 8246MNMVOmhUGgQidl1rU3MR2Vf0SbKmutTTKBuVQ6Ro4dp/izkD46VIRc/erIgEmxQh
 mX2TZF56/xE4MOCvo1A5rtcxUSo1wKToLkXnyuqb2lMiS2OLSVrqH2o7TlY89th9sWps
 3tQtysZc//Pkp8CSZY2PCIkXUuYhYLK5OfHoh9QCKI504QAznViACK4QngcqnJq+gBiP
 4N4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XBvQeQph
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: fix host build
 without FIT support
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 29/07/26 22:25, Julien Olivain via buildroot wrote:
> Commit [1] "package/uboot-tools: fix host FIT signature support"
> slightly changed the logic in which the file
> $(@D)/include/generated/autoconf.h is created.
>
> When there is no Kconfig sub-option selected, the file is no longer
> created and the build fails with error:
>
>      include/linux/kconfig.h:4:10: fatal error: generated/autoconf.h: No such file or directory
>
> The issue can be reproduced with the with the simple commands:
>
>      cat >.config <<EOF
>      BR2_aarch64=y
>      BR2_TOOLCHAIN_EXTERNAL=y
>      BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>      EOF
>      make olddefconfig
>      make host-uboot-tools
>
> This commit fixes the issue by simply adding a touch of the file
> at the beginning to make sure it will always exist.
>
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/928cc5dc5cb82e6f2cb43f853488309eb806ef89
>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2026.05.x, thanks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
