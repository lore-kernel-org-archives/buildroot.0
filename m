Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D5FC3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 07:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52C5680D92;
	Mon,  5 Aug 2024 07:15:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1Fz-edjwrhM; Mon,  5 Aug 2024 07:15:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 758D380DA0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 758D380DA0;
	Mon,  5 Aug 2024 07:15:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED7B31BF333
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 07:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E77D1402A6
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 07:15:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0VuPAms8PMl9 for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 07:15:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A183F4029A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A183F4029A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A183F4029A
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 07:15:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E5511C0008;
 Mon,  5 Aug 2024 07:15:18 +0000 (UTC)
Date: Mon, 5 Aug 2024 09:15:18 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240805091518.4c4ffae3@windsurf>
In-Reply-To: <ZrBvFLSlPYjjwCKj@waldemar-brodkorb.de>
References: <ZrBvFLSlPYjjwCKj@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722842119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=74BmGI/zYdPM3QEhIjl7DOWWuDGgI1ZZXRPOOK9M9p4=;
 b=LeU57Wma+1ALaXefhHsMmVxYsBGZvvS4DvBuA70VH+d6FvVWrswgnFbu44FlLGKcrPiduE
 FVU8G3xsR/16L0DVimIsYyTEvR95+eYhOAE6KXojng5Aw5nYGksVuHVV2CMWT8kmytsBby
 9FmoaHNGwOtk13LlbhnVT6U2qH2IstCgt9FDNwbDE3Rh7G5BPfspLoHjVMWlKegjtvf7jd
 ih9wFcPkZycNTqiYbYCos/gYE8vDQ+P31pWvkDkj49yAR5oObV4t69O/us6IUIN69tT9FW
 K6QVGE8rKiKNfnV5P+hXXBXVmuJy61yq9EO3QYyx0uFX+V2pRT9Dn/4/GPh/dg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LeU57Wma
Subject: Re: [Buildroot] [PATCH v2] package/uclibc: fix missing m_tim issue
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

On Mon, 5 Aug 2024 08:20:04 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Patch from upstream to fix missing m_tim issue.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f07d6d6ae2331f9972974093c0503b9d3c6b914a/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1->v2:
>   - add missing autobuild url (requested by Thomas P.)
> ---
>  ...are-st_mtim-if-defined-__USE_XOPEN2K.patch | 205 ++++++++++++++++++
>  1 file changed, 205 insertions(+)
>  create mode 100644 package/uclibc/0003-bits-stat.h-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch

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
