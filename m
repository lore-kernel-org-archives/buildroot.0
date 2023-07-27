Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3740C00528
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 21:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B569813F1;
	Thu, 27 Jul 2023 21:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B569813F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12_uHq_KneUs; Thu, 27 Jul 2023 21:28:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF6E4812F1;
	Thu, 27 Jul 2023 21:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF6E4812F1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F30611BF414
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA63A404D4
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:28:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA63A404D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VRQ2wyawEfK3 for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 21:28:53 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3640F4020B
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3640F4020B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 941B4240003;
 Thu, 27 Jul 2023 21:28:49 +0000 (UTC)
Date: Thu, 27 Jul 2023 23:28:48 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230727232848.1adda07e@windsurf>
In-Reply-To: <20230727144228.351219-1-bernd@kuhls.net>
References: <20230727144228.351219-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690493330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6JRzQj0OhwrYKU5Ekfs9swansrYJGKzMQSsnwFva1vg=;
 b=D7x8ghypn923SNIgI+09Eg3pfMTYPCL6FRXZuWMn2HPRf1Z/pFSagLUbmA1Z0/LPMNqAs7
 r4CDPrMSgZPlGI8GQdKgIkYQXXazHQZEa5s8Z8Wl3Bo1gzEVSdF12Op8GDyXGJD/BTkvpD
 9DEV+hImzUfxshI/+F2ULDnHZ4uWhpX6YcujOXoexaPebkVl5Hrvr0seawnPStpgQiQSUJ
 8df0eGbq+QqqOutvhfP00fGVK/TkvGvDNFR2198PnwUw0le8PIf42aumtW6SaEBZxkDh04
 g46cMMVnKWH6I/JLV5wBjmLvzh4Nw96fIfjuHxTuYxGFmXOHkK/Dlr5Gk5xqHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D7x8ghyp
Subject: Re: [Buildroot] [PATCH v2 1/1] package/cairo: mutex support depends
 on NPTL
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 27 Jul 2023 16:42:28 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/041/041ac8f0809a0f9415c545b7585cd197db08b55f/
> 
> The last bump of cairo took place in 2019 with commit
> 8d2a9d089a969909ad2de8acb67ee14ced03de28, the first build error of this
> kind I could find dates back to Sep 2022:
> http://autobuild.buildroot.net/results/8c5/8c547ec2e148ce3c4f230bb4b0d5c5b360d74dd5/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: extend commit message (Thomas)

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
