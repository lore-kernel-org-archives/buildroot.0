Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D5BD24454
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FC2F4136F;
	Thu, 10 Oct 2024 21:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qo0ueRx4FUw2; Thu, 10 Oct 2024 21:36:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49F7D4138A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49F7D4138A;
	Thu, 10 Oct 2024 21:36:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C5871BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BAD081F75
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UYz-OXxFBiCo for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:36:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3747881F71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3747881F71
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3747881F71
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:36:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86CCA40002;
 Thu, 10 Oct 2024 21:36:19 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:36:01 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241010233601.23f4ddb1@windsurf>
In-Reply-To: <20241009182540.3881681-1-james.hilliard1@gmail.com>
References: <20241009182540.3881681-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728596179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m5/zDoiBpsWaHa2wXwqLp8EJNHt+Spa4sykjtFsRrSs=;
 b=L1CmkmObuOaFOl6ZXHs4UoiDeAGNQNvDJYvnKtP1UM/I5Djr9Na7lhyPK+Gy0Dv7gYnMOh
 1/V0NcMfnGJh/SXHrZ3Xxwl6lyknFsYCgIE8ndsBFHD6+rNG0e9Y2nYFllYI0HHQLVfBg1
 GFt0SUTuzCDb6XuC/RxcnDmKRRdd1z+Rsgcr3vFcpq5AbZjl8FImhJ5c8+KFjrzbjUFQDV
 2Z+Ib75MvrSHUXjjCquTfQL3aQ03EUlkW9CusIDYxiVq2PcdRiDkZaRGgBfZFOO3xRkZ0J
 rlx6ChKqqQlJWDU4JDoiH9HKNm6rC0vOICxjocRjIwGKyk5qgPg1ZrKZJCf+IA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L1CmkmOb
Subject: Re: [Buildroot] [PATCH 1/1] package/python-watchdog: bump to
 version 5.0.3
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

On Wed,  9 Oct 2024 12:25:40 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-watchdog/python-watchdog.hash | 4 ++--
>  package/python-watchdog/python-watchdog.mk   | 4 ++--
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
