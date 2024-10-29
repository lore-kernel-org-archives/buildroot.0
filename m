Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C531D74943
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 22:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 437B68089B;
	Tue, 29 Oct 2024 22:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PS71Qb7QIu7j; Tue, 29 Oct 2024 22:06:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A075809EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A075809EC;
	Tue, 29 Oct 2024 22:06:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE286494E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 22:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC41F60602
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 22:06:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eqWXF2XqwPRv for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 22:06:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8BDD7605A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BDD7605A0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8BDD7605A0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 22:06:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9A0E20008;
 Tue, 29 Oct 2024 22:06:31 +0000 (UTC)
Date: Tue, 29 Oct 2024 23:06:30 +0100
To: Lars Wikman <lars@underjord.io>
Cc: buildroot@buildroot.org, Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20241029230630.5e4d6805@windsurf>
In-Reply-To: <20240903100952.3789698-1-lars@underjord.io>
References: <20240903100952.3789698-1-lars@underjord.io>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730239592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oMZCRiuaLlfgh5CAMnu+hDDiJsJR1aIWIiZ9QxAbAts=;
 b=BcHzNf/gv3q/o1sd2ExVH5+o+4ivfYd59fHsP/oyV8TcOHRc2JdPelHtamXBZ+uimpk6mE
 mdrE9qK4ueZj7zadCpxI4+Qa4AZ4Pf8vdo4iLxIToBNCcEJzGY1mnjObkHMAwjuz+daPIs
 A19CP0bkbbXCE+hPErN/qQvqmz23ZmqcBE1XNeq4kawGosl2FaA3v6UeEvfJC0J4d5EUMv
 XjVZSNU+hO+LeMegRDCiCRsGKQ1YbDf86Hm8DOkCos7a13PPbzO9BvPC4gvEpmklzWSuyA
 hl/Qr0iTS8RnoEKnsJsUQtJQV4/PvbPCbcDSCgCcoUlk5XMD/kUAkfWgNBgJvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BcHzNf/g
Subject: Re: [Buildroot] [PATCH v3] package/wpa_supplicant: add Smart card
 option
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

Hello Lars,

On Tue,  3 Sep 2024 12:09:52 +0200
Lars Wikman <lars@underjord.io> wrote:

> CONFIG_SMARTCARD was unconditionally disabled which has meant that
> even if OpenSSL is compiled with engine support and the supplicant
> is configured to use an engine it would warn that it was compiled
> without engine support.
> 
> This mechanism is used to enable the more secure forms of 802.1x
> networking authentication such as EAP-TLS with hardware-delegated
> cryptography and private keys protected in hardware.
> 
> It is still disabled by default in case there was an original reason.
> 
> Enabling the option will allow delegating private key access to TPM2,
> ARM TrustZone and other specialized secure hardware for establishing
> a network connection.
> 
> Signed-off-by: Lars Wikman <lars@underjord.io>
> 
> ---
> Changes v1 -> v2:
>   - Change option name to focus on smartcard  (suggested by Sergey)
> Changes v2 -> v3:
>   - Change setting disabled to match convention (suggested by Baruch)

Sorry for the delay in getting back to you. I reviewed/tested your
patch, but I believe something needs to be improved, but I wasn't sure
so I wasn't confident to do it myself.

I built the following configuration:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_WPA_SUPPLICANT=y
# BR2_PACKAGE_WPA_SUPPLICANT_NL80211 is not set
BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD=y
# BR2_TARGET_ROOTFS_TAR is not set

which really has just wpa_supplicant with all options disabled except
smartcard. And my understanding is that in this configuration...
enabling the smartcard option is a no-op, because I don't even have
OpenSSL enabled in my configuration.

Since the smartcard option only affects the OpenSSL integration in
wpa_supplicant, shouldn't this option have:

        select BR2_PACKAGE_OPENSSL
        select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL

like the other options that need OpenSSL support?

Thanks in advance for your feedback,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
