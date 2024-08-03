Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06980C52D6D
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 09:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0A1A81990;
	Sat,  3 Aug 2024 09:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0KPKStKjyUqN; Sat,  3 Aug 2024 09:51:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D86EF81C58
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D86EF81C58;
	Sat,  3 Aug 2024 09:51:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC7801BF378
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 09:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AB9B81C58
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 09:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rA7DcNZyuzn4 for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 09:51:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 71ACF81990
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71ACF81990
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71ACF81990
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 09:51:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87E0A1BF206;
 Sat,  3 Aug 2024 09:51:47 +0000 (UTC)
Date: Sat, 3 Aug 2024 11:51:46 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240803115146.02e24146@windsurf>
In-Reply-To: <20240803092005.9363-1-ju.o@free.fr>
References: <20240803092005.9363-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722678707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CBRGJzh/NIEGwbMOrssbCib7fYMu0+nU2lz17MqHyEg=;
 b=DQYKSxGwBIBL28I+3sd9Bf34Q3ZJ/TTjrl8a5ue/4V6l4oC14iBwbjGy7YRfO8iJVxvmEk
 lPyOqE2p+pkV61+IIZkjJ1xehC7dSPFMUJ+W3Xfawk/PGdGOYXSovyad18+aGIXOM4TMds
 Xzhb2Dcyx3ZPrtM/KXI3e43J2u6Jq+Dy31xYSdxcmTsNVuhBIUZDKymnMJwZ0eNxNFVRar
 oB/cGIJMBcwTGH2xbGpMObDvRgKm6usjykLRKAn8+SuJLFHyCnblh2NdUnm7EHyoEE1y0k
 uRfsXQJo0tvo2GXVhVM/FcrqsWWheVfi+6Nb3aJ6epJFuiBySKjt9oq6n04P0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DQYKSxGw
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Maeva Manuel
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  3 Aug 2024 11:20:05 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Maeva told me personally she will no longer contribute to Buildroot
> for the time being. This commit removes all the associated DEVELOPERS
> entries.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS | 5 -----
>  1 file changed, 5 deletions(-)

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
