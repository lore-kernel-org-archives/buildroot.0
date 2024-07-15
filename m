Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C2EC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 10:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A734C40143;
	Mon, 15 Jul 2024 10:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJt-8DNcvFTk; Mon, 15 Jul 2024 10:32:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5028140238
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5028140238;
	Mon, 15 Jul 2024 10:32:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5DBB1BF3FF
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 918CD40143
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HlnAagh13zPo for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 10:31:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D257940024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D257940024
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D257940024
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:31:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B81540006;
 Mon, 15 Jul 2024 10:31:55 +0000 (UTC)
Date: Mon, 15 Jul 2024 12:31:53 +0200
To: Fred Lefranc <fred.lefranc.evs@gmail.com>
Message-ID: <20240715123153.014a936f@windsurf>
In-Reply-To: <20240715101607.1288233-1-fred.lefranc+evs@gmail.com>
References: <20240715101607.1288233-1-fred.lefranc+evs@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721039516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Mu7OIJqKHpEnTXwqKgJ7RsX5rMuIJnjvY8KFR2qAU0=;
 b=bW3X1ZHcOKHdBEJ9WQAR33lhHZGefuBxC9cfUv5wAvGzONNBvtvhifjGTakp+vMxBn+VFw
 k7b6lPtGmEwNhzqQtC6MwASXqstCLl2erVv6RJZyt6z7LYV/7njjI/H28P+O3sHDjGmOJN
 TFwohalX5iLuKkOiEGSEQPwKzTsxy6xDsRxFfVibNuXSQZEdhCsanZXVn5VGZHrdTKNek7
 pp2L3NbahKCn9ZUG5Iqb7lQZJr0pF7+Iu0xX1PdZuCDzyjedNSjYcoHxuZ6R8yat7idrAN
 yjKdRQvq5fIdpyu9WcWHO6Smf3qFUBiYAr5ZjOQf9KMBC+nWd5V4AxjqG3nUuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bW3X1ZHc
Subject: Re: [Buildroot] [PATCH] package/busybox: fix build with glibc 2.39
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
Cc: Fred Lefranc <fred.lefranc+evs@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fred,

On Mon, 15 Jul 2024 12:16:06 +0200
Fred Lefranc <fred.lefranc.evs@gmail.com> wrote:

> diff --git a/package/busybox/Config.in b/package/busybox/Config.in
> index 3c2aa515f8..85fa0c7f9a 100644
> --- a/package/busybox/Config.in
> +++ b/package/busybox/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_BUSYBOX
>  	bool "BusyBox"
>  	default y
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC

I'm not sure we want to make this a mandatory dependency. Indeed, with
our default Busybox configuration it's not needed.

> +ifeq ($(BR2_PACKAGE_LIBXCRYPT)$(BR2_TOOLCHAIN_USES_GLIBC),yy)
> +	BUSYBOX_DEPENDENCIES += libxcrypt

No indentation for BUSYBOX_DEPENDENCIES.

> +endif

So basically, I would just do:

ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
BUSYBOX_DEPENDENCIES += libxcrypt
endif

and leave it up to the users who tweak their Busybox configuration to
figure out that they need to enable BR2_PACKAGE_LIBXCRYPT.

I remember there was some discussion with Yann on IRC about this topic,
but I don't remember what the conclusion was, but the above would be my
suggestion.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
