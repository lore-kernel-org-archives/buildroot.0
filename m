Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4079BD13578
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 136DF60A69;
	Sun, 27 Oct 2024 18:45:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YAQeYdl_lS00; Sun, 27 Oct 2024 18:45:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F33160B10
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F33160B10;
	Sun, 27 Oct 2024 18:45:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AE715123
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80338405D9
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3D_K1QyWHVRq for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:44:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 59920405B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59920405B3
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59920405B3
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BED24FF802;
 Sun, 27 Oct 2024 18:44:43 +0000 (UTC)
Date: Sun, 27 Oct 2024 19:43:24 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241027194324.25c47087@windsurf>
In-Reply-To: <20241026210431.2668520-1-bernd@kuhls.net>
References: <20241026210431.2668520-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730054683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qpw7D3AfwhTuPZy1FFXyglXSGD1tAZQvftD5WPqLnwE=;
 b=FQfy+c3HirxIIjkcJm4BZJIa71Q3BX9fjj9SHdKnu7Palyy/Ir6XQ7L9+2XQvsqM8+6K1r
 UaLBRi3DeyqjHqcqN22ZARJ7MH6/nYFIUSbIJJxOb1KU64abpGi7pi1W1ifTIWuzfd3/3F
 sUKXKaEE0lTZ50ljV8zBq1cVrqWGEFry8Vfu0XzXmx+2oiSCV4M5WAnVKIcOi4ZASJk6ik
 RMb5FZIshy8wQWFFmCPSuwJDKdRIH+26bUelgcqcL/waI9YYB/a7I8Vu8KQ7B3197HU6KI
 PXrwX0TgUwpJkApPo3G8RQn6a38irBwsg/jumqxQPZ/snn3rmC3hJIDXaAPBeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FQfy+c3H
Subject: Re: [Buildroot] [PATCH 1/1] package/dropbear: bump to version
 2024.86
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

On Sat, 26 Oct 2024 23:04:31 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://matt.ucc.asn.au/dropbear/CHANGES
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/dropbear/dropbear.hash | 2 +-
>  package/dropbear/dropbear.mk   | 2 +-
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
