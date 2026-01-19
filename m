Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0638D2ECE9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 21:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAF4780B0E;
	Mon, 19 Jan 2026 21:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsLig5JRyMt6; Mon, 19 Jan 2026 21:04:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 360768098E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768856667;
	bh=no2DUkxDjv4dLwXbA9uClYupMl5vw8z4MN/v0s7yPgg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DO4zPIbSMy2wnOV/TC7L92LonvZ0BSQqmLpvaqJnD9DITcEyM7MOdoez9VaHOt518
	 HZYewmzBMovc/q5DCIOrZiZlo/Y1sq4UqtFnE4516cR9hjayPxHP7ZiOvaCgq/9ULa
	 QkbMDA6ZZscZ9WjL0xlNCPjnZTX7jJBgIFV8Pe2PsQOxEqlc3QYkKLMJ4sF+WJg+tC
	 tbZDbUeSwJ4+tc4RdhvTW5pmrBYdPlmjxpeRIcqdclLVBJNhnB65GNS1qO9lcr7oTJ
	 NIGu77RC9XuOASYLPdzAi+Wl3UN3ezh8jHqANcPhEcWWK3JPHHUDR7vNUArrVFHVWz
	 fb8ezSvSm7Ugw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 360768098E;
	Mon, 19 Jan 2026 21:04:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AEE91160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 21:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D34C41B2A
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 21:04:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ui-1gN8WI5ga for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 21:04:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8AB7440147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AB7440147
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AB7440147
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 21:04:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 6DFC919F57E;
 Mon, 19 Jan 2026 22:04:21 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 19 Jan 2026 22:04:21 +0100
MIME-Version: 1.0
Date: Mon, 19 Jan 2026 22:04:21 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260118224947.3879017-2-bernd@kuhls.net>
References: <20260118224947.3879017-1-bernd@kuhls.net>
 <20260118224947.3879017-2-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <eaa5220557426c14695f2242a05c305c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768856662;
 bh=FTLQLgoT40OZ2mXP7Ip8LHtye8aMbfKkPvRy3wc3f+c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bP+DojX7FGfXt7dztIIuLYn49idw4rRdp+uY2ncfR4pL1mnPuJ5OimmshMEANzFcu
 Bqjq01fwJRlzISkvAq4mV+VGR1fshDLF6NmPDt3LUKGs8cq1Vm0KlJC/xXAcUUqKXE
 6yrheSODMWGcB14QFUocNuEWNTrlT8roqOIGUnwS3wVNjEYsL2kRTKG5tHyuyscHOx
 t1zzEz3u6J/e1s557aQ4wHwqnIrZL3bvb+6jC+CMuyADlpDCSfFN9RnCYWSsHlmmli
 vZF2B+K0bPOApTOBCG/jDbLjQcSiVhYkounRgmvdEuomfvLDq8IB0wKWGqQJd9Kyhb
 N8AWsg/zutKJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bP+DojX7
Subject: Re: [Buildroot] [PATCH 1/6] package/php: bump version to 8.4.17
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

On 18/01/2026 23:49, Bernd Kuhls wrote:
> Release notes: https://news-web.php.net/php.announce/480
> 
> Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_4
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Patch from 1 to 4 of this series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
