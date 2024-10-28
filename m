Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE103D5B154
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 21:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A9B460677;
	Mon, 28 Oct 2024 21:08:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sPwwTu-xoNL8; Mon, 28 Oct 2024 21:08:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EE7D606C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EE7D606C2;
	Mon, 28 Oct 2024 21:08:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE5915C1E
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F4524096B
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKscQNZowHRB for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 21:08:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B6BB40015
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B6BB40015
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B6BB40015
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:08:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F46940004;
 Mon, 28 Oct 2024 21:08:14 +0000 (UTC)
Date: Mon, 28 Oct 2024 22:08:13 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241028220813.2b98f28c@windsurf>
In-Reply-To: <20241027205610.3445994-1-bernd@kuhls.net>
References: <20241027205610.3445994-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730149694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CuTAbtUOT1JnhbcSUvpYT3/5dXladMkvecW2IcLEsf0=;
 b=RwVwRnyY6l58nLWOgRj2ldxkKmqRJyTUqxzEBR2U9DC4R3dSp2TGEg4x6w9rdpmcORKNfy
 JerP68GMgtPItKTtEFeQyqAmjgb+wY6v+kOhJwHgMxMMCVin79f7ICngC9xWSe2+c/Ytuy
 95/w+a+xDfUzJv5YnWVL3bdHVw6XLTQ1uPZYx0rh8/8ipdKHc+jM2QUNe8Wb5fLsDaVWRQ
 dHP4mZZCjAcuO1nT6oNqxOYkvrIJeDGg0v5LupfSKHvuMu4EAgZxrWEZcAQQIXbON2qphf
 VuVjHo9dheXE7LG9fRO2uLdN5QY3Hy9L+pYO6iYQf9Lzjh3pHeEut/Q+Yhg3SA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RwVwRnyY
Subject: Re: [Buildroot] [PATCH 1/2] package/ell: bump to version 0.69
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

On Sun, 27 Oct 2024 21:56:09 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog:
> https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog?h=0.69
> 
> Needed for bump of iwd to 3.0.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/ell/ell.hash | 2 +-
>  package/ell/ell.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
