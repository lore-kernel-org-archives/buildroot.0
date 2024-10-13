Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B9BCF2579
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 10:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43E764092B;
	Sun, 13 Oct 2024 10:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptkVVP6Dtyhg; Sun, 13 Oct 2024 10:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FC67409E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FC67409E2;
	Sun, 13 Oct 2024 10:48:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9B1E1BF35D
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98B7E607C9
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EmKsOwrsZkvl for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 10:47:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7B39D60759
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B39D60759
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B39D60759
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 10:47:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE62CC0006;
 Sun, 13 Oct 2024 10:47:48 +0000 (UTC)
Date: Sun, 13 Oct 2024 12:47:14 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241013124714.6ca748e4@windsurf>
In-Reply-To: <20241011174331.2762999-1-james.hilliard1@gmail.com>
References: <20241011174331.2762999-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728816469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pf9HeoNqE3DInsQcw1folhbNr7FikFxJnkEdoJ4VO+U=;
 b=Oin23kZzIwGSVrOx1AYS1FO/qVhTD/Y/unBbF1a+q8vY8Ef61lI4P7eBYXyBpvjnWy1Oqg
 sBLws8AD3+zOfOggccjTriQMzlBO6aZQtMEMk6zvOZXD8uU/nbyKhcNLfhbHKsaXwedje7
 aItle7jWvCWIRPhqiOp2rFJuZvuZIVdvNTr7oZJY3m2a+33kn27rzfHJ57WNvngqesHiSh
 rYeq5FqXRsLrrZB8ahNgzaWdM3cdBvKhc+OcyDNWvNGdL92SU2EiH1i1923o1GHXD+30f+
 CN3GH904ZZXJCldpKeFjmjxZvbRTR9KFPGJyG5VGtfJCaFPiSSdrvRh4ymUryg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Oin23kZz
Subject: Re: [Buildroot] [PATCH 1/1] package/python-bleak: bump to version
 0.22.3
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 11 Oct 2024 11:43:31 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-bleak/python-bleak.hash | 4 ++--
>  package/python-bleak/python-bleak.mk   | 4 ++--
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
