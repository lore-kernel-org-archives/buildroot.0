Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C00C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BAB142C2A;
	Fri, 10 May 2024 21:03:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RFLv693wwmR0; Fri, 10 May 2024 21:03:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E32A42C2D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E32A42C2D;
	Fri, 10 May 2024 21:03:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 642661BF295
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B968424D4
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxEX7KAWBdC6 for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:03:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18465420A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18465420A1
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18465420A1
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:03:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 157F1FF805;
 Fri, 10 May 2024 21:03:19 +0000 (UTC)
Date: Fri, 10 May 2024 23:03:18 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240510230318.1d2a8256@windsurf>
In-Reply-To: <20240307104008.28932-1-fontaine.fabrice@gmail.com>
References: <20240307104008.28932-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715374999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cVvAXzXLUTn7MZj5/PatpAWBh3FgZiJ2oXxGcvbV7WQ=;
 b=Zs7Uu5FfZIy/+CwSNbzAYXgq7VF2cvKn+c+wYzMAWb0EF6OtTqTBHIvZXflMT473TQPWi6
 gLyRxQOhptlHJ/Oq/W09IlSFCQaeJr3OIDpHlVzQQHl4tVG3vWYSbauNBNWCKHOsuFJfMe
 7EI5pmwZbp0HhoyCQhNb6zUKG5YJh94jqYh7eVlzd2Wz3AYgkwmjOla8hM+r5gjqdZXwI/
 k80T6trpeeYu1YWYtiMJ10dweZC4HQ2OsoJokN/IAwvcXnwQ+rNcKma+Mcc9tAQFyy37p+
 5zs2vd0XWg+SCX7Fva/eJzax6zM/DAU0Lp/bZk/xzS3LWP9tJsN/EyidNlxaxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zs7Uu5Ff
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc-bare-metal: add CPE
 variables
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
Cc: Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>,
 Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  7 Mar 2024 11:40:08 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:gnu:gcc is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/detail/A30F1DE7-139B-4296-AA87-A516462A1A81
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gcc-bare-metal/gcc-bare-metal.mk | 2 ++
>  1 file changed, 2 insertions(+)

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
