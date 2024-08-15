Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01255C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 12:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9A7F40B40;
	Thu, 15 Aug 2024 12:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-5kLvBvONwM; Thu, 15 Aug 2024 12:50:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F86740A7A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F86740A7A;
	Thu, 15 Aug 2024 12:50:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 537101BF574
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4198F80BB5
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q6Q343nK9_4R for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 12:49:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C50F80BAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C50F80BAB
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C50F80BAB
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 12:49:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54A021C0003;
 Thu, 15 Aug 2024 12:49:46 +0000 (UTC)
Date: Thu, 15 Aug 2024 14:49:45 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240815144945.5a8be0af@windsurf>
In-Reply-To: <Zr3Ktom4gvrx17Qf@waldemar-brodkorb.de>
References: <Zr3Ktom4gvrx17Qf@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723726186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WtvjAENmyvXAd0DF8TNjq4ARf92E/fjN5eI9AlFVYLs=;
 b=XanisvhxLylOp5IXgZrCHX/so94TS1pZFxojjyp4wCBQkXO/uquctGP1+L/DRTUhkcPdDw
 ymmQGtdqPupLe2h8GzJKB4MjdvvkU2/WwOqyMX/xwehao9zhWWT0fYFm2RpErOKWcVG16X
 20MqlCtbQOa7P39/SgAb4AlyKbpfFOAVu03fzegyeEdKdrvuAJPiHSugaoCYFu53/3n3n7
 sNZcCsPcNzCI42Jb/JyMumKeswwPUibiSYfygdLkMiFL7kCaV8NokGWn0yncec1Vkit3ib
 tNEHihkunS3N+25zRVGsL+oxrX/wmd7/PmsNhB88tCopXA9k+prd+d+aDHXpxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Xanisvhx
Subject: Re: [Buildroot] [PATCH] package/nginx: security update to 1.26.2
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

On Thu, 15 Aug 2024 11:30:30 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Changes with nginx 1.26.2                              14 Aug 2024
> 
>     *) Security: processing of a specially crafted mp4 file by the
>        ngx_http_mp4_module might cause a worker process crash
>        (CVE-2024-7347).
>        Thanks to Nils Bars.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/nginx/nginx.hash | 2 +-
>  package/nginx/nginx.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
