Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06929D0E3F7
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 482E160C06;
	Thu, 24 Oct 2024 20:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ObmLciU4TR_g; Thu, 24 Oct 2024 20:01:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ED0260BB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ED0260BB4;
	Thu, 24 Oct 2024 20:01:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45E73497A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40E4340E0A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:01:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h08Q_eriYANb for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:01:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0115A40E09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0115A40E09
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0115A40E09
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:01:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E74E1BF204;
 Thu, 24 Oct 2024 20:01:47 +0000 (UTC)
Date: Thu, 24 Oct 2024 22:01:45 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241024220145.24cf74c0@windsurf>
In-Reply-To: <20241008174840.3625931-1-bernd@kuhls.net>
References: <20241008174840.3625931-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729800107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cjp2Ep1qZv7j4hTkazT9Vbhn3uK6OKX4iSlMw+D2gX0=;
 b=aa+pU/laTXEqf4BMVdsgTuSjQ+noApyCmKI055BxOQBxCofh8b9r94pblq65hfATH/8bpA
 sugJT1X6PH0MekQY1iwmJUxBkDlCr0wXjor0KQ1ASHJfC3eAp5iNTmv+s8iZIejXQVVJUg
 lajiSdS/KnpDBRI9As0jB5NyTfTVL1EnxczmSnWkm7q0a9mJPdcqs4h0dcI1odiv5FZg41
 WBozXIRkphQoOMwLNF8u0UDgZYhS/chhRPn6s+CaJWvNO/c+Au9cpI+HAMbJ1H5eC7o2rz
 zT+WcbM3RRScFd8nOz7inxztGWNleqd/DavOwICvmlI16UBHbD1dhMWk2s7GmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aa+pU/la
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20240909
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

On Tue,  8 Oct 2024 19:48:40 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Updating the hash of the WHENCE file, due to firmware additions and
> firmware changes, but no changes to the redistribution/licensing
> conditions.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/linux-firmware/linux-firmware.hash | 4 ++--
>  package/linux-firmware/linux-firmware.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
