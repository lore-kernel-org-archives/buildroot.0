Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE8CC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 14:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C07381EBB;
	Wed,  7 Feb 2024 14:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uB1Ad6mMlpxK; Wed,  7 Feb 2024 14:55:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7632E83AA4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7632E83AA4;
	Wed,  7 Feb 2024 14:55:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C67DD1BF276
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 14:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA7DC40A57
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 14:55:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nuGMVn-IT9Tj for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 14:55:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B62B240A69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B62B240A69
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B62B240A69
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 14:55:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A08491C0002;
 Wed,  7 Feb 2024 14:55:12 +0000 (UTC)
Date: Wed, 7 Feb 2024 15:55:12 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240207155512.150c4abc@windsurf>
In-Reply-To: <4ec42d32f6ea3c94fee3da6d63c884b5594d2c0e.1706448055.git.yann.morin.1998@free.fr>
References: <cover.1706448055.git.yann.morin.1998@free.fr>
 <4ec42d32f6ea3c94fee3da6d63c884b5594d2c0e.1706448055.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707317712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zFiRgb+r3E+RKAsHFWFUGjfbFZ+4I8COdVdbnyq6/vk=;
 b=hiqUHE8qYROzlmmYRCag+1kCYbqa80attEucgQlWHjRpXy31yhSnk///dOCNpmleMYePRV
 7S4upKjRvF+BVWEAEmcaa5Mz+0mPVZpDCooBBnXmkQypviYLDHQvx02DEaTM+K/4mAbGgj
 zUPlTNSrus6VH+0KnbOdjjQk/c5oqNDJrYPXBS38AFKuRpfMMzahVJhEpwG/fnb2UVmEVx
 IPUrKiGkCDeiKaCwnH2ydgmkZp/RK7lm/o8x1FndiQMLs3IoHhlD3uzZ1Z17ZoqyRImJ5Z
 IBp3SMb3DkYgt4Di3NYiAFf4bc38CFSfF+XkPPXbnGwDwlBxOZOXXK0o7xrdAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hiqUHE8q
Subject: Re: [Buildroot] [PATCH 08/10] package/opencv4: propagate internal
 dependencies
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 28 Jan 2024 14:20:57 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Commit e22994378553 (package/opencv4: BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
> requires BR2_PACKAGE_OPENCV4_LIB_DNN) forgot to propagate the dependency
> to the internal stitching option, and to the contrib options dpm, face,
> and xobjdetect, causing unmet dependencies warning (unfortunately, not
> errors) such as:
> 
>     $ KCONFIG_SEED=0x9F66F854 make randconfig
>     WARNING: unmet direct dependencies detected for BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
>       Depends on [n]: BR2_PACKAGE_OPENCV4 [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=y] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS [=y]
>       Selected by [y]:
>       - BR2_PACKAGE_OPENCV4_LIB_STITCHING [=y] && BR2_PACKAGE_OPENCV4 [=y]
>       - BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XOBJDETECT [=y] && BR2_PACKAGE_OPENCV4_CONTRIB [=y]
> 
> Propagate the dependencies.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/opencv4-contrib/Config.in | 18 ++++++++++++++++++
>  package/opencv4/Config.in         |  6 ++++++
>  2 files changed, 24 insertions(+)

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
