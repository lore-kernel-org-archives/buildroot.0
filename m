Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33334C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F06CE41A17;
	Fri, 12 Jul 2024 14:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Go-2ik--TBmH; Fri, 12 Jul 2024 14:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0FDD41A1C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0FDD41A1C;
	Fri, 12 Jul 2024 14:40:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BDCD01BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABDD284692
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zv37zaJUIzX for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:40:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A0A2A84690
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0A2A84690
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0A2A84690
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:40:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C459B240004;
 Fri, 12 Jul 2024 14:40:33 +0000 (UTC)
Date: Fri, 12 Jul 2024 16:40:33 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240712164033.062082c2@windsurf>
In-Reply-To: <20240601210104.1160688-1-ju.o@free.fr>
References: <20240601210104.1160688-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720795234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gSkMKLQTvUhtWh0feyo//4yQtsClPskA7924i02tWUo=;
 b=JwLzPhM+w4pvC/ateu0F9Oi17++2j0b5FLM2SkEAxqR6/jAfj95OodQvHBfwCttIXcHfFW
 tk8jzlVxHj3747v8pyogsxemy70yaRoOg0mKD9uqs1WhXNkqIOIcwNd4Pt8UdEl7YoW+ik
 DfDEfEiL+b8YIEKH9M4N6uPEoqJNE5fw/b8pdztAy7/f0w1zMiI19g1bK32TD5zhIfuVML
 hfheOLsgtW+hsTlyHo8ywYb5zvzAnENVxhLLP+xs/VdwarydOnKCIT6UXoliza8OB3qxIf
 /9aplanNMV5vtKPY86ZkjAyg4JqZuXhr6fLUVFCTHG5In/wofxLNtn/x3PWZCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JwLzPhM+
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add bcc runtime test
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

On Sat,  1 Jun 2024 23:01:04 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                    |  2 +
>  support/testing/tests/package/test_bcc.py     | 84 +++++++++++++++++++
>  .../tests/package/test_bcc/linux-bcc.fragment |  4 +
>  3 files changed, 90 insertions(+)
>  create mode 100644 support/testing/tests/package/test_bcc.py
>  create mode 100644 support/testing/tests/package/test_bcc/linux-bcc.fragment

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
