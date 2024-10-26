Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259B4D10BF8
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 12:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC80A40206;
	Sat, 26 Oct 2024 12:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5AB5V-fllL1; Sat, 26 Oct 2024 12:57:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6278D40669
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6278D40669;
	Sat, 26 Oct 2024 12:57:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F2EA5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 12:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C95E407AA
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 12:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxNllfVRYgsi for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 12:57:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 049D240793
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 049D240793
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 049D240793
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 12:57:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7F2D1C0004;
 Sat, 26 Oct 2024 12:57:42 +0000 (UTC)
Date: Sat, 26 Oct 2024 14:57:42 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Cc: Neal Frager <neal.frager@amd.com>, luca.ceresoli@bootlin.com,
 ibai.erkiaga-elorza@amd.com
Message-ID: <20241026145742.3400085f@windsurf>
In-Reply-To: <20240922131229.499878-1-neal.frager@amd.com>
References: <20240922131229.499878-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729947463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3kf8417G8YGFxlPgnglRHlH8YY/Ocyswbcm12u0GRMs=;
 b=POedhvrmXEy2Kwd2MzE/GrVl9bbVIU002gsrNJhKlLm5LeAj5iKE9Auqi2RvYgrwKkmjSu
 fJi8EQnCGgH0c03gKI3v/MhZmBj/g5EvqBDgoRlCDMFK46yxRL2H7GF7EUkd1hjVzJaHYd
 SZAEmFgMobCErqZYNn8Y+mVQa7mujeOZ3tUq0F5gESwfv9XUhNUiRq8u9o6dbdaXJSRmGb
 wonuPzXSs8yyHCbpK0i3AIRh7iMIGlN/LxHXKLwf3wNVi2WCBkMKzB4qC1gzR9rpd+b+0b
 z2wz8U7K4Omx0Fw5IezbFtaVWwHqRmubid14GLl64rJkz2uB14gLuFxMBylXhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=POedhvrm
Subject: Re: [Buildroot] [PATCH v1 1/1] package/binutils-bare-metal: bump to
 binutils 2.43.1
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

On Sun, 22 Sep 2024 14:12:29 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> package/binutils-bare-metal: bump to 2.43.1
> 
> See here the release announcement for changes:
> https://sourceware.org/pipermail/binutils/2024-August/136396.html
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  package/binutils-bare-metal/2.42                   | 1 -
>  package/binutils-bare-metal/2.43.1                 | 1 +
>  package/binutils-bare-metal/binutils-bare-metal.mk | 2 +-
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  delete mode 120000 package/binutils-bare-metal/2.42
>  create mode 120000 package/binutils-bare-metal/2.43.1

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
