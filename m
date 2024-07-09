Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC009C3DA42
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 19:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F97240026;
	Tue,  9 Jul 2024 19:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nEKd-JH7EmDB; Tue,  9 Jul 2024 19:42:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21B4D4012B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21B4D4012B;
	Tue,  9 Jul 2024 19:42:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 746CB1BF5DE
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 19:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6003B812FF
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 19:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZIwWoO54CGgj for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 19:42:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3182781E6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3182781E6C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3182781E6C
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 19:42:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F189EC0002;
 Tue,  9 Jul 2024 19:42:51 +0000 (UTC)
Date: Tue, 9 Jul 2024 21:42:50 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240709214250.37d2de67@windsurf>
In-Reply-To: <20240709101841.1145134-2-fiona.klute@gmx.de>
References: <20240709101841.1145134-1-fiona.klute@gmx.de>
 <20240709101841.1145134-2-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720554172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RCr+SM/ylCWyGQD34HQeH8u6/F0EMCs6abpiUwLeGpY=;
 b=jLalqjILhFcRYDgW/wzQ3G2vvSY9VQkRlRtic1TAfBy63BS3t2npqEclk6qaZXzmnfxmXR
 SMxI4uR77XfAHUkkdDTFUBgOaVsVMP1JwN7o4wOPFc83kJPdAwmfyPi1QGe2dLWkJBh7IN
 WM6jNHVmXB8/15GPX8s6KidGSY5X1mM3qoX6OA6b5FL3z46WDUl/Z8IEVKqdQayw1FQqe3
 J8KaUlR4+do8wqHOJ29BD1pq01igWzUBpJI87Oawgp4rKeBAdIeaDaYcN8VxhalmZe2nJs
 x7/ZqBNVZw+A/enuxU3IhsuqdVKHlTi3OSZoTux6DdZqebODBr7jL4sWRewjXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jLalqjIL
Subject: Re: [Buildroot] [PATCH v3 1/4] package/python-pyasyncore: new
 package
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Tue,  9 Jul 2024 12:18:38 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> pyasyncore is a compatibility package that provides the asyncore
> module removed from the standard library in Python 3.12. It is needed
> to support fail2ban without a bundled copy and should be removed as
> soon as nothing in Buildroot depends on it.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

I have applied your patch, after some small changes.

> ---
>  package/Config.in                                |  1 +
>  package/python-pyasyncore/Config.in              | 10 ++++++++++
>  package/python-pyasyncore/python-pyasyncore.hash |  5 +++++
>  package/python-pyasyncore/python-pyasyncore.mk   | 14 ++++++++++++++
>  4 files changed, 30 insertions(+)

I've added an entry for you in the DEVELOPERS file for this new package.

> +PYTHON_PYASYNCORE_VERSION = 1.0.4
> +PYTHON_PYASYNCORE_SOURCE = pyasyncore-$(PYTHON_PYASYNCORE_VERSION).tar.gz
> +PYTHON_PYASYNCORE_SITE = https://github.com/simonrob/pyasyncore/releases/download/v$(PYTHON_PYASYNCORE_VERSION)
> +PYTHON_PYASYNCORE_SETUP_TYPE = setuptools
> +PYTHON_PYASYNCORE_LICENSE = Python Software Foundation License

This is not the correct SPDX license code, it is PSF-2.0.
See https://spdx.org/licenses/ for the list of license codes.

Applied with those changes, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
