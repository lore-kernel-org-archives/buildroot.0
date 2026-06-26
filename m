Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC755C43638
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC6206115E;
	Fri, 26 Jun 2026 14:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hAir4ZoKukEO; Fri, 26 Jun 2026 14:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAD6361178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485808;
	bh=jpVZh+EnWPO+1W8H/4iIWUp9wrpC7u/AzYu9BrLZ1Wg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=tIfjE3JBtxKk4bm+0wD84TY5l9lW6W5+x+JXGTDEig3IBDzEjxfXSQlrS46n2EkFY
	 amDsIVdo2WErwPBi9gsQThM/FBTS8DQlUbuMIpOJ3B5EynwypSxSDhXQNWUba6a58q
	 dYzVOAO/QgPrDhzlK3Ymz7ojXXqSjr0XG7PxB/xiT2hDyRTo6vwQpD3XvI56kjCIq1
	 1LrHfAIiyM979c8sYhPYNkFq9mG7eUUZZ2LYmMORTpffMOA3xRH57iHnpr+stFJUoQ
	 9DUS5ZD0868TdnVjUB1NFR9JRxin7ivYSxR1c5bhacK2by715mcVo9OGSjfZyfMxQ1
	 cKtgQsY7eydWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAD6361178;
	Fri, 26 Jun 2026 14:56:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A0383A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1FD5610AA
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qQy_-DU_8gpC for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7150461105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7150461105
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7150461105
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:28 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4926bd21aa1so7178325e9.3
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485786; x=1783090586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3moi3vrZDFEKRNP5Uo8vPiuAjlabvRT40fc+7ov3GyU=;
 b=KK6x2ZcHUWZN8sNtwZ+tHCqNhRqdk3mHwIvIoEKWzhYCWF2jEWWbrZGIX3UCY3iWXy
 O/H7D/whOH6r2Rydv3UmuhksHcZM/VV8snU5hj6dhWr7XXTYRu9xuGl2rIn7236rlQmP
 VE62Ll7BoeGypxxHsmS6qZIqhtskluwD7haQ0c1DBO8ThfJ4DMsJoKrmeCougLsbgGCs
 V54RUX5F9WvSHNn1l+UFT4NtHeLwAdzQB4d+CCOtaZgnnd+CWx6QuXZjHgR7tuNNoaZ2
 /dHw9LaMZ8pUDEfzRd6446nmwRoWj1wc4z5NyFTyP3oxzipCrIKi6aGnoEoeQlZysR7R
 mv2w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/gFDssj0Vz+vCEBXn/AqdAltnCsamKNF+ULcKWWn0G/SqaQrJIsEUzS+ubEZjcTKZ/P0FG8W00Un0=@buildroot.org
X-Gm-Message-State: AOJu0Yz92mXP+QBs7WbKIwcoDuXVjUY9qgh8X1Ijy2iNeqcytSHG5At/
 H6eOKiSdD6Y39gM6pYt73/AFqtmX/l1TYl4obRAESkwEJGh0/Ncdz37hkUcPZdaRVEk=
X-Gm-Gg: AfdE7ckVcJrk70Rzv3Ufr2mUx5QlXxUfl3LfkVvgHVTK9paLwjuI2wSBsYIY8NCXAKD
 FHpYdTObHl4cH+35VqLlrHFbAkvb95u+bsOXDTeXsT88sQexSMd6e4Z3k92YsPPWOSz9fBftnqf
 xmlJPbGhoO+EJhgwJQu1vRXVcgtJQMxkh0bnUBBdGs3k4IKw9TjwZNi4Ax/F0mqFjsVzZnFDipu
 7RgEM5175yR5fp/MSOOmjrUg2Aug6q6GHGg+f8AVniTiReNMQSgyyt3CdpZNts5aQQvO8YjyTJ6
 H2RQYpVb3AUq62EvDSQeQMlt/iI4xngT+foRkXrdT7/LRQUuLEkVxO4w+KWLppv+2EWi4G6SPRP
 ZE6ZP0gb9AgPQs0eZl+SPEIkC+hXmjWLVXnU4CiBJSY+Q0Z+etOKDuN/EeCgAxJRi5nV/AhoSxb
 9FL0zHMxj3o8YnwkY=
X-Received: by 2002:a05:600c:8b08:b0:490:b473:8f78 with SMTP id
 5b1f17b1804b1-4926687e70cmr98698905e9.17.1782485786352; 
 Fri, 26 Jun 2026 07:56:26 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492691f60bcsm87598965e9.1.2026.06.26.07.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:26 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:25 +0200
Message-ID: <20260626145625.345114-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-28-peter@korsgaard.com>
References: <20260618124835.2935850-28-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485786; x=1783090586; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3moi3vrZDFEKRNP5Uo8vPiuAjlabvRT40fc+7ov3GyU=;
 b=BVhSfgI+wI8IPIhcvN3fR3HJSfhKLIYErDUnUQuu1Mxl1hgCiSO8Cli/FnfohiJz+w
 ccWtzSXGbVSo2KeBU00ad5epbfsh9swd2A4EN7SnYgUvMBGsgIWJNTCMucSGbqYoiwvg
 /HphxzELwHFKYZ96hkmXzr4hH/Ya6xG4CG8Oqt8ftrVT3QoYFerBFnCoRP2zGTGEMqEX
 NKtdBK34DsUGDlJfqui0FQKz1yDvkOLmWLe4Lv6clAxeEohgQLhMwNzhcTGryRqiQ6lj
 m/lXm4Mf+K4He9bno8WCMOeI+bO0rF5EzU6/Pg7kxvHFWJIUhncCpUgoV+D/cJIvL2vW
 5Jfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BVhSfgI+
Subject: Re: [Buildroot] [PATCH 28/29] support/testing: test_weston.py: use
 assertRunNotOk()
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

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  support/testing/tests/package/test_weston.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
> index c8b243a6a7..737015f8c4 100644
> --- a/support/testing/tests/package/test_weston.py
> +++ b/support/testing/tests/package/test_weston.py
> @@ -150,5 +150,4 @@ class TestWeston(infra.basetest.BRTest, GraphicsBase):
>  
>          # Now weston is supposed to be stopped,
>          # a simple client is expected to fail.
> -        _, exit_code = self.emulator.run("wayland-info")
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk("wayland-info")
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
