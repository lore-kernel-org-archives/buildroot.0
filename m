Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F72C4452B
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 20:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0284F6089B;
	Tue, 21 Jul 2026 20:21:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id adXCcNVtiMBU; Tue, 21 Jul 2026 20:21:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 153386089E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784665305;
	bh=YqiPdNybJehLOKQo+jdPbwOftefhuG/tzO1KRf5Jrf0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FhjHDb2teB7dMg4K/SOWJhHMkCKmWUqa26aiYiyWRzan8e26jR+0je1IcUAH/bZLG
	 tmNAh8dVbpBUVoZacoJ9gwfLPTZaM/87GRcQB1WFIOnpHTsb+HUt5BEwOXbIjVmIMp
	 EpiLTAgw+mBo+j6fB5O/Uvx1usAeeem15AAJaeeUKURYpw+OsqoojVefGV+DUFDEGt
	 I+sm3fRVH3oeT84a2UgA9oy/FfduB5Qy85nkqLnwqUrQ7jkU5qbuhpMhyCu/LNwdmd
	 C5bv4XQWK1VgS/JlbqzgNwm/PUO9wsvjLQx3/Yz1jmDssINpaXI5U2tr04h7zGQEFB
	 JHAoxIEurnM6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 153386089E;
	Tue, 21 Jul 2026 20:21:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA92E42A
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC7906089B
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DplyaKQ1TAYZ for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 20:21:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CD40360648
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD40360648
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD40360648
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:21:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id DBD45B00548;
 Tue, 21 Jul 2026 22:21:39 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Jul 2026 22:21:39 +0200
MIME-Version: 1.0
Date: Tue, 21 Jul 2026 22:21:39 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260721092213.1282012-1-dario.binacchi@amarulasolutions.com>
References: <20260721092213.1282012-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <d7bd7eb35bfb82a4295b620c7439b57c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784665301;
 bh=VZSKgxn48ej178R2vUZvPLgX5T5ucMqgatZwFJcJV5E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Bnb0QQYakZTTAu3Jy6AweYT02oDdRiMMYvMX4SWiApXy0Hvh5XdC8hHj/eXC8d+c6
 6rdm/f361ck9gW/o62q441JUfH4nckliMd1TFJLUJMhl5/caAU3UeTYaEIi4xS90B0
 aFOCIQ56Sf0AN8te48u+zgWiCplBQZPpogC6tzJ6R4qv5iqfsXwN3DWdkXCiKqfSr8
 5pGkrcs2ylbTEsXh2/Grpxry/oLGo4KKoRRNaXu+i5KDvCjRwtUGLNPn8FAFajaH53
 i3Oc1Az9QtskqEXPfHz8iy+ixBplaHNZQrseH5WfvTFCis+xaBBMfTAuhR6EWCDghD
 X8YX8+s2JWfNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Bnb0QQYa
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32h747_disco_sd: bump Linux
 to 6.18.39 and U-Boot to 2026.07
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

On 21/07/2026 11:22, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.18.39 and U-Boot to
> version 2026.07.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
