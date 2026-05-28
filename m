Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B50CD5BD5
	for <buildroot@archiver.kernel.org>; Thu, 28 May 2026 19:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BD4B80F00;
	Thu, 28 May 2026 19:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VaS8Zh9COQYh; Thu, 28 May 2026 19:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBE7B80EE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779997558;
	bh=1I0k9+orgKj7ihPKHQ1Nq6UmZ0JqxCJNDwz14SQfeNc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cLr2W3hmdThHdv4EB/chlvTqRRlqNLJmlnJNK4CKz4IBmzg4gKvvXgYoOjLIWuxpT
	 fsDS8AcuwJanOUwc/9whSpcQocaW199RMoa7meeYg8IEMl7hotJ4IZt9zdN+bdgWMB
	 AlrAFNzRyCYE7tOufYJ6EY8cdkHMkxTU6839/7PxYhGFT5yVeFzoDn3oPCAMcDqwF+
	 MwccuB+gq4mtq2NXWN+Ng6jEmaFXBtfglWAa1FWdA5e7ka+cZQpNeqdvUczuqJH5Rx
	 yeyn4CptwwCYOY0ettvdDkPsrottnh6mwdod5mhRdkX0SKu9CAv0aBU0qXdMHnYcrl
	 sOmnyyoLgtxUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBE7B80EE2;
	Thu, 28 May 2026 19:45:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B8FEE28E
 for <buildroot@buildroot.org>; Thu, 28 May 2026 19:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AB6E606DC
 for <buildroot@buildroot.org>; Thu, 28 May 2026 19:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4YmVOIPgh-HT for <buildroot@buildroot.org>;
 Thu, 28 May 2026 19:45:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 344FE606DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 344FE606DB
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 344FE606DB
 for <buildroot@buildroot.org>; Thu, 28 May 2026 19:45:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6AF4D780395;
 Thu, 28 May 2026 21:45:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 28 May 2026 21:45:52 +0200
MIME-Version: 1.0
Date: Thu, 28 May 2026 21:45:52 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260528085044.344439-1-peter@korsgaard.com>
References: <20260528085044.344439-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <03828d34c8447281af5399a89d6c457b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779997553;
 bh=TEox0Wt2emJb75sG4dPM78INGLR8zyKppT16xWl9p88=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j9cfVTbUU1QLOHyXZAoGiyRLNAEmx8nhC6l4f/Awc1I5/2dY15rwAy8ZnJXuypNga
 JYKVxGJo4KG0GhcZPnBq7XE8sFGjx+6vswi4MFU8iNGv+V34mQHjzzTe0na5ykmVX6
 VHffpQ9+Tc6HHcsuJxkqI83gF9gvHxBfg7kt/wIx/D8rRGjNbtaRtZ0u6qbsj2nsWT
 6U7yjPFTvMzizZYeJtNJ/BaBbuS+OSnXKrtYRfClCoFbNWZF4OqF/S2HtLpRLnA4a2
 UxSmWQYpPvMWXlxPBpnU3MaI22NnFTlRM5Njm1MiMjiO0vgMtAvuZmixVAedi0bS0p
 0zY9FPBW7WThg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=j9cfVTbU
Subject: Re: [Buildroot] [PATCH] package/radvd: security bump to version 2.21
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

On 28/05/2026 10:50, Peter Korsgaard wrote:
> Fixes the following vulnerability:
> 
> CVE-2026-48715: Stack Buffer Overflow in radvdump Route Information 
> Option
> Parser
> 
> https://github.com/radvd-project/radvd/security/advisories/GHSA-52px-gh9p-m379
> 
> Release notes:
> https://github.com/radvd-project/radvd/releases/tag/v2.21
> 
> The release is now done on github, and a .tar.xz version is available 
> so use
> that. Notice that we cannot use the github macro.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
