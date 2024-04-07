Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A814CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 17:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F09E81D73;
	Sun,  7 Apr 2024 17:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id trz8vLDAeP4d; Sun,  7 Apr 2024 17:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C45881DF1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C45881DF1;
	Sun,  7 Apr 2024 17:19:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 635861BF2BE
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 17:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 504C060A88
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 17:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4UIxKN_Byn5 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 17:19:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F7BA60A81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F7BA60A81
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F7BA60A81
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 17:19:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED6931C0002;
 Sun,  7 Apr 2024 17:19:52 +0000 (UTC)
Date: Sun, 7 Apr 2024 19:19:52 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20240407191952.7a1a0f91@windsurf>
In-Reply-To: <344544f8-bff3-48b2-ad7a-84087000f95a@mind.be>
References: <20240303151239.185686-1-thomas.petazzoni@bootlin.com>
 <344544f8-bff3-48b2-ad7a-84087000f95a@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712510393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jMw9VnVXOatcuA88jUXQBcZf9fBKdaRRnJRxLGGn6oI=;
 b=iOK9IRDwCm/fu+1vXSiYDewTusivC6lxAlgqNIThajIFVPIhsSqkq1DyidLkTEveSqF/8l
 yE/E91O5bqD18RWybZ1frsUWxzhs0zTDLpwLJbwVbKCK0FwNS7RTKn9vd9e+hNRC+2NBZD
 nAtMsbNgXHrH/3qAVtDiGn4E9xAkHtp6q4yP9UtCvuch2rK4G/c/ma3F3D0g9pwuZPwB+E
 rIqBYdMpoEZ0UOIQFmMJoBAOmrE4YyTByD6/igbvDVdEELzSVC0/SnmBCnbB5HtFjHypLN
 AuvSYyhmBZSUvnYaaoEi5Jdy3KBRMCzew/lgXwjJKZqF77/rtuKWRmv1VjsjPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iOK9IRDw
Subject: Re: [Buildroot] [PATCH next]
 toolchain/toolchain-external/toolchain-external-bootlin: bump to 2024.02
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

(When replying to such lengthy patches, it would be nice to strip the
contents of the patch that are not relevant to the discussion).

On Sun, 7 Apr 2024 17:31:11 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > All runtime tests are passing, except the ones for the new RISC-V
> > 32-bit musl toolchain, for which Busybox fails to build due to an
> > interaction between musl-specific code in Busybox and musl. This issue
> > has been reported:
> > 
> >    https://www.openwall.com/lists/musl/2024/03/03/2
> > 
> > The runtime tests are nevertheless included, with the hope that this
> > issue will reasonably quickly be resolved.  
> 
>   I don't think it's fixed yet.
> 
>   I also don't see the posting on the busybox mailing list, I think it got lost?

Dammit, looks like I registered to the Busybox mailing list with
@free-electrons.com back in the days, so my posting from @bootlin.com
did not make it through. I fixed things up and posted it again:
http://lists.busybox.net/pipermail/busybox/2024-April/090684.html

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
