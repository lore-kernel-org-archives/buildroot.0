Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83745D2447B
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 06:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F86C82047;
	Fri, 11 Oct 2024 06:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZ3sv9JD14OF; Fri, 11 Oct 2024 06:33:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68A168204A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68A168204A;
	Fri, 11 Oct 2024 06:33:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 68BF81BF385
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 06:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 586148204A
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 06:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yf-xKAgYhE53 for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 06:33:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2048E82047
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2048E82047
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2048E82047
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 06:33:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5ACE4E000C;
 Fri, 11 Oct 2024 06:33:12 +0000 (UTC)
Date: Fri, 11 Oct 2024 08:33:10 +0200
To: Ludwig Kormann <ludwig.kormann@ict42.de>
Message-ID: <20241011083310.26cef6fd@windsurf>
In-Reply-To: <20241010091531.1943185-1-ludwig.kormann@ict42.de>
References: <20241010091531.1943185-1-ludwig.kormann@ict42.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728628392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FjZr0krVlLATurx1oPc/RwA2dVOXr5TBr0oFsOMWFcs=;
 b=W+FOUUeK4MSQ9/LmJFB/qS86qkhvv3qFPO8NZuTphBL17YlWcU8MpWXLMuJV2ZiIoPPpsp
 k0g54slxOjz0MRl6JIkVt4JpxFDD45qEBvVLFHn0NpRZyLhMA+M0yF6AtgcqZ12wnJc27l
 wvFjPR6oph/B9iRxIXRGvnaMQisSMdkP0oG/QO4p142Li0175hssDnx+lGbwZlikpeBaSb
 XpqK/zjjRmUx5t427LYONJajKX2dMQftc3ZOhCQUrZCbAhIgj4/emLXQjceFVx82MeA/4i
 LeZyxGiAxfriBmAkwELx8jK3da+n1qe9YY2Wt6w51/s52WUbUJGK+YM6R/G6OQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W+FOUUeK
Subject: Re: [Buildroot] [PATCH 1/2] configs/icnova-a20-adb4006: Bump Linux
 and U-Boot version
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

Hello Ludwig,

On Thu, 10 Oct 2024 11:15:30 +0200
Ludwig Kormann <ludwig.kormann@ict42.de> wrote:

> Bump version of Linux to 6.6.54 and U-Boot to 2024.10
> 
> Signed-off-by: Ludwig Kormann <ludwig.kormann@ict42.de>
> ---
>  configs/icnova-a20-adb4006_defconfig | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Thanks a lot for your patch, which looks good. However, we're trying to
migrate all defconfigs to use hashes to check the Linux kernel and
U-Boot source code, by enabling BR2_DOWNLOAD_FORCE_CHECK_HASHES=y.
Could you also do this for this defconfig?

There is a tool ./utils/add-custom-hashes that helps in generating
those hashes. You can have a look at other defconfigs that use
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y to see how things are done.

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
