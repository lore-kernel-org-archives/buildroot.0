Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC601FC72C2
	for <buildroot@archiver.kernel.org>; Sun, 22 Mar 2026 11:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB6D2811D0;
	Sun, 22 Mar 2026 11:27:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLg8jQiGBMRn; Sun, 22 Mar 2026 11:27:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B38481149
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774178824;
	bh=CLfDXmhxeRNvevOz26XCa89ZDg8GquaHoGp4+QD9CPU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Un3m6tyfkkXvIYcayB2JM2+oipT9jrxXyxBRoDSjuVrEDyI4OWtzk53oENzu4k1mm
	 8tKZmYxlx+3MrzOlcyCtdf7L3MOJPtdr4xE4lyhkrQGCNFKkGoHtOtCCvk6b7LQc7H
	 6w0VwuadtkgiBBCOPqwLZSLoa1dljv3GasgejAz7qDGWdpEEvdSvej8QHEQVbxOwSr
	 s6Y8Elsur5ekNQAGdRRkopwNAAaSjxjvxQ4fPaJAV/q6x96VLbx6sYnI48QZeM7gDv
	 qjNzsFtThy8521gVVvwfRI48ni+getDUI9eMG/niHiZdIWWGMvSVdjP9svJXIljrHg
	 0qrB2mK2n0s5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B38481149;
	Sun, 22 Mar 2026 11:27:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E873E2CC
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 11:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9FE94030F
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 11:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hmiVdO2300i2 for <buildroot@buildroot.org>;
 Sun, 22 Mar 2026 11:27:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0859F4018C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0859F4018C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0859F4018C
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 11:27:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 79735B00579;
 Sun, 22 Mar 2026 12:26:58 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Mar 2026 12:26:58 +0100
MIME-Version: 1.0
Date: Sun, 22 Mar 2026 12:26:58 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260321180053.448107-1-bernd@kuhls.net>
References: <20260321180053.448107-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <96bf4249c1a3942bdcbdcf60c1883e21@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774178819;
 bh=0UeNTI/6EgmraFYsUd8AXyvn7RMBCKAWaTSIMuUIXMs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QqiOFNYIOGwOCLf4rJi+T8iXgtBV1Oe52RSHeFBMjlunAq3n99kjFauQ3qly2Dozo
 XtrGl+BlQjnN9a6XeUSOI0Zr1w7drO+iOXlBraZjCHlcRdKV/EEmuOa8gW/Ur6evzP
 4aO43niOWmb0yAYE0KXhUqGU16CtYXp6A5j+UvpyW19r8N7YUJIEBo8vt50iJqJAKR
 9uhySJms8X8dKHsbV8zFhtNj4rK14cZYTWIr9LPc1f6xgA7bw0yMTjYYQc1rtnLa+p
 DGz1JEAj71XE2KRtA+nC/9byqXb2CMI1T7WttZI5M+xmMntMQPw+XodfNbjA4YKXQ7
 WNryQgHhVJnAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QqiOFNYI
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-zattoo: bump version
 to 21.0.6-Omega
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

On 21/03/2026 19:00, Bernd Kuhls wrote:
> https://github.com/rbuehlma/pvr.zattoo/releases/tag/21.0.6-Omega
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
