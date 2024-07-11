Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98486C3DA45
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 22:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DC6D4016D;
	Thu, 11 Jul 2024 22:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOgj83bGKaz3; Thu, 11 Jul 2024 22:08:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C65B840277
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C65B840277;
	Thu, 11 Jul 2024 22:08:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 87ECC1BF860
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 22:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7332F84108
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 22:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KukjyTuIMPpK for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 22:08:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6793F84103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6793F84103
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6793F84103
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 22:08:38 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42797bcfc77so9177415e9.2
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 15:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720735716; x=1721340516;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eK8kveqBQkMRO2vJ14URcI1h4QyUl2EjFjWE0BqAe5A=;
 b=TA44ffgFX4UoDWafhqcPvUTQDZpsLEJMLZ3oSJCCZjDc0a0RXhGYkvYNtJ8Ia29ZWz
 LWTxLtAEAWwbNSea9H6oNpLmQVHzRjMbAkQdgkgN6yJgMPpeF61F5yKtR5lDmmE2Sdx0
 yFyW1b9lHoUs5zQpySwnwz90g7UPHBSdFt3y3NH/s4XObJLb1sm1zbL0VwmL5IGCpUeI
 dUJtXFzE8N3C0mC5Ec1h916nTCfNTGvqBiecjQivv/er2xGkOjoQJzHY1xgrIp3dFnPJ
 AbEGJ7f+37Gm7k+gG35Zhs8G+kYULul+V9pw9NK52hFSLLqtyXW8z7sngDDP9ElDPhwj
 5AjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJOTaaHwBH9QrsDG7GRy/tvau7SKn4m0tso6vtwxsIEb+/fN0cFafcuZUeTjUFY7fJxrYD2xS1idFJ9px3PvV8h4q0Wm42Kw==
X-Gm-Message-State: AOJu0YyVsZJy13QvNxoqFROPan6tNonyMgr03AZbSpyjrUBRw5BCSMMz
 ZlDX/zgL5FL/uoRJTJFvScRINvEOkxPNvgeDe22JHP2kAcyFV5CP/Di586HIMBY=
X-Google-Smtp-Source: AGHT+IE/mKyPje6JrrA/2YzqyYdlCpyUmPH1OnFaNWHu8jeMeT7GcpROL7kK3cJ4Yo+7HkGSbHgetQ==
X-Received: by 2002:a05:600c:70a:b0:426:6320:226a with SMTP id
 5b1f17b1804b1-426707db6f3mr64685775e9.15.1720735716357; 
 Thu, 11 Jul 2024 15:08:36 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde89164sm8763504f8f.63.2024.07.11.15.08.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 15:08:35 -0700 (PDT)
Message-ID: <c8f71ea8-a7dc-457a-90ea-2af4084eb484@mind.be>
Date: Fri, 12 Jul 2024 00:08:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>, buildroot@buildroot.org
References: <20240611141216.1211627-1-roy.kollen.svendsen@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240611141216.1211627-1-roy.kollen.svendsen@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720735716; x=1721340516; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eK8kveqBQkMRO2vJ14URcI1h4QyUl2EjFjWE0BqAe5A=;
 b=LDMOF1dcojxuGxivyMcd2tYQ8M5oLWTWL9DXEUXtC/vkjhXKNq7kdGnrmn8EKozKGX
 cnrHnF+gBpgR3LVxXPN9gZ/aRxCvNJf8K6Lvj+7nYs9Ma0vQ2OYoAGJzzqYMNuE5MJT7
 SsKiIpYsI3lUYW8Ip0Gh7Jj8L8EOOqf/O9jKyNL0E90H1fJUErVRCCubOpLrC2otdI45
 C+7Ot7A7PZRAb7TWqF0bYnLg6JjUq426tPltrkETqolqemO4na8wDzsWOTJ0idKGMQLq
 93CbAs0K48Pw1kT9bjsxaXPo1PlvvIzgm2Hwvlq7e8MhQi0pFm5P9/VqVPhOSXaTm9Ku
 C2+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=LDMOF1dc
Subject: Re: [Buildroot] [PATCH] package/qt5: bump packages to lateste kde
 submodule versions
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@gmail.com>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Roy,

On 11/06/2024 16:12, Roy Kollen Svendsen wrote:
> Bump qt5 packages to latest submodule versions from:
> https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15

  Your Signoff is missing...

  You can just reply to this mail with your signoff and we can add it while 
applying.


  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
