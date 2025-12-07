Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E6AD2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73C9D60B25;
	Sun,  7 Dec 2025 16:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CO4NWBYjzZx4; Sun,  7 Dec 2025 16:04:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09D9B607EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765123491;
	bh=hVI+MSsVsd9hzfv7L6ZLiwWsUCqPnEvsYyXm6zz1wok=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gxSAmOFBVxCwBK6JA57+dkdiwdude2qTLhRxbjEFt7oPvwwaNS8asnEDoql5wq5/J
	 hTAK7YuMqfUY5NRKRFUEA/ZDmRoWBbqAJ8VMCNl4rA6QWTHwXuSitUt11sr4tvdiOp
	 VMkXVhBgGuYC4lp8MJsy3YZMdwyxqgQbuyXCSsgKX/Py4sN1pdlH9zqqmmVcaUoVXA
	 zuWRtjlNq2VOJyO2iRDOMUIgjuFA++uDoJGs128BciHx3nzd7MdhPTZe55oqSvoyXK
	 5Wy5gg6sT3c/nlDZEBDa9N7t9O/2eivcKh7DXgZMQJCPWGJsolpP3hsKRT1U5NohnW
	 p4lnZLrD8tiqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09D9B607EE;
	Sun,  7 Dec 2025 16:04:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DEDC151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09044607EE
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8rq0fB6EPL43 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:04:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 44F11607AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44F11607AA
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44F11607AA
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:04:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id AF4CC2003C8;
 Sun,  7 Dec 2025 17:04:36 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 07 Dec 2025 17:04:36 +0100
MIME-Version: 1.0
Date: Sun, 07 Dec 2025 17:04:36 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Alexander Dahl <post@lespocky.de>, Davide Viti
 <zinosat@gmail.com>, Eero Aaltonen <eero.aaltonen@vaisala.com>, Fabrice
 Fontaine <fontaine.fabrice@gmail.com>, Rahul Bedarkar
 <rahulbedarkar89@gmail.com>, Romain Naour <romain.naour@gmail.com>, Sergio
 Prado <sergio.prado@e-labworks.com>, Stefan Hager
 <stefan.hager@ginzinger.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251203214709.2321976-1-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <6c6d37c231c896fdbc77b280720c171b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765123487;
 bh=bTGIk+Y1E37DE1DyYosapb80SZo9YnZWPFz5Ea4Gp/0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nNk/3qwSIakjoe2F0dldmjF0TWjUmfNkzG18J620tiF1TGvVKcKrPvu2dEkP6+CjS
 HkRkBfvJpL3Cy2DLBZoXLmuPUilaE3uPslIpMpQkkdp90Zj2dx00dxasgMZKvwaTe4
 yrAe9/a+vA8PcGDeioEcK918xmCTW6KgUH7gJqAVKmmwWoB1thl11fm/JJzbxk8s+6
 /+boUcoeTf9mICiVUQiqFJ/iT+9sbpXEY85T0gefMkY3qhT3aBLHuqJ/6o0yqUqcN0
 efILsIF6d5kiS3ejmEpvZBNmRFtlpfN8JoQ5qVh+zmak0sQBycuCDGVmqpGaL9U/S1
 kSFa4MorZJSvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nNk/3qwS
Subject: Re: [Buildroot] [PATCH/next 01/21] package/azure-iot-sdk-c: fix
 cmake 4 compatibility
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

Hi Bernd, All,

On 03/12/2025 22:46, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I applied most of this series on branch next.
For the 3 patches I did not applied (json-c, libvncserver, read-edid),
see my answers for those specific patches.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
