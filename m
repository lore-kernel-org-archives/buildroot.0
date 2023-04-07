Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FA0C6FD1D
	for <buildroot@archiver.kernel.org>; Fri,  7 Apr 2023 16:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E842C60F2A;
	Fri,  7 Apr 2023 16:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E842C60F2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BIq7MNS5kybn; Fri,  7 Apr 2023 16:31:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40DFA60D4F;
	Fri,  7 Apr 2023 16:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40DFA60D4F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6DDE1BF23B
 for <buildroot@lists.busybox.net>; Fri,  7 Apr 2023 16:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD8818449B
 for <buildroot@lists.busybox.net>; Fri,  7 Apr 2023 16:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD8818449B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OE6ScdozRv8A for <buildroot@lists.busybox.net>;
 Fri,  7 Apr 2023 16:31:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FEA984495
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FEA984495
 for <buildroot@buildroot.org>; Fri,  7 Apr 2023 16:31:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BA99A24000C;
 Fri,  7 Apr 2023 16:31:18 +0000 (UTC)
Date: Fri, 7 Apr 2023 18:31:13 +0200
To: Oleg Lyovin <ovlevin@sberdevices.ru>
Message-ID: <20230407183113.30ee6a87@windsurf>
In-Reply-To: <20230407141930.694756-1-ovlevin@sberdevices.ru>
References: <20230407141930.694756-1-ovlevin@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1680885080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=deN0thUrG/WF8aZzmOcPHa+Rf2cEgnWUtf+KAioOYnc=;
 b=fyoH28haom8iScLFXqB4w+ht5Bm+4vCtGD0rm0iHgwKmvGMF/DA2C+i84528u6WLa0j2/L
 pRSvdLNlCQCa4sdTw4N2HmXMWDLdeIO6HwsanqaKtWdabrCGxdfEhmmKAm6DrA07dCSAeh
 sJFKV87gQS6s/Bvkj0eVnR0hzL20b1yZkYyXlkITqNWecn1lbMTrYZ+8uY3/vEL3LajlIK
 KSfdLYLEFgw8195a9OiPGuSR/gkhyCtTL57ciCugPfC7x135H/8dWGMzHaHiPnTPz5IMEx
 SI7eZpaMm+HpfDRgYrMyrLJve2kTk0cPNj7iaTol0cEU0Ml3XUwbj+B0HphCTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fyoH28ha
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-headers: use host-make
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
Cc: olegartys@gmail.com, sdfw_system_team@sberdevices.ru,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Oleg,

On Fri, 7 Apr 2023 17:19:29 +0300
Oleg Lyovin <ovlevin@sberdevices.ru> wrote:

> GNU make package from the host machine may be too old,
> so use the one built by buildroot.
> 
> Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>
> ---
>  package/linux-headers/linux-headers.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Thanks for the patch. However, could you provide some details on what
problem this is fixing? Is this due to something new in recent Linux
kernel releases that require a more recent version of make? If so, we
need to understand what is the Linux kernel change that causes that,
and what is the minimum make version that is now needed. Could you look
up those details?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
