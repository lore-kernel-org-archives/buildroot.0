Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71E5E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 21:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3156380B70;
	Sun, 29 Dec 2024 21:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZesU37wcYXu; Sun, 29 Dec 2024 21:51:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 809B380B9D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 809B380B9D;
	Sun, 29 Dec 2024 21:51:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9D73CA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF1C080BB5
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5dw13FlFXh8V for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 21:51:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 784FE80B8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 784FE80B8C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 784FE80B8C
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:51:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 478F660003;
 Sun, 29 Dec 2024 21:51:34 +0000 (UTC)
Date: Sun, 29 Dec 2024 22:51:33 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241229225133.3c689a4e@windsurf>
In-Reply-To: <20241103213001.2203278-1-ju.o@free.fr>
References: <20241103213001.2203278-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735509094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u5cRoj2fPcZ727SrriEgw+/rNmWR84HdSQ8kI3WJgvQ=;
 b=CXq/kP9MKnGpWQ3cNaHBRQ0jJxiVmf2nV33rhKBdMFw9XW+B0GUl58kCtf/j9vFssGO2/H
 Us+I8Uat9g/Omk1rbw/nulBwp8KbMtFu1fMVq7lPFXoPG2qPeTE2oqnbk0okcSsbi8Org7
 KAp8GHJRn6AtznpTSLg8Ok5jdsGMpytujGNUZDNgEIIKHptYvdaulFMs0eYE8ZZNDJ1+mE
 xlNRywZai+MquKy3y6pAjSspvGkMtDT3Re+MAtZkrd3IeWuMQlKnme7jCxhUg7i7sIp3XP
 Q+KaCEnRr01wgdSAi1RMtUqtub/EpFCgIWJ8lWme/nyf0M96ToHxwzDnDUV9eQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CXq/kP9M
Subject: Re: [Buildroot] [PATCH 1/1] arch/arm: add the Cortex-A78 core
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

On Sun,  3 Nov 2024 22:30:01 +0100
Julien Olivain <ju.o@free.fr> wrote:

> This commit adds the Cortex-A78 core, which is a armv8.2a ISA.
> See: [1] [2].
> 
> This CPU support was added in GCC 11. See [3] [4].
> 
> Buildroot commit 771da1dd9 "configs/nvidia_bf3_defconfig: new
> defconfig" [5] added the first defconfig for a board including
> this CPU.
> 
> [1] https://developer.arm.com/Processors/Cortex-A78
> [2] https://developer.arm.com/documentation/101430/0102/Functional-description/Introduction/About-the-core
> [3] https://gcc.gnu.org/gcc-11/changes.html
> [4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-cores.def;hb=releases/gcc-11.1.0#l98
> [5] https://gitlab.com/buildroot.org/buildroot/-/commit/771da1dd9b209adfb27d2dd344a4b2fdcc8bacc4
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  arch/Config.in.arm | 9 +++++++++
>  1 file changed, 9 insertions(+)

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
