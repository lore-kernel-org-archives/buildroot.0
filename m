Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA2CC3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EAE84199E;
	Fri, 12 Jul 2024 14:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qbQk4q17HyKV; Fri, 12 Jul 2024 14:38:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D30C419A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D30C419A0;
	Fri, 12 Jul 2024 14:38:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 148A01BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CA0184696
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id djzLOJb3kJs4 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:38:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F399884658
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F399884658
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F399884658
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:38:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E5D720003;
 Fri, 12 Jul 2024 14:38:24 +0000 (UTC)
Date: Fri, 12 Jul 2024 16:38:23 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240712163823.1e944a60@windsurf>
In-Reply-To: <20240602213333.2597981-1-james.hilliard1@gmail.com>
References: <20240602213333.2597981-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720795104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JweEAcww/fCu/4q3kYknAr/lCnkNm1kKtmxscUAf/QI=;
 b=kDQ8UmUed/EsstKeSpnIL4xxNh2gs1a05YYcx2QaMMSC5znaVbXGr6ADh8gX6drrNaVh0h
 a2+czXvwY+l95ojAByjHOOaxatri3ze3m/3PGjVecDg6WqHcmv0ZyKFyY3vvwDrSUv6JmS
 Adb9Y61xHykpo1rjV/puIeBsynkOB4abpoyr77BjT0F9GBnmRJTHuAoqLGp/JeArrZ+26D
 pTp6DYSljBaabLd00y38sBeWYEx4HXIzoF3KXEEdcGhmZfkk9kUgA0PHrryPuCqRY1cbdl
 F7uuPJJjivdm20/x9BlflVEpwfm8R73eppkp6yaOy3XTGypV54W1XRNcDgzFwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kDQ8UmUe
Subject: Re: [Buildroot] [PATCH 1/1] package/python-bcrypt: bump to version
 4.1.3
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

On Sun,  2 Jun 2024 15:33:33 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate from generic setuptools infrastructure to setuptools-rust
> infrastructure.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-bcrypt/python-bcrypt.hash |  2 +-
>  package/python-bcrypt/python-bcrypt.mk   | 19 ++++---------------
>  2 files changed, 5 insertions(+), 16 deletions(-)

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
