Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD51C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 21:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 282FA41325;
	Fri, 12 Jul 2024 21:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6-5wuEVeyk5; Fri, 12 Jul 2024 21:06:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA556413CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA556413CB;
	Fri, 12 Jul 2024 21:05:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 416BF1BF3C4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 21:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A8A5400B9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 21:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrCpQ-5OewvW for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 21:05:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3F88400A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3F88400A6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3F88400A6
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 21:05:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95BB840004;
 Fri, 12 Jul 2024 21:05:54 +0000 (UTC)
Date: Fri, 12 Jul 2024 23:05:53 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240712230553.23f75095@windsurf>
In-Reply-To: <20240522091608.3659847-4-aperez@igalia.com>
References: <20240522091608.3659847-1-aperez@igalia.com>
 <20240522091608.3659847-4-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720818354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2a9b8ZIoFifOTUJnKZvmE8C1+mRgbiUSjgA4dCsmS74=;
 b=lh5+SxVNqZdwnIwaYT+lY3NDGvLu8Sjji3q/jkeKctu4LJ3GNw/ODNiqfZF/DhQt1ifFHR
 oBSFXMrNzuPbO5cUl0STeE628mcMM8GPFbplH8q5V1hPXKzMAR60BxALhZyGa39AGAcoOr
 6mmP64E/eIf8VpMRpNYPA0bpoaWQN9HcBV3TW9MNKy7IxMmiv95/p1IeTDq+nNyVOTB4sB
 qilfAvcVr0V+cJddSfQ16TYYGwH4VaXfdwtoMMqNXAqVaPhj294OeP1B+S8mxisKwK3SRe
 1q+JbFlFWEW7/yfQn+9CzF31ZMql3S+kRlAY52j+OkLdGJlarn5FhiIEsdA/Pg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lh5+SxVN
Subject: Re: [Buildroot] [PATCH 3/4] package/libavif: new package
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

On Wed, 22 May 2024 12:16:06 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> libavif is an implementation of the AV1F image format, which may be a
> frontend for different encoders and decoders. At the moment only dav1d
> is packaged so that is the one configured.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Thanks, applied, with one change. See below.

> +LIBAVIF_VERSION = 1.0.4
> +LIBAVIF_SITE = $(call github,AOMediaCodec,libavif,v$(LIBAVIF_VERSION))
> +LIBAVIF_LICENSE =

Too lazy to figure out the license terms? :-))

I changed to:

+LIBAVIF_LICENSE = BSD-2-Clause, IJG, Apache-2.0

and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
