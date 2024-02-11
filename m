Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BCCC4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 12:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33BCA8229A;
	Sun, 11 Feb 2024 12:38:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0XJsIUqGjdHz; Sun, 11 Feb 2024 12:38:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D7DF8229D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D7DF8229D;
	Sun, 11 Feb 2024 12:38:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47F871BF33A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 12:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3776F8229D
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 12:38:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0jPsldG9jPxj for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 12:38:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4F158229A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4F158229A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4F158229A
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 12:38:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E730B1C0006;
 Sun, 11 Feb 2024 12:38:39 +0000 (UTC)
Date: Sun, 11 Feb 2024 13:38:39 +0100
To: kilian.zinnecker@mail.de
Message-ID: <20240211133839.5b235cbb@windsurf>
In-Reply-To: <4544153.LvFx2qVVIh@laptop>
References: <20231204231212.36450-1-kilian.zinnecker@mail.de>
 <20231204231212.36450-2-kilian.zinnecker@mail.de>
 <08b6187c-94f2-4cbc-b0e8-0066ca687796@benettiengineering.com>
 <4544153.LvFx2qVVIh@laptop>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707655120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abtsj6u47jUl9mk/oTDNuB6YpE8jTqDSWJjsARUytAs=;
 b=DpVWK7u3ukhDDXCfBFnP35NUT5knXznchj0HK5DJoi7xHM04CTNToMvJqJpKza+yyIdZrh
 3HvNP9ha72BPZHhsFrfS/iYUwJCs47F2eRbhgSXQZHoYeCGOr6+yWKtOKSqZ9CteZAnL1I
 7goQJt0dzYRVLhVyKgtEamvP+ihogSwvGb84BjQoeLpPBk4b9+Nc4vajPYMSUZXX/0AIs+
 wmQnUtOnK4SUCyWg9Qa8Y5dZBzyFsIss7jrP/y5vIW0124sHjSKdRj+GxKSyyC2svmJxjs
 5wYZgAqTXvR+GGrJZJDYK2kYSuodRfJXPWlxJnv3sXPZwyTcUOxFxx0/CCufaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DpVWK7u3
Subject: Re: [Buildroot] [PATCH v2 1/2] package/xuantie-bins: new package
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Robert Nelson <robertcnelson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 10 Feb 2024 16:22:10 +0100
kilian.zinnecker@mail.de wrote:

> This is strange, maybe someone can have a look here: On ozlabs, there are a 
> lot of patches, which have the submitter "kilian.zinnecker--- via buildroot". 
> However, most of them are NOT from me. E.g., one from Yegor Yefremov [1] is 
> marked with submitter "kilian.zinnecker--- via buildroot" - However, I am 
> definitively not Yegor, and none of his patches is from me. There are even more 
> patches marked with "kilian.zinnecker--- via buildroot" [2], some of them even 
> from before I ever submitted my first patch (the Rock5B board support) to 
> buildroot. Does anyone have any idea what this is about, or can have a deeper 
> look at this? (The BeagleV-Ahead patches are from me.)

Yes, this is a known issue, caused by an interaction between the From:
rewriting by mailman (needed due to strict DMARC policies by some SMTP
servers) and a bug in patchwork.

Sadly, the patchwork instance we are using (ozlabs.org) is using an
ancient version of patchwork, which is no longer updated. We have asked
the kernel.org people if we could migrate to the patchwork.kernel.org,
but we still haven't heard back a definitive answer.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
