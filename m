Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FEAC3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 22:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B302540CFF;
	Wed, 10 Jul 2024 22:04:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gopjqE23s6Jg; Wed, 10 Jul 2024 22:04:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F8F340710
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F8F340710;
	Wed, 10 Jul 2024 22:04:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82B741BF593
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 595FB40881
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:04:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C_zDWx4WZU1t for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 22:04:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF28D4097D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF28D4097D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF28D4097D
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 22:04:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DA88240003;
 Wed, 10 Jul 2024 22:04:27 +0000 (UTC)
Date: Thu, 11 Jul 2024 00:04:26 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240711000426.53a6cabe@windsurf>
In-Reply-To: <20240621214447.479094-1-ju.o@free.fr>
References: <20240621214447.479094-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720649067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K5d86gFiIgsvP/iTVMBn/+MQFpsiSBjOkDRsVUTkNm0=;
 b=O7ILbvJ5iqcNUUFFFbAI5Q6rPB0Eqz0FcnrCO5UisxRVIeQEw0XnpCYejYYSJOejUVpgPJ
 xWQ4skV0QZWRDQp9V6cTLMISbxgoWQeaE4xL8G/zZP44l/68/z/NsztBwon3GZZN4AJBxa
 OBhOd0dH/xjLwp3BgydSBJkml4FhmyYIlxvFC5P9Fsttt4ZB2NM00mAslq7Q763YRLEsu8
 6EmHRv8590sEbKIq7oB8H97ScRmPq+93nqCaLN2xrOAZDUK5e+dTsRHgp+anseyjQ3AH4C
 h6zLSeABoYIyRGInF1Hx/F5i7X3VYWfj0dT0urM9auIY5UznfeWKhXuju/GT7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O7ILbvJ5
Subject: Re: [Buildroot] [PATCH 1/1] package/highway: bump to version 1.2.0
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

On Fri, 21 Jun 2024 23:44:47 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For release note, see:
> - https://github.com/google/highway/releases/tag/1.2.0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit 4aff617 with commands:

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
