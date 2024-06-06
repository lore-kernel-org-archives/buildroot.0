Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C05AC27C54
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 18:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF8D24171A;
	Thu,  6 Jun 2024 18:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ne92smCIP61m; Thu,  6 Jun 2024 18:47:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3279941686
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3279941686;
	Thu,  6 Jun 2024 18:47:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73FF61BF592
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 18:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BE4284939
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 18:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NrNnBILq67Q1 for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 18:47:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ABA9F8493C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABA9F8493C
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABA9F8493C
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 18:47:27 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4210aa00c94so12961335e9.1
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 11:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717699645; x=1718304445;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cmkGKqhiva9PWk/9S8fiHwFUmLj6yfvTyYP6+D17vs0=;
 b=JNz5mljFxmwMsEUmBQwSILu/lMJ1ka/fatqsKHMezExnR3uFW/NsZ8HFIv7uxZbcqj
 BVnKcBZQY08fuyZRnPcBCcGb/Fnl2B0D+klikQpZj357U6kc9Q2ISEnpvcOnVeZTNREb
 tgUzQaPIBVlqpd9YTILXCKwB6eV6FNNVMG+5jZCC43hw7KdhMC55yuuPG0lOIIMlNRNU
 okDnSjO9ZDJ4as2S0pskuynDNezLhR8uCapP+c/N2fzADrsWGIv49Ni1Df/x79D9RyPX
 MynbT/4Zi3bhUm8IGTTKAuRZUsWtaI+4L8fISjFM1TE/80zvGCzYUu+SbuaixzTAyQXf
 tpBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrvXl1+XqdPNEzjNrCPed2sxKdbTUWvubFUfwBAkmkdj8/sjQEJK8YNjj7A2EM9uibZ3pPsisKQX/lXMZogFCWaK03Kt7Tmw==
X-Gm-Message-State: AOJu0Yy9FYVt3WGHzx2HVoNwdnc9Y7A43pdc9+V6YRWBjB+gYdrbSnLg
 0jERZUj6TcYj9Q3WX9odWApy6XipRMIlDkIfOfzDsAy/t8mVVA51uFHWBqs0/zA=
X-Google-Smtp-Source: AGHT+IF2apwEpgE4hCAyPqFVfGnaCIOkvaMabHv4ZMFK6VJeJw2z1djzhSmwxO9Dp+/gLgbnXdCT5A==
X-Received: by 2002:a7b:cd17:0:b0:418:4841:162a with SMTP id
 5b1f17b1804b1-421649f4f40mr4237055e9.15.1717699645019; 
 Thu, 06 Jun 2024 11:47:25 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c364bcdsm30046365e9.19.2024.06.06.11.47.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 11:47:24 -0700 (PDT)
Message-ID: <d3b95880-04cd-4172-a253-42f558b0f820@mind.be>
Date: Thu, 6 Jun 2024 20:47:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan Brattlof <bb@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240508-clk-fix-backport-v1-0-92b8e66fcac7@ti.com>
 <20240508-clk-fix-backport-v1-1-92b8e66fcac7@ti.com>
Content-Language: en-GB
In-Reply-To: <20240508-clk-fix-backport-v1-1-92b8e66fcac7@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717699645; x=1718304445; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cmkGKqhiva9PWk/9S8fiHwFUmLj6yfvTyYP6+D17vs0=;
 b=ayQo3VVzDcBWAygefcZvgkR68SobOEFnBEranRAlPO3hRc6Pf3s+Xxnp8HFoOtsYuz
 xbaz4eZWb4SVKh72BHlYyVdUd0FR7cDrOVBT8HNP46Uz9WpbPxApYPHcTixUf+QmF3EZ
 ZNOaq7Egx6ahfLntNRF4BMWbwAqrz8CQch3xZFg441cLvtgH/oW5pE/mjni3j5I1wP+Z
 n/Xy6Ga4REAGeWECwHiKv02DMhQSt9qIQw5NRG+57CWoyH9kntl3GgMrSuAcx9FN4iCn
 Qr+dc35e13xHvr7psC+vhTtSOWo94j963mL3FlmoKOOjzH9gAuok+XSaEF5d7yGBb9iv
 XwXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ayQo3VVz
