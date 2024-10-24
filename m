Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDB5D0E415
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1051160ABF;
	Thu, 24 Oct 2024 20:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FN1BUGNF0jVK; Thu, 24 Oct 2024 20:31:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3F3360AAF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3F3360AAF;
	Thu, 24 Oct 2024 20:31:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EBF754960
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D966140C1F
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYJ91eLavMe9 for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:31:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5941C40BDA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5941C40BDA
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5941C40BDA
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:31:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7D8D20005;
 Thu, 24 Oct 2024 20:31:34 +0000 (UTC)
Date: Thu, 24 Oct 2024 22:31:33 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com, Colin
 Percival <cperciva@freebsd.org>
Message-ID: <20241024223133.1069cd60@windsurf>
In-Reply-To: <20241004215451.1198861-2-dario.binacchi@amarulasolutions.com>
References: <20241004215451.1198861-1-dario.binacchi@amarulasolutions.com>
 <20241004215451.1198861-2-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729801895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FuMyZ7L2pI2zGBc/ZUcY+Xr8sgXLP8eY//VzemOdub8=;
 b=j8pCpamlj/VbgpK2fGpacoaSfTqn3vRuTb7eBsvNkKTAebVD3zP0K2JmMX0k1Zao1p9yRU
 rOFnft9VrvXil2Wb7hwp/kwb2NJSGBejUsjwetl/DdhWrrkHQ0IX9LSS2FNKmwATuzSF1W
 NiNxmpYs7QLgA0wxNFIXmb7zLqellXv8TJK1Xuyu+rXG9GoHVKdZ8U/j8Y1+1lFuR4Lj+L
 h+2pjpenSAE+sMWFQz6srrBFsxPu2qPR3CF0CoU5vOgFL61dsIg91seLPPRJPgHAXlYaeS
 5XMKbiDGKRSRzuFNev3HqUbKISlJNWBCVrcDokvS/Zb0QCr4zI4o7AMAH+1i6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j8pCpaml
Subject: Re: [Buildroot] [PATCH 2/3] package/bsdiff: switch upstream
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

Hello Dario,

On Fri,  4 Oct 2024 23:54:45 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> I asked Colin Percival, the creator of bsdiff, about the failure to

We try to avoid first person singular sentences in commit logs. Either
we use "we", or we turn the sentences around.

> download bsdiff-4.3.tar.gz from  https://www.daemonology.net/bsdiff,
> and he kindly replied that he intentionally disabled the package
> download because "that code has some security bugs and I didn't have
> time to roll a new tarball with them fixed. Grab the bsdiff code from
> FreeBSD or Chromium, I'm pretty sure they have all the fixes."
> 
> I chose the Chromium version because the FreeBSD one was less suitable
> for integration into Buildroot, given that there is no git repository
> for the project itself, but rather for all FreeBSD sources (4.7 GB).

https://chromium.googlesource.com/chromiumos/third_party/bsdiff shows:

  (MOVED) https://android.googlesource.com/platform/external/bsdiff/ fork of bsdiff; http://www.daemonology.net/bsdiff/

Does that mean we should use
https://android.googlesource.com/platform/external/bsdiff/ instead?

That being said, even the repo at
https://chromium.googlesource.com/chromiumos/third_party/bsdiff had its
last commit 10 years ago, so this really looks like unmaintained
software.

Shouldn't we instead just remove it from Buildroot?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
