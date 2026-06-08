Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BEECD8C9F
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 17:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2991C849A1;
	Mon,  8 Jun 2026 17:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sulg5M7QyZ7V; Mon,  8 Jun 2026 17:23:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 220FD8494F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780939385;
	bh=1PgrxoZq5hfyULLZc5NLJvBFTkSI9Sgmd5jL/vwarpQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mWbjh22m7aa2cW+H8ZyL7lkOxT2aPZt71DWXHSuVuwrcrBc9sOOY1RhV43e/A9/4B
	 dDiE2PvMh2wYJFZuRhqkvCmVfIbYY1LF2ihlhUEI/5A4i1ahTwPF8Xg71Lk9BbbErK
	 aZeMM36QJfyzP2sbuf2RvBL31u1Tqk+XeLLEvI45aHrHiz3hjgPUNfEI9ctASED87a
	 uQbZlT2rz/Z34acoYUiYqhyxGk6hpTN6J6qp/O8WJTevPTAc1cUnzX+TMY20tHHnNt
	 5MZJVXO1dsPzGFmtP7qCNpYnHoyj7nQjJLZ/+S147ZhLPSyE7rVJOmyBLt8Wf8J+YP
	 lFfNQefLUPi4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 220FD8494F;
	Mon,  8 Jun 2026 17:23:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6A742C1
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 17:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACF2741ECD
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 17:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OicTeoiaYeq9 for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 17:23:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AD89B41E22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD89B41E22
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD89B41E22
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 17:23:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id DA38613F8A9;
 Mon,  8 Jun 2026 19:22:57 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 08 Jun 2026 19:22:57 +0200
MIME-Version: 1.0
Date: Mon, 08 Jun 2026 19:22:57 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260607211849.1353654-1-romain.naour@smile.fr>
References: <20260607211849.1353654-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.16
Message-ID: <0be9661268f4203ec0aff00d2c14e853@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780939379;
 bh=URH+hPZlzvJHQFcaMxVQy9OocR+Fpqamtudkw2ky/co=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z8QdxaYZepyEqXUz7B5f7pyZYmGIDPYUaZ+umjKUU/+kRlwSWsrDjcj96QB/gb6gF
 oCRL7wCzIi1HYbEQoxotxOaQMFptO8p51Qo7moj0mVNWPFUH1AipESKBBog8oEk1D+
 RY9SgAbBf9RoPTN6m5fSU9abHNfkO5tA1ULmrCW24OaExG3RGfIaAP2V0FLLmPZ9Ra
 O3jbLAkk8g0SNRdwSAJzF1QxbllqYNl6fhNH/fEF2wQgAJ6ihApSpai2vifXRjkzez
 A6Wz/AdHVNRL97tk3NF2zHICSmKJsmZx9UU4PRHsqrVwnmJ7WtafDxCBsc1Hm1A1fE
 gGunq28GQp5GQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z8QdxaYZ
Subject: Re: [Buildroot] [PATCHv3] package/runc: fix regression with kernel
 without user namespace
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07/06/2026 23:18, Romain Naour via buildroot wrote:
> Since the runc security bump to version 1.3.5 [1], the TestOci fail due
> to missing user namespace support in the kernel:
> 
>     proc/self/setgroups: no such file or directory
> 
> The test was working well with runc 1.3.0. The regression is caused by
> this commit [2] from the 1.3.3 security release.
> 
> The regression is fixed by a refactoring from the 1.4.1 release [3].
> 
> Backport this commit on top of runc 1.3.5 (fixing some conflicts).
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/14696525946 (TestOci)
> 
> [1] e013e2df84fb36985261d7b3c6e6af06afd40f93
> [2] 
> https://github.com/opencontainers/runc/commit/7762edc82c36ba69a4ea88b86483fcdcac93f5a2
> [3] 
> https://github.com/opencontainers/runc/commit/323a54ef0d91a20f7d5be4308e5e65a98886bf4b
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
