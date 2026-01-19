Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E416D29C4D
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 20:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 540C084091;
	Mon, 19 Jan 2026 20:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4Tkqd71C6S6; Mon, 19 Jan 2026 20:18:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB50584086
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768853880;
	bh=zg5k/HvNJCl+lUefidxLd3Qnd7EDU6aKq7o4Sdnxcek=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SUmB9SIxQBlr8uzxDGsBeMCiFdFaXP90ToWCz3EXOsy9ix2cTbua3uLY3ie8c09tP
	 346TSBb0ky4O7nvoDsXR3GrM7UjPtMyFgFC3Sguop8d144B3pOWNgESRhtupMbHkyF
	 ClfMtkAOrMLGEUjT5/hCsTlPqJw266cINxSTA5JGo3rM1u+DH1ND+73LuhwgK8O+wp
	 uZwll68E5jcfHNE8iBcV9uQYbedA6//NHvhPeMzNCqAfndhWJgiUXOE5ZRq/RL4HoV
	 Q62zG+dSXPTDCSCd2upHnAiPOZuUiGTAfcIMPJ5XMSn4NSQ++YJyQ9usgE7LkeCcoM
	 aq4AmgKjqxirQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB50584086;
	Mon, 19 Jan 2026 20:17:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DBBC2A8
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED38184086
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r22Z0k8A0207 for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 20:17:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B565884082
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B565884082
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B565884082
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:17:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D1C69780368;
 Mon, 19 Jan 2026 21:17:52 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 19 Jan 2026 21:17:52 +0100
MIME-Version: 1.0
Date: Mon, 19 Jan 2026 21:17:52 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260119103809.2880459-1-peter@korsgaard.com>
References: <20260119103809.2880459-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <5cbfc5bd978dec3e789ca29f6d83d8f7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768853875;
 bh=GB/FJv8vCHHbRK3XAzU5EK+D+KnRnQSH5NFetmWZ8WM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dNKUP15rxvHGHBvIRppVfWlPj8m1Jxdwd/9GoTRY7pcVo3cKyIpYl24K32Cj6kjuR
 2JbUsIXLzUuCVO760030Z00+Rq3jFDWn6Frgq30b6GBwyt4/hsWeMJT7XwKBgsxcyh
 4T0USy0TFjPggQEB0V8DxY/oeuOWcvD8NHtt4lXvvx7aLh/e2JK8nnOmA0Q5UNJyRU
 cMCLa75Oaz6SW+Tvtwa09rdaazH9pPYiEFbhzkISIVgkz+ICDk3UQZLu5vY9166mlj
 bDR73dUf3GkhE2/vACdWnXcNYnx1Z+HZ1gCsXZijEOzLMx7aZw10TwDbfd0UiEYQD0
 puXp/OUC2V2mg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dNKUP15r
Subject: Re: [Buildroot] [PATCH] package/python-urllib3: security bump to
 version 2.6.3
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

On 19/01/2026 11:38, Peter Korsgaard wrote:
> Fixes the following vulnerability:
> 
> CVE-2026-21441: Decompression-bomb safeguards bypassed when following 
> HTTP
> redirects (streaming API)
> 
> https://github.com/urllib3/urllib3/security/advisories/GHSA-38jv-5279-wg99
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
