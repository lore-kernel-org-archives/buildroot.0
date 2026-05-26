Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C4ECD5BB1
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 17:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E76461044;
	Tue, 26 May 2026 17:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wyxOg-Zz35rK; Tue, 26 May 2026 17:52:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA2DA60DC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779817953;
	bh=neKwOXHUs9rnuxxFr//Vj9CowXpcDWSgDJNsH5n7ZSo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QuPIJUPWd6sMn0879YbAloZ5744Pgm+DnV+N2Zhshbfre60BGL3xkYpPJ1InqyBJl
	 l/1xuswpubNX3uTmyEMXZrJVFXupfnU71c+mzVAQTGEW47rsBdInkrgRPBwSlNBiQX
	 aLolrb3DrwKJXloucsPQsnJQkhelmv6+xmvFynhuAMhaW0CvJ8WXYMEjye1BcLuqMs
	 RH1zH4iRGpL+gV0YsZFaVRtD0gskqwSpTXfcrJmUv0cz1fWbj6HIIf65NUGIdhPSeK
	 yyNFyFgMyQXui/1kiAEwTqzXoBPL5CSBhD+L3CAbqdBnGB+cB9h5GoaKoQoblel6PT
	 nZcfNasBSu+Qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA2DA60DC5;
	Tue, 26 May 2026 17:52:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 338B921F
 for <buildroot@buildroot.org>; Tue, 26 May 2026 17:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24FCE4061C
 for <buildroot@buildroot.org>; Tue, 26 May 2026 17:52:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZGjBgIEYesk for <buildroot@buildroot.org>;
 Tue, 26 May 2026 17:52:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A2FE8405AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2FE8405AD
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2FE8405AD
 for <buildroot@buildroot.org>; Tue, 26 May 2026 17:52:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 428FF20039E;
 Tue, 26 May 2026 19:52:26 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 26 May 2026 19:52:26 +0200
MIME-Version: 1.0
Date: Tue, 26 May 2026 19:52:26 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260526132827.216542-1-peter@korsgaard.com>
References: <20260526132827.216542-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <a163e627ac3993d03636585dcbfafa81@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779817948;
 bh=dH4pu7USHpemVBEFnNGl0ltNUGkoGbsSZalKSnEXEaw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gUh6k4FOwplZSO6P3RnWtnX0XSrrVn++cf0msII1KjEHmkBH875GhrqsmRriWhfty
 kwcX8fkTzVyzCz7VSn+evU/86Pkfhvijg+mBWlwBE9VhHm8d956TBUJpAmzXL11+Et
 qqo9MX7TTqDEJ9SdpSlZYGkE91/E+XdNQEHxW98i8Ms1ZIWOU9Qh6HURPYZBdp8Jsg
 z2H03payBhIo54xCK9+JbPtQ8L3Hl/8omwsyg9oATZtJ8tHI1u8L9nRwflZeajrevC
 /PWFBe5h0mSJoJ2P6cFW0w5Rr+CWy8FKDDGN361KAQOeffa0AiHDLZg2fgcY84KpwP
 e9vUrMsJpy5gw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gUh6k4FO
Subject: Re: [Buildroot] [PATCH] package/python-urllib3: security bump to
 version 2.7.0
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

On 26/05/2026 15:28, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> CVE-2026-44431: Sensitive headers forwarded across origins in proxied
> low-level redirects
> 
> https://github.com/urllib3/urllib3/security/advisories/GHSA-qccp-gfcp-xxvc
> 
> CVE-2026-44432: Decompression-bomb safeguards bypassed in parts of the
> streaming API
> 
> https://github.com/urllib3/urllib3/security/advisories/GHSA-mf9v-mfxr-j63j
> 
> For more details, see the release notes:
> https://urllib3.readthedocs.io/en/stable/changelog.html#id1
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
