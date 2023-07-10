Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F845EB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D887E81393;
	Mon, 10 Jul 2023 17:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D887E81393
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QPU-LmvU0tRx; Mon, 10 Jul 2023 17:28:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 289E78137B;
	Mon, 10 Jul 2023 17:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 289E78137B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 77BEC1BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D45741554
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D45741554
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XFSOyQ_34IiD for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:28:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00749409A3
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00749409A3
 for <buildroot@uclibc.org>; Mon, 10 Jul 2023 17:28:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 110D5240008;
 Mon, 10 Jul 2023 17:28:36 +0000 (UTC)
Date: Mon, 10 Jul 2023 19:28:35 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230710192835.7ae7a8b0@windsurf>
In-Reply-To: <pan$d539$6aa08ab$68f22d83$3050a5c0@ID-313208.user.individual.net>
References: <20230708163644.710352-1-bernd__8474.55057535029$1688834229$gmane$org@kuhls.net>
 <pan$d539$6aa08ab$68f22d83$3050a5c0@ID-313208.user.individual.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689010117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=//hs9W/jdaAaWA/bR4QGZoXzhgLcFaYj1E1u0Rh46fA=;
 b=BCw6uAcCxOVXLUjU1UFlioWWNZgafcUzxmOAbCKmsQ3RsyZUpauXDrUmhjpZWO6YuVsyku
 +BSX3fqiNdZeoAVK3kb4lpI7ZGZPYve22kc9QfHaBhMjsp91UM3eK0EboS3O9W9nv9KeP3
 iJlRUVu6ntElynIp6jEOBrBNsHp2fFlLDGUlw3JmTlB7boNXMIfU2FgWif6JWzNxCtCEUf
 I3ZDGfvfupZb/w7QJvi8qY3z5SqJFvGgeygAzq5+ckalm6RQ+9q7Se+b7oqE5uX2PE2f9f
 0/1yY4gDd9uLYq0duU2qPxZ4FhN1oLnRgsTu1V0DDogdR0gJx8Fwct8Ycfr4Xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BCw6uAcC
Subject: Re: [Buildroot] [PATCH 1/1] fs/ubifs: increase logical eraseblock
 size
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 09 Jul 2023 14:39:10 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> or better update utils/genrandconfig like this?
> https://git.busybox.net/buildroot/commit/?id=3c98eb26db6501a373cc405c80505ba72fde9e96

Yes, setting BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT to a larger value in
genrandconfig would make more sense I believe. You can set is to 5GB
divided by 0x1f800, to match what is done for other filesystems (they
assume the rootfs will never grow beyond 5GB).

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
