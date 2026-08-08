Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE37C55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 09:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1447180F7B;
	Sat,  8 Aug 2026 09:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mQQYSWIjTPK9; Sat,  8 Aug 2026 09:26:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BF3480F6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786181173;
	bh=ayQ5ys7JvGZjlvBfi1iD7QLjo1pyMtFpj8qk3XO0dZs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aAdARliUGcNfxrEdtb5jdEYwqu6+6Sg7/RyAOdfP3ZmglM/XPeQaePysg8udDVju2
	 SRUTEQ+rW1Otbu6PsLZepaw8SqX4o9goDzJHmp9ytR+HGDB/V1D74o2MWh4dQ/OCnY
	 MctuViTBWS7oCCcp6JlFeIcgIgjA73ex8K+4xh+1/vbU+kzBFfP3vjfM/5nKYCZ1JZ
	 8FFW2YyZz+LKJrUbHyVzQkeuLZuTPPfTnbnsuYP3BgPIc5Si6iveRdZhudvevUagVl
	 /31QUhDaQ5lM9G/dkaFCivgtq6jRGiWLTS02DB2Rw6SGqhyZXSnWSJWH2w6+mX5qLJ
	 30TkFyv2TwOdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BF3480F6E;
	Sat,  8 Aug 2026 09:26:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 356132B6
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 09:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2757140755
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 09:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WCLt3pfGQh3I for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 09:26:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 103FA40753
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 103FA40753
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 103FA40753
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 09:26:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8A92E13F8A2;
 Sat,  8 Aug 2026 11:26:03 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Aug 2026 11:26:03 +0200
MIME-Version: 1.0
Date: Sat, 08 Aug 2026 11:26:03 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260808082357.69525-1-bernd@kuhls.net>
References: <20260808082357.69525-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <dad6d6576183acf9b7aeac640bc172f3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786181168;
 bh=mwZX8ZAUZeST7aq43OZDe2ykmXG+nSw+/6u0MqhA45w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fwqPabn2VTSwSeQF+JU8g1YDo+kvWJyJmDaxvsOiTlOsI9e5mywcODVtu8CPEIcOm
 7JL5ykthUx2vVS2nxyGjns36OvCffEIyf99ecwDhqoBltVgnQkmWlHzVcZswhv9ksU
 Fc8nhcOKH7UaS/5lB3CYz0oPc9OTP8Wi0TuYCUOuWIqbAch+OMObUpY31Htegt3T9B
 7IzeIxx+erRyuERw64ytFNMBsOxXPt9zn1YFQ/kz5nirE1dVfJUfx5X78maSu6jtYG
 6dm/PAvJDW5TfMjXARuFLnVFYxXAgrqbQBv0H9c5uksQqsTXtYMTJaeSQ0sEseICuu
 wJ3I6M1xpiX4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fwqPabn2
Subject: Re: [Buildroot] [PATCH v2 1/1] package/gcc: bump 16.x series to
 16.2.0
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

On 08/08/2026 10:23, Bernd Kuhls wrote:
> https://gcc.gnu.org/pipermail/gcc-announce/2026/000193.html
> 
> GCC 16.2 is a bug-fix release from the GCC 16 branch
> containing important fixes for regressions and serious bugs in
> GCC 16.1 with more than 102 bugs fixed since the previous release.
> 
> For the list of bugs fixed in this version, see:
> https://gcc.gnu.org/gcc-16/changes.html#16.2
> 
> Removed patch 0003 which was backported from the gcc-16 branch and is
> included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
