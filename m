Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0763DC5478C
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 20:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C69398308A;
	Sat,  2 Mar 2024 20:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B_amHKrPcG42; Sat,  2 Mar 2024 20:43:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F11F583126
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F11F583126;
	Sat,  2 Mar 2024 20:43:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4BDFA1BF834
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 20:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 395DD8308A
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 20:43:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eIlT0chDdFet for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 20:43:55 +0000 (UTC)
X-Greylist: delayed 376 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 02 Mar 2024 20:43:55 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9078483134
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9078483134
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9078483134
 for <buildroot@busybox.net>; Sat,  2 Mar 2024 20:43:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72C0A240003;
 Sat,  2 Mar 2024 20:43:52 +0000 (UTC)
Date: Sat, 2 Mar 2024 21:43:51 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20240302214351.00494c2b@windsurf>
In-Reply-To: <20240301220336.315114-1-francois.perrad@gadz.org>
References: <20240301220336.315114-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709412232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=agfnEAXb27aqUBWu6wMo/HzZvhbi2MPPewqvTN8nG/E=;
 b=A2+k6DnPJNQrvv3YRVJe4Bn3DBuvSGENzXlK/U8sm0XHQE5Rd1gI83VuAxNoy3rMeNpe/X
 o7e/guiPJl8PL5kvKsSb+Tc6iEdAF98xJU30A+iRFNR3vSQNcJL/oa01leqEONL6JdWy/U
 /frktAGSBXH0kgVDJQX33LOfIrJS5JZbDFTGJV0ky0LqDGF9wzbtMbZBB0Dg2irRuLophc
 /mvYuObvF1EjEW6Rmm1blUacMeM1Pr29ALtK3EWFODGbSLGl8wdG8WyODeEl61jA7c/bnm
 yuD7LhELWWm3BrzqZluMOHKhKp52fjsi1T0lecKPvaWaYpsB2wLHkkDzLF7exA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A2+k6DnP
Subject: Re: [Buildroot] [PATCH] package/pcre2: bump to version 10.43
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  1 Mar 2024 23:03:36 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> diff LICENCE: update copyright dates
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/pcre2/pcre2.hash | 6 +++---
>  package/pcre2/pcre2.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
