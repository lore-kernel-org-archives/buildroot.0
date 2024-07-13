Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A406FC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B804413C7;
	Sat, 13 Jul 2024 14:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xCo3L6ChphdJ; Sat, 13 Jul 2024 14:37:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7E6D41707
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7E6D41707;
	Sat, 13 Jul 2024 14:37:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B0AE1BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 744278208F
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xEKPAG3_wPzX for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:37:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4D8D980F6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D8D980F6D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D8D980F6D
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:37:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4019740004;
 Sat, 13 Jul 2024 14:37:31 +0000 (UTC)
Date: Sat, 13 Jul 2024 16:37:28 +0200
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Message-ID: <20240713163728.617f32b4@windsurf>
In-Reply-To: <20240712221333.909756-1-rgallaispou@gmail.com>
References: <20240712221333.909756-1-rgallaispou@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720881451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=16sQFfMroXhrcikSOYKVFoVrhiFnTOFFc9rUI7KLatQ=;
 b=QpQpE8ZGVMIUtGhm/DWqoUZ3gUrQN0hqfmP7Anzjm2ovrpo2HTmAAD/Bb5uKH0CWGal2Zy
 FKtDMNjs5cREug8J5ajmcQo1HApDXooawYZQybq+KZXAYoxX2t6vyZupK/MP6WQ/QnjP+c
 U+/98OsP3OH/CWHIZ3EfI2DpnSKIMB6fraHAqHNwRHlqlroudzRsKz+b88qD7J/HMQaJdr
 PpGjmIGaw6A42/5/BBnmOjc6MrlL+/t6U8VjdmGQGnyPlMKQ2FKJM8zI493o66lmM0kLbP
 FuNV/RGdcM9jMDR+XsKpDffCthHIfV1klJVjT7SmO5sMPlfKrbu8wpJqevmcdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QpQpE8ZG
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/stm32mp157c_dk2: bump {TF-A,
 U-Boot, Linux} versions up
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
Cc: Marleen Vos <marleen.vos@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Jul 2024 00:13:33 +0200
Raphael Gallais-Pou <rgallaispou@gmail.com> wrote:

> Bump TF-A to v2.9
> Bump U-Boot to v2024.07
> Bump Linux to v6.0
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
> Changes in v2:
>   - Keep comments
>   - Update TF-A and U-Boot along with the kernel
>   - Use explicit versions
> ---
>  configs/stm32mp157c_dk2_defconfig | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

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
