Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EB2C55162
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 20:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1E3480C6C;
	Sun,  2 Aug 2026 20:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dlfDwx0c99Wm; Sun,  2 Aug 2026 20:28:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BFA580BFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785702499;
	bh=1hHjmpMqI3G3NLenwTRK2lME+VfWudZaqfBVdc/ucxQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i6RlasnDNj2zJFKpxFvLkOBaMWLUACDUFtwHBgtmSzIwRZwDb9qC42VZ8ietIx0Wc
	 pWMHSq1Ce7T5MQtGIfXlHesUvuWArZXF4JJerKc5zsLAlpwVTWaUEncUPEXbTmSoNt
	 LoZRenz+89cVZZMU/v3aBacQV409AQP2wh7m3nxxJpxmBS/pjbh9eGjvrvS/mS8MzU
	 3141C36dpmSejJ5Yk86xnxr/abTqbzmdZeNMrYWSADt+y9XMa1McoRoPp128lOU200
	 X5E3ZJIZXi6DoV5jmto3nfyTlQPB428ZQTxiC4MAuwtejq9cr2kaivQ85FTUBw53sc
	 JZXqOUEuDEq+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BFA580BFB;
	Sun,  2 Aug 2026 20:28:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14DA826C
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 20:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEFCD80BFB
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 20:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BKDrCZoGOIyl for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 20:28:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED90280BE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED90280BE6
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED90280BE6
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 20:28:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id DEC9519F5A7;
 Sun,  2 Aug 2026 22:28:13 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Aug 2026 22:28:13 +0200
MIME-Version: 1.0
Date: Sun, 02 Aug 2026 22:28:13 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260725215737.1555933-1-ju.o@free.fr>
References: <20260725215737.1555933-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.17
Message-ID: <8b5c0f81d168e72371b05eb64f31ec9c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785702495;
 bh=FTNyL3a4DBh2LUjo30TMgFmlap38ZUQheDyoRPfQYK4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VzommrytOH6QIHAhfiV3/H0nAjciZHVWcshd0StfuKnqwLqZhIh7f38e0JdwKwrya
 /PM6k7e4gywWRVp0dSXgCrLl2OczPew18++ereibUpT0JB+wmfY0s0au5iBWx/Lp0e
 SRLuVBbNXwvdaFXmJuHkeyDGr7KSl0IVImdXqSaDH2c1kGu5x0rsfH6P+hIMENCgiY
 KMah5nTng9pTE1aO4QMzWd/WK5YSIsBASZe4KtF/HvQpRsac/OnIZuRetGWBFUHeGx
 pAH+H9lg1hwUGdZ8IescS4AQqQ2R5L5+7ZAWnIGGQNKp4I+Ew2MM+4APgYaFnoIsht
 918ceY+WR8f6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Vzommryt
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: libgpiod2: new runtime
 test
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

On 25/07/2026 23:57, Julien Olivain via buildroot wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
