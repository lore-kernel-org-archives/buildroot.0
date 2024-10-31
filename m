Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427B3D767F7
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 18:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BBBC4021D;
	Thu, 31 Oct 2024 18:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oAJZdZpivdwY; Thu, 31 Oct 2024 18:26:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA2D64024E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA2D64024E;
	Thu, 31 Oct 2024 18:26:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C50E5E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9873A80BFD
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d22c1qUQS1mU for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 18:26:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6551180BD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6551180BD4
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6551180BD4
 for <buildroot@busybox.net>; Thu, 31 Oct 2024 18:26:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86601E0004;
 Thu, 31 Oct 2024 18:26:46 +0000 (UTC)
Date: Thu, 31 Oct 2024 19:26:45 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
Message-ID: <20241031192645.5a8a712a@windsurf>
In-Reply-To: <20241030085818.912555-1-francois.perrad@gadz.org>
References: <20241030085818.912555-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730399206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eKgW6yWXC/HXYjSJlBYCfuZQWH+VnVM/ktsM3vyV5Hg=;
 b=bzzLqCRgrVmv7F0CyNOiB3A00jdw/HQWZWTG0Q5AwEiv1usT7CsjC4OQSl43ahohAd+sJl
 TRQ06HXJkW5JbPukQpBbb8mMWFMw2HKB7VyNRklz13oQ8uKjQnj2CQn5Cw8Fu3tR+Rnnqc
 Ohyi5WwJdfkp0nwz8V5GqY1D1Q0SA1UtLQ32DPHWc+XTBEA5qCStNh5iRbFzpkHX6HrMiD
 LhB4BVCDIEctpZjZHFMTh6Nmt+p4OeNfo6es62r6L2DJLtHA85tExIHDPmZHDUBLgMv9ag
 1nRhcKiYFbkJB/w+nNBVbGXv0Gwd6EdLWge3mdB0sgPyHB2Hk/WtoBT3/l4JoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bzzLqCRg
Subject: Re: [Buildroot] [PATCH] package/lua-compat53: bump to version 0.14.3
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

On Wed, 30 Oct 2024 09:58:17 +0100
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua-compat53/lua-compat53.hash | 4 ++--
>  package/lua-compat53/lua-compat53.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
