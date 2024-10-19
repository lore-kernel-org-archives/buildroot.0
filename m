Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB15D3C90C
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 18:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F19180F44;
	Sat, 19 Oct 2024 18:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4CowaD4az9ef; Sat, 19 Oct 2024 18:06:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBF4F80F4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBF4F80F4F;
	Sat, 19 Oct 2024 18:06:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3629B3A23
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 244EA40557
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbMLYmt59qVH for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 18:06:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F2E4340543
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2E4340543
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2E4340543
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:06:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31430E0004;
 Sat, 19 Oct 2024 18:06:30 +0000 (UTC)
Date: Sat, 19 Oct 2024 20:06:29 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Louis-Paul Cordier <lpdev@cordier.org>
Message-ID: <20241019200629.2f1efee4@windsurf>
In-Reply-To: <20241018190654.29370-1-bernd@kuhls.net>
References: <20241018190654.29370-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729361190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mRN8M2RlJkmdSv7AbELcIxPOEFVJxGdBMl7+Xk2M+0Y=;
 b=bqX7FOMQI1o8d3h+vxi3stuSYnGLOB2S1JNPywEz7yfV9DlfEZyeT3cGY8g1T0K7GDKGDj
 2ItXVLtyEaGyq4/FEQ8LhGJe9SIS0Z5yadKvSeym9muXX0gElpuYgDYX7N+QO0YZb96ZJE
 bhgQzIjhqKPtPk554beEHZN0UMwnbGs4jgB4qUvS66k/KtwcUxTdUFcePWmy8QDsUNpV4w
 /EhAdxKXQjeKqzkQJVHh9ZFMZ5MYfTho9RSuI0n3EwWrTs/sMheC6WQ/7yEusZvBB+lPyG
 9TORCM2G4BYDy+DXjy4Vf5nSCvzu1+0CCYySexrurthR34GX9a/wj5rhUqDvRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bqX7FOMQ
Subject: Re: [Buildroot] [PATCH 1/3] package/intel-mediadriver: bump version
 to 24.4.0
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

On Fri, 18 Oct 2024 21:06:52 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/intel-mediadriver/intel-mediadriver.hash | 2 +-
>  package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Series applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
