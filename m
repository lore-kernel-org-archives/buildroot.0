Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE71C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 801F0840C5;
	Sun, 11 Feb 2024 21:37:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lanTVUG4Vizi; Sun, 11 Feb 2024 21:37:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE0C684201
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE0C684201;
	Sun, 11 Feb 2024 21:37:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EBCA21BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7DD54012F
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:37:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8mHUSi_ygxaR for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:37:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 983564011D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 983564011D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 983564011D
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:37:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D517DC0002;
 Sun, 11 Feb 2024 21:37:03 +0000 (UTC)
Date: Sun, 11 Feb 2024 22:37:03 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240211223703.2d5ec6a5@windsurf>
In-Reply-To: <20240211183631.1162846-1-fontaine.fabrice@gmail.com>
References: <20240211183631.1162846-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707687424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ab9COXossCfVj9YndbNJfFLiVHMVhIufFc4fOkA+yyo=;
 b=HwPkkpT6P/xFaK9MRvk5i6D2iBRVSpPSDpvH+kE3zZBOX4/XvKTzv7x+z0YBkLxj/tHIv4
 hQKGngfzVJ7V6r+EmX4JNFWdczdqMg/wf7sXey90fa5iotJZKauK6GnWyWaK1gjmL9T8AH
 IebcYSkol/cV5Rk5k7u5PaaJd1kluj7BqnGX90+dX2QFA81wl88jlsTqG5x6xO+c4UAHP1
 /bnOQ4nqMui7kVIbw3+2zNgAQPg5BmZNiPn+WU8nu37Ck51e0MOAbWZjQv+vPbjbdnSY4f
 a1Zq4ekk3mgBU48vhcZBsFzpRlvbJJl+Hw8xmK5XScJi3TFFAvPtEYfsezIk+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HwPkkpT6
Subject: Re: [Buildroot] [PATCH 1/1] package/opencv3: replace
 PKG_PYTHON_DISTUTILS_ENV
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Feb 2024 19:36:31 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Replace PKG_PYTHON_DISTUTILS_ENV by PKG_PYTHON_SETUPTOOLS_ENV
> to avoid an issue with naming of python modules since commit
> 09de823cbc7bd50a40e25f4166b4e42be94b0c7b
> 
> Fixes: 09de823cbc7bd50a40e25f4166b4e42be94b0c7b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/opencv3/opencv3.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
