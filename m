Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66659C636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 20:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1F62403F8;
	Tue, 21 Feb 2023 20:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1F62403F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D_QwgqmLvoQa; Tue, 21 Feb 2023 20:26:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B7994012D;
	Tue, 21 Feb 2023 20:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B7994012D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9689A1BF3F4
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E53981AEA
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E53981AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RroXJFy_K_2k for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 20:26:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B6D681ABA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B6D681ABA
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 20:26:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6BE6C40006;
 Tue, 21 Feb 2023 20:26:36 +0000 (UTC)
Date: Tue, 21 Feb 2023 21:26:34 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230221212634.736f8d70@windsurf>
In-Reply-To: <20230221200857.GG2718518@scaer>
References: <20230221142144.1503123-1-fontaine.fabrice@gmail.com>
 <20230221154827.7e737960@windsurf> <20230221200857.GG2718518@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677011197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lNmc7aUvs2qNSl9ddMrlX4cgQsl9lUtWKBdv5iQfZtU=;
 b=ZyQs4BI6MvVqUk14dvgKovP6v4N9D8xnwdcTgZUeObBvOHYjSAePh8YUeOLxp+nRpwS0Ur
 WKTpJVcc1wjNJfSNainoWaXCSKd2W16jtjPD+EaeOTiRBShBb2aJkPMhb2O55GRgiarj5G
 dIqqJ5Woq1SabcNXayHxRrGuTjWOnMJ3ASkWGU7d5gOAu06aTcq5VToKILUrUBNoWnJhM6
 JXGJMe2bYoGS4V9mHt+5P2AEPZ90zLeOwW21OkigE/3fmV0JiLfXmqBK+MKICes6ZE6S3C
 ITyBxbsQckDD6n9VkHDjYlVoMJWdBFR1kzOuO9k1pbi6bPAb1yy3H52DAo/BUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZyQs4BI6
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: disable with -Ofast
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
Cc: Norbert Lange <nolange79@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Sen Hastings <sen@phobosdpl.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 21 Feb 2023 21:08:57 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Alternatively, as the upstream commit also implies, maybe we should in
> this case keep -Ofast and just add:
> 
>     SYSTEMD_CFLAGS = $(TARGET_CFLAGS) -fno-finite-math-only

But the upstream commit causes the build to bail out as soon as -Ofast
is in the CFLAGS, so even if you specify -Ofast -fno-finite-math-only,
systemd's meson machinery will bail out.

So your other idea of:

SYSTEMD_CFLAGS = $(filter-out -Ofast,$(TARGET_CFLAGS))

certainly looks very relevant.

Fabrice, could you give it a try?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
