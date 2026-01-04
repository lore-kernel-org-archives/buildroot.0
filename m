Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E5EC2A074
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 10:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B54AC60756;
	Sun,  4 Jan 2026 10:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b8JbhAsY-DOh; Sun,  4 Jan 2026 10:54:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D57360708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767524040;
	bh=Cy7AFXx7rrz60DfWdTNHr0b+QahG1N5c5GRJq47if1U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c44Jf3lK+yztFF9msCwVC3K2PAm0RvydhFsYks/Bw/l9hkoNjqf7OD1PbsQI09Nkc
	 jwrvfOtdxUeuFD8r4B3aUupCuBZA8Un4pU9q5tSRzwXIE0JgLksnmcT4XMLTHVeg6q
	 08LPH7mx1TuudseYTg1FL7PySCjsnCv/bVv0AX3EKSi9tLL6aiGjqlG33SMaL/ppCJ
	 UNm8lK+d0DHmC4W9Lg+EtYjjJbohTXX871gmKnQJveTXpmC3CAl4p3N/DDks9jAb+c
	 p9/7+3p1LLKfUcnnqHdD/B+1vziq3bRKUrrSkCabNYKTiaRwVSUjcYVHm2ieO9JPYH
	 UFzD5STRBrFRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D57360708;
	Sun,  4 Jan 2026 10:54:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 879622DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E651404E7
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 53rH-viT-PyR for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 10:53:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5B03D40475
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B03D40475
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B03D40475
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:53:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 334A61A261B;
 Sun,  4 Jan 2026 10:53:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 040486072B;
 Sun,  4 Jan 2026 10:53:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 30BBB113B0449; Sun,  4 Jan 2026 11:53:53 +0100 (CET)
Date: Sun, 4 Jan 2026 11:53:52 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20260104115352.7ea9456b@windsurf>
In-Reply-To: <20240808210603.185284-1-ju.o@free.fr>
References: <20240808210603.185284-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767524033; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=oDdYtyD8gTxW3KgSpnRbk22f65I3EPuT4GhAx78A6T0=;
 b=YYSmSzzBn+Y3+tlkDe10vC8xF7yp2QK1RTFALNJkZU0o8T5mOsJmOChbUtog6ElTVi94In
 iNiGSiHwMuCIAH49NZLMZtdbqQhFZ3kfIF0Rx5CE8uMCPg0gXLNaIVN63qKV4Huop5U7Q6
 rkjOxYQZRibqV0+SApmxD19yOfHnskYupuOtteH4C3UeARh8Ruv5Qsfl79t22SRts6JAJU
 h4qtn6MQ4rKBSRxZWlZKCdhB5BOAJt5v3+OYxOv126PqSDI4y3RxanTEWAqMeQUZTqQzfe
 Ua/8q3d0fpKTBxjzhO+GAC5HYPSBhqnlKyYsbFrVVeF+9CGG/55QRj66g4O4tw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=YYSmSzzB
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add flac runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  8 Aug 2024 23:06:03 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/7540310064
> ---
>  DEVELOPERS                                 |  1 +
>  support/testing/tests/package/test_flac.py | 20 ++++++++++++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 support/testing/tests/package/test_flac.py

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
