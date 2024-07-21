Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F20C3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5C906068A;
	Sun, 21 Jul 2024 16:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HHG6b9ErQaLC; Sun, 21 Jul 2024 16:21:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1D70606EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1D70606EB;
	Sun, 21 Jul 2024 16:21:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7206B1BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F60840139
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKcLCWlfhtrC for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:21:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 11E1540124
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11E1540124
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11E1540124
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:21:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1C1C40003;
 Sun, 21 Jul 2024 16:21:38 +0000 (UTC)
Date: Sun, 21 Jul 2024 18:21:37 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240721182137.13d567d6@windsurf>
In-Reply-To: <20240721065302.35452-1-fontaine.fabrice@gmail.com>
References: <20240721065302.35452-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721578898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8+kxPjfDbpVgReCLVLYBAQiigGk9HfrouBodpvnFXiU=;
 b=CByDET8MZdVnAHc3gPZoNqW/1U9Dtap4+nTLC0A9raWPH35sj2aSeVjD+oXTLh6jwHbtMu
 nXM0otOzo1w/XYa+NHKAENsLo8C16d/JmmXfQdZkBVe1quTwn6RKFN8RzN31Oeu7FbP+ea
 +mVCfKuHY25I/B2yXM6+Qrfj4s33zA5xb/cHZSAafJF8r8ABxKYYJ2ELMbUNqSvkfQcBjt
 UVLuuRJ01hRq/M+jRWvHIJIbERxS0+DyZSf9aF8Fw4ZuHpKU/hkYAP8T6q/L6u58QMR4qX
 WXWMUKKWlsc51kkZO/PUqScxe4CUP5+sFJQ58o/c21kzAIrp3i3Bun5XrGXiyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CByDET8M
Subject: Re: [Buildroot] [PATCH 1/1] package/sysprof: needs C++
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
Cc: Will Newton <will.newton@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 21 Jul 2024 08:53:02 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> sysprof needs C++ since bump to version 46.0 in commit
> 0d57555407f2a0708515e7c377f57a6466c78b1b and
> https://gitlab.gnome.org/GNOME/sysprof/-/commit/a4b5ea6160135ae4ee2916b6a93b281302d5ddc8
> 
> Fixes: 0d57555407f2a0708515e7c377f57a6466c78b1b
>  - http://autobuild.buildroot.org/results/6ab455b9287220d4353154ba3b54df4ce57748df
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sysprof/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

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
