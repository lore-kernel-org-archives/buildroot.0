Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D86D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 18:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E5D16062A;
	Sun, 28 Dec 2025 18:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kVoPuq_bnpWj; Sun, 28 Dec 2025 18:18:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A1E8608D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766945892;
	bh=ICu3YjQzbDffBRR/VF2MmKGZPJyXyNNu9lN11T6FvME=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NYBn/9ecQAf8d/pGv5grDyRM8SFp8QnYTK4hYp1cLV+GVfG2w5WR1vFsQzjXYA11M
	 +tSi2QyJissXqtwwWa3xf3fPORcDRsjNQRTs2lHBtvV8voJKM0OUuyZx0WGHj4763l
	 DhR+AukBdaBhGN57CmUx0P9CiVe2e8rAUdNrJ6789KKAyxUVy0P16h4zzjEDpU8b9f
	 U7Ajpv6YgbBgPONFDCV+RsEzFcZ5pvp+yXcC7D9oHDkklnkZWSTepYI8mkCZblkUKz
	 aTBhtwz2ANsJKI7Bbv8Sg1vZTldVrpq+07C9ao+f1/d/pyIDIJ25bYjPKI7p0rTbR6
	 phC0j4k7RpLNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A1E8608D0;
	Sun, 28 Dec 2025 18:18:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA1B6B9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF5BE608D0
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2JnVhLCABgIR for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 18:18:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9C0096062A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C0096062A
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C0096062A
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:18:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 549D01A24BD;
 Sun, 28 Dec 2025 18:18:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1E0BF60725;
 Sun, 28 Dec 2025 18:18:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8120511978E99; Sun, 28 Dec 2025 19:18:04 +0100 (CET)
Date: Sun, 28 Dec 2025 19:18:02 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Karoly Kasza <kaszak@gmail.com>
Message-ID: <20251228191802.30e25bcb@windsurf>
In-Reply-To: <20251203194201.2283684-1-bernd@kuhls.net>
References: <20251203194201.2283684-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766945885; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ytscKDSTDT4PS/TAnD3GXQ7UdEImoovpU+BP7nsEYVk=;
 b=SBAT5Ess7oxNT9xycABMOo/17Y83KbvlMZ0coh8KSectH/zYUZ+dEGu1mjI/nFWJvZ8fC3
 Sf0tHyv/17o1OZmEXYOm2JNMSn8XGhgAqSZQBECq3AIVhFEL+WIdNG3dpzCz98MO+9rH8G
 Jp7cHEB8/OsFLD89D0US08/tK2py2TvXOTtEukyq7sS9/6f/QHTH1407xEOVd7Ps8HL37E
 qRFUboRCoVYdVsSp8lRiKcyOHbM019nrMAM5yroXF8zIuTG1mUOsGejq4QVn8kkJBqwzWM
 7KbnGHpWTaIFyR9+kJcS6xnZVe6tWclRpemzcUp4E5SgLqOdwxD79LfWCW/M5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=SBAT5Ess
Subject: Re: [Buildroot] [PATCH 1/1] package/irqbalance: fix build with
 newer gcc
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

Hello Bernd,

On Wed,  3 Dec 2025 20:42:01 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> https://autobuild.buildroot.net/results/3b6/3b609fe191e03330480f647b09dd06916da13317/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks for the patch. It would have been nice to narrow down a simple
defconfig that exhibits the issue, and then investigate at which GCC
version the problem started. So I had to investigate both myself in
order to have a more meaningful commit message. This again confirms my
request to you to improve the investigations you do and their
description in the commit log. It would help us a lot.

Note that irqbalance 1.9.5 is now released, so if you want to send a
version bump, feel free to do so :-)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
