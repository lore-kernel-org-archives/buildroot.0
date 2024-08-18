Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C82C52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 20:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89D6440209;
	Sun, 18 Aug 2024 20:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDx4udzGWNDj; Sun, 18 Aug 2024 20:49:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A75B40215
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A75B40215;
	Sun, 18 Aug 2024 20:49:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 648DA1BF27A
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 20:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F8B480D90
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 20:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JisaODylp69W for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 20:49:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 975AB80D8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 975AB80D8C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 975AB80D8C
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 20:48:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D73840002;
 Sun, 18 Aug 2024 20:48:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sfmpb-008MLb-12;
 Sun, 18 Aug 2024 22:48:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240817000027.654079-1-mmayer@broadcom.com>
 <20240817121031.55afa6c1@windsurf>
Date: Sun, 18 Aug 2024 22:48:55 +0200
In-Reply-To: <20240817121031.55afa6c1@windsurf> (Thomas Petazzoni's message of
 "Sat, 17 Aug 2024 12:10:31 +0200")
Message-ID: <87le0th808.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/dropbear: provide config option to
 turn off SHA1 for RSA
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
Cc: Markus Mayer <mmayer@broadcom.com>,
 Markus Mayer via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > Inverted logic options are always a bit annoying. Wouldn't it be better
 > to do:

 > config BR2_PACKAGE_DROPBEAR_RSA_SHA1
 > 	bool "SHA1 hashing for RSA"
 > 	default y
 > 	help
 > 	  SHA1 is no longer considered secure, so users may want to
 > 	  disable it, but the lack of SHA1 support for RSA might
 > 	  preclude older clients from connecting

 > 	  This option defaults to enabled to preserve backward
 > 	  compatibility.

 > Peter, what do you think? Or should we break backward compatibility for
 > the sake of security, and leave SHA1 support disabled by default?

I think it makes most sense to do it like you suggest, but drop the
default y so it behaves similar to BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO.

Talking about _LEGACY_CRYPTO, I just noticed that dropbear 2022.83 has a
bug, so it unconditionally enables support for the legacy DSS
protocol (and 2024.84 fails to build without RSA SHA1). I'll bump
2024.02.x to dropbear 2024.85 to fix it.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
