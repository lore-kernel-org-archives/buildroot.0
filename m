Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22D4CD4851
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 13:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE81981EAD;
	Thu, 14 May 2026 13:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CTjn0WvYH2sE; Thu, 14 May 2026 13:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3E8981EA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778766238;
	bh=KoL1T12+FHeeMXRIsBFqnpqsWUzvdzhH3qB0CCeVDKw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gpF5l/D+PKAEhgFDaNia7dtKm16W1Urlox18fsH3bJaBKU0DS/k3XGc49Vi5qRlRo
	 wNFrPuh+4rYM67LPFh2GKAmlpFQMbsqq51iDYkdR7Rqrl4iGobVYgaJG8n5fzptT55
	 iNhmj9R1JLlYnHJDZ12MrtnxrV7xqDZRLa/N+MmWJMwLNmduFZs3pR8evb0PKt+epv
	 tt61AYGouDiHvsBqvCDKJ2WpS4gTprskhY9kKblqY61F0UtZEfnGYtSuqAE3XLsWnU
	 EjdgQPc9cJTvnG9hd3IGl4o9a4adIGES4rqeQ12jCNlPx8pTGBl1idp/slqR412Rna
	 hCsZG3CmpU2XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3E8981EA0;
	Thu, 14 May 2026 13:43:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EA8F37D
 for <buildroot@buildroot.org>; Thu, 14 May 2026 13:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EDB460E8A
 for <buildroot@buildroot.org>; Thu, 14 May 2026 13:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OCPD5-LTUiLj for <buildroot@buildroot.org>;
 Thu, 14 May 2026 13:43:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0EE7C60E87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EE7C60E87
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EE7C60E87
 for <buildroot@buildroot.org>; Thu, 14 May 2026 13:43:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9273C5FF95;
 Thu, 14 May 2026 15:43:51 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 14 May 2026 15:43:51 +0200
MIME-Version: 1.0
Date: Thu, 14 May 2026 15:43:51 +0200
To: Daniel Crowe <daniel.crowe@maxmine.com.au>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260512072832.801739-1-daniel.crowe@maxmine.com.au>
References: <20260512072832.801739-1-daniel.crowe@maxmine.com.au>
User-Agent: Webmail Free/1.6.14
Message-ID: <f3cc901cd0f7636f406575dcbc36e609@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778766233;
 bh=9QAuYn0pHZboccvBEF8+PbTi4ry7K/lH3OkLVKtfanc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AxVMp6a1m1xR3u+73AK5jZPKF8BbRPRjsFrDP/CMnXrYUM6Fpr9rXXMgqE0BJ4YYp
 4i7FN9rzg7iH5TUbt8zo05jKqC1DR4dVhOcoXcVkQT+WW5c5+YuNuix6pujl5lNhjZ
 PsrG3sv3MS4YTZNxQhWSSg4FzXOAAoLYlx3plPfjo6F+qSqiFHyBUjuCo7oWWyBEw4
 G7MrYoL8BhD+69FQXmXuGUidNh9cdyu355+N6VyulX6OFheTVmhSABM/jJJjDOUyxx
 nm5CI1LVGLWEgd68KMPkqELZJD/P6L370z7yqYrtkgd1oAEQLoDmrJr57fbndqdN6G
 wGgK21WJ42/Uw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AxVMp6a1
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cachelib: bump version
 to 0.14.0
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

On 12/05/2026 09:28, Daniel Crowe wrote:
> Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