Subject: Re: [Buildroot] [PATCH 1/2] board/ti/am64x-sk/patches/linux:
 backport linux clock fix
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/05/2024 16:49, Bryan Brattlof via buildroot wrote:
> With newer versions of DM or DMSC firmware (v09.02.07+) invalid clock
> requests will be NAKed and generate a warning in the kernel logs rather
> than being ignored like in previous versions of firmware. This, together
> with the linux clk driver assuming that all clock IDs are contiguous,
> can generate a significant amount of warnings during boot when many
> drivers are being probed.
> 
> A fix for this has been merged into Linux (commit: ad3ac13c6ec31)
> however the backport to older kernels was missed which unfortunately
> affects the current v6.8 kernel.
> 
> Manually backport this fix while we're using the v6.8 kernel
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
>   ...e-sci-clk-Adding-support-for-non-contiguo.patch | 74 ++++++++++++++++++++++
>   1 file changed, 74 insertions(+)
> 
> diff --git a/board/ti/am64x-sk/patches/linux/0001-clk-keystone-sci-clk-Adding-support-for-non-contiguo.patch b/board/ti/am64x-sk/patches/linux/0001-clk-keystone-sci-clk-Adding-support-for-non-contiguo.patch
> new file mode 100644
> index 0000000000000..bb2babf6aba0a
> --- /dev/null
> +++ b/board/ti/am64x-sk/patches/linux/0001-clk-keystone-sci-clk-Adding-support-for-non-contiguo.patch
> @@ -0,0 +1,74 @@
> +From 750cdf4cb6791c45d479ed73a97728100394fb32 Mon Sep 17 00:00:00 2001
> +From: Udit Kumar <u-kumar1@ti.com>
> +Date: Tue, 13 Feb 2024 13:56:40 +0530
> +Subject: [PATCH] clk: keystone: sci-clk: Adding support for non contiguous
> + clocks
> +X-Developer-Signature: v=1; a=openpgp-sha256; l=1876; i=bb@ti.com;
> + h=from:subject; bh=CKSvD6FpqwRzx8blynhoCEc3XUR5TlwjFJdcgjQwpgg=;
> + b=owNCWmg5MUFZJlNZHYzOLwAAZP/////7puP/r7v/9q9s+8t7wa8/97UZO//d+XvPsvfv2/+wA
> + RsYHaQAAAAAAAAGg09IPUGmgAaAANBoAAAGmnqAPU9Q0DQ0HqMQDQ8ptTeqeogaABoPU0NAPUAA
> + 0GgDJ6gANAAMg0GmgNGgDEGh6jR6h6hp6mgepoPU2oDTIGho0IaHqA00yDQNBoGTRoDTRkAZNAD
> + AmTIBkGjIGmQyAZDRkAaANAYIxBk0DQAAHODcFn1CAGBsJeG8ZtU3FQCBdLH7LjDIouHeAszY1j
> + AFkqjaWIFXEVi8NV3giRplb1JjCYunXimTaK06SgQRYsUGRSbKOVQP2t1LlAYS93QjOMWF6CHXK
> + 69KzHyBDpXR2mHAAkHcHX0X3SAYJkxPElwJ1ZnHK1RfDKRfJcRQKzxnryM+4x2mCxpIFIIjpVLk
> + nItd1Vl1SEF2QiWZIYV4b0lawcUqLGgTQZ0+qpJ5QORYrvPXE4DR89JlJYBU4DjxAoyACH6KN0o
> + AiaknqZTfMwmF8iREpU4SgDEVun3X3OFlkBp3hBO+Ynb12GJoLSFBSz9IWE2ooLKFalh5XJMZfl
> + +GthEEOnlrMQHOF8qCr+JAKqXEqSrwLGuEIMFbnGEjJYruo4ENGOmGVlkvW+kLRp5ibCXAAcDMM
> + TPOUZ/i7kinChIDsZnF4A==
> +X-Developer-Key: i=bb@ti.com; a=openpgp;
> + fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
> +
> +Most of clocks and their parents are defined in contiguous range,
> +But in few cases, there is gap in clock numbers[0].
> +Driver assumes clocks to be in contiguous range, and add their clock
> +ids incrementally.
> +
> +New firmware started returning error while calling get_freq and is_on
> +API for non-available clock ids.
> +
> +In this fix, driver checks and adds only valid clock ids.
> +
> +[0] https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j7200/clocks.html
> +Section Clocks for NAVSS0_CPTS_0 Device, clock id 12-15 not present.
> +
> +Fixes: 3c13933c6033 ("clk: keystone: sci-clk: add support for dynamically probing clocks")
> +Signed-off-by: Udit Kumar <u-kumar1@ti.com>
> +Reviewed-by: Nishanth Menon <nm@ti.com>

board/ti/am62x-sk/patches/linux/0001-clk-keystone-sci-clk-Adding-support-for-non-contiguo.patch:0: 
missing Upstream in the header 
(https://nightly.buildroot.org/#_additional_patch_documentation)

  Please run check-package :-)

  I added the Upstream tag and applied to master, thanks.

  Regards,
  Arnout

> +Signed-off-by: Bryan Brattlof <bb@ti.com>
> +---
> + drivers/clk/keystone/sci-clk.c | 10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
> +index 35fe197dd303c..eb2ef44869b23 100644
> +--- a/drivers/clk/keystone/sci-clk.c
> ++++ b/drivers/clk/keystone/sci-clk.c
> +@@ -516,6 +516,7 @@ static int ti_sci_scan_clocks_from_dt(struct sci_clk_provider *provider)
> + 	struct sci_clk *sci_clk, *prev;
> + 	int num_clks = 0;
> + 	int num_parents;
> ++	bool state;
> + 	int clk_id;
> + 	const char * const clk_names[] = {
> + 		"clocks", "assigned-clocks", "assigned-clock-parents", NULL
> +@@ -586,6 +587,15 @@ static int ti_sci_scan_clocks_from_dt(struct sci_clk_provider *provider)
> + 				clk_id = args.args[1] + 1;
> +
> + 				while (num_parents--) {
> ++					/* Check if this clock id is valid */
> ++					ret = provider->ops->is_auto(provider->sci,
> ++						sci_clk->dev_id, clk_id, &state);
> ++
> ++					if (ret) {
> ++						clk_id++;
> ++						continue;
> ++					}
> ++
> + 					sci_clk = devm_kzalloc(dev,
> + 							       sizeof(*sci_clk),
> + 							       GFP_KERNEL);
> +
> +base-commit: 9fbb5fcb41e7e96fb8769a9f5a12a35a984c23bd
> +--
> +2.43.2
> +
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
