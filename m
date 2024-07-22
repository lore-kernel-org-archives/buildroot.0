Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9DFC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D744A401CD;
	Mon, 22 Jul 2024 16:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZxXNdFJeXSG; Mon, 22 Jul 2024 16:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90137402BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90137402BB;
	Mon, 22 Jul 2024 16:33:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1550D1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E07D810DF
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8hgz1wAuqEQC for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:33:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EF08480FFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF08480FFF
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF08480FFF
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:33:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B1AEC0006;
 Mon, 22 Jul 2024 16:33:32 +0000 (UTC)
Date: Mon, 22 Jul 2024 18:33:32 +0200
To: Romain Naour via buildroot <buildroot@buildroot.org>
Message-ID: <20240722183332.1e385320@windsurf>
In-Reply-To: <b27cbc6b-d3c3-43cd-b661-02f98512fe92@smile.fr>
References: <20240713093700.13981-1-antoine.coutant@smile.fr>
 <b27cbc6b-d3c3-43cd-b661-02f98512fe92@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721666013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lXFNy95mc/ycu2PtSFB8GbO/G0JtGb9Rea/1nuPE2Js=;
 b=gMd18zvxPvUmOjqouAC+IBoLT0wufOt4+iRdVorB95Pw1xIlm+qWE9bSL1BKNJiQeZ99C1
 VXh/kZ2NlCDUaQ1qu2xpfNHncoxznnNPVDc6QtoCvx4fSUyz25fkb4h8JsyMO2a9/SiEy/
 c9ElD3Tqm9pb78N5iz2Z3Ak09zRO7Xrm+FZG4lBF41NtszDTmY/odA21Z/+CvKQ4lhuiZP
 4hVGsX2K0OFezfkIyWDWOHkENxgp3lA22ImUXTdl247NLqG0NrE2x+qJp4ROr/MDMy5WNK
 3lpMKLraHZsHxlJLSj7om2abxdCS1gpKtlqOw4DKB6JaHVt3EJqNmUJp3B1ZtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gMd18zvx
Subject: Re: [Buildroot] [PATCH 0/7] Adding RustiCL
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>,
 Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Antoine, Hello Romain,

On Sun, 14 Jul 2024 13:10:20 +0200
Romain Naour via buildroot <buildroot@buildroot.org> wrote:

> It seems your patch series only work on top of mesa 23.x. Since mesa 24.0
> rusticl include new llvm stuff to build [1].
> 
> Somehow it takes the wrong clang or llvm headers/libraries...

Based on this feedback, I have marked the series as "Not Applicable".
Could you address the remaining issues, and send an updated version?

Also, it would be good to have a runtime test for this functionality,
which is quite complex.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
