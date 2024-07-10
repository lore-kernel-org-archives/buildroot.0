Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468E4C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 22:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10ACC408C1;
	Wed, 10 Jul 2024 22:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FhBbfyBEy_61; Wed, 10 Jul 2024 22:16:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAB0C41576
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAB0C41576;
	Wed, 10 Jul 2024 22:16:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E2CE1BF593
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59ED4400FE
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:16:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G4QhHlQ0nEuT for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 22:16:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1A8AB40126
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A8AB40126
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A8AB40126
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 22:16:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A87520002;
 Wed, 10 Jul 2024 22:16:38 +0000 (UTC)
Date: Thu, 11 Jul 2024 00:16:37 +0200
To: Viacheslav Bocharov via buildroot <buildroot@buildroot.org>
Message-ID: <20240711001637.4fe27e3d@windsurf>
In-Reply-To: <20240619075547.1390096-1-adeep@lexina.in>
References: <20240619075547.1390096-1-adeep@lexina.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720649798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p8TGtVeiUtVoGgphQSXPpgqdMeG/t62ug0TfxgAVoqU=;
 b=jlf3bur0Q8uJvkUfMrXHG8QdyRphmeO512kU4kpbWvtTrBAIxnqFrYHyJLJzAr5Xg+fzR5
 pcHi+wQRlQfy2PNw9J1hwmzbh876DgmaLwHZYO82ZtgrozqzqgytEEDQw/yds/zu+JGzix
 zFClqlPFu7aWvrfkOhv9K8tZoS01b3UMWE/dUjYwqUZwGmc6OMRwOl1Q23WbQWKan6KTrt
 9znKoSWbiRoYyBZqG03PmoPQ/JhU1npeQl06+lueRa9FzvhpRLtDoaM2o4j9KxxgPWAdp8
 8VTkTInKyt1X7nbmO8F2ceHu5LBtKrYrbDK6vNk2AM8obsr9W3JFZ9nUMCToPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jlf3bur0
Subject: Re: [Buildroot] [PATCH v1] package/rtl8822cs bump driver version to
 latest
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
Cc: Viacheslav Bocharov <adeep@lexina.in>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 19 Jun 2024 10:55:40 +0300
Viacheslav Bocharov via buildroot <buildroot@buildroot.org> wrote:

> - Update driver for kernel 6.9+
> - Fix warning/errors on build
> 
> Fixes: http://autobuild.buildroot.net/results/82dd4d986c0ddfb48e7316473186ef4c9d8ee783
> 
> Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
> ---
>  package/rtl8822cs/rtl8822cs.hash | 3 ++-
>  package/rtl8822cs/rtl8822cs.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Thanks for your patch, I've applied to master.

One question: https://github.com/jethome-ru/rtl88x2cs says "** USE
RTW88 NOT THIS DRIVER **", so why are we using it? It seems like you
are the person maintaining this driver.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
