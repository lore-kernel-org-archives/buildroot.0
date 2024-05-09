Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CECEC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DB7941E6D;
	Thu,  9 May 2024 16:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hw1QX9oMbTqi; Thu,  9 May 2024 16:32:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2047541E40
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2047541E40;
	Thu,  9 May 2024 16:32:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E7BC1BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C0C983EC1
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jTRuEawbEJrO for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:32:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D22383EBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D22383EBC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D22383EBC
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:32:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45BC640002;
 Thu,  9 May 2024 16:32:47 +0000 (UTC)
Date: Thu, 9 May 2024 18:32:46 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240509183246.6cdffa31@windsurf>
In-Reply-To: <20240407210922.3404297-1-fontaine.fabrice@gmail.com>
References: <20240407210922.3404297-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715272367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VOGL1ynViPe3W751UVTwKk0s8s5AY91cvA6HJkO2TrU=;
 b=BQ3cY7840M5SHsQ1WVHPLPCJHFc/HJI5liz8hkGAZ0ixeUjvFmDfq4NTHeJdwkJmItam8I
 34xw9ssy/xBXcHrAVWVSHjIOumS7XZsK44HTrQRvEXTnNgo4FhIVn40nOhUS6VENUe9dbX
 HyRfKPoDCH0GrHnZW/7Ic1PazAab/GBsyRJdlgWjrupOW41k5x8m4uekOGEGpL+ZT+uII2
 g25Mbxex9YD2qCMMLSakeikDS574pBQ3azXOKoi7ZcSYEjdMLZj8Jp8avSUHeb60XIXD/z
 W+JisIiVnVjW+rPAPR9+ZuCed72LHcy0pqsE/Ij6hSqgqk3D6XF38E4UCmtdyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BQ3cY784
Subject: Re: [Buildroot] [PATCH 1/1] support/config-fragments: replace
 br-i386-pentium-mmx-musl
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

On Sun,  7 Apr 2024 23:09:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Replace br-i386-pentium-mmx-musl by bootlin-x86-i686-musl to avoid the
> following build failure with efivar and musl < 1.2.3 as suggested in
> https://patchwork.ozlabs.org/project/buildroot/patch/20240303171115.1140763-1-ju.o@free.fr:
> 
> /home/buildroot/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: ./libefisec.so: undefined reference to `qsort_r'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a0ed3970da8a84d884b26c081b49b8d2b7208829
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../autobuild/bootlin-x86-i686-musl.config             |  4 ++++
>  .../autobuild/br-i386-pentium-mmx-musl.config          | 10 ----------
>  .../config-fragments/autobuild/toolchain-configs.csv   |  2 +-
>  3 files changed, 5 insertions(+), 11 deletions(-)
>  create mode 100644 support/config-fragments/autobuild/bootlin-x86-i686-musl.config
>  delete mode 100644 support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config

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
