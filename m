Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5C4E7719A
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 00:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2024A8300C;
	Fri, 10 Jan 2025 00:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOMFAAfDG0n3; Fri, 10 Jan 2025 00:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CC5380C95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CC5380C95;
	Fri, 10 Jan 2025 00:17:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 663AA940
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 00:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44BB4403C0
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 00:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gG7yr8SNW5yi for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 00:17:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 49867400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49867400B8
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49867400B8
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 00:17:06 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3a817ee9936so4442845ab.2
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 16:17:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736468225; x=1737073025;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aVxB4dmw+UH7BxAZaKb2GK3dkHhDAShxbs/53cHTCg8=;
 b=SkX/vxCiqItp29ev5e9kAmeRspDIqHIVqMOkaycZrQQ3IC3TNH0VSQwhz2gfLaKSr8
 nosEN3lWLcDfh7tD2c8FkXFfPumS6C6RHQULPPayieqU3CC78I48dLJjk7dvnhvq04Dh
 IvVz4yNFYE0iLCsyeq67mxJHy2L7Omgk/NBUJLTT4VzN0DyRNKrfcXXN3KGGqg3EDoup
 bHBNV83bFV+vLZOfff9YjVZeZ5pCRMzwwUhy2I1Q3xLEDj4XepD9edpOrmVImVqAtY82
 x0iiVriobjrUqCW94IIMUHlLEI8sO/DUgLaqbjB31kLOZmGY9/wcHiSbvOoswHxvSfRB
 XOjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRaDdykq+NP9maoZ9nbYcQW+xFA/FWmoXO6Yo5KinMhFzHTOxuV79CEqhibCSWuMSIVmZMV9a7vls=@buildroot.org
X-Gm-Message-State: AOJu0YyRQuFfQND782FNo40Qe17HAW4ZNGR/Y1atUKNlnW/igzAKLor/
 WMIU8468CTxy4j8NSIf7OPFWFPNdahcg1+LdjFm19ExOUJRytLVF
X-Gm-Gg: ASbGncsijq9W92kdUry2dSEI+zLhMzXCRRyAzv+Ol2xfkkeSQAG+/Od7UWaWImzU9bA
 Rsh6rSkmWSgeXAvMJaKWxAyDCfGeiwbcHui5yJ7obno7gq2F/JgnhIJ/OF7M0pwRerxTr9MFFRf
 SuBhxnGi7YC4XheBa0hSmmnFuhRWNLeA2wehfinyDn+kq1MJZtlgKSjO/2rZw7ZwIi0HkxTuWP+
 y37iReAmtOkSH9zml7fzcvCSVGkfZUqFOGJS/WrjNL1QhDzfiFdqPsT6Q9CK2bdYFvSpFFXvMeR
 GrfLvkVFdeUld56MyxuLywqJwymJi50=
X-Google-Smtp-Source: AGHT+IFBxCRX5fT7NbxfQG25UhfPnSTF5DTfLLgU+1HOV8QMt9snaMvtH/5oYmF06f6BbY0XpHvIog==
X-Received: by 2002:a05:6e02:160b:b0:3a7:d84c:f2a0 with SMTP id
 e9e14a558f8ab-3ce3a93f1a1mr65568825ab.7.1736468225126; 
 Thu, 09 Jan 2025 16:17:05 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce4adb3a9dsm6557355ab.21.2025.01.09.16.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 16:17:04 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 09 Jan 2025 18:17:03 -0600
Message-Id: <D6XYM1425J0M.3BHZUH83I7JQX@gmail.com>
From: "Brandon Maier" <brandon.maier@gmail.com>
To: "Neal Frager" <neal.frager@amd.com>, <buildroot@buildroot.org>
Cc: <ibai.erkiaga-elorza@amd.com>, <luca.ceresoli@bootlin.com>,
 <brandon.maier@collins.com>, <ju.o@free.fr>,
 <thomas.petazzoni@bootlin.com>, <romain.naour@smile.fr>,
 <michal.simek@amd.com>
X-Mailer: aerc 0.18.2
References: <20250107151521.1655280-1-neal.frager@amd.com>
In-Reply-To: <20250107151521.1655280-1-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736468225; x=1737073025; darn=buildroot.org;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aVxB4dmw+UH7BxAZaKb2GK3dkHhDAShxbs/53cHTCg8=;
 b=AAYBVTe52ZynOn+lpDHwX1xM7yyu5vwhjACcjKcMCm6sdQBN/CF/FcpsREiuINsJ/K
 ovUVOXCypDfYv2BEtTM+1xE9Zg1hvcD5TzJwK1lgGMa6ZvRmiww+6Am6AJNpjF+8NIRQ
 AxfuYwUgn5iyK6QGPaBUIWwcy8LDuwdsAT+COVGhMIzfxocp52+v/T5aSJLheRCeZchg
 pN6x+ROWJDdlwW9ECEI32MM5umsUYnr58VvnWMPnDlwcPyssBwNBjy2TPGXg0jrwcN0e
 tTNjap9pLQQ8FULmJ7OeTgU+R0+6joeKdT5pK2MnKPcZDJix7M3e1PMY69Nttx585z7Q
 SSZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AAYBVTe5
Subject: Re: [Buildroot] [PATCH v1 1/2] boot/xilinx-prebuilt: bump default
 to xilinx_v2024.2_update1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Tue Jan 7, 2025 at 9:15 AM CST, Neal Frager via buildroot wrote:
> This patch bumps the default version of xilinx-prebuilt to
> xilinx_v2024.2_update1.  For some reason, the original xilinx_v2024.2
> release tag was missing the kria boards.  There is no difference between
> the xilinx_v2024.2 and the xilinx_v2024.2_update1 release tags other than
> the fact that the kria boards are included.
>
> Now that the release tag includes all the boards, it is possible to bump
> the default version from xilinx_v2024.1 to xilinx_v2024.2_update1.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Brandon Maier <brandon.maier@gmail.com>

Thank you!

> ---
>  boot/xilinx-prebuilt/Config.in            | 2 +-
>  boot/xilinx-prebuilt/xilinx-prebuilt.hash | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
> index 94ef3dd111..8e5918ed4e 100644
> --- a/boot/xilinx-prebuilt/Config.in
> +++ b/boot/xilinx-prebuilt/Config.in
> @@ -10,7 +10,7 @@ if BR2_TARGET_XILINX_PREBUILT
>
>  config BR2_TARGET_XILINX_PREBUILT_VERSION
>  	string "prebuilt version"
> -	default "xilinx_v2024.1"
> +	default "xilinx_v2024.2_update1"
>  	help
>  	  Release version of Xilinx firmware.
>  	  Must be xilinx_v2023.1 or newer.
> diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
> index c955cd79f5..ea072378a8 100644
> --- a/boot/xilinx-prebuilt/xilinx-prebuilt.hash
> +++ b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  xilinx-prebuilt-xilinx_v2024.1.tar.gz
> +sha256  86ee9629366aa8c0d70b87202152a793804ed4090e3a6fdac4eaf855bcc4d458  xilinx-prebuilt-xilinx_v2024.2_update1.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
