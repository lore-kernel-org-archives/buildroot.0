Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E2FC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9059140B7F;
	Fri, 10 May 2024 21:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NBOFDPl5yQgX; Fri, 10 May 2024 21:32:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96024404A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96024404A3;
	Fri, 10 May 2024 21:32:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9C601BF36A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A116F614FD
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2U48qiO0BoGS for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:32:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 433A66148F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 433A66148F
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 433A66148F
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:32:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7121740002;
 Fri, 10 May 2024 21:32:07 +0000 (UTC)
Date: Fri, 10 May 2024 23:32:06 +0200
To: Brian Mayer <bleemayer@gmail.com>
Message-ID: <20240510233206.04122516@windsurf>
In-Reply-To: <CAB3eKoBtu8-9ch_k9k=-tHocLE8SjYanSotPOM1HOTUsU-eGOQ@mail.gmail.com>
References: <CAB3eKoBtu8-9ch_k9k=-tHocLE8SjYanSotPOM1HOTUsU-eGOQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715376727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1OY+5QPKsZZt5r07JFvX/HqAeljPUbI6D+mXTW7nkjU=;
 b=Rd0b2rZNIIOb+WdRS4OXI2KiMX76oHKcRUjnmKPvnBndxQtrkD8lueZE7IPXM/L12TmwoD
 vab5CdG+45c3UYcYPU61RJtU3tueouIZ7/mYZkiRrIX9MJAQsF767EIRQGqrKCANVj8xcl
 wLJo0lQybT0oKGrgbCiAel8lxx/wvh3qqxy3d/JKEBEkhT2kMnCmrwj3wPNOBj/9Bm9LA8
 T61Mwh9cSenkaJS8Zn3E3KePiZaLN4yerlfyFILsV0mDNeZ1nBzmf1ExlGAAkh2uAlgPI0
 6KZdUWljuC1LPZxGtv1qFM6xs31mI4VmL1upn2DYTuXP2hA1OEeZ3Q8wg1cEmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Rd0b2rZN
Subject: Re: [Buildroot] [PATCH v2] package/sbase: new package
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

Hello Brian,

On Tue, 26 Mar 2024 11:36:18 -0300
Brian Mayer <bleemayer@gmail.com> wrote:

> sbase is a collection of unix tools that are inherently portable across
> UNIX and UNIX-like systems.
> 
> Signed-off-by: brian <brian@myr.sh>

Aside from the wrapping issue, we also need your Signed-off-by to use
your full name, and to match (in terms of e-mail address) the Author of
the commit. Right now, there is discrepancy between:

  From: Brian Mayer <bleemayer@gmail.com>

and:

  Signed-off-by: brian <brian@myr.sh>

Could you fix this this in your v3 ?

Also, a few more comments:

- Please add an entry in the DEVELOPERS file for this new package

- Please add hashes for the license files in sbase.hash

- Make sure using utils/test-pkg that your packages builds reasonably
  fine on a selection of Buildroot configurations

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
