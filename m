Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678A8D24455
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 307C741511;
	Thu, 10 Oct 2024 21:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQ46mpOa12_p; Thu, 10 Oct 2024 21:36:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C75F44143B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C75F44143B;
	Thu, 10 Oct 2024 21:36:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A0BFA1BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98A6F41320
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ACpHNhDM1lsc for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:36:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D7B9F412F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7B9F412F2
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7B9F412F2
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:36:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08F0D40003;
 Thu, 10 Oct 2024 21:36:22 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:35:35 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241010233535.4c5325ab@windsurf>
In-Reply-To: <20241009181053.3874403-1-james.hilliard1@gmail.com>
References: <20241009181053.3874403-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728596183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hdhIg7xRrQNNzs+3p1iO8QtXXdeVVma8/e6MnXI8bdY=;
 b=iTA93o77fkv8g1axH1ydkWLnIWgvz558SWQ40wYy+fBUUf/IonmwanllRUx9lCFbf6Vf/B
 nKn78hstt/pdWwt/UeOJqb65eOIzYkc+qlFV5GptQ6hjkuHphy3JkshUmXHXo3FmeehVTM
 WxltF2JYdABhUAzSyMwUYTk1noCECJW8YE7HFYy0AT+Yz0pxy9wA4+UnumqoRV9Hv1s9uw
 Rv8r73xiCVCs5D/lWZ/ZyoObCRse6SpOqqWIE8tftQg/Vzk5L42Mogbydce+Hd3KRtokOF
 TXfvfSMEScp5pvwusI7xQm9YKnG6tmWE5PJQy9jgahne0Vup6GjcY/GL4SOuxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iTA93o77
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tomli-w: bump to version
 1.1.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  9 Oct 2024 12:10:53 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-tomli-w/python-tomli-w.hash | 4 ++--
>  package/python-tomli-w/python-tomli-w.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
