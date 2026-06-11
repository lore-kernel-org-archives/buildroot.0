Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EB5CD98C7
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 19:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40DFE821AC;
	Thu, 11 Jun 2026 19:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h7qr8hoKe6Tr; Thu, 11 Jun 2026 19:47:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E489821A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781207236;
	bh=HM1WtlfVybkgge2hdvBaLijECXGakdimSb8oLkwJ/sg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HMfs+ZLQImKB54venB21uk7qa+mmc+fK9KmHSH50GRW1ZnfQ0L6RZ9egLWnJ13RqP
	 Ao9VwCMmCRh2CwpPGuBWKxCdLrA3CTJ5DWU8KeoPYVx/Eic59RTp/Oo2YPfuG41/9S
	 zJ4y/ouWqznNR6G/r4lphr9KZEHir9T4od5YrQpXULVeaTsZZ8/EMUBTALwPXxDLiT
	 X1J6Vcb8XO0q9xjko5p0wxvZNdEcx0M+1oZPknWKR+vXqav+IbqTLhxKLeO4jeM8RR
	 E8py17aeGJvPfYYaTb1zyprsbwAL0n9Vrc91lTNsh48liEIXwsKBhp9y8XGGoTkpgp
	 s9qDt8OuDZMfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E489821A5;
	Thu, 11 Jun 2026 19:47:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F5FB237
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 414BD821A5
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7zRRTG5Lk54 for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 19:47:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 57F3A82155
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57F3A82155
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57F3A82155
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:47:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4C0B919F59C;
 Thu, 11 Jun 2026 21:47:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 11 Jun 2026 21:47:10 +0200
MIME-Version: 1.0
Date: Thu, 11 Jun 2026 21:47:10 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20260609114315.14060-1-fl@n621.de>
References: <20260609114315.14060-1-fl@n621.de>
User-Agent: Webmail Free/1.6.16
Message-ID: <c7ef171c2c6f86d39472916d9518a31d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781207231;
 bh=2eNeJEeGV5zrbhP+EiGRDMaRYI99NZpjN33cPQlMHfM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X2AkjDjH+pTnM5CYqgLutr23y18pMkyynCqVLYXq9H+ebfnKECnM0bdo3NfPc/PbJ
 D82xwskJDWUMLz6vkbVJ0QuVIJowy7udDQ5OKs4ZQ/FgSlm9gxIPTdzqEa1avHlPlv
 VqXoy6W4Ku2mEh3dS7q4ewcLZ1ZhrglFhl649QpK9o1g3gilgjVDQkSZ0M/S1PwJSn
 741oB1oHchUYggQi6rMCz4vx+Qsxwi6foRcmNGOtuzXtIm83B2SCDj6kHKNHABGCTj
 sR9qBX+AfcNvEZjOhHnlQk5yy8kQgRNwEqRs4rGs4MjjLuRbqtIer0JxpURFT1ZF36
 YOfxk44Ku6nSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X2AkjDjH
Subject: Re: [Buildroot] [PATCH 1/1] package/sigsum-go: bump version to
 v0.14.1
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

On 09/06/2026 13:42, Florian Larysch wrote:
> Changelog:
> https://git.glasklar.is/sigsum/core/sigsum-go/-/blob/v0.14.1/NEWS#L1-30
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
