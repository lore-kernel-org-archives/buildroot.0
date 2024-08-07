Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976F8C52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 10:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BD348059B;
	Wed,  7 Aug 2024 10:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBDHhsW1rotk; Wed,  7 Aug 2024 10:24:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89BB580569
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89BB580569;
	Wed,  7 Aug 2024 10:24:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17C831BF97F
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1171D40553
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9sk2v0rNZ-MU for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 10:24:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C1CD3401FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1CD3401FC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1CD3401FC
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 10:24:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9CE4FF803;
 Wed,  7 Aug 2024 10:24:25 +0000 (UTC)
Date: Wed, 7 Aug 2024 12:24:24 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240807122424.2b9bd275@windsurf>
In-Reply-To: <ZrMRX7l9ma6LPT3I@waldemar-brodkorb.de>
References: <ZrMRX7l9ma6LPT3I@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723026266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HQVcAJ6X5K+DOfuk5VjcZxVd6yHnnOiVEx9EAN10t1E=;
 b=jKtU5ooVQ3SK4SSW6B1FznZJMelecq5huSAJSmynR5zrY2J/jCkwpZbTnvKfKSsOwuOCQ3
 w6xtmkQZVzkctt80QcKXP0Vb1/Q+dIKEKAwPVT5+MKVabSGc6lorLi596eCtdf8/h9DbSL
 B6ZvqRa6OixDItPBbi4XF/e1gHHTBlycAMVzhXIZT0xXx7IRxhuGshCIMiCl6pCBlfdZVi
 tZj58ARHe67CJeEDhYYFgGZfyMDUhPiASKzxZps269jnqVHOg57PpCpPUJJnH/VJcpepV2
 ISFLZI9VvlyhA4GqBXOuHRVNFjw6BopXkafCMGns7K8HoQzaKnLUf+GwZsTWpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jKtU5ooV
Subject: Re: [Buildroot] [PATCH] package/elf2flt: update to 2024.05
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

On Wed, 7 Aug 2024 08:17:03 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Patch 0001 is upstream, this is also the only change
> in this release.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...r-new-style-ctors-when-using-riscv64.patch | 34 -------------------
>  package/elf2flt/elf2flt.hash                  |  2 +-
>  package/elf2flt/elf2flt.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 36 deletions(-)
>  delete mode 100644 package/elf2flt/0001-fix-alignment-for-new-style-ctors-when-using-riscv64.patch

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
