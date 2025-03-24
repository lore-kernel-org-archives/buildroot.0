Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A11C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 21:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FE1F605BA;
	Mon, 24 Mar 2025 21:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AuE3Wylm5TAp; Mon, 24 Mar 2025 21:23:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC4D360672
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC4D360672;
	Mon, 24 Mar 2025 21:23:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A837C1C9
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 21:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99ADF4094B
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 21:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pA8e6veUWCrh for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 21:23:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 04A6B40944
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04A6B40944
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04A6B40944
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 21:23:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 042EF2003BE;
 Mon, 24 Mar 2025 22:23:27 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50260])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Mar 2025 22:23:27 +0100
MIME-Version: 1.0
Date: Mon, 24 Mar 2025 22:23:27 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250323190602.3336195-2-bernd@kuhls.net>
References: <20250323190602.3336195-1-bernd@kuhls.net>
 <20250323190602.3336195-2-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <c6ab7067dd7d4150aabbce8f6a8c4a72@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742851409;
 bh=nCda1Vin8h+rRvMt9Eq5xrB5XBvFdqKZ1lyTNbmlzx4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GwHgbhME1d45Nedya9iSnM46C9zk4tGs272Ylw913Mx77kTdXdYu3NghwaRf5stvL
 Zspu1wXOPDJ3IZAHaqI0gV4glwgFQHUH8Ioz39JXbHKQacBbwsLaoYf+oYZtDpESSU
 2eFLtDyToT3SDlnpDnAot6o6VuOZqJ3R1Hkiy5Xsp52zrGNZ28L4ygyjM+5w1Q3Sw4
 76G4UgWhLAyBeVtopY54R3YDFtPxV3kvMaLA82V3rNVJN2spZAvo4MGjpLbhPawsYu
 YaJk4roB2YEWhHPc8emJEmnEPAsodMQIlQ7P8/jv+3VymW6G8eabsQSJRILI3uFR9O
 dZ/P+6DH7HJhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GwHgbhME
Subject: Re: [Buildroot] [PATCH] package/intel-vpl-gpu-rt: bump version to
 25.1.4
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

On 23/03/2025 20:06, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
