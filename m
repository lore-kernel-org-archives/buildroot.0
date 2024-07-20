Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF1CC3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9516F40499;
	Sat, 20 Jul 2024 21:04:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3kefb9fLtR33; Sat, 20 Jul 2024 21:04:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71B4E4049F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71B4E4049F;
	Sat, 20 Jul 2024 21:04:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 505801BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4959F4049F
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LszCopuuWz1L for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:04:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E6FFE40499
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6FFE40499
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6FFE40499
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:04:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFC6AFF804;
 Sat, 20 Jul 2024 21:04:16 +0000 (UTC)
Date: Sat, 20 Jul 2024 23:04:15 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240720230415.475e9859@windsurf>
In-Reply-To: <20240720210114.1714249-1-fontaine.fabrice@gmail.com>
References: <20240720210114.1714249-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721509457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v5pbDycAxmFxaoympRDLfPKEQyGCBri2gXMYHB7El6Y=;
 b=krKEHu39Aqi3bFmVweBoDgTNrYa6qgbUYjSHH3mTljshX31o5TW2y5ZcYE+/ObJGmH3p2d
 OBXUqyr84KKY/zBQepPzAf6yzF/pDfnf9ASx/JdmnDcu14yq2bSxmjjzyO2xpmduA/vnCN
 WROUz8nZVGu/YGZApa1oBJJbsnTqkwbpgH7ZDe56AbzAVATjzoE4twBJug2RYoL1gmCXD4
 Vnq7odrrE9LgJWsKrIxeKVBSJsRkb5GscEFOGYcgJ/zP5Hi5U1w17KDFyOnaEfyIH5cFAZ
 XkBOmyx1zRpVl3CppNjhTIhPsSd4nDgTHucsWGHyIPxk7Kqfjp5ys1pbI7Qeew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=krKEHu39
Subject: Re: [Buildroot] [PATCH 1/1] package/gtkiostream: fix build with
 alsa-lib
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 20 Jul 2024 23:01:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Select BR2_PACKAGE_ALSA_LIB_MIXER if needed to fix the following build
> failure with alsa-lib raised since the addition of the package in commit
> fab48302865e5c0c98d91b696bc90e75e38189bb:
> 
> In file included from ../include/ALSA/MixerElement.H:20,
>                  from ../include/ALSA/Mixer.H:20,
>                  from ../include/ALSA/ALSA.H:56,
>                  from ALSAControlMonitor.C:19:
> ../include/ALSA/MixerElementTypes.H:26:5: error: 'snd_mixer_selem_channel_id_t' does not name a type
>    26 |     snd_mixer_selem_channel_id_t channel; ///< The ALSA channel ID
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes: fab48302865e5c0c98d91b696bc90e75e38189bb
>  - http://autobuild.buildroot.org/results/6be71c9fbdccbdf4f5e540bafa748dda833aeedb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gtkiostream/Config.in | 1 +
>  1 file changed, 1 insertion(+)

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
