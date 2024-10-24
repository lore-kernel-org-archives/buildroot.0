Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E59BD1036C
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C8D28122D;
	Thu, 24 Oct 2024 20:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vkDU3hXcXMFQ; Thu, 24 Oct 2024 20:48:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B0C981230
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B0C981230;
	Thu, 24 Oct 2024 20:48:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7860A497A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D29EB60DB2
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1tqfSK6gYLF for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:48:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C0E1760E00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0E1760E00
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0E1760E00
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:48:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FC1CE0004;
 Thu, 24 Oct 2024 20:48:50 +0000 (UTC)
Date: Thu, 24 Oct 2024 22:48:49 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Gao Xiang <hsiangkao@aol.com>
Message-ID: <20241024224849.48ed60b2@windsurf>
In-Reply-To: <20241007222405.1804794-1-ju.o@free.fr>
References: <20241007222405.1804794-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729802931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RVXuCShjM86uZV0Eey7T1rgrkFEHXofhnZBbc+bgoA0=;
 b=Dx4BJAlB1fNA67F4d4znUjGPfgY8RTglFxDwTNo4RVpWclUiv8nw2WB6EQ1mPZl/19iogX
 wfH5qQUlZafY9RlYMoIzOYiLgclvCxb3s+vm6/cw+fXd3v5T5nsRPADZtZMazc6lTaxb/y
 JIoZR71xnlneWmWgUVFA7+Xo2y1NK21XpepdkR6WWJl1+QfNKCmNqqzjF/KsKYj9Cz9SnK
 kcg7aQ5EgFjZQC7Jt5Q4S56uBOfynDKka96PJWT00o046k0KrybxyAIa1LamDVlGlzsDAp
 7fLC9p1eK8aZfDIymC958IUWfxNVav7A6b6pcVDF36eQTJkmfOj4uauedXd1Pg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Dx4BJAlB
Subject: Re: [Buildroot] [PATCH 1/1] package/erofs-utils: bump to version
 1.8.2
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

On Tue,  8 Oct 2024 00:24:05 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For a change log since 1.8.1, see:
> https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/ChangeLog?h=v1.8.2
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8015803076
> ---
>  package/erofs-utils/erofs-utils.hash | 2 +-
>  package/erofs-utils/erofs-utils.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
