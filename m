Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E418C67861
	for <buildroot@archiver.kernel.org>; Sat,  6 Apr 2024 21:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E714C60613;
	Sat,  6 Apr 2024 21:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptqNDaqUvms4; Sat,  6 Apr 2024 21:37:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F49160621
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F49160621;
	Sat,  6 Apr 2024 21:37:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD28B1BF5A7
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 21:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 968DF40065
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 21:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQljh6YPipUL for <buildroot@lists.busybox.net>;
 Sat,  6 Apr 2024 21:37:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 66A57400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66A57400AC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66A57400AC
 for <buildroot@buildroot.org>; Sat,  6 Apr 2024 21:37:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8560FF803;
 Sat,  6 Apr 2024 21:37:02 +0000 (UTC)
Date: Sat, 6 Apr 2024 23:37:01 +0200
To: Chin Huat Ang <chinhuat@gmail.com>
Message-ID: <20240406233701.036e7ca8@windsurf>
In-Reply-To: <20240406154308.3336009-1-chinhuat@gmail.com>
References: <20240406154308.3336009-1-chinhuat@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712439423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bh992OyJYBr5NHMA45N2uo/qq9XRg9IwxWX7RH5b3KA=;
 b=U9NFS5By6/JAG4Lfx0Q6OyXEUdwMpod7gnA0REng/kpBQrWeoYkuOMMM33rn/w+dAJDwet
 +edEJ/hkeaNrq+TBzhG3u6av/jnucTlGz6eFE7SFcoxyuur4l53lV5wcPAqJlm+0sYaTvQ
 +Gv8wa2K62VThg6Fx1HJjVBSjWmvg5O5HaTrHBftp4PznbsHn2o2JV13AllF0U1C/Th37u
 8+bySivXYO9nyCmJm5nBmdNByVsjnugqRag8nX/rgOv1Hjv0JbM5XM5oh+WqqLlfTvuAtF
 LeqVMbXfFH9e4+gJI9wAKgSZbdTS5EeYosQXi8mQVocIg/XcwmSw2Q9U2M43uw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U9NFS5By
Subject: Re: [Buildroot] [PATCH] package/uclibc: bump to version 1.0.47,
 add Y2038 config option
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

Hello Chin,

On Sat,  6 Apr 2024 23:43:08 +0800
Chin Huat Ang <chinhuat@gmail.com> wrote:

> +config BR2_UCLIBC_USE_TIME64
> +	bool "Use 64-bit date and time functions (Y2038-ready)"
> +	depends on !BR2_ARCH_IS_64
> +	default n
> +	help
> +	  Enabling this option for 32-bit targets will configure
> +	  uClibc with config UCLIBC_USE_TIME64=y which enables 64-bit
> +	  date and time handling to support date/time beyond Y2038.

Thanks a lot for your patch!

I don't think we should add a BR2_UCLIBC_USE_TIME64 option. Instead,
there is already a BR2_TIME_BITS_64, which enables 64-bit time_t for
glibc. It simply needs to be extended to also allow enabling 64-bit
time_t in uClibc.

Also, can I suggest that you split your change into two commits? One
bumping uClibc to 1.0.47, and one making it possible to configure it
with 64-bit time_t?

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
