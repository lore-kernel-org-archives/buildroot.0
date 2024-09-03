Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31D5CD37AB
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AEA740A20;
	Tue,  3 Sep 2024 19:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M8D9ZnRsQAbc; Tue,  3 Sep 2024 19:20:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7566740A48
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7566740A48;
	Tue,  3 Sep 2024 19:20:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 664A71BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6196980CA7
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PufD55Bxunx9 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:20:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4DDDC80CB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DDDC80CB4
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DDDC80CB4
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:20:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E2C340004;
 Tue,  3 Sep 2024 19:20:24 +0000 (UTC)
Date: Tue, 3 Sep 2024 21:20:23 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240903212023.0cc619a4@windsurf>
In-Reply-To: <Zs9C/g1czFdKG5Kf@waldemar-brodkorb.de>
References: <Zs9C/g1czFdKG5Kf@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725391224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8QQ5AwnaT9iJ0ylGuXKCPhAkk6UJEp2Y1JJMJ81wAZ4=;
 b=XXPKTE1jPHkTV80o/LDzO2Tc2Qk09g7VMMv1oidJjq4D43grVHKclMRa/JOw6R9jjttQ5N
 1ktKzp9xycBlTKV2eYA4+gsfCIuC+bN/UHB8xt81/iKdfvZjyy18FZFygTk1PtLcYwVsEE
 WdqQOsT3cR1NVKZ22u4OqovBUPvA78B58Dm6+WOCGTNiKVBe/3tpzCqB0dLi9X5fu1mZg9
 phFyJTyWt4jyot/gAowCxMj9maTHij9WSwYOs0Tv29p20Qy1/Ga3pSfh4KtIUdIkdjx5o2
 k9Q4HFUO4I2JVaAmVd9rpkBcpreaA1ri2UiSms8Hyo2gD07aZm0hmgW92e8Osw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XXPKTE1j
Subject: Re: [Buildroot] [PATCH] package/tllist: update download URL
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

On Wed, 28 Aug 2024 17:32:14 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Fix download URL. Tarball is renamed, too.
> 
> Fixes:
> 
>  http://autobuild.buildroot.org/results/950/950688493021c12c4dea98ac4b220355d917ff69
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/tllist/tllist.hash | 2 +-
>  package/tllist/tllist.mk   | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)

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
