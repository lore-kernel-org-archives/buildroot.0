Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2947CC25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 20:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 503684082E;
	Mon, 13 May 2024 20:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCzOBM4Bh71z; Mon, 13 May 2024 20:36:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 549F340819
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 549F340819;
	Mon, 13 May 2024 20:36:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A337D1BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9572F60B1A
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lTRG4jOD5oaz for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 20:35:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7376960AC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7376960AC7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7376960AC7
 for <buildroot@buildroot.org>; Mon, 13 May 2024 20:35:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 916101C0002;
 Mon, 13 May 2024 20:35:24 +0000 (UTC)
Date: Mon, 13 May 2024 22:35:23 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240513223523.4fcdf88a@windsurf>
In-Reply-To: <20240512181356.2106142-1-bernd@kuhls.net>
References: <20240512181356.2106142-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715632524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=owwG6McyfJP88SUJUo+WWJ3hLfHdkO5oUMEFc3xHlY8=;
 b=Wh0iSzb1+OR9d6xrcoa1sj3xKZXdFoE9b6UqZyYmr//1fdYR0xBgmwzsAXwW1lsP9MF49P
 QC1eKvO1amHHItv7M/Z8jLi3dPlNWFoKcs1YpmzuP0SzIkNCZ8cyh4ZAy5BGDah9GTGMDx
 KNOH2FPyB8dJCebrMj4xozkI2u2pInaJR/NI3Z9dnytqyd3Z86DH3iKkErOUQCb05mIj/W
 1fsZKx5Vud/WPWFNS8S32tE2aGgr8KrcBKB22clghR7wgVMZEKbUlxvH3G12LeS8UXR2Fc
 ZeXZR77eeBNUqdfDtd8U9K83QJlASmT3bYboxgJhFOe49AIqFsZReAtUZMZuEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wh0iSzb1
Subject: Re: [Buildroot] [PATCH 01/22] package/kodi-inputstream-adaptive:
 bump version to 21.4.7-Omega
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

On Sun, 12 May 2024 20:13:35 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
>  package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Entire series applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
