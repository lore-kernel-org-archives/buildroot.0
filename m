Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3ED1CDD0F4
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 21:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADAD0406DF;
	Tue, 22 Oct 2024 21:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aizrH6P7tfdJ; Tue, 22 Oct 2024 21:18:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6F2B406F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6F2B406F0;
	Tue, 22 Oct 2024 21:18:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A88E59F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58C6481116
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugBFY_ut_mHQ for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 21:18:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A3CF8110E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A3CF8110E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A3CF8110E
 for <buildroot@busybox.net>; Tue, 22 Oct 2024 21:18:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A699E240005;
 Tue, 22 Oct 2024 21:18:41 +0000 (UTC)
Date: Tue, 22 Oct 2024 23:18:03 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
Message-ID: <20241022231803.2d1ac147@windsurf>
In-Reply-To: <20241022205133.532205-1-francois.perrad@gadz.org>
References: <20241022205133.532205-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729631921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N3LhZXA7Xta6+SwjZbUA7mbUHQpOmcedwNfwHgmtKJo=;
 b=duvfIDCR92CQR289sT2RObRT/kE0NnMwC9nXsfU6/0qGAsTU63obCUx9ustVbwrprYSOFX
 zRqJbqcHZtZjUmp/+k+Qr62RYryJNwOqrRl7aPXO5aXZzCDX7Gl7/ccCAlNRwaIzZAJo82
 g2zks1Hcn7Y6Jcasv8Dwj09JBM8n3Taam/7l1t8skBVji274Ezr0apDFvzR4DspFHmESaK
 E2xen7s4uhoXfS3ez7xR13OFB8KR1/pot/pKeGdu8CpHA4KJK9ghDabDQeMRA/5tc3JyWR
 VXyDqrvfvcRFpxGj3srWZVO0Wco9RM++LM7CzCZbCWxLuykEvd4BE/h7cUFrwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=duvfIDCR
Subject: Re: [Buildroot] [PATCH] package/nettle: bump to version 3.10
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

On Tue, 22 Oct 2024 22:51:33 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/nettle/nettle.hash | 4 ++--
>  package/nettle/nettle.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
