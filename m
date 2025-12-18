Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B799DD68BE8
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 07:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74F3C6111D;
	Thu, 18 Dec 2025 07:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kbcWE91oSu1x; Thu, 18 Dec 2025 07:41:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A01A860C28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766043716;
	bh=lr65AUFfqn5mZ6jwFDg3QceC+Pe6IStKa2CUKo49+nw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A5AgBqAn86awUeGMWj3dalG4r5ZKNqZ2hgQrzZneGB/MfnBefaMId3+3R+vde9uF0
	 xoj+h8JIVgtDnWtdbjV9yGi4KHImWN5PF1G8VR2TfvbzGtmy5rj9YejvZYPKLxgK+V
	 g9mAjA8+8q8kzPJYvwTg01yWOw/qq/WbVgfj6tBMmDgluvVCbX+dgVJagIZ4cRfN6R
	 SGRd8+ox89MUx6/hTp3ruHYdkndjEXWHQWZ12bYJ1VZT2k4BPk2DnsjDN/Eu98/dIg
	 u6zZAIPvG2i4ydceFJSCU8Z41QhySj0crHWabTsYaDlK/K8TvTTPyMUZEz132MiDva
	 Ct88aDYUtObOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A01A860C28;
	Thu, 18 Dec 2025 07:41:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70D3D361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 07:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 634D640611
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 07:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ay4imbkpCoWG for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 07:41:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 35FD04055E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35FD04055E
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35FD04055E
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 07:41:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 266BB1A22B1;
 Thu, 18 Dec 2025 07:41:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EFCF86068C;
 Thu, 18 Dec 2025 07:41:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 04CAE102F0AF0; Thu, 18 Dec 2025 08:41:44 +0100 (CET)
Date: Thu, 18 Dec 2025 08:41:42 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20251218084142.0abe7e1c@windsurf>
In-Reply-To: <20251207174348.18519-1-bernd@kuhls.net>
References: <20251207174348.18519-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766043705; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4MKnWxpoJ+E+MZZv1sz2ZyxwAhBF0HMWcKHCuCZy1MA=;
 b=a9eO0KGMWCQ7RuyW++6kKCtwO8hn3PlIiz3UbvPdDwHCLTNTaD48YcYc5+th9MG/myh6KO
 j+Xh27ulIf/B9aoXxpR9iWCJa9ooeTnmUDIOpyuvXvGfqgGptPtGW4TiwjLEsNEIEhns+f
 nl4lFsHFsY8+JzE0K2azZQxK5O0bqTBaNLQfcItPWo3/Z8l7Z1jiacAd6YKuxLk++KXWD1
 +7Gw+ca5FDW41HD8DsEq3jmN7QxwPfcwFErB/NTLI8ScOi9gtG/b2dZGa9nDP/sPmgh00l
 0pcI9QhwqfPFFfWt1yZBu4y803zUGTLPkmXXiCdokhauZaKQ/Dayu44ReC8cbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=a9eO0KGM
Subject: Re: [Buildroot] [PATCH/next 1/1] package/json-c: disable apps for
 host build
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

Hello Bernd,

On Sun,  7 Dec 2025 18:43:48 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> https://autobuild.buildroot.net/results/dcf/dcf72922750a830901279e8eb8fc2def95d35e01/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> Supersedes
> https://patchwork.ozlabs.org/project/buildroot/patch/20251203214709.2321976-9-bernd@kuhls.net/

Thanks applied to master with an improved commit title/commit log.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
