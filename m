Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF40A103FF85
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 21:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B100F4182A;
	Fri, 27 Feb 2026 21:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-jFs-4Gz693; Fri, 27 Feb 2026 21:06:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E284D41824
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772226390;
	bh=+bfJMaM2q+ziWmWLatfKdPtR9wSjX063ql3xIC5Vzbw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WATQFM4feop/jRlJ+4X/qHRn6Op8A+R/QUWop4gWlKyUY240Q9QY8DArrzfajgqir
	 BV5mC4M+S37iFMAVQxWdlB+GWK4C9+JAW7/wn2FJOQS3XwfJzazA6uQ7pfz8J0rJuP
	 t4vY4OesDoZnR9dzAsTbz1SjYp5xDgJvlmonEHOhL398FYJtiu3e1PkXUJAr+foKvK
	 kyEphNousa2lvHvVsUsmFR3pHqnDOSipCnDgOaEikXzmSPKAT+5K817Q6m48XKEB6M
	 3tx19AnP66UsnLW0+2fFX4CqtRw9W7/NMSebuikRYXYW42Jej42Ev0qVjcSaFmcSkP
	 N6/5KLhWKaKQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E284D41824;
	Fri, 27 Feb 2026 21:06:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84A5A1F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 21:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A81A83419
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 21:06:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yps2Pp83KLNH for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 21:06:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6303883B5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6303883B5D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6303883B5D
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 21:06:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 95AC85FFAA;
 Fri, 27 Feb 2026 22:06:23 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Feb 2026 22:06:23 +0100
MIME-Version: 1.0
Date: Fri, 27 Feb 2026 22:06:23 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260227201607.3701906-1-giulio.benetti@benettiengineering.com>
References: <20260227201607.3701906-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <cb7debcb76e3b5441b9284b65fef7077@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772226384;
 bh=MYUHk67EVTbz07YmUDfv4BkQW0uN3f5I5cyw3iX+9G8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SAyx879mhOrAAx5A7a5B8l1SYWp0Hlo7zz9rkXlCp/OBrSUWfc+x/0ZXnpR7sisrG
 LdSyKPefA3iDvUX5/4WtfIUpmHeMP+/nVpTFynNTUp5poH9Gbl1QYjKvYuPaNIuoJn
 erbIokuZd5iDpv6iNJDdDC3rWyb5NdOV1NJuO1ToVg6c6K6TNHJMsOmFRZl4BiBTd3
 YYMrpMNO+8sxT5tWUuFP1EwkGsea1TA3SgRM9ysb2+t4iLZj5w3G44xXd78ri3fo51
 9S8/C4t30ldIpx8DVKePj7tlEeItpQi//Q5CGdw3PmcLk438ipaPQMQ39uiRzbLXDf
 snpWcSInyg/Sg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SAyx879m
Subject: Re: [Buildroot] [PATCH] package/bind: security bump to version
 9.18.46
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

On 27/02/2026 21:16, Giulio Benetti wrote:
> Release notes:
> https://ftp.isc.org/isc/bind9/9.18.46/doc/arm/html/notes.html
> 
> Changelog:
> https://ftp.isc.org/isc/bind9/9.18.46/doc/arm/html/changelog.html
> 
> Fixes bug:
> GL #5751
> https://gitlab.isc.org/isc-projects/bind9/-/issues/5751
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
