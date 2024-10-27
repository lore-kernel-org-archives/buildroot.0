Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAF7D13572
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB33C6083D;
	Sun, 27 Oct 2024 18:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KEEgmN2Bf8Fk; Sun, 27 Oct 2024 18:45:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5BEC60886
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5BEC60886;
	Sun, 27 Oct 2024 18:45:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C438A971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B78F740260
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5NmIf7FeYIjt for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:44:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6A4704012A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A4704012A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A4704012A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41919FF804;
 Sun, 27 Oct 2024 18:44:39 +0000 (UTC)
Date: Sun, 27 Oct 2024 19:43:21 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241027194321.7ca8f543@windsurf>
In-Reply-To: <20241026210405.2668493-1-bernd@kuhls.net>
References: <20241026210405.2668493-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730054679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eFtOdj8KYU/AZueyrlYKdUgm6Dz2NbMxWbzRlwXC8QE=;
 b=hbI8Mt3k4O1DDDW8E/iZZAxu/+w69uncgOinxPjfj/BnCd6S7//DZb4pLM26BppP3nZX++
 hXdap832eIwXpuFdhwICwQ9va4TEHnzTDnXTc9L0Opa9SBiIGvOEyM1VQR/yLI5pR+Lgox
 fFymp2yX4tv7LX63mb8HXmP7Z/NItLcBxIDfxl7jXtQNB3eiuBHTVCmdemlsxp+9FbOEwr
 /vCIUn2pLD/HwwV71yqP0g5EZdUCuYprR6GK1N0SN+hq0O4Km/5ybBY4EjHFYiWJpMqj8Y
 KSXcD9GfVe9Jem3BQM+RBNzzL8DrJ3SAfN6v6pTwcq90Qs6nIXAZv8t9WHpSJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hbI8Mt3k
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.8.13
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

On Sat, 26 Oct 2024 23:04:05 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
> https://forum.torproject.org/t/new-tor-stable-release-0-4-8-13/15397
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/tor/tor.hash | 4 ++--
>  package/tor/tor.mk   | 2 +-
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
