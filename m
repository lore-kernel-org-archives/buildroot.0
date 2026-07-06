Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07CBC43458
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 03:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EB6E40A03;
	Mon,  6 Jul 2026 03:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X5cl_R2IDcWB; Mon,  6 Jul 2026 03:33:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A77D3409D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783308824;
	bh=H5oHCssORkovMBtbQ9ZFMThWHmOfL5i5FeYTuuttnEs=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jQwWf3FkIbc8xs+g1iQL0gHVGFb1yJ+BvUBTWJLGPDmyV9j4uke0W9/z+hU7UR7s/
	 LIazTZRMZFg92xn5VKMRyu2bKIVJIk6R3he8FCGesaT9XgTRi+LRLL/0jmfCKixRGm
	 QVLALiuY/sP+1SFJ7luP16gkuPY+fA1UkjhH8+3N4o9NtAQ9chhc4tyxxhDXNoTTvz
	 JEQmZWltatpXypEPi42n8NwZFxotAQZQYmEAUseL0sbcLQAGynQT18bWS+CEyVPtFA
	 T+lT2x2fwW3Lt0iRcSIECuXXPwtc00g3mFcgMk2AUvzZUw2T8WQbIUbHvC2345CoBM
	 Pw1Szu/RsHJYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A77D3409D4;
	Mon,  6 Jul 2026 03:33:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 60E902A8
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 03:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F6C98120C
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 03:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wuyTgP3mJGiU for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 03:33:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B4638120B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B4638120B
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B4638120B
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 03:33:42 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-39af87c4589so23142051fa.2
 for <buildroot@buildroot.org>; Sun, 05 Jul 2026 20:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783308820; x=1783913620;
 h=user-agent:mime-version:date:content-transfer-encoding:organization
 :references:in-reply-to:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UYw4mBgIObVoEcBKcpZxX9XtF1OjF0gCx5a1tc23zqM=;
 b=HBwHa6aYBDse+kqs2+8H2209u6p2c142uYhoI91L7mhVrBZfqjDXjPc5wHaiFI/oKY
 1f8Hi2846PzFUWNiCALwQJ13+OiXjsbC9b0FzZNLAQchHlgJ/eaFZrcqkFKrXKyTmPEj
 LVoR/1zNyLhRU2GvCGaFYTfasHaFSUZqsqVIa6qZ7pKaIgc2ChL6ojZXCfcbHrWPNimi
 qEmXVjCEiZe9DV0JNXmiQ2mWtrLICznKao3F/Ty8O7HuVkEnqGKyUkmnyBn1k1qsLjmO
 HByYfZNV05oh7tBsJib0zLhId+L1ZWRm4fELGNcge26bqeHHx3cCAqlMNdHZKUHXM9K7
 Bp0g==
X-Forwarded-Encrypted: i=1;
 AHgh+RrCl5AZHAQA66LkZi9oafSV2AIx700KFPFSprsWaMv5JFWl6yILOG0pQGVeHc29p1pQbnRiN84uOJg=@buildroot.org
X-Gm-Message-State: AOJu0YyXieCsKZWGmfkt8i4o1d2B2ohJuOoFMx1LQZjAA8Uv+s5NXM0V
 vzPR4gAnVYJN6r+xNDHq60bPm8nSZzX0CPXMbSF/DgkNFQWJgiGwCLPZ
X-Gm-Gg: AfdE7cliJ0MOxcntYQjK3Z+DNuWH85lUd0wbn+nF2ZbF9rvGnkrPxRXswtzpV9AprD4
 Idsb4g78IInFBRiZblbnrJfvuLgspYe3qnXUMhfgq9lJH/vLmTOWnZ1Ho+sn5d+Bsrpx8DbFf/I
 R792G2VCoPN3BEcNtRPQlJVecyePREWfAbNfj7d4BuB6UsLl4OZA/36HVQ1gQSglj6PxrXtRk3o
 vi3KiFmxDI739KAlft5LHS6ynLj3qpozK/myuETT189ApBoQWFvf7ruRRVXAjpbIwmVqggdTlrI
 dTfSGZAjBA75i2fDnzMuPQWgaYxiS5wlhaq1druEr6RvZ9moVZ1ouIpco53hHb5MfTtWcxAIqUa
 AXWuElD+XBvPey9RYTkSuKc/ekMqRlfaxNlk2thUMfGcD23Z3kxMVHkxSIJ9oiEVWWGVg/6wCK3
 MqYtfe/6+IuSyX4IwPRkE3ZJsrLCif0G+e/z0idV+RxnnTK6iPNQ==
X-Received: by 2002:a2e:a90b:0:b0:39b:da8:cc3d with SMTP id
 38308e7fff4ca-39b53d42d31mr14260311fa.22.1783308819534; 
 Sun, 05 Jul 2026 20:33:39 -0700 (PDT)
Received: from [192.168.0.42] (h-158-174-22-6.NA.cust.bahnhof.se.
 [158.174.22.6]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-39b4ae810fesm16477371fa.42.2026.07.05.20.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2026 20:33:37 -0700 (PDT)
Message-ID: <40d76b0db9c0c3c4084e4c81921f13286d02b9f9.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
In-Reply-To: <20260704075843.1758771-1-bernd@kuhls.net>
References: <20260704075843.1758771-1-bernd@kuhls.net>
Organization: wires.se
Date: Mon, 06 Jul 2026 05:33:36 +0200
MIME-Version: 1.0
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783308820; x=1783913620; darn=buildroot.org;
 h=user-agent:mime-version:date:content-transfer-encoding:organization
 :references:in-reply-to:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UYw4mBgIObVoEcBKcpZxX9XtF1OjF0gCx5a1tc23zqM=;
 b=rjkdDX64n1NAgBTuA6O0Fq1n1MXYapDP2ae3vBjB2SL8r9GxRGLimlWix0EWQvDwQr
 d64ia8TIO6H/twFwQQ+wtn4SYxuCGvC7PwPwJvAnplUP09lGsfs/pmm9A15zXcw5l7Bc
 BzKHj3I8a5iKD6bbmIsbiLWXas3h5Bgv0Uu6ZLWfYUinpdzdpzO8dT5GDGdogq8Y1V1Z
 YhfmjHbSo8kKehl4psCWe7kqSB5RfkFydTD0j0IOYrfVUcP/Y5xn7rTNEjBRUzZ7WOsm
 S3DXFjMiFQGU8OGDK/EpyQLnLyTTl2xLD+riKCCmKqbPxTm+0orFd5TGUU9B2rZr4DWM
 Qj1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=rjkdDX64
Subject: Re: [Buildroot] [PATCH 1/1] package/smcroute: bump version to 2.6.0
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

On Sat, 2026-07-04 at 09:58 +0200, Bernd Kuhls wrote:
> https://github.com/troglobit/smcroute/blob/2.6.0/ChangeLog.md
> 
> Used sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Acked-by: Joachim Wiberg <troglobit@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
