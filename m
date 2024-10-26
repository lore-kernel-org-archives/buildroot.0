Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74580D10BE8
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 08:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 356D16062C;
	Sat, 26 Oct 2024 08:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id htGwzG3Gc46d; Sat, 26 Oct 2024 08:48:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54FFE60637
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54FFE60637;
	Sat, 26 Oct 2024 08:48:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 737E55C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 08:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 613BC408B2
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 08:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZQ9ddhhVStc for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 08:47:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E968240879
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E968240879
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E968240879
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 08:47:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E60CF60004;
 Sat, 26 Oct 2024 08:47:53 +0000 (UTC)
Date: Sat, 26 Oct 2024 10:47:52 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>,
 linux-amarula@amarulasolutions.com
Message-ID: <20241026104752.0d70ccd1@windsurf>
In-Reply-To: <20240923054626.2911036-1-dario.binacchi@amarulasolutions.com>
References: <20240923054626.2911036-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729932474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=klibMrnP3zoFT2L0XfyIT1sQdlfTh4k2Xn30rMKYd4I=;
 b=k7ykBXYnnAG7AAbtxOsdkHhrN7eKIhDGOWEpaWc9LRUCzq1bJ0Cs2kqxXZjVQM/fyVqCN+
 SUXnbHNFNVLiM8Pe6h5OZN0ItHt8CGeuGPCT9W3h1SgBMnYEOgYqb5VYCE1ZT031I7+cfQ
 +DPoYHKhSaAo0MrKz1U+ApHgIYZbxtR/4fh2KPBOEEjAN9FnuERJ5Bavzkll/0eGByknV4
 MXFiAPymwUVLwZZBSdtbZBal8mVbGpw+0FwHnMYkc4KTG6r8pc/mZofHl5vZmpzMX3kPqK
 /88aY+myDcQVntOvx9qQFhTG1QJlmJ7ZhLkUEUQzVc/OMsiIpt+bhiH5bqNeeg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k7ykBXYn
Subject: Re: [Buildroot] [PATCH v3 1/2] package/iproute2: fix building error
 using designated initializers
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

On Mon, 23 Sep 2024 07:46:25 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> This patch fixes the following error:
> 
> arpd.c:442:17: error: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
>   442 |                 NULL,   0,
> 
> The analysis of socket.h [1] containing the msghdr structure shows that
> it has been modified with the addition of padding fields, which cause
> the compilation error:
> 
> struct msghdr {
> 	void *msg_name;
> 	socklen_t msg_namelen;
> 	struct iovec *msg_iov;
> #if __LONG_MAX > 0x7fffffff && __BYTE_ORDER == __BIG_ENDIAN
> 	int __pad1;
> #endif
> 	int msg_iovlen;
> #if __LONG_MAX > 0x7fffffff && __BYTE_ORDER == __LITTLE_ENDIAN
> 	int __pad1;
> #endif
> 	void *msg_control;
> #if __LONG_MAX > 0x7fffffff && __BYTE_ORDER == __BIG_ENDIAN
> 	int __pad2;
> #endif
> 	socklen_t msg_controllen;
> #if __LONG_MAX > 0x7fffffff && __BYTE_ORDER == __LITTLE_ENDIAN
> 	int __pad2;
> #endif
> 	int msg_flags;
> };
> 
> The use of designated initializers allows the issue to be fixed.
> 
> [1] iproute2/host/mips64-buildroot-linux-musl/sysroot/usr/include/sys/socket.h
> 
> Fixes:
> - http://autobuild.buildroot.org/results/e4cdfa38ae9578992f1c0ff5c4edae3cc0836e3c
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> No changes since v1

Series applied, after updating with the comments from Petr.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
