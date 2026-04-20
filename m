Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC45F5A8C6
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 20:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16BB682835;
	Mon, 20 Apr 2026 20:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bF92ThF3jKNZ; Mon, 20 Apr 2026 20:57:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4200280F8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776718651;
	bh=Szhgd+QP4wFoLe3Hqf6+GC460tjbAcpuy3DMI/++iZE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K0uSkpxRLgkzDxHQJDpHPfbJ/Yr3EpWC4NqRbkNTPiCIrp5zoBuZtJintbMfFaohS
	 HWieQD8C6P6lIQbaSTv51Pn6VuqeobjngveAUwT7Y8z6iYKfFKyqkeLyXspLB71mY4
	 DcqGAXt2zEdc6zJ9M2eEV2G0E/eul49FadC7WZIa7iVJ4smdoLXnd90vCYSKJ2YwlK
	 xmGFx3+qai6c+TtJ/BTyzrMXeBByx484g676+KqxE3CVmOkMILpPG5b05WhqnJSXlJ
	 OHNWacbuqfNh2twins5cFUPPn9vEUGBkXATC+wYbUUDdrd/1ZEHIH5KQ8dL8UeWIh0
	 A6LpZw9NGJFNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4200280F8C;
	Mon, 20 Apr 2026 20:57:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8312924D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 20:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68CB14110C
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 20:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OarPMefOUbw for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 20:57:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 880D841109
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 880D841109
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 880D841109
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 20:57:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 25D682003DC;
 Mon, 20 Apr 2026 22:57:23 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 20 Apr 2026 22:57:23 +0200
MIME-Version: 1.0
Date: Mon, 20 Apr 2026 22:57:23 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Olivier Schonken
 <olivier.schonken@gmail.com>
In-Reply-To: <20260420195520.191853-1-thomas.perale@mind.be>
References: <20260420195520.191853-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.14
Message-ID: <2da1be3a1748889af9c813293acbee15@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776718646;
 bh=MwWugNQnJqEFwRutfNObD9D1eSHNqIZltKImBAd3+hY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZGPCCvC+Tn9JQGzi7GhVstNShGIKi0DCDWseeh1jHK4G1sHCubzeVKnHBW9W3Dglv
 q3+0CUVrY8ce+LcCyEqdUGMC+WjvrqLRToeRUOCWtyEFYQm+Uu9+freP2qPhw4PQ1y
 /dPTb4jTk362uoSA5Yt8wRP9HaUS89EjMsQoXfGG/pRKRe2wdxROJdFk7SxnKQdkpH
 CvpzQbmCUpggDpPrY7hGr+mr7nq1AuxwB/5AIk8kbOX8BfPqUT/S9IVN2Rx14CltJG
 nuQRp4gUnu5PPK1wwzcr5HN77iDAG9wGfQ34NS4cFAw1xZDD5nDL1jt7YjwBHJO2NF
 skev8Y8WPwhAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZGPCCvC+
Subject: Re: [Buildroot] [PATCH] package/cups: security bump to v2.4.17
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

On 20/04/2026 21:55, Thomas Perale via buildroot wrote:
> For more information about the release, see:
> 
> - https://github.com/OpenPrinting/cups/releases/tag/v2.4.17
> - https://github.com/OpenPrinting/cups/blob/2.4.x/CHANGES.md
> 
> The new release 2.4.17 contains the following security fixes:
> 
> - CVE-2026-27447: The scheduler treated local user and group names as
>   case-insensitive.
>   https://www.cve.org/CVERecord?id=CVE-2026-27447
> 
> - CVE-2026-34978: The RSS notifier could write outside the scheduler's
>   RSS directory.
>   https://www.cve.org/CVERecord?id=CVE-2026-34978
> 
> - CVE-2026-34979: The scheduler did not always allocate enough memory
>   for a job's options string.
>   https://www.cve.org/CVERecord?id=CVE-2026-34979
> 
> - CVE-2026-34980: The scheduler did not filter control characters from
>   option values.
>   https://www.cve.org/CVERecord?id=CVE-2026-34980
> 
> - CVE-2026-34990: The scheduler incorrectly allowed local certificates
>   over the loopback interface.
>   https://www.cve.org/CVERecord?id=CVE-2026-34990
> 
> - CVE-2026-39314: Fixed the range check for job password strings.
>   https://www.cve.org/CVERecord?id=CVE-2026-39314
> 
> - CVE-2026-39316: Fixed a printer subscription bug in the scheduler.
>   https://www.cve.org/CVERecord?id=CVE-2026-39316
> 
> - CVE-2026-41079: Fixed a SNMP string conversion bug in the backends.
>   https://www.cve.org/CVERecord?id=CVE-2026-41079
> 
> Also updated patch offsets.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
