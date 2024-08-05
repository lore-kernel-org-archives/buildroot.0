Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F048AC3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 20:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 656B68126B;
	Mon,  5 Aug 2024 20:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A9maOy0O8O9S; Mon,  5 Aug 2024 20:43:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7F9A8115D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7F9A8115D;
	Mon,  5 Aug 2024 20:42:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BDB1C1BF966
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABC7C6063E
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wWXfK2DHT4YC for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 20:42:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3817A60621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3817A60621
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3817A60621
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 20:42:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42432FF803;
 Mon,  5 Aug 2024 20:42:46 +0000 (UTC)
Date: Mon, 5 Aug 2024 22:42:45 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240805224245.3fb54aea@windsurf>
In-Reply-To: <20240805190910.3411004-1-bernd@kuhls.net>
References: <20240805190910.3411004-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722890566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppuct4NEFrQ4f4VI23isF0oN8fJsxAXBVpGgk+rpV/s=;
 b=Bf2V8iaJW8nw1KOYmcujvw4ds7jCVxs0hpA0GSJpcycRq7bWz6nnjbH+z+7gTbQtkYo41z
 O8KM7DyIP5VFnTZvQCoS6/D2vRqkz42QzpqkohC81pZQ4ChdOPkT2ZJ/N7QxrhpqY95mWA
 S895Etpy17FjdC9tqxQXunwKQ9ed91VelidkPD+Ybvt1eqPvTQVuSNJXE1pk8dtnxTIsfy
 8KLSGaVBV9mQlEXv5eyr/yfZDFIWpoEz/CtukhYKE8sqKWyHT2SrV1R598PRm8dPYp2SMz
 upIOXPlVRgQbUqWsVZsg4wwdW+qH0zCiAzW9RFMuLqODaeoeBn/b9L+OyY1mKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Bf2V8iaJ
Subject: Re: [Buildroot] [PATCH 1/1] package/libxml2: bump version to 2.13.3
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  5 Aug 2024 21:09:10 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Add configure option --with-http to enable HTTP support which is now
> disabled by default to preserve previous behaviour.
> 
> Release notes:
> https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.0.news
> https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.1.news
> https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.2.news
> https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.3.news
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libxml2/libxml2.hash | 6 +++---
>  package/libxml2/libxml2.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

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
