Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE5CC433FE
	for <buildroot@archiver.kernel.org>; Thu, 17 Nov 2022 07:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF78E80FF8;
	Thu, 17 Nov 2022 07:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF78E80FF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hnBNt_pd157I; Thu, 17 Nov 2022 07:53:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E675280F2C;
	Thu, 17 Nov 2022 07:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E675280F2C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 202AF1BF239
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 07:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5C43418AE
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 07:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5C43418AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9aW93b1cbJXt for <buildroot@lists.busybox.net>;
 Thu, 17 Nov 2022 07:53:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A866C41899
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A866C41899
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 07:53:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 32B1224000E;
 Thu, 17 Nov 2022 07:53:40 +0000 (UTC)
Date: Thu, 17 Nov 2022 08:53:39 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221117085339.4a4d5d8f@windsurf>
In-Reply-To: <20221030083033.GC1058960@scaer>
References: <20221028223844.1180418-1-james.hilliard1@gmail.com>
 <20221030083033.GC1058960@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668671620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04UtJoN0ifZ0768xSznAb3UsMdiI1tzdL7SRuo92stw=;
 b=Dfgibw31JQEeAddiCmWI2M0wKPLqz2WvPaFqTK+f3lNUVIrwKg8Jzy/AaFCCzbU61Zqq1h
 TpbdSejbu++oxK1S7yTbJMwMS0NuXHNsA+isvKhKnvSUxuI1jq8KPurIwQpd5J0c3yodv9
 CpTKyhiob7td2Z0cO2/2jYHJvDAXEgaNqZkK6AlcM9Y6Stg19RggHMtcnaVLC+NNsXzxxI
 ty3bfOw99nI7nDjCp0bBvsbtGh4H5lEh/8K04eOySbYbLnWhnwj9j1xtRCKbm6T/eskLQO
 9Ks8IjgjQ78j75FTzgaaSWTf+x0PS2n3SMUbIB6GyoS5Rgm+BP6UgjLHJhipTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Dfgibw31
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc: ensure __register_frame is
 optimized out for glibc
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
Cc: Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 30 Oct 2022 09:30:33 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Should this not be limitied to the intial compiler only? Otherwise, why
> would we need it for the final compiler?

I confirm limiting the work-around to gcc-initial works.

However, I have reported the bug to gcc upstream, and they say the
issue is in glibc:

  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107728

To be honest, even after reading multiple times the feedback from the
gcc folks, I'm not entirely sure that I really understand their
explanation nor how to move forward with investigating the issue.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
