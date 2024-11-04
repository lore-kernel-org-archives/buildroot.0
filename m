Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C09FD1BDC2
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 16:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03C9E6072B;
	Mon,  4 Nov 2024 16:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yyHRci0uzSjj; Mon,  4 Nov 2024 16:19:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 166596073A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 166596073A;
	Mon,  4 Nov 2024 16:19:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8E80723
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 16:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9DA880AD6
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 16:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QIz-_E8eMPQ2 for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 16:19:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A1E9080AD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1E9080AD4
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1E9080AD4
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 16:19:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D05FC60009;
 Mon,  4 Nov 2024 16:19:40 +0000 (UTC)
Date: Mon, 4 Nov 2024 17:19:40 +0100
To: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Cc: Cherniaev Andrei <dungeonlords789@naver.com>, buildroot@buildroot.org,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <20241104171940.7ee21e6f@windsurf>
In-Reply-To: <3e85727b-a279-4be9-88db-16ca10931553@green-communications.fr>
References: <20241104074539.2369910-1-dungeonlords789@naver.com>
 <3e85727b-a279-4be9-88db-16ca10931553@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730737181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lychGHokNsNCUpzxGBQZ2RhNqLFFIP9xOPf3PmaVinU=;
 b=QguH8+2gqie3QgP5jCriBowA4ftLHwi8qQxZUdfEdycK1QUSXfMdspSeW/6oQN9fIGuzpW
 7x5d5lUa538llgFrnBCh+0gXdeE100Ts4UnQuZRDFn7qzjAYASpyY9ZWVr5L94gDCbZQIy
 HnPf3vo1HtiyZmWXyy8LOQMmOTg3FY6UEGTYI0NFSQ01gEDt7zbyZRQYkD9naWrFcFgXJ9
 Qjdx2aLEeZHv9FS9d0cHUGwy3edTuP4Wp0zOSxiuFrt+yhxpg9PJ8dmmYopQa9g9p/ikSx
 bVJUTmIwCWd+1AhltNqJF+ubvKLiZkexpQ9T6tFK8cbEZj8F1HzlkxafwLWbWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QguH8+2g
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-meson: use --clearcache
 instead of rm -rf
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

On Mon, 4 Nov 2024 12:30:26 +0100
Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr> wrote:

> meson needs a non-existing directory for the outputs. Buildroot assumes that 
> "build/" does not exist and use it for builds. The problem with openh264 is that 
> "build/" already exists in the source and contains various build system files.
> 
> The correct fix would be to not use "build/" for openh264 outputs. Either change 
> it globally to a more unique name like "buildroot-build/" or add an option to 
> configure it per-package.

The former looks like the good solution: use a less "generic" name,
such as buildroot-build/.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
