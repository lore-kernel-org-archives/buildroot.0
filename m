Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E384FC6172
	for <buildroot@archiver.kernel.org>; Fri, 13 Sep 2024 22:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C71FE40C93;
	Fri, 13 Sep 2024 22:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dDkaMJE0LGMc; Fri, 13 Sep 2024 22:22:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8715D40D5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8715D40D5F;
	Fri, 13 Sep 2024 22:22:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFA711BF2BE
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 22:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF30E40263
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 22:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0tNreIuaqKC5 for <buildroot@lists.busybox.net>;
 Fri, 13 Sep 2024 22:22:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B163F4024D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B163F4024D
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B163F4024D
 for <buildroot@buildroot.org>; Fri, 13 Sep 2024 22:22:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BCD020003;
 Fri, 13 Sep 2024 22:22:22 +0000 (UTC)
Date: Sat, 14 Sep 2024 00:22:21 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240914002221.55d3fc0b@windsurf>
In-Reply-To: <20240911205322.1772612-1-james.hilliard1@gmail.com>
References: <20240911205322.1772612-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726266143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZY/v4/e/pYfVUYASGaExnv49VmkruU9K33Xw6yWQIbk=;
 b=PuOcXaPK9M15kn/ZCGJBdWPzgmLtBtnmd+kuxnlSUf6xsfiwgK+1Yb4WSgpHqyJoYpiQwn
 6t0pgvQgnZuZQrLYgIAaQRGmG2UMfnWKjCfSCSLqwdPbZYMokLINijuEp6hR0ZneWOa8m/
 cXE12jPXFKPbLr1zYI9nsrzpxXKiv2QQL/nYUAhs5ip5xtBVU2G2XJAQi3Cq/obfsnVWJC
 tdKnw4wz5iBfkTwrWRS/BY1ackQyYwtmzwgkLdHRRzBX5QXB0+sOTpPVLXgP31vMg4VHw2
 Zy6o2Ra8YPj9pXr9cYw8BosJuYmE8RINi4ujWTbdIMke2HjbQMg15Vw2RTU+kw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PuOcXaPK
Subject: Re: [Buildroot] [PATCH 1/2] package/python-aiohappyeyeballs: new
 package
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

On Wed, 11 Sep 2024 14:53:21 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in                                 |  1 +
>  package/python-aiohappyeyeballs/Config.in         |  6 ++++++
>  .../python-aiohappyeyeballs.hash                  |  5 +++++
>  .../python-aiohappyeyeballs.mk                    | 15 +++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-aiohappyeyeballs/Config.in
>  create mode 100644 package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
>  create mode 100644 package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk

Series applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
