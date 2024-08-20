Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52797C3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 21:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1ECA840474;
	Tue, 20 Aug 2024 21:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KxG8IjLSXdmL; Tue, 20 Aug 2024 21:38:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE25C40B7F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE25C40B7F;
	Tue, 20 Aug 2024 21:38:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 045831BF3B8
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7250811D7
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p7d6J7t4ktkN for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 21:38:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD09A80E76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD09A80E76
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD09A80E76
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 21:38:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D327FF802;
 Tue, 20 Aug 2024 21:38:31 +0000 (UTC)
Date: Tue, 20 Aug 2024 23:38:30 +0200
To: Vincent Jardin <vjardin@free.fr>
Message-ID: <20240820233830.5927db8d@windsurf>
In-Reply-To: <20240820085848.4242-1-vjardin@free.fr>
References: <20240820085848.4242-1-vjardin@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724189912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QmlNMl1lgdxJwTjXJta/dvUudE2azOMKnb5h+nGiz4A=;
 b=gfAOU3YJmt/5+sRL9CzuLngabqxMQXSjxm9G8DkspSbhlZGkFpBSX6XSqxafrNT/M8tYvO
 FfbuOTCiRBRMcwNqgERWZyF4+a72HJ7M7sYM5iYZnQFZ5uC9uZcTUfwJjSrG8SHxMkI23g
 aICYWF7Zaq4j3TtXvMuxsw77m/XmdCrvCNgvELqnElyQznco2se1Lj8mdfy2qo5LvhCt8N
 pFL1ehthe6aYEsAEx2136C+v3YP8Baft1P1W7+USwDb9qcFg7zyj9xbNR06kAfJntYSLW5
 yhjyg0YRkaL8RC7W5SymkcneYcg+4WiFx0nSAcbJHEB5MbquR8VyxYe7BXtLsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gfAOU3YJ
Subject: Re: [Buildroot] [PATCH 1/1] package/lsuio: bump to 2020 version
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
Cc: peter@digitalbrains.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Vincent,

Thanks for this update, see below some comments.

On Tue, 20 Aug 2024 10:58:48 +0200
Vincent Jardin <vjardin@free.fr> wrote:

> diff --git a/package/lsuio/lsuio.mk b/package/lsuio/lsuio.mk
> index 193de15aef..4d5cf35bcf 100644
> --- a/package/lsuio/lsuio.mk
> +++ b/package/lsuio/lsuio.mk
> @@ -4,8 +4,9 @@
>  #
>  ################################################################################
>  
> -LSUIO_VERSION = 0.2.0
> -LSUIO_SITE = http://www.osadl.org/projects/downloads/UIO/user
> +LSUIO_VERSION = HEAD

You can't use "HEAD" because this is a moving thing: if you build today
and tomorrow and there's a commit made upstream, you will build
something different. If there are no tags, please use a fixed commit
hash.

> +LSUIO_SITE = https://github.com/DigitalBrains1/lsuio.git

Please use $(call github,DigitalBrains1,lsuio,$(LSUIO_VERSION))

see other packages.

> +LSUIO_SITE_METHOD = git

This can be dropped if you use $(call github,...).

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
