Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F90DFC617E
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 12:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BECD6086F;
	Sat,  3 Jan 2026 12:11:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8yYJBvo5hL-7; Sat,  3 Jan 2026 12:11:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EA3B606FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767442283;
	bh=Q2zEyN9cZV9g84rynO5Wy9wIwduDcpvoqUtWXocHryk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SwfLlOmNQugbqZPCAzV/K36dvbiFSGx1W6GgaBEzRAP4ZwUldTmE5lGrcBLfbqgS7
	 o+9YY+gNp+97CY+INkBvAwqNyWM9k8oTWYtPezGimGOIvHgtvhFhQHOsTAiRqns64/
	 qZybIxYoKA0KqboUxd6zgs1vL1KW2wny6UKQSMBerzpRb6umIJ+fXeCOZBOVJOqF68
	 lvBgUvPAX28bj63jfFM1xY9b2MrtmjzcWHB9iZjU2tg8hMk6wUQuoeNx/eaySqxV1Q
	 vbQWDLwzDS7nL2ku2hsggI1P6kbprVZOlhI0aiBdnnUu12t4vUamHPgo92arVdqb/1
	 lHCTPKu/jr0UQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EA3B606FD;
	Sat,  3 Jan 2026 12:11:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A91B2440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EF2A606FD
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:11:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMQ8nfJ-JHTp for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 12:11:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D9733606C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9733606C7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9733606C7
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:11:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 7EBB9B0051E;
 Sat,  3 Jan 2026 13:11:17 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 03 Jan 2026 13:11:17 +0100
MIME-Version: 1.0
Date: Sat, 03 Jan 2026 13:11:17 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260103003629.670533-1-james.hilliard1@gmail.com>
References: <20260103003629.670533-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <78d15282c1b8e329624224425f9086b1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767442278;
 bh=bvcNY8koosnUM9r7jZfyGSe/aP7k4vVIEDVPr5b4d2g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Yt4mlpEkchmF/9aGCgO4x3KOPq7X+gDvtHLkor7akUU3cPolopz/YAv14rsmLnW1H
 FapqLMv9wa6vnD5FMx3awjFP6fp7p0D9reUZ7Er1MJ4MY0HXKUdgayECT6AsxJqlcm
 TVTVY1XrThcBRF6uDoHytE+zBdkLAd0cv7g+RKKvGy0p2pOPgLrMMiO4Pd8mOqASDV
 Fi0hTZ2U6gn8gile4SkJTAXMlcdGi/MmGLTSPRfyUE7H5J51Fdqv8GIq8uipP5vrQj
 eb6zv4Ja0nLbl10490Xqco4U6FFjlR7Lwz5bs/8495P5CplADuSTPIm/SP3qmMg9PU
 KZhF2lHyn0Uqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Yt4mlpEk
Subject: Re: [Buildroot] [PATCH 1/1] package/python-grpcio: bump to version
 1.76.0
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

On 03/01/2026 01:36, James Hilliard wrote:
> Add new python-typing-extensions runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
