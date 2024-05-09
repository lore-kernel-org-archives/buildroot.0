Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A43C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7ACF83DBB;
	Thu,  9 May 2024 15:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFFPGXEHLcW9; Thu,  9 May 2024 15:18:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA83983DCC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA83983DCC;
	Thu,  9 May 2024 15:18:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DBDB11BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8D1260EF5
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_P4ikFNLfJI for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:18:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D431600CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D431600CC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D431600CC
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:18:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CAEF7E0005;
 Thu,  9 May 2024 15:17:58 +0000 (UTC)
Date: Thu, 9 May 2024 17:17:58 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240509171758.2ca0fdd9@windsurf>
In-Reply-To: <20240417220610.136595-1-ju.o@free.fr>
References: <20240417220610.136595-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715267879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hIHo6PFWAnQAK7wtGbdzVHTne7cFC7WsBbfWb46q9Y4=;
 b=DBy3rl64NSIReEJJ5K/CiKpR70UPOjuaQ1HGJCSlBqFv9j+NWQ9pgog3zkXdpiQNT4VMN9
 PWi7nXt31s4Ov47ElAq33lur09uJZDp+7JSW5vj+uyeJD3trYXBvLqjs8M5PFHXuEFhHRf
 p8qAYwgO2bsFcBq6JPCPnjBG8m/RM/XJ0pwUKAzOnQFo5k8mTvR2kupM1qX3n7es/8jbnP
 Xj76adwpjOzFEvrdCGUFpHQcDI/Q7gv4rjdfGmS4HRCKwZSt+kyz4nvheKCostXEhFzCSD
 cVtpIx7ppsHHCJwgzuBcV1cTHtP5H0Y5gQ/pFJaLrznuU2IxGNs3LA2Ooc06pQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DBy3rl64
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add netsnmp runtime
 test
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 18 Apr 2024 00:06:10 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                    |  2 +
>  support/testing/tests/package/test_netsnmp.py | 44 +++++++++++++++++++
>  .../rootfs-overlay/etc/snmp/snmpd.conf        |  4 ++
>  3 files changed, 50 insertions(+)
>  create mode 100644 support/testing/tests/package/test_netsnmp.py
>  create mode 100644 support/testing/tests/package/test_netsnmp/rootfs-overlay/etc/snmp/snmpd.conf

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
