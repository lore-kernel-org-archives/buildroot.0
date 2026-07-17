Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687DAC44515
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 16:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 009F940B00;
	Fri, 17 Jul 2026 16:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0QL4YN0OEhXB; Fri, 17 Jul 2026 16:57:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 394AB40B03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784307468;
	bh=kfalIu2I4NfDN4c2QbKkE6rHxhbCtzAoyf0oj7dfWsY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LaIgMdq+ho6yn6f+bu/zeJ3Mcgc/Dgj5hLQrES8U9uO659tASqtjYG91RpPooiNMI
	 Ah12i7V1Ycsh3h3J6uuxErYh2SLrZeQiZG6QyCl6O52eqr1hz8dHPIQaZ5S1kxluFS
	 LgRRulbqaGg8Ubq8QWILySy0tz909atzyn18ZCUb7+MbdTK2cxpQ46/k3VklbnFvQw
	 QbMq3I3l/HdMsFRPLuikBAG32ca2VWaC5vkQXmdXjf0pT/ekOc6V9+rSKqXMhA78vQ
	 NZ0r65cEp6j6HeiwJ3Vmnk/FBOlBHaoYcxCVzkvtJnd8DDdGbM0+eJUa2m4IEB6IsM
	 4g4X2rqsGXnWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 394AB40B03;
	Fri, 17 Jul 2026 16:57:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 137801F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 16:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDFF160ACB
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 16:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gG_Duo5GQZKv for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 16:57:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF6D260AC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF6D260AC6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF6D260AC6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 16:57:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2AD5F13F879;
 Fri, 17 Jul 2026 18:57:42 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 17 Jul 2026 18:57:42 +0200
MIME-Version: 1.0
Date: Fri, 17 Jul 2026 18:57:42 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260717150301.2829199-1-troglobit@gmail.com>
References: <20260717150301.2829199-1-troglobit@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <b5ff94e53d4147bbbc0ed311f05edddb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784307463;
 bh=X0PkI5mKBLzCPGSTNDzt9d6Sfhh6vIGletmWtxL0cZ0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fdtSZwef72wPsgnic795suL72bStlXPtWrciPRsnBq1v3P08Ty1vcb+I/AcXs3c/A
 JqdXDw6zHK18uxGgI5A15OeFkQcGBqs6MvXDRQXiS2dNrE0PjM4nhsX4E9p4/C8C56
 fMPpTsL4YspicUC3eXcLiUaILNUGdVaAwU4YnN4kOhFVALMZyMVGn0Ov5DaWaS04Da
 gdnBd5yhApya5K1OpGnw7HOsuWkZkjaPd3U4GpTiJu1DDquGiwoTjiq6a7hWEf8mP1
 leIpU2oRV2QE+agiHTLtRmrS0UEG/jIQM6ZgpauppHj4QzLrYv5ku7/cs2Pw/OWVq4
 d/z1e3F2W/82Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fdtSZwef
Subject: Re: [Buildroot] [PATCH 1/1] package/mg: bump to v4.0
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

On 17/07/2026 17:03, Joachim Wiberg wrote:
> Major release, multibyte text can now be typed, displayed, and edited 
> in
> UTF-8 locales. Also, syntax highlighting, a visible region, and side by
> side windows.
> 
> Release notes: https://github.com/troglobit/mg/releases/tag/v4.0
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
