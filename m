Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0B1D3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 11:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD34F40282;
	Mon, 29 Dec 2025 11:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1HY5EIF9qmU; Mon, 29 Dec 2025 11:25:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE8CD401F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767007558;
	bh=hkVL0M/gf5ydNE030oMmmOOwZRvz5NI/p+5Ngotpsvs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iA0CW95PMY3zNy5gBOqvh5YHM2nGtfwFYKPbyf4UA6lbTKBYEtVkbfnolQwj2kJhx
	 dDjov+co3wMbUk++2XqKUt4lUS0/Fsl/hUqd/my5N7iMiLoOdIDh8uRMRa1pd8lu/p
	 SI8I6Hbw2HUYJl3SEeLSzTUHchdlV6JTignSJeVIGTX3HSbuTuT4ndjpa897Tru7Hu
	 YWzJSXWo5mc3eJcFsYPYhjzG4peeVSduUmUF37P1fmnQhh4JRrrpCbsbC2hoTJG1Y0
	 JBH+BDayW0Qla2BFxCHAR66482cdWVGxZXN21v0QRz5MWLdHDPdpI88IzhgpyeNi3H
	 FNE7e9GqRTRWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE8CD401F7;
	Mon, 29 Dec 2025 11:25:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22E82D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 11:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20C0740459
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 11:25:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PrIkat2PNchh for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 11:25:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 38539400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38539400CE
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38539400CE
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 11:25:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id AB9032003CA;
 Mon, 29 Dec 2025 12:25:51 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 29 Dec 2025 12:25:51 +0100
MIME-Version: 1.0
Date: Mon, 29 Dec 2025 12:25:51 +0100
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250802083139.17758-1-shirokovalexs@gmail.com>
References: <20250802083139.17758-1-shirokovalexs@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <8a616ce8c8500bc8c5adde0480b91ce4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767007552;
 bh=DB4l2KLdNblVJ9wAiGHQLeJotrX7bhDA74/Sz76i5yU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Fmg03dJYZnlF4wVgy3wnnJXlSfAg1nkJKbPE7nCNDi5e+AQs4m//7Q9rV4kLn4bLv
 OkfWcYQa5HLI18v1URa0xGhx59xlTXrSqvBu9bWpPB98m+fO8nBYdWjQplV7+f4i30
 ESnfNzhHX0hL8lIlIPqlRgJB6UDhaqRR+cLRJtU392xmdgJAMUj2iUgKg3iXYZqKUn
 0ePrfvb390qwL0Flahk8Y5wEqEptDFTa4WbakOjXGZfaKK6UXFBCy1baJ0fdKWAIOA
 6LUyJok6SMsK8nblAWE5aEov0D93HxUFxbU+e03YUrgjweJC5mWcgDx2/s1ilN1odZ
 3XPejDhXR9IIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Fmg03dJY
Subject: Re: [Buildroot] [v1,1/1] package/aichat:new package
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

On 02/08/2025 10:31, Alexander Shirokov wrote:
> AIChat helps seamlessly integrate different LLM models, providing 
> access
> via the CLI and network. It can serve as a gateway to heterogeneous and
> distributed LLMs.
> 
> Handy features like roles, macros, and sessions help simplify 
> repetitive
> tasks and reuse of existing solutions. Features like playgrounds and
> arenas help to explore and compare models.
> 
> https://github.com/sigoden/AIChat
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
