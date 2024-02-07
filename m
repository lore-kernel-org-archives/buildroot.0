Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62162C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 18:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06EE861474;
	Wed,  7 Feb 2024 18:56:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZBQLNX4qfTUF; Wed,  7 Feb 2024 18:56:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2322361478
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2322361478;
	Wed,  7 Feb 2024 18:56:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D387D1BF20D
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 18:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0EA7415D6
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 18:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dmH1Ljj6EW1Y for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 18:56:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A0A540925
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A0A540925
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A0A540925
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 18:56:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 067FA60004;
 Wed,  7 Feb 2024 18:56:12 +0000 (UTC)
Date: Wed, 7 Feb 2024 19:56:12 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240207195612.7ea08e54@windsurf>
In-Reply-To: <20231129172852.1684628-1-dario.binacchi@amarulasolutions.com>
References: <20231129172852.1684628-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707332173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n+PfkmVWJdOU7+f2fG3ysE4wkxIKChiKsQr7sD669pM=;
 b=WwDe47vifPqGJsEmv+1uiHCjbsbXtclao+lHOurV++7ZA4q9lvJoNkNiG/yCu4r18a4bIk
 eHxU4VNhK5edCVbFR8a3pxSmEAbE4G0FVRhZYlaMP0lfcbpTPKRBMNI1htkYeSH6HYxLJS
 gZzSk4bn0wKfayn5VQvxOWAY4SFQViXo2Gt2N4tb4ug+wo/or38U8I085TAP0sLBAjdK2Q
 b/dT8s7VBy+i+/dli73oge68XaPhhPZPr76tdgLeZHERFLmsIMBVYII4SVZ43hJfgypY5j
 usleD2NkAOGtMjDlINE1Lxf4BkoGCDaY1LZSV/ht2e6q3BRzDtq+4RtBnqy8/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WwDe47vi
Subject: Re: [Buildroot] [PATCH 1/1] boot/ti-k3-r5-loader: add support for
 patch files and URLs
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 29 Nov 2023 18:28:52 +0100
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch adds support for URLs using similar code as found
> in linux/linux.mk and uboot/uboot.mk.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  boot/ti-k3-r5-loader/Config.in          | 11 +++++++++++
>  boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 18 ++++++++++++++++++
>  2 files changed, 29 insertions(+)

Thanks a lot for your proposal, but we no longer add package-specific
options to apply patches, as BR2_GLOBAL_PATCH_DIR allows to patch all
packages. We do have options that exist for linux and u-boot indeed,
because they predate BR2_GLOBAL_PATCH_DIR, and we need to keep them for
backwards compatibility. But we do not introduce such options for new
packages. For the example, the arm-trusted-firmware has no custom patch
option, because BR2_GLOBAL_PATCH_DIR can/should be used instead.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
