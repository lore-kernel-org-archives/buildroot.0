Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE0AC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EFE24183C;
	Fri, 12 Jul 2024 20:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AJ8D8of3rPDg; Fri, 12 Jul 2024 20:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C7B341972
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C7B341972;
	Fri, 12 Jul 2024 20:21:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DE761BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B4AE606F5
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fVPtcO-H-wvH for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:21:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F3C86067D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F3C86067D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F3C86067D
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:21:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 624A11C0002;
 Fri, 12 Jul 2024 20:21:20 +0000 (UTC)
Date: Fri, 12 Jul 2024 22:21:19 +0200
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Message-ID: <20240712222119.791acc8c@windsurf>
In-Reply-To: <e87e2b6d-7591-43e9-ba17-b0d99bc869e2@mind.be>
References: <20230916142256.384319-1-fontaine.fabrice@gmail.com>
 <e87e2b6d-7591-43e9-ba17-b0d99bc869e2@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720815680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W2teUyW3rk+fbx0gujAyVetL5o4wtVLs0waRE1tXhxA=;
 b=XXEdCSuQbusIttjPn4BQXQ7LS59Zp9otIIngPbcgEFNvHseZCoI0/0IqErd/9QJzTUzdsh
 CHzHl2KRvuZ443rjwOq7rBfHLovezylxfbU0wBq7aEKTtQF5zj53am9zzYbU3iBBMzcGrl
 UotQSMfNpr/zglJ1fbiw9+rjrtu8BYXSbElRY8UURPYWyigTHVaHGVBqzHderS3F32Wb0i
 HZu2R/D050rH9SJKpjjFo/nfFEn/19hOm5iQr5KJe2XultHHs6opGYVduMv0Pg8+EKlffd
 NTLtUhxuaFMk5rDCXE+cftm2A7qXNclbvPsifTfNis/OE5aUnOdd1HU8oBrOSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XXEdCSuQ
Subject: Re: [Buildroot] [PATCH 1/1] package/check: disable static build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Jul 2024 22:12:33 +0200
Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:

> > Fixes:
> >   - http://autobuild.buildroot.org/results/0d6/0d6fcbedef29bf0d6a1d9ecb8e4d82b4ad06cfa8
> > 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>  
> 
>   Applied to master, thanks.

And I reverted because I actually fixed the issue:

  https://gitlab.com/buildroot.org/buildroot/-/commit/526b89b981cb3fa3da7644482d1f140f1fb25e27

And also did a fix for noMMU builds:

  https://gitlab.com/buildroot.org/buildroot/-/commit/d10bee42012103fe7974c5e20be3af81e3c1c250

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
