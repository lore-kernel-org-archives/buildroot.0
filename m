Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA500CE7A8E
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 19:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7180640361;
	Thu,  5 Sep 2024 19:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOgLKSodCpOf; Thu,  5 Sep 2024 19:45:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A2A840391
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A2A840391;
	Thu,  5 Sep 2024 19:45:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B51761BF423
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B008B60AAE
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ro8XXvyVH7e7 for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 19:45:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A8CFC6062D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8CFC6062D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8CFC6062D
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 19:45:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9517240005;
 Thu,  5 Sep 2024 19:45:51 +0000 (UTC)
Date: Thu, 5 Sep 2024 21:45:51 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240905214551.06532f87@windsurf>
In-Reply-To: <20240904154417.168646-1-buildroot@bubu1.eu>
References: <20240904154417.168646-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725565552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VUtqv8iCkqTgqhUOFmKbJUgGSP/K4RxNwknQ+TqzVCw=;
 b=Ah65aS2Lm+pIKO35jVCMsqVyGaoTG9Ci/lUNIJEwwbSycFzIGcbCeHRpiJHf5nn7JIsdt4
 8RI9Alm85d34iz6ux5+rma8+iL7R+hJnZkDVBJ03LaOMGoNSx5A5HrO5+xBotNJfe1vp/N
 dcCchfu2uaqZRD4fTuzbFnHXtgz3Ef6+mDLUpByuEpbR8+JcZuNB/f2H5DX8f8OWLjF5YL
 WiuDvm4LMsP+IhwseOEY0WY91CcRRChT9ZWQJqPkjUpoJpBOb1U5ZW0RdwDjRPRI4SRsUe
 vDMgPaspnkpR86CpomEmldFEBVCgjSfSYuL2K4g9Fl33Ngu8I2xM1U20dfkEOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ah65aS2L
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 5.1.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  4 Sep 2024 17:44:16 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Fixes:
> * CVE-2024-45230
> * CVE-2024-45231
> 
> Further changes: https://docs.djangoproject.com/en/5.1/releases/5.1.1/
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

I've applied to next, because next had 5.1.0.

For master, which has 5.0.8, we need a bump to 5.0.9, which fixes those
security issues I believe (and 2024.02.x should also upgrade to 5.0.9).
Could you send a patch against master bumping to 5.0.9 ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
