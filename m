Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA9ACD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 20:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54203847FD;
	Wed,  3 Jun 2026 20:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3RkqOeDtg6rL; Wed,  3 Jun 2026 20:07:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E445B847F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780517243;
	bh=1YfgZxx2LNXDVfQVULgDBVsryzVf+Hk/hXIKpsc/Qm4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MfYNCvoJkmp6M5Z/NyvtRnis7o1YCh/xsHXvBjXZmhkmxDl28f3TcqRP3s2J8c1sF
	 EPH/he1GLgVXUHdRl2BFe8zI3ffl11QYjsvk31fsXLBKgj1JSHYDEBk4f30T/WD53l
	 gt9OUGfw44/rTbj8ev0WImwR6UDaF9ZPnynknZrpINBAQsaPFNKxsIl29ofHNskeDL
	 /oEwkWtL6nNEeXNoBxbmzrl5rmQFdEiCQKuTDkBn2GNy7yzzJWVJLH6DjNX0t+hZnX
	 aHeBgo6/bPF64BRifzMAT3xJ5/EHNbxlNuyXjr7/PsXqH7D9fIN52ijOXgWuyuOE0l
	 hb1c8ucD93Yrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E445B847F7;
	Wed,  3 Jun 2026 20:07:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E39ADE
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BC8540A3D
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egndEv8wYmyi for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 20:07:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A07AE40A3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A07AE40A3B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A07AE40A3B
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:07:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 51C2F5FFB1;
 Wed,  3 Jun 2026 22:07:14 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 03 Jun 2026 22:07:14 +0200
MIME-Version: 1.0
Date: Wed, 03 Jun 2026 22:07:14 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
In-Reply-To: <20260603073245.2918813-1-peter@korsgaard.com>
References: <20260603073245.2918813-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <1b51ebc282564951ff40916f5078db76@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780517236;
 bh=70uYw70bUA9XaqAV35OFhjrY4dfeySh00ekb3uOWfAQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hdgu7KSfwk5w8PP20EamSkPyZtlkcV/Hj1jSl+vyUUclQvbefib5jQEqV39vTHRGo
 CBrO6kZ0jacmOXQ8lErmm2Vgbp5eLdJKcczCVaLt6qXZhPM9slHHq10vPiTCHbtM/X
 WFo0LNg9PBfyIFouDmDJg/xc3SeBxOHnt7v1iTjoufwLmZHLT6ehEbdCbnzRmimc4K
 kMY8CtsrecnQGYk2nHGFL6U4M8BNXAJ8OY6RycXmpvjRrAJISPNjL262JQDoZ7QTIT
 y+fc4EKFK1fyG1GZTL/ybGvoIHqU1m2qyF1RT2mzhi6oTG9z97qIurUkhvN+kb3P/L
 bUynIBU4uozlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hdgu7KSf
Subject: Re: [Buildroot] [PATCH 1/2] package/docker-engine: security bump to
 version 28.3.3
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

On 03/06/2026 09:32, Peter Korsgaard wrote:
> Fixes the following security issue:
> 
> - CVE-2025-54388: Firewalld reload makes published container ports
>   accessible from remote hosts
> 
>   https://github.com/moby/moby/security/advisories/GHSA-x4rx-4gw3-53p4
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
