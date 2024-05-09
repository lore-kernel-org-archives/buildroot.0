Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504C6C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07ED9413D3;
	Thu,  9 May 2024 14:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-xOouErA96f; Thu,  9 May 2024 14:32:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D7B5417CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D7B5417CC;
	Thu,  9 May 2024 14:32:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33C161BF990
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C0E183D6E
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rwkTrWAJ6sXk for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:32:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F10D483C38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F10D483C38
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F10D483C38
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:32:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F10491C0008;
 Thu,  9 May 2024 14:32:00 +0000 (UTC)
Date: Thu, 9 May 2024 16:32:00 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240509163200.75c6a179@windsurf>
In-Reply-To: <20240508203747.736743-1-fontaine.fabrice@gmail.com>
References: <20240508203747.736743-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715265121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r2Iv1Ju8W4CHhO8BsdXDTLpuZOCZSzfRshqBG3SjYRM=;
 b=CaiOdN7SWfWVu7RYAtB011/ZvHv3Z7o8pKm432+2ie05g6GDgGeTF/P1V+PHfisTdG/FYB
 t7edRgfDvQSeeM2a1xHhBaqMH8RWwGc8gg2FXm2grZk08XVXx05cO9svABWUM2IgMB4KI1
 Bdqg33EU/W4g11xz4m59dbb0zr0srxA0MBKWxwt2a4tRsSp3wZZyFOvkMKMLxjYhyBtnBm
 XHp/GvenyCjzTAyoPwc6QN1iZk9TGFlk8zxUXIbmX/3C58tTkTnPTSWHIUv/Y2Tsp3fOPZ
 MJObidBbOaU3O5QDsHBMoA5DNw/SWX8075DLxprzLPmU0oYgcW8G92WK/pZadQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CaiOdN7S
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez5_utils: disable datafiles
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
Cc: Marcin Bis <marcin@bis.org.pl>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  8 May 2024 22:37:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable installation of datafiles to avoid the following build failure
> rasied since bump to version 5.75 in commit
> b890206876588ed0d16187abf49d35a45177cc3d and
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=be0e796299b0e7a73bf06c5655b56180588550b0:
> 
> rm: cannot remove '/home/buildroot/autobuild/instance-3/output-1/build/buildroot-fs/ext2/target/etc/bluetooth/input.conf': Permission denied
> rm: cannot remove '/home/buildroot/autobuild/instance-3/output-1/build/buildroot-fs/ext2/target/etc/bluetooth/network.conf': Permission denied
> rm: cannot remove '/home/buildroot/autobuild/instance-3/output-1/build/buildroot-fs/ext2/target/etc/bluetooth/main.conf': Permission denied
> 
> Fixes: b890206876588ed0d16187abf49d35a45177cc3d
>  - http://autobuild.buildroot.org/results/cbd98588b3aced7c18467c2fec96e59c7d180881
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/bluez5_utils/bluez5_utils.mk | 1 +
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
