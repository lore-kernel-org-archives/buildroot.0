Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1DAC6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 14:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1100405EA;
	Tue, 26 Mar 2024 14:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wpp-jOIdyDnC; Tue, 26 Mar 2024 14:44:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89871405A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89871405A5;
	Tue, 26 Mar 2024 14:44:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 165CC1BF4E2
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 14:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04039414EF
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 14:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6aSD3D5oMvS1 for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 14:44:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C5693404CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5693404CF
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5693404CF
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 14:44:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A813E0011;
 Tue, 26 Mar 2024 14:44:35 +0000 (UTC)
Date: Tue, 26 Mar 2024 15:44:34 +0100
To: Christian Hitz via buildroot <buildroot@buildroot.org>
Message-ID: <20240326154434.7734ca6f@windsurf>
In-Reply-To: <20240228145642.436509-2-christian@klarinett.li>
References: <20240228145642.436509-1-christian@klarinett.li>
 <20240228145642.436509-2-christian@klarinett.li>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1711464275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NyjZxWaCLCXRtVJHooiZQ3c6kESU2x4aD78KHtKjQNI=;
 b=WHRwmol/6EvSTMYlSGXPyaBG0OS3An8afyB8WejT5f11T+04SjceMrHSzP5eDV8tLLqSry
 GmWuAv4FOLpJuWylq82t/7V0WXrgO2C7jKe1EfJutRGE/qzsyeNidIkRIIPTk8+Rpjm+1c
 hkTcFvNEgNK5OenkShVGRZLjIcMzDCWvB2eW4i25r6A6nbyKlqxWXdx0B3rh10/OqKukyW
 5FFbTKrUd4nLmKTiZd0nUFfhcogpW1yauV2yCwchAkOJgzoQjn/tA4C3JI/DLcjIKEKITI
 aIeLmO2/Pfg+U0nOlkUGnTdQvdu9k4DI1nXr+jwys1vUTwfhiftmqmy0eLHNLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WHRwmol/
Subject: Re: [Buildroot] [PATCH 2/2] package/zic: enable installation on
 target
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
Cc: Christian Hitz <christian@klarinett.li>,
 Christian Hitz <christian.hitz@bbv.ch>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Wed, 28 Feb 2024 15:56:41 +0100
Christian Hitz via buildroot <buildroot@buildroot.org> wrote:

> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>

Thanks, but for a patch like this, we definitely need a non-empty
commit log. Why do you need zic on the target, what is the use-case?

> diff --git a/package/zic/Config.in b/package/zic/Config.in
> new file mode 100644
> index 0000000000..11a8c99a66
> --- /dev/null
> +++ b/package/zic/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_ZIC
> +	bool "zic"
> +	help

No dependency on toolchain-specific features? Did you test this package
with ./utils/test-pkg ?

> diff --git a/package/zic/zic.mk b/package/zic/zic.mk
> index a915f6d256..12bb9e9943 100644
> --- a/package/zic/zic.mk
> +++ b/package/zic/zic.mk
> @@ -10,6 +10,19 @@ ZIC_SITE = https://www.iana.org/time-zones/repository/releases
>  ZIC_STRIP_COMPONENTS = 0
>  ZIC_LICENSE = Public domain
>  ZIC_LICENSE_FILES = LICENSE
> +ZIC_INSTALL_STAGING = YES
> +
> +define ZIC_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D) zic

Can we use $(TARGET_CONFIGURE_OPTS) instead of CC="$(TARGET_CC)" ?

> +define ZIC_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 644 $(@D)/tzfile.h $(TARGET_DIR)/usr/include/tzfile.h

So just the header file is needed, no library is installed?

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
