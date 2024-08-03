Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4DFC49EA1
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 18:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 355FB40394;
	Sat,  3 Aug 2024 18:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7L_wbanc4y5c; Sat,  3 Aug 2024 18:27:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF0254039A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF0254039A;
	Sat,  3 Aug 2024 18:27:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 60AFC1BF364
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 18:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A83A40292
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 18:27:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F8Ecyl-tLByo for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 18:27:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0661D4039A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0661D4039A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0661D4039A
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 18:27:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16E091BF203;
 Sat,  3 Aug 2024 18:27:30 +0000 (UTC)
Date: Sat, 3 Aug 2024 20:27:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240803202730.069291d6@windsurf>
In-Reply-To: <20240803104527.2574127-1-bernd@kuhls.net>
References: <20240803104527.2574127-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722709651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GPZl1VVLUbx56ueyT0Jki+MPdBVMaLtBCfmOAzveUjM=;
 b=CpGZIRBZAsFvUG8jYUVkzgO+OpN/wECHag1FT8GuYFcVkZwnyV6xhtEEIQlYaiKe52TxI8
 lXWYq7hepGQCp3AaIQ3wxI1TcHTlCh7bQn96f7kNhi0f25h040tKJXwDehBe8KnRHGUIaW
 adkrRZ/jea21sfbcebu5CVDGFn2iuVQJCnakJoSSxB5IdFsX+4ckU9bm5hrAzxKtu4+J5m
 PFD701d5ri8Y2nFiUTsyKNRbUcP8zsWT/tfcTWN5yXcCn12+09HYg7hnXjMxMCG5paVSAn
 6O6cayu7K9f5P1Y4KsjyutVMxCtTj+bZ89kRbqRPyud7TGVNSvwn3jnYE04ZCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CpGZIRBZ
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.20.3
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

On Sat,  3 Aug 2024 12:45:27 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Rebased patch 0001.
> 
> Release notes:
> https://www.samba.org/samba/history/samba-4.20.3.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...d-pre-built-heimdal-build-tools-in-case-of-.patch | 12 ++++++------
>  package/samba4/samba4.hash                           |  4 ++--
>  package/samba4/samba4.mk                             |  2 +-
>  3 files changed, 9 insertions(+), 9 deletions(-)

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
