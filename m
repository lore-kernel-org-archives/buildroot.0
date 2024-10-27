Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915A5D13578
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5479860683;
	Sun, 27 Oct 2024 18:48:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id edTRRQCfwQbS; Sun, 27 Oct 2024 18:48:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61B52606D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61B52606D6;
	Sun, 27 Oct 2024 18:48:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70A6F971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B0BA40270
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mu7zdkIB5xa4 for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:48:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B44234012A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B44234012A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B44234012A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:48:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C865A1C0004;
 Sun, 27 Oct 2024 18:48:34 +0000 (UTC)
Date: Sun, 27 Oct 2024 19:48:33 +0100
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20241027194833.4aa5a162@windsurf>
In-Reply-To: <20240915123729.800902-1-thomas.petazzoni@bootlin.com>
References: <20240915123729.800902-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730054915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qR80uT6pyyD/Ib3gMgo90swWT63Mu/jzRSQIyTu1OyU=;
 b=SERrbCrA9Ah90kr2lFDlROyYp/4//HIwlTvRPiMe0otc11hC/+MBNHeSPk/thNPx5WvRok
 0QAnuucb+/Phr2I0xY2AltpZ6u/1pghvr3LSjWeEI7o+qfnYaqPeEXuQMtdyK3j/KSDPPS
 kx1HG80aBUHnQ5OkWMeaHMRVWplemKUPI13LMHjCFJExLvWmfIBx6s+97jhWEfMfS2gYVY
 ObYJ2VAFmfjrotdF3rU3ap+RHcQJQ3xF6Ld+CxJBl9Df/XU3gxBxZh8W3euKuu4oFPSkZp
 DRcE0W210lDbMUciVuEInbSP7CJFK7J7RTiMdWqSFH5DOuJApPOEFgrxuYn2kA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SERrbCrA
Subject: Re: [Buildroot] [PATCH 1/2] utils/genrandconfig: handle
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
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

On Sun, 15 Sep 2024 14:37:27 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> When BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y,
> BR2_LINUX_KERNEL_IMAGE_TARGET_NAME is supposed to be non-empty. But in
> the context of genraconfig, we don't know to what value
> BR2_LINUX_KERNEL_IMAGE_TARGET_NAME can be set, so let's avoid cases
> where BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y. By dropping this option,
> kconfig will revert back to the default image format for the selected
> architecture.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/1d104a051c83bb31e98565369a2ec7badfa21eca/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  utils/genrandconfig | 4 ++++
>  1 file changed, 4 insertions(+)

Both applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
