Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE880CD37AE
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73F64405A1;
	Tue,  3 Sep 2024 20:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jc25KS-sNAlg; Tue,  3 Sep 2024 20:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BE4540577
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BE4540577;
	Tue,  3 Sep 2024 20:42:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 160011BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10F9C40198
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id apceU_Exc5Hi for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:41:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CE6B2402F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE6B2402F6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE6B2402F6
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:41:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2690D20003;
 Tue,  3 Sep 2024 20:41:53 +0000 (UTC)
Date: Tue, 3 Sep 2024 22:41:52 +0200
To: Michel Alex <Alex.Michel@wiedemann-group.com>
Message-ID: <20240903224152.5cf6b343@windsurf>
In-Reply-To: <AS1P250MB0608E95391462F88D8DC7F02A9932@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
References: <AS1P250MB0608E95391462F88D8DC7F02A9932@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725396113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bEXqUJliX+rjKQFL8HK0FlKLqH7Dn6S7YfvUCPNg3kU=;
 b=OXTbdRjaFR5Tt21Sl31tQODeZ4eiWr7ISob9YbvwU/vagUdWTW7EvWFeXVqjDlUcIefyBL
 /uBYBPNWIr16P3TVecqZq1Tg3h+C8XbE4qrWHlVcDyQEvs1rksRjaNcHCHohcuvxBf/22h
 zfbTSQGP7Y7sEHJWpxtOZxcKulcMOkDeW5N/+UR0Rj2Y7DhRMnCkbHCqs0OE3a4VqHNAqI
 y0shYgZJNPYs5lubJciXSmvV152tmygmSAYVTi01DDNbnM4tWgtVD4c/Ny2nTCHQjS+wN7
 UOsMM1QvTgoKIa6mbPy60yrmAP+VPnwhEjrvEqIIf5B8mrsbsgPVZdnFEDOD9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OXTbdRja
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager-openvpn: bump
 to version 1.12.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 3 Sep 2024 05:30:01 +0000
Michel Alex <Alex.Michel@wiedemann-group.com> wrote:

> https://download.gnome.org/sources/NetworkManager-openvpn/1.12/NetworkManager-openvpn-1.12.0.news
> 
> Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
> ---
>  package/network-manager-openvpn/network-manager-openvpn.hash | 2 +-
>  package/network-manager-openvpn/network-manager-openvpn.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
