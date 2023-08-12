Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6791C001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 12:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8237760E73;
	Sat, 12 Aug 2023 12:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8237760E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nc3LF8hCed0L; Sat, 12 Aug 2023 12:36:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8D0260F01;
	Sat, 12 Aug 2023 12:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8D0260F01
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD1001BF3B5
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 12:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A71CB81F84
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 12:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A71CB81F84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vPI-8_IfwpAU for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 12:36:37 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 995ED81E57
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 12:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 995ED81E57
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBFD0240004;
 Sat, 12 Aug 2023 12:36:34 +0000 (UTC)
Date: Sat, 12 Aug 2023 14:36:34 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230812143634.5f88c712@windsurf>
In-Reply-To: <20230810203222.3072070-1-bernd@kuhls.net>
References: <20230810203222.3072070-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691843795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQCTdgFASYpdg8u1NK07BBp931ubAxhfmDk3wT8QACY=;
 b=D+FbolRUpW7FxcR7nX6plJdLReLKuaqxzQ9BxEt+lJwb2lugDgqAo/Mh9GDUIFnALO+jT2
 rDcEFXT41BhotXv2IS0wo78qytXivoN/BjOtn8SOTxiLI+hj4AnegDKQNQDIuTXF0/Y8fU
 0TwnTuDLql2ylxNvlg5jyp5WBXXByO7mWG2aRzR10+U7x3FeZq+LBSFuLO7O4acxCbSSOi
 wvMbsAtMb/QJsxwJxnZBYwhU9vVWwCOJyup57KLtLrJu77lTZvxuaeMLTB6XdC9fWoVJMX
 P6Ca7BjtGzrz5KJNrAN6FfHEmFkcBh9/PbLGxMb2F2eVoUWDjn/NdnI+dsPNCA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D+FbolRU
Subject: Re: [Buildroot] [PATCH 1/1] linux: fix hash for kernel 4.14.290
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

On Thu, 10 Aug 2023 22:32:22 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Buildroot commit e0a786a46733cc473f0e4c35064a3b09ccf548e6 added a hash
> for the wrong file.
> 
> Fixes:
> http://autobuild.buildroot.net/results/fc0/fc0e253e3535bbc1413d150554e836d3da9e2042/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  linux/linux.hash | 2 +-
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
