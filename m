Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFB6EE49B4
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 21:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6F8960A53;
	Tue, 30 Dec 2025 21:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0iVYwxeUa9Z9; Tue, 30 Dec 2025 21:45:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A553E60881
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767131112;
	bh=2acgs5Pgc8xVaLzMLuFWeZAIAydCnB9j419j/ObGxMs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OzpttoohYDj5kO0HWig7a3Wt0FIL4xhT4A1kMdNBL+aAgN+L1LPWpV7dD86ky8MkP
	 fPwMNMkNbVIBH14MOsW4Y7e7tLepLGmoG1AkLSMtdufyTUKF43HpSywkj1CEOZVx3X
	 KP96t7POEZH6RzwcTHqR10P/PakkZY4HgtYI9OQ9qL8c000tb/qtAG0nsRG5fP8RSU
	 QvLa7Mkx4c8sWrU2j6VwNyO1YlbOev6anJlsrSQoFf6DAYjBGC2yedXB5cs0z6Cder
	 asrbooUZV369F2AsuBGuecgDH7+Ih/k0hTajImxcoQH/dDoAbPVeLHqD5NK3DZUpgN
	 bJxh3PtWLgn7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A553E60881;
	Tue, 30 Dec 2025 21:45:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6301C177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4986E405B5
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AjNdExsYnU6a for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 21:45:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5DCD74055A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DCD74055A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DCD74055A
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:45:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3FCE313F8A2;
 Tue, 30 Dec 2025 22:45:02 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 30 Dec 2025 22:45:02 +0100
MIME-Version: 1.0
Date: Tue, 30 Dec 2025 22:45:02 +0100
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: buildroot@buildroot.org, Lothar Felten <lothar.felten@gmail.com>,
 Bajjuri Praneeth <praneeth@ti.com>, thomas.petazzoni@bootlin.com, Fabrice
 Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20251216151449.395253-2-kory.maincent@bootlin.com>
References: <20251216151449.395253-1-kory.maincent@bootlin.com>
 <20251216151449.395253-2-kory.maincent@bootlin.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <0bd25fae68ba496d4f70b1590af2eb5d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767131107;
 bh=sXKUb3gYeClw4gvv1i/hQvrk5TsMqFGdg79aSDaynD0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Hu3VT/2lD+OImSr3qM/YtBa/bg1S0KPKzAfTSRt3vxmOZ2hjpPX+8AFeYVEW3Luat
 t7r5raMeNsxXWAHRtyF5ChwkLqR+TaU8cNCmYT4g9eXrWpRJa56sRV6+dmmKWGFb0n
 0BBXau4zt6U9VMcyFa4xHP4tH0PzeyiPRczkhZAf07oDH4IoxRNHg8ZxLAvmshaHxd
 VlHf2SBKmT3VmLOlhOJSJMaM3XEVlO9puIr0tR1c0RePjitRzerlCe8YYnun1W12wN
 i4MlohSNk6s6fJawZ3rksTWkm0/KBneYQVZJ6FcVPt0dnGi5c9bwX79FG96oqaaBpG
 sGUQHSs83P3Fg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Hu3VT/2l
Subject: Re: [Buildroot] [PATCH v3 1/5] configs/beaglebone: Switch to
 Bootlin glibc stable toolchain
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

On 16/12/2025 16:14, Kory Maincent via buildroot wrote:
> From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
> 
> Switch to Bootlin glibc stable toolchain as requested by the 2024
> Buildroot meeting report:
> https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
> 
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Patch (only) applied to master.
I left the rest of the series opened, since there is comments.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
