Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3DDC3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 09:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02CEE400F5;
	Tue, 23 Jul 2024 09:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0CD2nZFEIndI; Tue, 23 Jul 2024 09:30:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D33CC409EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D33CC409EE;
	Tue, 23 Jul 2024 09:30:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 09FB01BF3AA
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03B3E40232
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7eneop2nZfa for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 09:30:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 385844019E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 385844019E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 385844019E
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 09:30:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 638D26000F;
 Tue, 23 Jul 2024 09:30:41 +0000 (UTC)
Date: Tue, 23 Jul 2024 11:30:40 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240723113040.29919bee@windsurf>
In-Reply-To: <20240109060128.3974794-4-james.hilliard1@gmail.com>
References: <20240109060128.3974794-1-james.hilliard1@gmail.com>
 <20240109060128.3974794-4-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721727041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8qrWUAj+CWnn+SBjpO32HIz4CesuTkBVmQYNKbrCIq0=;
 b=hNL8yJNC2qtF2vz6n+Tj1ZDpsbdMkZYVgWbuLCCpddFtGmkU+IgI5JDZwv3iFXNuUJ22IM
 DdrerRnGmkco5fdliPXhRFMYwU/i4mcWxTvKxSOWVC8SS0ddkVOCfdd8Vqb5sumaMuJoXm
 zbV/vRXApLOUORS7Q6nD/4akjadpt221r4jTFqjfmSZkIrdpN1WYQJ/kXIF8w1EiAz3PIf
 mhvOVSOEk9Wobd/PYWK2k+FO3C/8cG2AbJbMrJvaPwsQ8cqYmecHuBw9yoM9gD8gktI/N0
 yrqYP+BtIkFb/EEjEv8WdsDH1L/rJvhVCx9dkolp230DRPkQjXlEuU0rij4hLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hNL8yJNC
Subject: Re: [Buildroot] [PATCH 4/6] package/python-jaraco-text: new package
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

On Mon,  8 Jan 2024 23:01:26 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in                                 |  1 +
>  package/python-jaraco-text/Config.in              | 12 ++++++++++++
>  .../python-jaraco-text/python-jaraco-text.hash    |  5 +++++
>  package/python-jaraco-text/python-jaraco-text.mk  | 15 +++++++++++++++
>  4 files changed, 33 insertions(+)
>  create mode 100644 package/python-jaraco-text/Config.in
>  create mode 100644 package/python-jaraco-text/python-jaraco-text.hash
>  create mode 100644 package/python-jaraco-text/python-jaraco-text.mk

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
