Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DF8C5DF67
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 22:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B1C1407DA;
	Sat, 15 Aug 2026 22:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1jdpAEdrfWT; Sat, 15 Aug 2026 22:03:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BD65407B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786831422;
	bh=q98u3bfJ4LVRAgiI+TgG87s7175o7yxvzVHL6UhnFs0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nOr9Iq7PMdGR49ZrBUu4mY4ZNpHERv2+jBKOLtqs83j4/EpJYRLUgnPN9ZNfmnOmd
	 af0+TWKSB/t+3HHFEMVL3qXtM1Qkvkv8reKZB/oH/bds9NYwj2uyOv5BhB8jSs9EGL
	 76/t5/pYKiu1YnG6WNXnQS0sWkFX0YACAkrGmM63bG65c4nBbv980+Qf9xi4GnECuv
	 pDgOoJM2ntrWFL0HSTTCfBthKuWyik4189WrwJegeX41p6YhpZEUeW73wO2BOATtWj
	 YiwZG45taB4oYdbM/IleRfWyMdM4IV9zk1tYg/u+DuIU9zGeZNxzv+wPjEtjNjJofT
	 TS+XAlhs4Xy7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BD65407B3;
	Sat, 15 Aug 2026 22:03:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C51623F
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 22:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0276C407B3
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 22:03:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1YcVNq7Yqscc for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 22:03:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F36FF407B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F36FF407B0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F36FF407B0
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 22:03:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 326972003BE;
 Sun, 16 Aug 2026 00:03:33 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Aug 2026 00:03:33 +0200
MIME-Version: 1.0
Date: Sun, 16 Aug 2026 00:03:33 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Boerge Struempfel <boerge.struempfel@gmail.com>
In-Reply-To: <20260722094344.153516-1-buildroot@heine.tech>
References: <20260722094344.153516-1-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.17
Message-ID: <8738f01d9765835bba311f0c8310e382@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/libgpiod2: bump to version 2.3.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 22/07/2026 11:43, Michael Nosthoff via buildroot wrote:
> - buildsystem changed from autotools to meson
> - add option to install dbus-server and client
> 
> changelog:
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.3.1
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks. For info, I rewrote the Config.in dbus
option to propagate the libgudev dependencies. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/1d132d04fc0ecac014be003b7e1662c47672328b

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
