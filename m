Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57756C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 07:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13DC340E04;
	Thu, 15 Aug 2024 07:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1eknYkCN3OEx; Thu, 15 Aug 2024 07:19:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFF5340E12
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFF5340E12;
	Thu, 15 Aug 2024 07:19:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AEDC41BF5A9
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 07:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A72E080A5F
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 07:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eq2gfg_ZJNTX for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 07:19:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5128C805B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5128C805B1
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5128C805B1
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 07:19:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A773E0002;
 Thu, 15 Aug 2024 07:19:29 +0000 (UTC)
Date: Thu, 15 Aug 2024 09:19:28 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240815091928.4478068d@windsurf>
In-Reply-To: <Zr1DUNSWk+fNwdzx@waldemar-brodkorb.de>
References: <Zr1DUNSWk+fNwdzx@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723706369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xtaZm0/OtprTnky8SKbtOEE8BbYkGvjvJFVP94N+CmA=;
 b=OFc1wPbnfDi6YKb6Unyso7RUMoA6PvNwwd4tmwU/KvPAqj1tph+AqtDytBFYbgrSnKP/ii
 fnIH3j6R4+DIZDDFAAxyy3HlwAr07lHQ29Z7/3LV3YZUFP+yydMAoLjbKTGtO4K8Cg1xJq
 uOdBSXLpurkM0rAMhtlx/YbiB0/vXRImZ3TFCof4rfHLCh/3RN+pqKUWqZ01HB68mzldJH
 2/1TEyRTV7nwY29GLxg7pBNvk+qWOTjjkFRkOpJ9UcER9/m0EzBGqbqiA8hnWfGibUtEJj
 EVKu7JHFHCkf75LQ1BzmynYeEZmL9qzT7EPrwzdsiIw2+MchF3OpslEsB3j2qw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OFc1wPbn
Subject: Re: [Buildroot] [PATCH] package/libpcap: fix m68k-cf compile issue
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

On Thu, 15 Aug 2024 01:52:49 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Compilation with -Os triggers this assembler problem.
> The problematic C code contains a long switch statement, so
> everything looks like GCC Bug 104028 is triggered.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/db5/db58215fb3c7f30b6c0f0764a84271010346edfb
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1->v2:
>  - use GCC_BUG_XXXXXX instead of arch sepcific stuff, requested by
>    Thomas Petazzoni
> ---
>  package/libpcap/libpcap.mk | 4 ++++
>  1 file changed, 4 insertions(+)

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
