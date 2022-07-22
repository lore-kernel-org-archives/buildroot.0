Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222FFC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 20:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9551060B1A;
	Fri, 22 Jul 2022 20:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9551060B1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YfzwOPvJPws0; Fri, 22 Jul 2022 20:51:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DD7E60A6A;
	Fri, 22 Jul 2022 20:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DD7E60A6A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C500A1BF3DE
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB9ED42376
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB9ED42376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FB7osu5E6wC6 for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 20:51:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E535942372
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E535942372
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 20:51:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 59CB5200002;
 Fri, 22 Jul 2022 20:51:21 +0000 (UTC)
Date: Fri, 22 Jul 2022 22:51:20 +0200
To: Dimi Tomov <dimi@tpm.dev>
Message-ID: <20220722225120.2472bbab@windsurf>
In-Reply-To: <20220614192445.2390329-1-ben.hutchings@mind.be>
References: <20220614192445.2390329-1-ben.hutchings@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658523081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4iPavIOxi/qo5U7J6DlQ2cfh28LMkaLtnyRkHJFhvAQ=;
 b=EhYbWB/v5e+Y7jKbdZrNU/fo0Kt6MjNxVXwMYaFQdB35YY097dwWPudqlzZcK2MxZk94Pq
 DGKXWF///rbuUeN3b0lH0TX3wI8SkvfgffTbRVR+mg00WCnWQJytHCU50yDzAK0thzKg++
 VGfC5uleY6SdQ8PgLHXqft2u6GNtkXfq9/7eV8mI78Jep+IQGb+5WXoNfJX2fAlTjGC+Cc
 lri6ZmRLmHHT+25hyCSq9Cm8cU5YQTntVulM04Az5qFl48SqkjzBIRGcQViQgT3o0kogzA
 HRzay+iX5P/QqjzUnVSdb6dubeZmOSzy1G2X+b9pYBlLfrVsNbnVzzplazaKtA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EhYbWB/v
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
Cc: Ben Hutchings <ben.hutchings@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dimi,

Could you give some feedback on the below patch that touches wolfssl?
Do me it looks good, but perhaps you want to improve something in
upstream wolfssl in relation to this issue, such as detecting the CPU
architecture capabilities automatically?

Best regards,

Thomas Petazzoni

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
> 
> diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
> index 58b6f296ab..ff6a65c397 100644
> --- a/package/wolfssl/wolfssl.mk
> +++ b/package/wolfssl/wolfssl.mk
> @@ -33,14 +33,12 @@ WOLFSSL_CONF_OPTS += --disable-sslv3
>  endif
>  
>  # enable ARMv8 hardware acceleration
> -ifeq ($(BR2_ARM_CPU_ARMV8A),y)
> +ifeq ($(BR2_aarch64),y)
>  WOLFSSL_CONF_OPTS += --enable-armasm
>  # the flag -mstrict-align is needed to prevent build errors caused by
>  # some inline assembly in parts of the AES structure using the "m"
>  # constraint
> -ifeq ($(BR2_aarch64),y)
>  WOLFSSL_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -mstrict-align"
> -endif
>  else
>  WOLFSSL_CONF_OPTS += --disable-armasm
>  endif



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
