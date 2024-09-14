Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76FDC021A8
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 18:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C5C2840F4;
	Sat, 14 Sep 2024 18:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XUTOSVmE3LAO; Sat, 14 Sep 2024 18:14:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB3DC84147
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB3DC84147;
	Sat, 14 Sep 2024 18:14:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C401F1BF283
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B288C4073D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BRgjVPPGszx6 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 18:14:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 04BAC40735
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04BAC40735
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04BAC40735
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 18:14:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0782F20002;
 Sat, 14 Sep 2024 18:14:36 +0000 (UTC)
Date: Sat, 14 Sep 2024 20:14:34 +0200
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20240914201434.34d5c340@windsurf>
In-Reply-To: <20240828103538.7945-1-buildroot@heine.tech>
References: <20240828103538.7945-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726337677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6RXJgBZ51o+yLAwwQaBMhHSwBc6VFjxOhzznaPMJElI=;
 b=B5NcpdCoVQU5wqlDHfgFFrDDusujEsZHfX640ZH/eJ4aThOWzEHDyyrYR4ve6oLUePe8R2
 tzwwkpDpAQSNpjUCoLWcej0erxDlk++XeE7ksOTGSl++4MMNRqFgjvdsIz+kHZnBODZj96
 dfVR+cslYF1prx/SRNaHPsgmbhMt2QQ/baRaFP2hnwXHPcUOyRHqFUXss6xNdwihDWVaIl
 TeMMYHcmaY16NUgiCeDaSXaoNogp4L+Sbyg7EUQMkY4qYbyfNfVsJgvW8G8I/hkgXBvcXQ
 +RT9cSBXlubs9LEufm/snECMUZtUMM2PYC17hoO45KvKJHNrXVuLTuqFWH8+kg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B5NcpdCo
Subject: Re: [Buildroot] [PATCH] package/gtest: bump to version 1.15.2
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
Cc: Stephan Hoffmann <sho@relinux.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 28 Aug 2024 12:35:37 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/gtest/gtest.hash | 2 +-
>  package/gtest/gtest.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
