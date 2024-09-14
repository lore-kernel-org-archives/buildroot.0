Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B997FC021A5
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 16:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 852688199D;
	Sat, 14 Sep 2024 16:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPuzQ32VaJaE; Sat, 14 Sep 2024 16:23:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 806BA81B04
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 806BA81B04;
	Sat, 14 Sep 2024 16:23:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 508601BF83A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F869607BD
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id grMwI_xyF8CF for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 16:23:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F187607B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F187607B2
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F187607B2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 16:23:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E878640002;
 Sat, 14 Sep 2024 16:23:24 +0000 (UTC)
Date: Sat, 14 Sep 2024 18:23:22 +0200
To: Thomas Perale <thomas.perale@essensium.com>
Message-ID: <20240914182322.181c10d5@windsurf>
In-Reply-To: <20240914153651.2633469-1-thomas.perale@mind.be>
References: <20240914153651.2633469-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726331005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m30XgZOIBEWEKOvLlUWXDLChSg0Z7PRnmgQkQF3mRpQ=;
 b=XUciC3PRcweX2MaMUnAU/B15AXbcECU2iN2lLavLEVr403HBj3gr8MfE58L21nGFbeNi9Q
 7WldBF9w5pm56iLJ2DQvy+Uj0A4pS1iBA+qOWhrGsPMd/NzYZxuRXlqCA0ARnjQlll4OLC
 bAPK9dK5gypU5DISpBaPdAR7ZjzcmX+rs+Yxyri9uJGTaaU13EEEHDjd9E8ECBE7RhvUNY
 wm57YFaaNCAXS3tSjdr8YECumEh1AqMmu/VgEv2us18pqfbFM6WlFD4HMo9vlPKH7HMP75
 oV/ioxVE2MKlSVfyhstXXmf0855Fibcl85X2ZNNCW+/xEADO9eU81HCK7E1Z9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XUciC3PR
Subject: Re: [Buildroot] [PATCH 1/1] package/ffmpeg: fix build error
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
Cc: Anisse Astier <anisse@astier.eu>, Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Sat, 14 Sep 2024 17:36:51 +0200
Thomas Perale <thomas.perale@essensium.com> wrote:

> ffmpeg builds with `--enable-vaapi` opt made GCC v14 and 32 bit target
> will throw an 'Wincompatible-pointer-types' error.
> 
> This is a downport of an upstreamed commit but not yet present in any
> ffmpeg version that fix the pointer type.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f5f/f5f2d16226ad9500ecf046779d5282ee071a54d3/
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Thanks for your patch!

> diff --git a/package/ffmpeg/0007-avutil-hwcontext-vaapi-use-the-correct-type.patch b/package/ffmpeg/0007-avutil-hwcontext-vaapi-use-the-correct-type.patch
> new file mode 100644
> index 0000000000..e455654b2e
> --- /dev/null
> +++ b/package/ffmpeg/0007-avutil-hwcontext-vaapi-use-the-correct-type.patch
> @@ -0,0 +1,26 @@
> +From 6f8e365a2af2b6b21701d41eed3b2e3f8a436eeb Mon Sep 17 00:00:00 2001
> +From: James Almer <jamrial@gmail.com>
> +Date: Wed, 31 Jul 2024 10:00:54 -0300
> +Subject: [PATCH] avutil/hwcontext_vaapi: use the correct type for
> + VASurfaceAttribExternalBuffers.buffers
> +
> +Should fix ticket #11115.
> +
> +Signed-off-by: James Almer <jamrial@gmail.com>

We need you to add your Signed-off-by line below the one of the
original author, and we need an Upstream: tag pointing to the upstream
commit (or pull request or mailing list submission if the fix isn't
applied upstream yet).

Note that those issues are reported by "make check-package". I suggest
that you add https://paste.ack.tf/faa8ee as your .git/hooks/post-commit
so that it automatically runs check-package on the changes you make.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
