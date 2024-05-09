Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BB2C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54CDE40119;
	Thu,  9 May 2024 16:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnJiBTjWlepN; Thu,  9 May 2024 16:48:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F86640128
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F86640128;
	Thu,  9 May 2024 16:48:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B76D71BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B21796125F
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYQeAjy7ok3p for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:48:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC97161002
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC97161002
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC97161002
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:48:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8950E40002;
 Thu,  9 May 2024 16:48:28 +0000 (UTC)
Date: Thu, 9 May 2024 18:48:27 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240509184827.61f436ec@windsurf>
In-Reply-To: <20240407114445.683504-3-bernd@kuhls.net>
References: <20240407114445.683504-1-bernd@kuhls.net>
 <20240407114445.683504-3-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715273309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yikBGYdLyBzlCWwmro1EQeON4PYtTBvp4xtbWn13CSI=;
 b=HhbLRdbKkhP6YyJpVlEll6ts9dOk59JRnRkH+KaRgq1S2JBE10lLVQiK09KHYblfq/qocn
 6KZWmY3i1t6a9of+gDseQnJeoM9YirjKdfKMHsXgD6Zr5rz3yV1Eifp0NlbO1O31iCkLCe
 +lBLKi19T6ijn1AqZ5KVwQqfmHZzg+6fskq88Q6Tr5KdM/4P2jutw1wBq+rBAk+Y0paxbt
 J2tPX+6Tu9TDDEtu2mm7PpU6n25tMcBkw047fGHM5orYAs+8Sm4ZH2a8gmpa36jheSJ+S2
 9Y5q6mgdujsJ8nb7HdMCAxWHb66dzgKBkx2yQJrtt2a4TOXevjW/QR69NU8H1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HhbLRdbK
Subject: Re: [Buildroot] [PATCH v2 02/20] package/freeswitch: fix build with
 ffmpeg 6.0
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Apr 2024 13:44:27 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...002-mod_av-fix-build-with-ffmpeg-6.0.patch | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/freeswitch/0002-mod_av-fix-build-with-ffmpeg-6.0.patch

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
