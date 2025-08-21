Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1647CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C895284769;
	Thu, 21 Aug 2025 19:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tvdg0Zmvlz0F; Thu, 21 Aug 2025 19:22:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0621B847A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0621B847A0;
	Thu, 21 Aug 2025 19:22:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C89D1C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EC79416BA
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3iCDoYcDu2DR for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:21:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F5A541599
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F5A541599
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F5A541599
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:27 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b916fda762so1069963f8f.0
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804085; x=1756408885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rCumoRp+FYOTy5cmiNoiB2Irfu/1QAUG6/R1GxuT7PQ=;
 b=GKtKOAUMWip0heWryrhpzQPtMeUXh5KaZzuZYfNh+FtLtp6xm5msqSSPTWXzmAW5WX
 6nyo2E4vnKQzGp2Z4Ezde0BTWl+TTpAJp63it6/+rq+mg+QzFM7gEugTHJuvRrOZ1wyn
 vYHhRg2pteTuiaP7gwmZQEe/uHiRGII5KBvo3O+QwZwFJYCALa2tDGMHuHUEfqpDbdiC
 V8yG6UpC1JlxnWkya9sJoc41XrvJx/sjX9lT9Xk0O5WptoNukherXC1Uc39WV9Kld3Zi
 hJSn+MXjyc7VbuR/lyTMvDksXgeQGZc3EGYPj6k/pnJXzl3Um4MV7pmZTT64iJtbxma9
 eU/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzdPCsmv7AE2g6oMGnQetJZn+XFjVo0AO68HBV/TRPdpBpSOCBgwDJoeCTds6KZmpkriHNZulzvws=@buildroot.org
X-Gm-Message-State: AOJu0Yy8pSQkqnb/Rs6Fbyfd/ZWmanIxicOK2g+zz7JJVaMXpbTxMlji
 5KXhe/Ck7fButIygf1tw8S2aFwq3VM4TMn1F0rfKZ82rCDN5c9SFa+/hL7AUABqGZ3rhQ8EeLXM
 0w1TwkP0=
X-Gm-Gg: ASbGncuy4B9ri/IlUR4I/7Ek2gCMSys9TjwCyz6/u79EyT2afDTJxvHqf9WcqUwrnKI
 i6zQwgHYlIuCTrm/f7HuBrLf5U87lLM0Iscam2JqWophn2NxVDTNUG3yabxJ2+fSHOfS+aK1CWu
 fOQfXMgPgK6pAYXSBcyqHNUmkOy/bQmHc31Jw6njBxx/c8QQRb+/bD1hfbyZ7x14Gh6mItKsqEc
 7mCFF9zHOcaL5FY/9BcnEKl5byKQLZmaxEzeSafOQ5sIQJseBu0sfLHMrKTrjOTetzxN+WsVmAh
 w/oJBCYH5j1c5+Np+PbcHHHvf14JHTKYvhTWVjLYl/5w53lkGgIuMxQT1zkmMYPBoUN2yQjC48K
 pQYj9YT2zDMxgPg==
X-Google-Smtp-Source: AGHT+IGShCK4YyX2bYkJV2AErMPsTa1vUgdFovQ+xg7gXXX2QzpFaP78ytI129jro6DpPQ2+HCGAZg==
X-Received: by 2002:a05:6000:4201:b0:3b7:775d:e923 with SMTP id
 ffacd0b85a97d-3c4ae74ecedmr3368164f8f.4.1755804085122; 
 Thu, 21 Aug 2025 12:21:25 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c0777892f8sm12426501f8f.53.2025.08.21.12.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:21:24 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:21:24 +0200
Message-ID: <20250821192124.24665-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816152519.198872-1-ju.o@free.fr>
References: <20250816152519.198872-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804085; x=1756408885; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rCumoRp+FYOTy5cmiNoiB2Irfu/1QAUG6/R1GxuT7PQ=;
 b=On7Pagk593euzG8MzTH/VOiOglqJ3bTYzJTCBYAe4IfS487I1cObhNuGhD98+u7Ynn
 E7rdB10X3xtdHLTNAx39DVzn99Hoa4LEuDdmANbDQlU0KSVzcWk2cBnYB19jDXq2nPHs
 yAUSGmGc8cMtaRyZYDGE0vp/sUEotq03dRvTGCFTtL6DWk8Tx+f8MT+Q0SlFN/jsXgLm
 R++GaDU9cyx4VlUIlXG4r15ULEL/rUAzIfQjc1/41Z7RpITyKSIPSiMDdHkP+EtgYeEQ
 12uxYbRF+u4Laqg/0NknPYlGPRJ9feqf2D2U0aGNyN91OfsWa3bU99IFV6XgClW9Hhpo
 wxGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=On7Pagk5
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_dmidecode: fix
 test after bootlin toolchains update
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
> the tests.package.test_dmidecode fails when building its Kernel 6.6.39
> with gcc 15.1.0.
> 
> This commit fixes the issue by updating the test Kernel to the
> latest 6.6.y version (6.6.102 at the time of this commit) which
> includes the fix for gcc-15.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/10984686001
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/947dbc92a20c5acea7882166cae7893e6ea661e1
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  support/testing/tests/package/test_dmidecode.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_dmidecode.py b/support/testing/tests/package/test_dmidecode.py
> index 33c19f0d96..087075a7bb 100644
> --- a/support/testing/tests/package/test_dmidecode.py
> +++ b/support/testing/tests/package/test_dmidecode.py
> @@ -14,7 +14,7 @@ class TestDmidecode(infra.basetest.BRTest):
>          BR2_TOOLCHAIN_EXTERNAL=y
>          BR2_LINUX_KERNEL=y
>          BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.39"
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
