Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF40FEE4C9
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 14:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB548418A8;
	Sat, 28 Feb 2026 14:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sN4JppZ0uoUX; Sat, 28 Feb 2026 14:21:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F4C9417FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772288468;
	bh=4pORgvWJLD78HLdU6zAMs1omvQz76lqOua/8/iqNPtQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qZlwjtV+uXNo3rz7z1UXonFa+ed4x0E3uuV7p5slFzFLEfvfZewsklNtW0j/u+18x
	 ol985SHV7QoXDbyDs28ouSjDi+cvgm60XU4nddnPMOrnfASUbG81LCDv25yy0ITuVM
	 gQzmYVCQbp8SB1v6hhdW18V/W0pSbf1P4uaiaqXHu7QgovoKR+kq2cg2ErQ2XTrsGr
	 9oH7+Npj1CVvxmv/7RO0hQfXoBtVbcx5HHjOcIN2gBHcZ6k6OADi4VeTC8ITvjYgs3
	 JrjHmSC+NxYLxjDTbPnSH/SwVTRZV0hwNea3Dosi9+rHF9GL8MeY9H48hDHkYLZKIH
	 +q4YFvDs3lCaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F4C9417FA;
	Sat, 28 Feb 2026 14:21:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ED77B18D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 14:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3564417FA
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 14:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v24HI7Rrp6GC for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 14:21:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C4AFB417F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4AFB417F0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4AFB417F0
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 14:21:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 90D2213F88F;
 Sat, 28 Feb 2026 15:21:01 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Feb 2026 15:21:01 +0100
MIME-Version: 1.0
Date: Sat, 28 Feb 2026 15:21:01 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Julien Boibessot <julien.boibessot@armadeus.com>
In-Reply-To: <20260226201437.1118555-1-bernd@kuhls.net>
References: <20260226201437.1118555-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <697c08a6b6cfc514901bc8e32260cb65@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772288463;
 bh=dh4U5Ny1esBt7LqvXgFNOLuySDkmriuXz+D4ZvucfhY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qSit9XWLQkl+7yTJJbm/wT6/mEAAtmU3EDeXpUBqOC1xoGoASStWAJTcnrDhmahQ8
 4IZtHNPbJHNDIeeNUetUYumQUY8luzKv2OE/EceRUto+s4t9hvRcupwSLwCofEYGyS
 IfQDZGgZbvQPLXG4ApjPpi0tdCbjfxLp5+YRFGkBydLB+UKRLTX1ghTgwlzLOqVLX5
 NsbYMoBePcRFQ0akJ/vNDz63xrO6By8bV9TRJwKNSiKUBVF3bOmx/3FBSt+FQFLfpD
 IlEZsoESfe2L9jUwy9kuNlahKqFni0ZGlOTOC0JwyqARrLUdZn1Hc9rI1N4HaTtcqM
 QT5yMkBEWkWHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qSit9XWL
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libmodbus: bump version to
 3.1.12
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

On 26/02/2026 21:14, Bernd Kuhls wrote:
> https://github.com/stephane/libmodbus/blob/v3.1.12/NEWS.md
> 
> Added tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
