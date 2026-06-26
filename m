Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26439C43638
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E99C982364;
	Fri, 26 Jun 2026 14:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B1ssbnIvl4e9; Fri, 26 Jun 2026 14:55:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2017E82358
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485736;
	bh=iR/1Nxmu/Ud+qCVCG9W/1R52Rctcf54HIzE//FPLEEg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Hqul2lSYxIsyG20gv/15ru14SI8IAUyUrn3Y8aYM5a+RO9FJu/vo2M1+dT//gdM6j
	 kaLGvdJcSXlGAnTk3g0DIu3D5bPjdKPWEpiFpq+2EZEDFBrcF3qFoa8N9FU6/9dtEb
	 VM5A/U/5r0kh43eTI8b3Fe96t+dii526EaITKUGfUR6MuXs3L+WsxCTEhtHT5VFkyC
	 wNbEm/VOq9k0iJKcAf7l/t3CWCNuxyPXQ4ra2lGx+GAIvXaNpT9hHwVJUr8CvulsNL
	 xQkb1I+2w9lE2pR49A0xzJ6ua3VMXSP7tecF1OEURg0xca6rRHxRWKLXzLVBtUxQFE
	 EgCZT1vdJi4cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2017E82358;
	Fri, 26 Jun 2026 14:55:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61785231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 533CA82350
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1OcK5GSX8fE for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:55:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7077E82345
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7077E82345
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7077E82345
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:29 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-46e22950091so652464f8f.0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485727; x=1783090527;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6R2aD4W1kGPPFUTv6JPvK7ffnrLy+0FaYuFe2Uu9r7Q=;
 b=N0Iiq0Z0uoUMO9s+hRnrVGCWsCPILJmbJIXRpkwXs6/xGd9UpdT3/OOtgMT9Ngttyx
 Ukpi2xsWWAgfquB8QghXSO4Qne53NygrkqCmFOUtLVFKNjzLgEGn7qsV5Ny5U7JK+rVA
 u9c3Zg6BrqBNvrdMhekc0HIULG96sKt7FqMCdnVu8+Wef6/ds+DlbJGNFUH69CKxC408
 hzZffj0Xdg/tad+Mv/4gYoKY/y4cSkOi/kKBU9gZJAIoZNLof2lRUi4FZwipomoxuZv0
 IVmY1y0tec98kXkwL9+W5A3xWfmzTpWuVa4UgsK14p2XCWNIpnQNeoIAfUCjmN5T6q5X
 SvYQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrWJYrM3blLqclzFgwO2uMio6tg2md5pPAp/rR60uUs69Z5oeEYbv3YBLL11w7yCuwzAHNFNuZVbNg=@buildroot.org
X-Gm-Message-State: AOJu0YyyCyRLhdGzQjz2m66sC9jRFE/mzxYNCC77wVGvIVBthXzPMS1O
 Eakwx2XrI+8OtL+LEonShaY0mhQrnaLQbDJt0+auXJeJMa3nrZVmomv/Iccw2ZsexfY=
X-Gm-Gg: AfdE7cm3fxzEBSd7FWOKt7b7hZOCtdJ+owqqBP133wRKNp4gUHQSya4cxOY70kTBmvk
 1BZVwR6aO9ahGTYyK6Hxdc1tTWWtNOjH3xSCCaBhrAd1L8vUE2FiY+HGIzZ5TxMnOKpM8fKJsOM
 fndfgawWD7t/9UMKNfrI2gNKj2rZRZKNq/NdPzVE5U+TDpo5RDqALKtYBo9CoF86qu0MrPprWrE
 LjZe5+x/slkT5zXDKdlk4OwC479dlY2KPYG/5Qic6HsBTZmX9kn9Hcj2cPLhUwEZ3yaGoEJgAr7
 jEcwWmWgd0OLVzYgXDjyL+Yz4TfRWkjkWZFAeqRwOkWut6o0n5sI7gs3EFQ7UuTbBixRTFaAe1d
 DZCnwr9x+OXarr6aqw+hTf2e7lqUURqdEficVfUvHowwDbxCOH5IGtgl5yWgtUhNK/YJjRqSmra
 hBS/Mh
X-Received: by 2002:a05:6000:50c:b0:461:fc84:dbee with SMTP id
 ffacd0b85a97d-46fb70c19f4mr1551924f8f.16.1782485727459; 
 Fri, 26 Jun 2026 07:55:27 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1ee0189esm26645451f8f.9.2026.06.26.07.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:55:26 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:55:26 +0200
Message-ID: <20260626145526.342949-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-20-peter@korsgaard.com>
References: <20260618124835.2935850-20-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485727; x=1783090527; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6R2aD4W1kGPPFUTv6JPvK7ffnrLy+0FaYuFe2Uu9r7Q=;
 b=Vg/rFqFsschQbRQimiFVDRIgPfdV6LjglfQJ0Tj90OUEJNTqxcpRFcQeVX0Bmpp50e
 aOmjDqUUOGhjG8mLfkIq8w9EuqfUE/Q7eC7t4YFGfENlknq0ZqnETathL1VciofcUu+o
 fYTi5S9vzjeqaYeX7w9SW8FEzt67c9yDGyL6iDBM9Qa6dS80deUsx7pV8p3Me95cPo2J
 YmOprrbOxeBxP6PHdZG50IHDfL1m6jIMOlmfzp9v5LwiXifcIUYp6//A88gv075Ho41A
 WYLV4eeVIDOLDdCR/9V4qcU+J6DTL8mj3yzY+75N0Jt7xpsLm6girIjyF2+cA38c06HO
 uG0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Vg/rFqFs
Subject: Re: [Buildroot] [PATCH 20/29] support/testing: test_nftables.py:
 use assertRunNotOk()
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
> Use the helper to simplify the test.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2026.05.x. Thanks

> ---
>  support/testing/tests/package/test_nftables.py | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_nftables.py b/support/testing/tests/package/test_nftables.py
> index 2622c7e822..62e14d5d35 100644
> --- a/support/testing/tests/package/test_nftables.py
> +++ b/support/testing/tests/package/test_nftables.py
> @@ -69,8 +69,7 @@ class TestNftables(infra.basetest.BRTest):
>          # A ping to 127.0.0.2 is expected to fail, because our rule is
>          # supposed to drop it.
>          ping_test_cmd = ping_cmd_prefix + "127.0.0.2"
> -        _, exit_code = self.emulator.run(ping_test_cmd)
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk(ping_test_cmd)
>  
>          # We completely delete the table. This should also delete the
>          # chain and the rule.
> @@ -128,8 +127,7 @@ class TestNftablesInit(TestNftables):
>          # should allow ping to 127.0.0.1, but not 127.0.0.2.
>          ping_cmd_prefix = "ping -c 3 -i 0.5 -W 2 "
>          self.assertRunOk(ping_cmd_prefix + "127.0.0.1")
> -        _, exit_code = self.emulator.run(ping_cmd_prefix + "127.0.0.2")
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk(ping_cmd_prefix + "127.0.0.2")
>  
>          # Stop should flush the rules, ping to both addresses should
>          # work now.
> @@ -140,5 +138,4 @@ class TestNftablesInit(TestNftables):
>          # Start is essentially the same as reload, check that
>          # 127.0.0.2 gets blocked again.
>          self.assertRunOk("/etc/init.d/S35nftables start")
> -        _, exit_code = self.emulator.run(ping_cmd_prefix + "127.0.0.2")
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk(ping_cmd_prefix + "127.0.0.2")
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
