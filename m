Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2F1C021A7
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 17:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9F14405E3;
	Sat, 14 Sep 2024 17:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLWeI-uxWZm2; Sat, 14 Sep 2024 17:25:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4F324072E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4F324072E;
	Sat, 14 Sep 2024 17:25:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B3EFF1BF86C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 17:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A23E14072E
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 17:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzELG2DQKJbC for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 17:25:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3AEDF405E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AEDF405E3
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AEDF405E3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 17:25:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 011EC40002;
 Sat, 14 Sep 2024 17:25:11 +0000 (UTC)
Date: Sat, 14 Sep 2024 19:25:10 +0200
To: Yuriy Kolerov via buildroot <buildroot@buildroot.org>
Message-ID: <20240914192510.13464c03@windsurf>
In-Reply-To: <20240823152547.1023215-1-ykolerov@synopsys.com>
References: <20240823152547.1023215-1-ykolerov@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726334712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hnx/A/cNIoAfdHMubvB37unUbX1nmNsvzIqeKZ2GlAs=;
 b=RmiaeJ/KUmZSWEdCH9+IR+HSjz3dqy+DvotNSapVA/qDr7JkXpfu1TiMUHzNPPj20oNaMt
 cnYmfkV/4TKZR6mYBUPzVCllsPUp8hJJajWQttTJA8D8ooqPtkoZoz/7cxQWt26hF4aT/k
 4o64lrEJO4KgB8L4HdB4puRPR+HCoSmJCp3LYbsr6NY7IkC9uZCRP9vsf+xLgpJ86VX89T
 v4eR0P27YYbvK1AHylIhztkfHCIstY81pLsFcNmY6DwlY0ZQZCcupaVrwAbdjlbHsRVixm
 9F7zFdU0XkNT3DMtSYIHZLZJbd3BgNdghyt2hhYpTuGTNJz59NJ3xiFtbmvxtw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RmiaeJ/K
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: drop support of ARC 700
 targets
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Yuriy Kolerov <Yuriy.Kolerov@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 23 Aug 2024 18:25:47 +0300
Yuriy Kolerov via buildroot <buildroot@buildroot.org> wrote:

> Synopsys ARC 700 family is not supported by glibc. Thus, it is
> necessary to prevent selecting glibc while configuring for
> that processors family.
> 
> Signed-off-by: Yuriy Kolerov <ykolerov@synopsys.com>
> ---
>  package/glibc/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master with added autobuilder references. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
