Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09578C636B2
	for <buildroot@archiver.kernel.org>; Sun, 22 Feb 2026 21:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C896A61093;
	Sun, 22 Feb 2026 21:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nvaum7w6jbQ8; Sun, 22 Feb 2026 21:05:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0E4D606C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771794337;
	bh=B7peIZ6tDacW6u7ARZAoP8IHyPJak+0J8pSULyyDoJY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pp6suVUFnPdzzOvaTH4V9uCHclvEfPsCG5pwgVIflwzanmX7mCPfEDusdNItkQmVE
	 CuvdlVt/Vo32a7T0bV9s5gg1+3w+6xAr/FYj0IwVhmQCH62hXsar1nyLu/6G/ECHkw
	 RZf3rk+IrBDvawg2J2zRFNxOc7qhVKLnF3zI4NdeuB1Q+/hP0WrpfCD/qFfS3P51bK
	 T2sciU1m5qt27d3T1FMsd0Y/tr8moq0SkFaNNfCrHfHicRWBaoZOjNNOCFA39eW10c
	 UDqpHDob6k2tkIURjSnf9pDgXg011n75/QhZNaIAy4ChLcw7dka1pRZFaRkOaD4MMc
	 64IOJzKAy/uGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0E4D606C7;
	Sun, 22 Feb 2026 21:05:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BDEB6249
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 21:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3DAF40064
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 21:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dmz4nttQIeqB for <buildroot@buildroot.org>;
 Sun, 22 Feb 2026 21:05:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE47340055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE47340055
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE47340055
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 21:05:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id EA1FE19F5BA;
 Sun, 22 Feb 2026 22:05:29 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Feb 2026 22:05:29 +0100
MIME-Version: 1.0
Date: Sun, 22 Feb 2026 22:05:29 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260222204607.292238-1-thomas.perale@mind.be>
References: <20260222204607.292238-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.13
Message-ID: <2379da15434e17889791451c2221bfe8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771794331;
 bh=4yHhtMJI4we7oJnZcqjdXd074Wl9wbNsg4C+mYBL8HY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JunxJ8SmFEM1ekaEeknZ3lmHs1/3bahx25vB1HYO+bFmu3noQaiI6uVJ5iVpByyaL
 vuPNp6wH8Rb62pbjuufy5g+9afbXmIMs761r2Urvs/4QtYEQ78ZUP4RCi2GO9MFSg9
 G7T3jgo1P3SbihagA2MwVHNeVOslCcHPIhUJgfzvuSzcoFui+qmM/fOODBgEZ8adB8
 vJcOWTcAgxOMCRRcew/BjOBYQdFMaEK3NtkGBgr3+RyTOFoYM2z0wm4aM7M6+hNSFs
 Nbzawe1nGNHVki/kwjyo6hLuxfQyLt/5CpBkfsMxDBMUqJU8dFDwImpCpJ72O3GzDm
 8/nV1hPQeCbNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JunxJ8Sm
Subject: Re: [Buildroot] [PATCH] package/c-ares: security bump to v1.34.6
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

On 22/02/2026 21:46, Thomas Perale via buildroot wrote:
> For more information about the release, see:
>   - https://github.com/c-ares/c-ares/releases/tag/v1.34.6
> 
> Fixes the following vulnerability:
> 
> - CVE-2025-62408:
>     c-ares is an asynchronous resolver library. Versions 1.32.3 through
>     1.34.5  terminate a query after maximum attempts when using
>     read_answer() and process_answer(), which can cause a Denial of
>     Service. This issue is fixed in version 1.34.6.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-62408
>   - 
> https://github.com/c-ares/c-ares/commit/714bf5675c541bd1e668a8db8e67ce012651e618
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
