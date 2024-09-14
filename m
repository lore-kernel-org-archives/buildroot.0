Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA869C02189
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAD00840AA;
	Sat, 14 Sep 2024 09:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ionXO2AuGmSg; Sat, 14 Sep 2024 09:29:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEB23840BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEB23840BA;
	Sat, 14 Sep 2024 09:29:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE03E1BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA0FD840BA
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ds2FyYp_C_ZB for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:29:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B87E0840AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B87E0840AA
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B87E0840AA
 for <buildroot@busybox.net>; Sat, 14 Sep 2024 09:29:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4EFD240002;
 Sat, 14 Sep 2024 09:29:41 +0000 (UTC)
Date: Sat, 14 Sep 2024 11:29:40 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240914112940.6e85d783@windsurf>
In-Reply-To: <20240911075544.3455716-1-francois.perrad@gadz.org>
References: <20240911075544.3455716-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726306182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Vy0TQOQXXb0W0EKLCwDtxruzTW4c43Ywsqg/AMx0co=;
 b=ffwwk/KL9knDD5dU8IZPwzr8TjV2gqqcHynL2+2Bl/SHJh0o6ZoFkYCbmhdstAJWA59cZ9
 nvdnaXETbX/e6i9qxE8hd1LoTytDWj4olwLK57nuY1dpQO74Z6yJWyl3z1cI4qmxWPL1Pu
 l0ML6tyW8vcLDtbAN0ccRoEpG1gXnO2taLO9Z0p19onXiI0mNSw0fmlGYkx+l9MXolHzUq
 UGeWrRL4yuTH374vTYg1rqfBXhghsIcPFr9WRQBywhXBrvvkgzcHgeqgXl08TgheeahPn1
 IHJv93AEUpX5P5lFH6wZ6GHp+5wQmkjCMuisbZfu0jqG4x7HmWmKNwcKIhkVfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ffwwk/KL
Subject: Re: [Buildroot] [PATCH 1/2] package/perl-mime-base32: new package
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 11 Sep 2024 09:55:43 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                              |  1 +
>  package/perl-mime-base32/Config.in             |  6 ++++++
>  package/perl-mime-base32/perl-mime-base32.hash |  8 ++++++++
>  package/perl-mime-base32/perl-mime-base32.mk   | 14 ++++++++++++++
>  4 files changed, 29 insertions(+)
>  create mode 100644 package/perl-mime-base32/Config.in
>  create mode 100644 package/perl-mime-base32/perl-mime-base32.hash
>  create mode 100644 package/perl-mime-base32/perl-mime-base32.mk

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
