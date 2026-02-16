Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF55E83836
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 21:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12AD760E4B;
	Mon, 16 Feb 2026 21:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t8pQXH4rfVAj; Mon, 16 Feb 2026 21:47:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40DE160E1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771278437;
	bh=WEKJhLXHN6o2jExDOhpzdOmu6OJZYb8H9PZw4D8IoWI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LILHC9IFwpDYNlghBZiJEHpDnGjmhPY1H2yp1wN/yrpDqcNIzaLMu25/uYnlbKKdz
	 GMGIQGQc0PB9Sj4bpRm+LCC7daaK26AAuNXX0Li0fvWZIacXMLOn9JW5a+Mi7zA9ZH
	 Fwk4iGX+xodhu4H1mhAKrx0MHFq0n9yMvQrtdcsZ7LnU0aNRafK0GvvTHUmBJiLL4z
	 K829t9HArkGjqDNfQiIpKbqylrY5W/oTBHUyhefiwMAF+vqehW51+LpRBq0oskMeUy
	 qDED7GxQv/6Aq+dH2NKE2BvJ3AqB1tAklbBJWzYGyeHEhiN0SJ4sfKbzhbHPW4+z42
	 9eZEgBswNRwMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40DE160E1C;
	Mon, 16 Feb 2026 21:47:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E8CC1270
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 21:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E664040940
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 21:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ukj6XRGKGVSr for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 21:47:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D9CE408B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D9CE408B3
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D9CE408B3
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 21:47:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1E9E52003C1;
 Mon, 16 Feb 2026 22:47:11 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Feb 2026 22:47:11 +0100
MIME-Version: 1.0
Date: Mon, 16 Feb 2026 22:47:11 +0100
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
In-Reply-To: <20260216083733.4184105-2-buildroot@heine.tech>
References: <20260216083733.4184105-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.13
Message-ID: <f3f2ec86e20a29337d96a7a2edbee974@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771278433;
 bh=KZLv1E0xYOZEVTNyBpP1WbosnSWiolVNgdzEgvtD1A4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AbIY/zLetQdGO64z29jKRMCc8gDq+Cf3P6LXjQ9zbtWStn4PtwnHGRxmfn+AHF1oM
 shHYC6wDhOrLUoUx5rEUbVnfv6pZqrP1AGCAumhFP81B9rUFl1FVRxCgBRONLNUJS7
 Y/LfBdjcDaGuiiJcFF3dy6pPW4XmQsGWvZ0vdhwnvR/dYh412TgYm3hBnhlGPZSl8A
 RYApmHzNaHnom7tM5BqHVdZfqUjFRo4xmiWw+7uFWxDP8dnR2zTzb6fyuSQV/SVNXe
 yr3DQ1Z3KfaIxjfKPWVkyePg7XUqarn/lwrf4EGGvvpZvzK3FPc7g1FZFAc+Rvy4LR
 fXr4MYWX4qKSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AbIY/zLe
Subject: Re: [Buildroot] [PATCH] package/catch2: bump to version 3.13.0
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

On 16/02/2026 09:37, Michael Nosthoff via buildroot wrote:
> changelog:
> https://github.com/catchorg/Catch2/releases/tag/v3.13.0
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
