Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B36C3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 21:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C9EF40B38;
	Tue, 20 Aug 2024 21:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5x4CMD8-nRYY; Tue, 20 Aug 2024 21:24:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1261940B4A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1261940B4A;
	Tue, 20 Aug 2024 21:24:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B1F601BF3B8
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABD6581210
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSSQGDK1wbKM for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 21:24:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 976E581222
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 976E581222
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 976E581222
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 21:24:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C19141C0002;
 Tue, 20 Aug 2024 21:24:26 +0000 (UTC)
Date: Tue, 20 Aug 2024 23:24:25 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240820232425.52502981@windsurf>
In-Reply-To: <ZsRJkHnGdaJ0DBy8@waldemar-brodkorb.de>
References: <ZsRJkHnGdaJ0DBy8@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724189067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QucVaGX4PVh0PGBdjE0F34Xnqx2t3Q3CYVx5dOSWwx0=;
 b=pdeoG5SRJwkAfj21Xv/yYRhxD3LJXnJYdkJD/xqa38WaDEwSq1gib+trOzRSKPOGHie1kz
 xX2IR/Esao8k+9zkjhX3fVFPqU03g+mx9eqSIdQcclCDxDNzvswz6Nzck1kwamqs/z9JhI
 YWX9VsNVQALEUe+t0MD/YZnaku5R9b4JnfCz+a/w2uhvBUZxUywONDPgE0SM2iPPpoQAdj
 aszaz7rZ6r/2g1lA1Du/P0LmdrMlebKHTP9vEtR2f892fhz2zs1YwnsmrSfXLgc042uDzJ
 9h08wEJaQrSSkrZALIXIxTGKmi/Nu1frtX9qYUFX+p4kY4y/jm8curInH2fi2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pdeoG5SR
Subject: Re: [Buildroot] [PATCH] package/aumix: update AUMIX_SITE
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

On Tue, 20 Aug 2024 09:45:20 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> The old URL gives 403 forbidden.
> Use a working sourceforge URL.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c0c/c0c3945cade7a6d7a615ac23523c93b02dbb056f
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/aumix/aumix.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for the patch! In addition to AUMIX_SITE, one also needed to fix
the URL in the Config.in help text, so I did that and applied to
master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
