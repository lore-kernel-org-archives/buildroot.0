Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62802C27C53
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 16:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DBE54055E;
	Sat, 22 Jun 2024 16:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id he_Pe1jO7mc5; Sat, 22 Jun 2024 16:43:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D91524056E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D91524056E;
	Sat, 22 Jun 2024 16:43:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 00DFB1BF5DC
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 16:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E25FE607BB
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 16:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H7gwTsXip9Dr for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 16:43:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E96B6077D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E96B6077D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E96B6077D
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 16:43:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02FA41C0003;
 Sat, 22 Jun 2024 16:43:09 +0000 (UTC)
Date: Sat, 22 Jun 2024 18:43:09 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240622184309.62a68711@windsurf>
In-Reply-To: <20240612192125.52199-1-bernd@kuhls.net>
References: <20240612192125.52199-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719074590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v6K3YJstlgWkWyanp4odrtDj5jQe4uDWudbjFWdVoB0=;
 b=DyrS0EqnVUDgGbyKaTpmHcaouSxRljNXMldSilzfFgcaCrdLzZxu8aTGjxLihC8FZC3G6h
 z6JnHjZMhKzA5I2LJqplCVnj0zEzgqdUnfbpM3AogkjEp37sRh0e3cBuc9ZxnoVchQAer2
 INuEsCeGnPTy7sMB9xTGC2BsrRUf0BYt29bFqcCzuNhPwn+e4rsRpt9d6mmvxxvN24bNIW
 eDo/mll0JnSlEqQ3PDJVExI6xiqbEloUaDjGPegbuOk2fUT0kk8BS+0Xn/QiaVbtunofLl
 ai5iRSsfhQr+m5HKY/MMZAoOdMhAdFjOjtWky3IVxTCOW/LP35YXa1o5aRjfOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DyrS0Eqn
Subject: Re: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.121
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

On Wed, 12 Jun 2024 21:21:25 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://lists.x.org/archives/xorg-announce/2024-June/003516.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libdrm/libdrm.hash | 6 +++---
>  package/libdrm/libdrm.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
