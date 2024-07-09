Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FDEC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 20:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C07D681E8C;
	Tue,  9 Jul 2024 20:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FAVFfXKgOr-4; Tue,  9 Jul 2024 20:29:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4D2281E90
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4D2281E90;
	Tue,  9 Jul 2024 20:29:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7704D1BF5DD
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 635B140EDF
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yb9i-HLJXgj9 for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 20:29:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1EE3A40585
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EE3A40585
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EE3A40585
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 20:29:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CB76E0002;
 Tue,  9 Jul 2024 20:29:53 +0000 (UTC)
Date: Tue, 9 Jul 2024 22:29:51 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20240709222951.74066a4e@windsurf>
In-Reply-To: <20240509181602.3ce82bb1@windsurf>
References: <fm-32642-2024042316454638a76fed21d3a8dc75-KB_QAw@errorhandling.siemens-energy.com>
 <20240509181602.3ce82bb1@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720556993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZkS7TVPgelbcZO9IUD5P/iysbxhCEDQGpd9xFOvPZ/M=;
 b=SOVwBiW/anunuJy9j6cdnyQbNXWH+XYUhDeIv8jmNJk1bEL3pyba2qRycw5ywPR89R9qKl
 c6aBFsS0H8KhKp63H1/Idzt7Iw3pN3wHiipXPYvtAttNLMV4VZPlA0VEPaD8ltCuhZxpLL
 1oFMFQTzpvNLoUq6BxwQRLAJ4ImLKJ/siDCeJDwbebkuc3ZXC2cKOpYwx5IZ7lQcdbqTyN
 rTqVroEwnXjekkHh/f/9n0sZx3EzVI7rjBJnzR5wtRJ8nTPflmSGLPcrw8CzqyHBU94dZL
 JKrRpNSXwdIJ2bAK59KDZv2cujsVK5C6ZtmSLIhutcVKLyLgWKhlsHQI7Hksmg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SOVwBiW/
Subject: Re: [Buildroot] [PATCH 1/1] linux: add Linux 6.1 CIP-Kernel
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
Cc: Moritz =?UTF-8?B?U3Ry?= =?UTF-8?B?w7xiZQ==?=
 <moritz.struebe@siemens-energy.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 9 May 2024 18:16:02 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> Thanks for the patch. My question is what does the CIP 6.1 kernel
> brings that the "official stable 6.1" doesn't bring? Indeed official
> 6.1 is still maintained by GKH until Dec 2026. I do understand the
> value of CIP when it picks up maintenance after the "main" kernel
> community gives up, but for something still maintained?
> 
> This question in fact also applies to the current CIP 5.10 kernel we
> already have, as 5.10 is still maintained upstream, also until Dec 2026.
> 
> Wouldn't it make more sense to have the CIP 4.4 kernel in Buildroot,
> for which there is no longer any maintenance upstream, and therefore
> for which the CIP effort does make sense?

Since no feedback was provided to this question, I marked the patch as
Rejected. We can of course revisit if additional feedback/argumentation
is provided, for sure!

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
