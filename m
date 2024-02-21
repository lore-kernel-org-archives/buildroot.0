Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482BBC48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 17:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11AF5606BD;
	Wed, 21 Feb 2024 17:45:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fpGpgLitU-92; Wed, 21 Feb 2024 17:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AAF2606F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AAF2606F3;
	Wed, 21 Feb 2024 17:45:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F2CD1BF2FD
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 17:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C02240497
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 17:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AdGDzS9rXtJQ for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 17:45:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9F241402B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F241402B1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F241402B1
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 17:45:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 327C71BF205;
 Wed, 21 Feb 2024 17:45:14 +0000 (UTC)
Date: Wed, 21 Feb 2024 18:45:12 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240221184512.204b88c0@windsurf>
In-Reply-To: <ZdYt_stfXR6pbvR5@landeda>
References: <20240219182604.1287000-1-buildroot@bubu1.eu>
 <ZdPEzH3kvBYikWcY@landeda>
 <04a28a98-2699-44b6-b5d5-697a1a6fe893@bubu1.eu>
 <ZdYt_stfXR6pbvR5@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1708537514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FM5usqGwCjkUSMHknoajJu+7gzyoXGyJJUNGrVtijlk=;
 b=PTrkcbuGYpURisC7JkoSCv0OhvNdErZZ0yShjEXAsYyEP6b6/m9lRk7huMGf7qgmzhmBBZ
 BDEZi4SVV4tRKCgKgGyeOgavJGW/TrzSSkIVK7qFyj7Uo1xEZSs7UVMt7RDuYS3tTG9BQx
 8hHYMbfNf5ygCGlId2zTaaxCib8u6dYlzRmyBYW9mfoULDNUuRe492icb3SwdJ1FVk8oFC
 UB+QH9tSFthgWJJMsy5SP+SPtyTaQyRm06yeRk9YHcDv5ukPxcWhT5budL5ElHj4w0JrTW
 c8tNVSbiyNPYTrVjT/vB3YSZomIH+n+/PlP7ftlG1GzebKTOZD00OLdmbF+A1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PTrkcbuG
Subject: Re: [Buildroot] [PATCH] package/systemd: bump to version 254.9
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
Cc: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 21 Feb 2024 18:08:14 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On 2024-02-19 22:30 +0100, Marcus Hoffmann via buildroot spake thusly:
> > On 19.02.24 22:14, Yann E. MORIN wrote:  
> > > Please watch the gitlab pipeline for any failure of the runtimet tests,
> > > just in case this minor version bump breaks anything.  
> > So if I understood that correctly I can add myself as a maintainer of the
> > runtime test files and I'll get an email when that test fails? Or is that
> > not how it works?  
> 
> As far as I understand, yes, this is what should happen. Thomas has some
> scripting (somewhere!) that sends the daily emails, so he'd have the
> authoritative answer.

Absolutely correct. If someone is registered as a developer/maintainer
for a test case in the DEVELOPERS file, this person will receive an
e-mail when the test fails in our CI. Please note that runtime tests
are not run every day in our CI, but only on a weekly basis.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
