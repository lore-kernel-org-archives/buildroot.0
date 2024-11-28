Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C0CD70DED
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 20:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33629406E9;
	Thu, 28 Nov 2024 20:18:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KtxRwod4Ei7U; Thu, 28 Nov 2024 20:18:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F222F406EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F222F406EA;
	Thu, 28 Nov 2024 20:18:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F0A4F712
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE84360711
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hMHaACgXpQW7 for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 20:18:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C1D896075B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1D896075B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1D896075B
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:18:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 981891C0006;
 Thu, 28 Nov 2024 20:18:18 +0000 (UTC)
Date: Thu, 28 Nov 2024 21:18:17 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241128211817.6c68520d@windsurf>
In-Reply-To: <20241126182855.38704-1-ju.o@free.fr>
References: <20241126182855.38704-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1732825098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NpHva8VLqsx3x5UGqeJaHEjZp2i3Eeq7PTLvznA04sA=;
 b=VcxgolYl6j5WuQsjkVR5baSBwKuC4zxWY0BLy8IA06CgBClIoFcHY6fFZpROaOchK1355J
 tD5lN6VlMx4izCBpD0scHUqHBlpSKzkjbzVU9n8mXBqGpy7o68b0/QG9AJ5a2kO7OwGD2e
 BLWH/NbuzCMl1Q1+dyrygp2iZ7wGKDxh18gBn4VGf0ealAqnvYb+marctNEWbxKciSKgWV
 eF1CVJDWfgibSdI7Xlhd4QH92ZUiS4DPzAzzgoBROouaXIThMA9iI+ZheRD/TuVmlaUHZ+
 untk5lxDY79Yx5lHszU2/lf2oBxYq+Vvlx73Fd8vmLfddKyj+vl44HvOZPVcfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VcxgolYl
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: improve mosquitto test
 reliability
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julien,

On Tue, 26 Nov 2024 19:28:55 +0100
Julien Olivain <ju.o@free.fr> wrote:

> The mosquitto runtime test can randomly fail on slow
> runners, see [1].
> 
> This commit improves this test in the following ways:
> 
> - the mosquitto_sub subscriber process is now started in a subshell
> to suppress the job control messages (to prevent any spurious
> messages when the job stops),
> 
> - the standard error is redirected to /dev/null, to prevent the
> printing of any messages,
> 
> - the mosquitto_pub publisher process is started later, by increasing
> the sleep time,
> 
> - finally, a new sleep time is introduced between the mosquitto_pub
> publisher process and the check of the mosquitto_sub subscriber, to
> make sure it will have time to write its output and exit.
> 
> Fixes: [1]
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/8453386454
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  support/testing/tests/package/test_mosquitto.py | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Thanks a lot, I've applied to master. However, I'm not a huge fan of
those hardcoded "sleep 5": it makes the test longer even on fast
machines, and it doesn't necessarily resolve the problem in all
situations. But I think you had yourself mentioned in some other thread
that it would be nicer to have some kind of retry loop instead?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
