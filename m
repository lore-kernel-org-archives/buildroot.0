Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E728ACA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF953847BB;
	Thu, 21 Aug 2025 19:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3wvjOsOjGVQF; Thu, 21 Aug 2025 19:22:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D1A5847B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D1A5847B4;
	Thu, 21 Aug 2025 19:22:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EAD351C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E869840D31
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VB80UIY-CXgx for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:21:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0DA9240D21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DA9240D21
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DA9240D21
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:27 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b9e4106460so1184029f8f.2
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804086; x=1756408886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mPsjma2jNoqLcHdajyo+1d2stjsgIfwsBeGPQApAqss=;
 b=wVBYbrdTPZm45sfI5bMoZ2F3xHOdezjjYKDtPguc6lNyPwz4USNl2SuUG5XaZxjXg0
 RqqT/HBY3tusDjy+C+kzqKm2X30faUKLpJWATtiXCjb/jlirjIFrFTVMFJclz671ctqu
 sQn1e0eXR8LKMM1yNghhvvBpFiqQZ25Y6BQiyPn7nGm5tPYystyC+83aZ6H/yq3hz7ee
 1a5PMkfUIn1r5k0xRGDrW9PmE0/5+1JXFexuteVahwRSEBGutBf2Lkavm7C163G12ahX
 os1EuDRN9DXiAJ03oY0OOUY2I7JJHkvrN4iJMpirJ426xQh3F+tQWuR6Ok5YEiHihmvS
 5CSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbDUPSdX7JypeYziJdvfXBL3DR/9uBdXO/N8btteAWXuNgbKI0pXVlKOajgSfAJ/7fLrPT0YWTvCs=@buildroot.org
X-Gm-Message-State: AOJu0Yy9FrwWxIygmYyGtVajTakI4Wqh0/3a4CicYagZpuDUa1L5rF8T
 yHvOHpy0W6agbKscW9UwU5o1th6EW0C6C5lRxODmD7uu5gUylvOQKS449V3M+9PGuTU=
X-Gm-Gg: ASbGncvJjgPHfXjb/WpsmzWKZiZbWPCNWOhreJL6r91TTuw1mwzhxYLPKLEL8/K4Zp0
 5L/i2bi1puK0/xtJx5yNHucqAixDTgxpNYcEAGd4W7D4lFNtlNKFfvT2+xzkN0oIFctcfxVCSq8
 zcbAX1r5rv2ATlLsumuybNUxJ7zcWnIWQrl2APVeOZkEtgi29F4tA/dlnHBSNR2XZsTQnFdLoMO
 KVIwfZcbRfP0+VRelFNFvYTRayh3Vy2ZtfO1BYAJbjB9AwYA4l+rh0wSwEWEGqP7N5n0k97wXeH
 tsRNVdAuk1B0/p2HAfTxWjcVobj95LcpTVlxdQfbbGjd5Etz502O+cww4bjURSPDtG1Xui+nGXa
 vSLZPivOiivwGvA==
X-Google-Smtp-Source: AGHT+IECHvvKqrctBKzaHbw9TLSRBLLtBiI3uqgPYmjlYKjGg/398w15cqBytehyj7rmQkB+YUV4LA==
X-Received: by 2002:a05:6000:18a9:b0:3c5:374c:1265 with SMTP id
 ffacd0b85a97d-3c5db0ef49fmr134374f8f.24.1755804086095; 
 Thu, 21 Aug 2025 12:21:26 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c5e024eee4sm110230f8f.66.2025.08.21.12.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:21:25 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:21:25 +0200
Message-ID: <20250821192125.24714-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816001117.246947-1-ju.o@free.fr>
References: <20250816001117.246947-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804086; x=1756408886; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mPsjma2jNoqLcHdajyo+1d2stjsgIfwsBeGPQApAqss=;
 b=HwXjH10sT4QNJ2hiw1qVp3lPmFQ2ydvONsVxI4VdalHXu4T7YdHmHXCCW4p3waNdFj
 W24wHEgiB1Dp5760jUt592uuKTikbmVD6Gy+4iVdssPLXOazL8Jkp6IQ7WykeE8U73PU
 02W9BSRBCKd8CTDmK6X90IGRwCOKvPQW00XtAZhdL5mAENvs2F2ZZUVEQmslJFQ+uo+z
 pd1AzwLalzBFPd+SHKAkG2zG40b23iW/i/MOG3WrpGgENsYS4MZVTHA9HFi2UVB9NzBc
 PTjACqvNE1KshK5tQnWK41XAaCaDmv4+3rpnBDLRdw5XMBVkGuXV3rgp5Yvh+ns11fxz
 egpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HwXjH10s
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_dpdk: fix test
 after bootlin toolchains update
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

In reply of:
> Since Buildroot commit [1] "update to Bootlin toolchains 2025.08-1",
> the tests.package.test_dpdk fails to build its Kernel 6.6.58 with
> gcc 15.1.0.
> 
> This commit fixes the issue by updating the test Kernel version to
> the latest 6.6.y version (6.6.102 at the time of this commit) which
> includes the fix for gcc-15.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/10984686010
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/947dbc92a20c5acea7882166cae7893e6ea661e1
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  support/testing/tests/package/test_dpdk.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_dpdk.py b/support/testing/tests/package/test_dpdk.py
> index de2828298a..6f55cddee8 100644
> --- a/support/testing/tests/package/test_dpdk.py
> +++ b/support/testing/tests/package/test_dpdk.py
> @@ -11,7 +11,7 @@ class TestDPDK(infra.basetest.BRTest):
>          BR2_TOOLCHAIN_EXTERNAL=y
>          BR2_LINUX_KERNEL=y
>          BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.58"
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.102"
>          BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>          BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
>          BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
