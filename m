Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE467C021AF
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 19:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 698F880EEE;
	Sat, 14 Sep 2024 19:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOObo3xiXPfH; Sat, 14 Sep 2024 19:56:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D2CD84130
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D2CD84130;
	Sat, 14 Sep 2024 19:56:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56F841BF2AA
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 19:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 462C56073A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 19:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 49Kk11G6Sj4K for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 19:56:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F237660701
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F237660701
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F237660701
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 19:56:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94FCA60003;
 Sat, 14 Sep 2024 19:56:04 +0000 (UTC)
Date: Sat, 14 Sep 2024 21:56:03 +0200
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Message-ID: <20240914215603.17de98b6@windsurf>
In-Reply-To: <20240914183850.273831-1-thomas.perale@mind.be>
References: <20240914183850.273831-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726343765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rwJ5lU4jkOFrx0yULq8sAzYB4966gSxvrvCLAUJv+Vk=;
 b=F+OcfQYQqKVSW3omLTRKGO2WoOSxkTlUuPpzK+2nCq2apT7keMfK06NnQoNXSMTZ5eZGjn
 kVOAkQbj3rzlBcMChWxulPkcFbntJTHxtlM7icOD68izcRhG2lOMhsR4633lNvFYjHAoxJ
 iP4jO0bacuKm09st40JhLbhVsJVJjyTDQ4x2U1yxjmnymjaIpetASRtTMdtLXyJXfYLQlc
 9EcWFsMyAyNlq3SbyQ0JXT48q6FOtUgt5IzsmgQyeMKGaabb6biZHmz7tul0j1BReogdKH
 o++QYzHndrhGw0SFXBqaDQ2GqOzNcPBte35nnYl5j6sl5r24EPGFNbfEyoPotg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F+OcfQYQ
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
 Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@essensium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Sep 2024 20:38:50 +0200
Thomas Perale via buildroot <buildroot@buildroot.org> wrote:

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
> ---
>  ...hwcontext-vaapi-use-the-correct-type.patch | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/ffmpeg/0007-avutil-hwcontext-vaapi-use-the-correct-type.patch

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
