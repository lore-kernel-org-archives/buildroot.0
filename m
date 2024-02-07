Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72C5C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C92F80E41;
	Wed,  7 Feb 2024 16:24:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iX6wXCtB5yA3; Wed,  7 Feb 2024 16:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A10DA80E5A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A10DA80E5A;
	Wed,  7 Feb 2024 16:24:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A69621BF59A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9334A80C36
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:24:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uWfzFzHMJX-4 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:24:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E32180BDA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E32180BDA
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E32180BDA
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:24:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A94BC60012;
 Wed,  7 Feb 2024 16:24:22 +0000 (UTC)
Date: Wed, 7 Feb 2024 17:24:22 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240207172422.09b472a7@windsurf>
In-Reply-To: <20240106224320.3638136-1-fontaine.fabrice@gmail.com>
References: <20240106224320.3638136-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707323063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o5ea95+9sF+wMH19I8R3ou8ad2G1WJoC+mWt6kpmyos=;
 b=XNOXRBqapnKImljwJEp8lNly9JiNIi8+qOuhwB79Hei/zjRCTYK3WalA9QDe93hB/aKRwM
 dY/FthgetIPlpkVdAaIxE+cUBBP5KYrxsGM+okpYjd1yZvwv69j4SkqOM1FcJ1GeoslVVa
 iaH98/6WR/eTn8+qC+9layF6lXrkEp1h+LjPeobhSDJ3w2+/MDQ2wjlIlhVPY77gDg9PXp
 WbaMlWhEejRTDkYHJw0t5wLe3ddxXZaB03ooxL7NzLs1BmtEQcmjWKhFwOXneLrczrof8C
 UaTUnxldJHTAgxd2c260xn2hH3IQ8dAPeT4EoZ1JZ7X9ch3oj678hnMMx+wThQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XNOXRBqa
Subject: Re: [Buildroot] [PATCH 1/1] package/bayer2rgb-neon: bump to latest
 commit
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  6 Jan 2024 23:43:20 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  1 -
>  ...add-some-_always_inline_-annotations.patch | 75 -------------------
>  package/bayer2rgb-neon/bayer2rgb-neon.hash    |  2 +-
>  package/bayer2rgb-neon/bayer2rgb-neon.mk      |  2 +-
>  4 files changed, 2 insertions(+), 78 deletions(-)
>  delete mode 100644 package/bayer2rgb-neon/0001-add-some-_always_inline_-annotations.patch

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
