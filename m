Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38E6E8FDA2
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 12:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8D7380E83;
	Fri, 26 Dec 2025 12:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yz8CO6C9IIy9; Fri, 26 Dec 2025 12:46:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD80A80E59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766753175;
	bh=z/huqkxbEaJclSWHLIsp0OLRnWoDL5WkqIKThHcYVCk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ifc1/Pl4xzSGE8wIucJsrD2r5NchrybXwY0pWGcX5QWieZoPW024A4D8EEOk+uiWa
	 jNEUxsRc9NCQwi2VLZGY8hBmkwl05gCMgooRYiAfzTBz/wzKDmKMHrXtOY8xwn1+L5
	 pEiL+xv97c8gSDrm8rk1J7jGcjZrkt+NONROk7LDddjzDRMlpCGjs7BlwBWepJXpOg
	 dYmrZyXHar34FjYLhjhKfxRkw9QnCz+xM7zQ+jHm4zIIC27I7QscGL1vsRcJueRdcd
	 aY0O8d/va8LIUWADgWDeKVlW+lwMjF7iPd8KAB9uvustp6FlYyne/Uj6xY67X7Gbb2
	 9TPdX2Ja2S9NA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD80A80E59;
	Fri, 26 Dec 2025 12:46:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DA3EEC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3426F40512
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXK55-ufXpQF for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 12:46:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 524E64025E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 524E64025E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 524E64025E
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:46:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id ADD9A13F880;
 Fri, 26 Dec 2025 13:46:08 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Dec 2025 13:46:08 +0100
MIME-Version: 1.0
Date: Fri, 26 Dec 2025 13:46:08 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251225124559.107007-1-peter@korsgaard.com>
References: <20251225124559.107007-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <ef3599f9e8328b7785159cd01a1cc2fd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766753169;
 bh=+EYcEghzQ8Oh5FnFMnq4b8Ossp5WCOWE+1EEbTsghA0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Nzain+QbPrzD+QFhZEzgshGde3WHQviWDoTy/BvTS+CBusQgUzaETSpSKbD2tZlg3
 aib0MSIPC8zM+kJ7c9P3FsMgeRfjtJ7De3SKvpNGrn1RiLf3RxjF1f/NY1qmnjdp98
 73kQ6EoNVYAIm9PelTsljM8sAz3VIxGkdrFC11/xIOxis9nUkn9tVT6mEhhoe6H7fK
 pDOFDXMT3T+j3bPLHpONH4ZXlPEf5cg3SZd5MJS+z2o3tHchzpTNaWSkTI+x5onkS/
 9C9VUoy+V3BpSQZVBPsdN5wIGU025ZYdU/ifmlGBrsnrG0aHydOEUzU7Lmq5LH1JtZ
 avAZMWxSzftQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Nzain+Qb
Subject: Re: [Buildroot] [PATCH] package/bats-core: bump version to 1.13.0
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

On 25/12/2025 13:45, Peter Korsgaard wrote:
> Mainly bugfixes:
> https://github.com/bats-core/bats-core/releases/tag/v1.13.0
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
