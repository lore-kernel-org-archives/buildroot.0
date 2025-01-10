Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4624E77188
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 19:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 720CC6075B;
	Fri, 10 Jan 2025 19:35:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_oa7PBw7Tod; Fri, 10 Jan 2025 19:35:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95D5860761
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95D5860761;
	Fri, 10 Jan 2025 19:35:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E44BB76C
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4DDA839C0
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:35:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOu0ai7jtOcZ for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 19:35:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B55B283955
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B55B283955
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B55B283955
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:35:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A954C60128;
 Fri, 10 Jan 2025 20:35:41 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:59038])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jan 2025 20:35:41 +0100
MIME-Version: 1.0
Date: Fri, 10 Jan 2025 20:35:41 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250109173243.1538289-1-peter@korsgaard.com>
References: <20250109173243.1538289-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <965c831df6dfce47bb94f7b458aff072@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736537743;
 bh=JUtI2CscqjBcd45TPsfNxMcCQxxwoOfMF3ijZ1KF87o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V8nRK9BFHHh+j9PMPcLN6+C0zVOKICPFzudDSvLYLh7INaLpeDo1ZyoS+lxO/3Cru
 lwwkz1TkRK+Kzd/fC2oGhVHgoJ+n5qw+t0BEbhBvs2pZSu4N3uVJXGk46ZMgQgehtS
 2wyhQTixTMq6RO+R1dMk33LAkEsVQJqjO6mV+I6Qh8TXhuFYhdX5CNzvKh9U/FpJco
 q2xc05dcGdZHEhLvtJ7T1ig9A53MPiExY2RXvdPe+14Ve91AVDh+rI3oArD3qzDwWd
 urYcLXTQ19FWa7IAQtc4DOWWQ38xlI9HjEnz9YteLg/rq7S+gJstUMi3pAYSWMzpsE
 i+kt9hMrYLN7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=V8nRK9BF
Subject: Re: [Buildroot] [PATCH] package/pipewire: bump version to 1.2.7
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 09/01/2025 18:32, Peter Korsgaard wrote:
> Includes various bugfixes. For details, see NEWS:
> https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/cc7439187f61dd73b81ca69f5dbccbb52ce970b2/NEWS
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
