Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634CAD5B15A
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 22:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3187A60E08;
	Mon, 28 Oct 2024 22:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CR0GCsK13DfC; Mon, 28 Oct 2024 22:10:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BC1860E13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BC1860E13;
	Mon, 28 Oct 2024 22:10:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DB694EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA2C340015
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:10:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9VAQX9O59td2 for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 22:10:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5BACD40148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BACD40148
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BACD40148
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:10:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F34440002;
 Mon, 28 Oct 2024 22:10:53 +0000 (UTC)
Date: Mon, 28 Oct 2024 23:10:52 +0100
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20241028231052.4096b119@windsurf>
In-Reply-To: <20240822103854.2114748-1-thomas.petazzoni@bootlin.com>
References: <20240822103854.2114748-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730153453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dZ/92oeYmr1vlJfnDieIbowDtw5CSTl+bgc31sOQy6M=;
 b=U2k9TW8b1ZXl9HZq1BPaVEu+ioTC9VOMQFCCfsRd9DqpLB7JHrz192nDL5a00U6qNi26UW
 1PgSTDqrMu3taxvBaOwc5WcLDZNX70qDt71Is4K5dPcUnLqquFsinORfyHtjnjDrJUmj6t
 nmSocKnzHdRBZ0CXcmfOhm7xXjvs+0TCtTgfkQZnbeTinim+dvH4kpuSmoGOUYECfEVPfx
 0K3+YhG22qCtembo2vfYwY8Vnk0b2SPzkTa5JZSfMX1DeDqBXI9s7EPMYbUXJt7PytafrR
 SpZdMWvkovEE+zUPHn3ZunY1mQCnc8iEmebmn+LQky09+n6a59iRdCzBu2Nq8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U2k9TW8b
Subject: Re: [Buildroot] [PATCH next] package/cmake: bump to 3.30.2
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

On Thu, 22 Aug 2024 12:38:53 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> This is minor release. According to
> https://cmake.org/cmake/help/latest/release/3.30.html#updates:
> 
> 3.30.1, 3.30.2
> 
> These versions made no changes to documented features or
> interfaces. Some implementation updates were made to support ecosystem
> changes and/or fix regressions.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/cmake/cmake.hash | 4 ++--
>  package/cmake/cmake.mk   | 2 +-
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
