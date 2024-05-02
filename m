Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D540C25B10
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 07:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4845441575;
	Thu,  2 May 2024 07:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8S13EChzh1Q; Thu,  2 May 2024 07:49:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 173D440F4B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 173D440F4B;
	Thu,  2 May 2024 07:49:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B6331BF83C
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A10D160652
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J3WwQBf-0c_D for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 07:49:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8C68E6065A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C68E6065A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C68E6065A
 for <buildroot@buildroot.org>; Thu,  2 May 2024 07:49:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A5F760006;
 Thu,  2 May 2024 07:49:23 +0000 (UTC)
Date: Thu, 2 May 2024 09:49:22 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240502094922.0cc0d5ab@windsurf>
In-Reply-To: <20240411210114.2127887-1-bernd@kuhls.net>
References: <20240411210114.2127887-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714636163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XrHQT2oU4nOIcs5/6PYaAdH52GA558tWzebq2lxiFp0=;
 b=H8DkZDHiLyTXSPY7plSu9E4osnKSOsbHTJcRkFXB7Q7t7mcpngjbz1I9P0cYXTcPl+JkA6
 Quo7tx0bFaJ1/9m6qasRGrtZo65vuVc4xh/lJDhSHzTjUs3ohOd/3vMWp4k+HnOl745vlX
 M+Q8TdliOK6LJf+jxj6D8utSfnBaapFkbS8a45vSeX4Ya4+Jc9n0eL6dXP41WjIqOPlCr0
 OXGaCtcGC0e/pDzy2IqcsQKch2jMe1Okl1615kh3DSc8WANhwDiH3CpvahKvx4I9SPlTYZ
 dmbcVLP4XGuvdjA9Z3Y2lxR88kKMnEzvwzM2l6c9AkyiV+Bdm1c4b74ifS5EVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H8DkZDHi
Subject: Re: [Buildroot] [PATCH] package/libinput: bump version to 1.25.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 11 Apr 2024 23:01:14 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://lists.freedesktop.org/archives/wayland-devel/2023-August/042967.html
> https://lists.freedesktop.org/archives/wayland-devel/2024-January/043396.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libinput/libinput.hash | 2 +-
>  package/libinput/libinput.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
