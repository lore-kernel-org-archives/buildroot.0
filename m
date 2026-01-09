Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D892D26D6F
	for <buildroot@archiver.kernel.org>; Fri,  9 Jan 2026 17:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFC0860EF2;
	Fri,  9 Jan 2026 17:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7PJtVGzbazy; Fri,  9 Jan 2026 17:37:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB9B060EDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767980251;
	bh=ODNiHyCnceYlgsLY4bD7r9Cqt5/O6qaEf45acWkspLA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UnyqUVVfz7JhsisdxoDZOThSPrDIbuS9J5X3yo579aeCBYDFrFJdJ2Y7sP6QWOXAa
	 sWk8pRHJiaSUtKoBl/Rj6liueyd6yqL6XYxMVCLe4YqOuW4SLW2ctzQvoEFXnkl56J
	 BcOWyu+5HsaJNMDKh9xQ47QX58sEgsWWFeZegtLMCLPkFfrQHce6UBAJBSnaPp2mfZ
	 yIk6/4SI0A1IFqYEP7tOtQU640SLogexVdErVIxCT6Yb5uLS5r3bPGhkoWTT6PbK/I
	 HAORTpOrNg35QWYHCOyW2byk0JrDMAPK45GqPy3lwMW04Sq9RyaJRAtaf9P8dEVTOL
	 jRPS0fmNcdq7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB9B060EDA;
	Fri,  9 Jan 2026 17:37:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF9BD12E
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 17:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5969E81F11
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 17:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1DI2KE-ZhFO1 for <buildroot@buildroot.org>;
 Fri,  9 Jan 2026 17:37:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 61CC781ECA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61CC781ECA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61CC781ECA
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 17:37:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A483CB00571;
 Fri,  9 Jan 2026 18:37:19 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 09 Jan 2026 18:37:19 +0100
MIME-Version: 1.0
Date: Fri, 09 Jan 2026 18:37:19 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260108224855.2762464-1-bernd@kuhls.net>
References: <20260108224855.2762464-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <4977d940b74d376bf4d861b94506ce32@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767980240;
 bh=PwKRMS818ll+TQzvt0ZaUPYKIphzl1T0A0joI05iE7s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZfNQ01Mg8Sxm6UasQZbCSjPuU+BZR2UKfRKyEy7wODqkT/er+kQyrl47cdS3gy8fV
 7HUqck2zNRRVVwpqf32cOeZg5TId7lWWsRqqenVIwrdtg7h2wjaNq1hkmbppO5LEcF
 0ZkIyAesZPg/bRxJt68Io6/EIgQSEGx/5emAm5U4kISxXSXn3RSBbKpLfFlqJ0TiIN
 7VECYPU8EKHgBbRqIOD59GsCeyiDwsHK/ULEWav2Nuh00a6AU5YW6rzh6qc/gdChfZ
 OCUSYo1vdpWOYCGaiG1Ytq2zmVBplcxfdzJGNHo6DQ9Y8qXlFfCR+3QtM/LD8j3Y/P
 tcAFvJdCs1Zgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZfNQ01Mg
Subject: Re: [Buildroot] [PATCH v2 1/1] linux: bump CIP kernel to version
 5.10.246-cip66
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

On 08/01/2026 23:48, Bernd Kuhls wrote:
> Added Upstream: tag to patch.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
