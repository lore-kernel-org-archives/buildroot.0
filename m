Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE4CC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 21:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47AFF6105E;
	Tue,  7 Feb 2023 21:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47AFF6105E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PpS9KJMAJYdX; Tue,  7 Feb 2023 21:39:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81DBC6105A;
	Tue,  7 Feb 2023 21:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81DBC6105A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 077741BF377
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D51D741756
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D51D741756
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id voVzYjOaszEs for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 21:39:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5295B4088B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5295B4088B
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 21:39:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 612A020003;
 Tue,  7 Feb 2023 21:39:33 +0000 (UTC)
Date: Tue, 7 Feb 2023 22:39:32 +0100
To: Ben Hutchings <ben.hutchings@mind.be>
Message-ID: <20230207223932.696d9190@windsurf>
In-Reply-To: <20220614192445.2390329-1-ben.hutchings@mind.be>
References: <20220614192445.2390329-1-ben.hutchings@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675805973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n7mgd1tLxGvcdPVVfy5/smvrr0ru3HUu9kZoe+UaIeU=;
 b=Z79cwNCEVYuIoUX+R13XqjvxGk+RzTv6f35e3r96AzkjBjZ6q80AoCyZXm0aRJ8+uNBTWA
 VX7hYmjbsuWbW+7MwVZmNqhGWuZ0+n2YDKnpPKZ+OfkUC/W/e7XdSs0EZqiBeq1WV620rv
 +3qX9WuUd7031u4OfEPDJfMjW0zfQIMRyX7pSs/m6kvJdgFEGN1QvVmeinFKwx/EcUfeb1
 XGWyprSCEwYh/xhNdBCPcjJrPf6iECfE6meJP2ihRbb57jEFlMml5kZxd8CCgleMlqwOI1
 hpRuOqIqv1/Ha1fwG3Otm/Doq6PJfqcvxBPLOaTVkPHES92sAjG6lcTlYDVIjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z79cwNCE
Subject: Re: [Buildroot] [PATCH] package/wolfssl: Disable broken asm
 implementations on 32-bit Arm
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

Hello Ben,

On Tue, 14 Jun 2022 21:24:45 +0200
Ben Hutchings <ben.hutchings@mind.be> wrote:

> wolfSSL has ARMv8-A assembly implementations of some functions for
> both A64 and A32 ISAs.  However, some of the A32 versions use r11,
> which is usually not allowed:
> 
> wolfcrypt/src/port/arm/armv8-aes.c: In function 'wc_AesCbcEncrypt':
> wolfcrypt/src/port/arm/armv8-aes.c:3303:5: error: fp cannot be used in 'asm' here
>  3303 |     }
>       |     ^
> 
> That can be fixed by adding the compiler flag -fomit-frame-pointer,
> but then there is another failure:
> 
> /tmp/ccV19DQV.s: Assembler messages:
> /tmp/ccV19DQV.s:248: Error: first transfer register must be even -- `ldrd r11,r10,[r14,#4*14]'
> make[3]: *** [Makefile:5858: wolfcrypt/src/port/arm/src_libwolfssl_la-armv8-chacha.lo] Error 1
> 
> This is definitely not a valid instruction in A32, which suggests that
> this code isn't being tested at all upstream.  So disable it here.
> 
> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
> ---
>  package/wolfssl/wolfssl.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Thanks, I finally applied your patch, after adding a reference to the
autobuilder failure it is fixing. I also pushed two other patches to
fix other wolfssl build failures:

  https://gitlab.com/buildroot.org/buildroot/-/commit/36b8c9494b56b877fea62f17926f747c7c7bfb8d
  https://gitlab.com/buildroot.org/buildroot/-/commit/f79a9c775ff0a59027f274a237d98b5f8d31c022
  https://gitlab.com/buildroot.org/buildroot/-/commit/d8dc5315eb712eca0a5cbf793a6714a47ab6e57e

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
