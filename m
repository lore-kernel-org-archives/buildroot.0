Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43A8109C05B
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 20:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 017B381D11;
	Wed, 25 Mar 2026 20:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXZmJG0lCXyL; Wed, 25 Mar 2026 20:35:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6001681C58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774470915;
	bh=LLypJ/fnCTqv+Rq5OjebGLhrN7TCGFez6NJ3OPwCHvA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K3hap2mTK/KcToxZGgmaFdUg5Ve7ivzZ/Vj+FOOc/ZmH7irSNxxHMWCkmmEc0V661
	 PG0W3zLKO3EnGt10Wr5fla7vrycHkwAqlK7OXrG9cFvQ217ateigfnE0L7CO4PmNS8
	 bEHsxJgQpXbZLVai22kWjIb/eF6C6Q5/8EliZfRo7NabcDq/sNDaLcOkdMxdorCyzQ
	 zR8kBjGeEtFlh32hZEFJ72DeoOzqHkrbJNTaadTM7ntKtf6LsuyW2PN4W8w2rrPUiS
	 7ipQTMLIzg7M2suD8trbGvrdcuYu/EDkMKviitwn7y8LvnCnpPGGGh1q3AD1lTedkp
	 Owq2ITYkw2D8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6001681C58;
	Wed, 25 Mar 2026 20:35:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A0BAF5
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 20:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7615A40A81
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 20:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ymw_Gy_-Y8Nm for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 20:35:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7696540A70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7696540A70
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7696540A70
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 20:35:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 33EBF13F879;
 Wed, 25 Mar 2026 21:35:08 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 25 Mar 2026 21:35:08 +0100
MIME-Version: 1.0
Date: Wed, 25 Mar 2026 21:35:08 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20260325181056.3018343-1-giulio.benetti@benettiengineering.com>
References: <20260325181056.3018343-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <16f134f88175bdf2e9add32c9ac4a9a4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774470910;
 bh=j6xRph5yRJZybhaeCu/exZHVwps2RG4mh6PaV1awAkE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Fwr8ES7vrPnhy1pgSQ0SLB5Mgo6qcnR4Z7ggb98IWb/RIfKCVaP3i9LOJQCloWm2D
 w8lq5PNmDnarLH/oL+OA8rnwez1mMV75PNmbK+X/Vs30DLV2jZnjc2o0DdlXIyGunl
 yEG7CjBjpjjUbQlZP3Nt5E9I5up3M4w/k8wzv8RSs3nGhDVESPPCjWdw8dDg65jFpJ
 fpfdqSyALtUYe+rnsj9xTz0sH/6o1GxJuxjpcVfxZG1i7LSm7ZEcF7SLEFcsba55xL
 Idi7TC1RqDpIvLByISr1CFTJesm9CDBr16Z7yjPq1g4iZiYqrU419F+4T6/LEUAi1H
 x2NgpAhsDpxkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Fwr8ES7v
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.122
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

On 25/03/2026 19:10, Giulio Benetti wrote:
> For release note, see:
> https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_122.html
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
