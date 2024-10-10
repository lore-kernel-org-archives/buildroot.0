Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC88D24455
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BF3B4155C;
	Thu, 10 Oct 2024 21:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X_ZRNBxXE2yZ; Thu, 10 Oct 2024 21:37:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F08F141600
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F08F141600;
	Thu, 10 Oct 2024 21:37:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 959421BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85A9C60BE0
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qmE87SXwmxpg for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:36:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 70A3160BE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70A3160BE5
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70A3160BE5
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:36:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF82340002;
 Thu, 10 Oct 2024 21:36:33 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:34:41 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241010233441.1608ac75@windsurf>
In-Reply-To: <20241009164143.3825125-1-james.hilliard1@gmail.com>
References: <20241009164143.3825125-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728596194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IHSQzgh2EFurAhcxSDQB9JKKdEJw2vIn9PCqqWKV2J0=;
 b=dWr4FZes68MaITRdl6oD7UV7g638EOP5YA1kG2JT7T+ck+p0z3PRS42nREnOkmESNBMvow
 JzwvcC6n92I83VSEf9QVKF9V055bJAQuY6jcMKW2l12mvH8t0lyOYRfoFei+HttdDgofWa
 tYFpQvYQfMHE9WpCmwrdx4gpfvrM7XSzXlM9x8EitFygl06fX2esmrbQLY0Txv314F3VIQ
 eQwmwkKgC1y2vjEKbq/K0q/W4Xlby1mcqBTDPEDwnA25C5HwSWTgR7HCGgOC81mUHKstDo
 fkkRmg2TWZyMVbqQm3Z6Hnk244NdKDxgXRsMELLlYKes43yEd9yUyjJac4zDYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dWr4FZes
Subject: Re: [Buildroot] [PATCH 1/1] package/python-humanize: bump to
 version 4.11.0
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

On Wed,  9 Oct 2024 10:41:43 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-humanize/python-humanize.hash | 4 ++--
>  package/python-humanize/python-humanize.mk   | 4 ++--
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
