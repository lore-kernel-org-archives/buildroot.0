Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D490CD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2766040297;
	Tue,  3 Sep 2024 20:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KfjQU7vsrdKP; Tue,  3 Sep 2024 20:33:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFFDC4029C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFFDC4029C;
	Tue,  3 Sep 2024 20:33:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A79681BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A19144029C
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kHoLu0OTekw2 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:33:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4674040297
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4674040297
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4674040297
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:33:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BF1AE0002;
 Tue,  3 Sep 2024 20:33:36 +0000 (UTC)
Date: Tue, 3 Sep 2024 22:33:35 +0200
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20240903223335.620f67ef@windsurf>
In-Reply-To: <20240830114319.4353-1-tianyuanhao3@163.com>
References: <20240830114319.4353-1-tianyuanhao3@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725395616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tx1OZ1XBUwVIvTLQR3Gy3tPxne3qqe8UBrv5nTmQDsA=;
 b=TFC/t1g0dbwkL3T6JBkYr13cvPcRL/87e4x9OXu8ZNucYSSVBZlKZCZFVue86mMtMjlQ0B
 CUFs/IGczOuigFL9Qp+kAfkJlDr9SDNJQPW2Kram0W4ussx7eOyYhxXmQWaz7UZCTRK++6
 MbXNZxskMYE9EH6BNO72FAWJAedxO46arxABRI69bZrLAg1pusdAyRU+ZbHOEZ1BYIm6on
 MuO272Mwr+BY+HRwzC01gHyYxTi6ZdmIP1FPaF7Ov99IPeX0RALTtnC5ZlVGb3rCmALHY+
 aS1LjqmUqthGgVNIFeLvlF2ZNiLUhYeoWl7FLvg/EIdfQZCNBJviLyQPldG2hA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TFC/t1g0
Subject: Re: [Buildroot] [PATCH 1/1] package/chrony: install default config
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

On Fri, 30 Aug 2024 04:43:19 -0700
TIAN Yuanhao <tianyuanhao3@163.com> wrote:

> chrony needs a config file to work:
>   Could not open /etc/chrony.conf : No such file or directory
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/chrony/chrony.mk | 1 +
>  1 file changed, 1 insertion(+)

I have extended your commit log with the great additional explanation
you provided as a reply to my feedback, and applied your patch to our
next branch. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
