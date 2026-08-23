Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C471BC5DF81
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 15:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4CB980CB9;
	Sun, 23 Aug 2026 15:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9cd3sHOVMLIE; Sun, 23 Aug 2026 15:41:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787499678;
	bh=hp7T0vkymxUgeq+Y71mtuNOYkfAympeQzDEQh/NL4ks=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lHu9U7Szo9JbvMfbeeMycQbwYLiIvAIAIXy+2mKAxoYTBf6/n6t5EcwY99Z8gX3M2
	 KXJrujxhs7WtT+8yIk67UNMGUd3BtZaS9OdgtnFnW5AHnTEySQ3vMcB2028cjJDvBP
	 pSd7TS3vaYO7altdQGEF7J9BBkceqoRODKwTbDuR6eEQScor8skqEdF0Q8H5BvSECd
	 izkIxh9gn2Km2brBQ7RjGb/KY+l+3mlDtOzrbOiRL1E+DZtfjQMiPAnaH52sfjP/xb
	 FBt3tkhyCoSeAum501u54YatPI72awnBOtlsAisNKu6dmDeS+/AbtgJAfo55OWsidp
	 tE18V26spOrtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE55D80C9A;
	Sun, 23 Aug 2026 15:41:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CF4E336
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 15:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EFC940656
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 15:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ifsQqTvo9h6J for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 15:41:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15E8440652
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 15:41:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9D82260129;
 Sun, 23 Aug 2026 17:41:09 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Aug 2026 17:41:09 +0200
MIME-Version: 1.0
Date: Sun, 23 Aug 2026 17:41:09 +0200
To: Benjamin DeCamp <benjamin8532@protonmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>, Pascal de
 Bruijn <p.debruijn@unilogic.nl>
In-Reply-To: <c-LIqtVGERPuiF6keYuaBafYyc7kAd3_m1-5cU1R2x-Akg3D5jWjzo1SgFGQOE_Hfwms6HQBgSjm3pQqgd584wZWumaMDikhOKE3IMN2ct0=@protonmail.com>
References: <c-LIqtVGERPuiF6keYuaBafYyc7kAd3_m1-5cU1R2x-Akg3D5jWjzo1SgFGQOE_Hfwms6HQBgSjm3pQqgd584wZWumaMDikhOKE3IMN2ct0=@protonmail.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <5e4411f4ed1b1096f94f9d4e8743660f@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-tools/S10hyperv: fix
 invalid return value
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

On 20/08/2026 18:11, Benjamin DeCamp via buildroot wrote:
> In both start() and stop(), ret is only assigned on failure. When
> hypervkvpd starts or stops successfully, return "$ret" expands to an
> empty string and causes:
> 
>   /etc/init.d/S10hyperv: return: line 31: Illegal number:
> 
> Remove the double quotes so an unset ret expands to a bare return while
> preserving the existing return status behavior.
> 
> Signed-off-by: Benjamin DeCamp <benjamin8532@protonmail.com>

Applied to master, thanks.

I also fixed a check-package error, which was the initial reason I added
those double quotes. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/667335cd187150c5afebac2a278f92d5b6ef744d

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
