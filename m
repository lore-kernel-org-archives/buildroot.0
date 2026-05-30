Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBFFCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 14:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACBE542ECD;
	Sat, 30 May 2026 14:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z-LChiMV_77j; Sat, 30 May 2026 14:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 441D742C99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780152905;
	bh=uK8Ty6l6j10d7GJy+9F9dfeEjpBADbU3dd9HhZj9RtI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NCIpoojgaBb5c8kK4L283+bVRAWFrh5nDMWmdd483d4kN/YnT8q7sZUZMOCZUnHHb
	 v/JjFgUP8GiwrfO4Znv6/UDWnu9y8sNEAeTpDS32h5Mu7wJz9OA37BH07CrUjfuk88
	 zna+H1k0M0DPCMnUz1UdBh6Atbc9bsTAUE4KqSKp4A1fYX+Y3Kjga84T6EVK7YjV0j
	 cZ0sPKkr9Mv6rv286s/ZPT7Md+T+a3acrhnA8lWLmAJawmcMgMmAgDFosGz0FA4O/g
	 fmxKU4D0O83GbHgSKS93toh0f+2uQ0pfC3KF3IaJZVdAkZ4DE087iQXMLTM05VhKNG
	 c7P2lDk7e/c/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 441D742C99;
	Sat, 30 May 2026 14:55:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C4BFD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30AB96F4CE
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCUe5ugdRlBx for <buildroot@buildroot.org>;
 Sat, 30 May 2026 14:55:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 50D5D61B58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50D5D61B58
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50D5D61B58
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:55:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8BACF4E42DA3;
 Sat, 30 May 2026 14:55:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 471136073B;
 Sat, 30 May 2026 14:55:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 273A610888CD8; 
 Sat, 30 May 2026 16:54:59 +0200 (CEST)
Date: Sat, 30 May 2026 16:54:58 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Cyril Bur <cyrilbur@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>
Message-ID: <ahr6NNVATOAqBk1x@windsurf>
References: <20260504203035.1729184-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260504203035.1729184-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780152899; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=d/vD0qbXUyg8+fP3JrQejJEWu/W56KnnRu5OSrVoFNg=;
 b=fyZTzz9y19EP1Js9k2wmzw8PkDuqjuXbIP3uJwN5nZU4iK5KHYv9Y7SBMPn7R9mfpyHcQJ
 IH6E5tBvSdYDGVkQdUCuBKaB4qyCIfrcxwcKBzBsG5/GRYJAeFW+mkOTd7nJQijW633r7S
 NcKd51l/a6Ijij7OwgTBWZ0bcTUpHhiJERNmM/vjfCTx1ir9WbVKjIrFWZYTv/mei8r7A4
 ahsPGtIp922Ev0FBUqGe2Qr38r7IZF8+MWEy8KG8uZieQdnhDD+kYs4nJy3/PtWsos4g3z
 etczN4YT6pR7hZ2l/uZUuT6jdOYnnVf4lJvcZxQMe9BHODdjNCJoxFLU/71Rvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=fyZTzz9y
Subject: Re: [Buildroot] [PATCH 1/4] arch/Config.in.powerpc: add Power10 CPU
 type
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

On Mon, May 04, 2026 at 10:30:32PM +0200, Julien Olivain via buildroot wrote:
> This commit adds the IBM Power10 CPU type. See [1].
> 
> This CPU is supported in gcc since v11.1.0 (see upstream commit [2]),
> and in binutils since v2.35 (the gas -mpower10 option is documented
> since upstream commit [3]).
> 
> [1] https://en.wikipedia.org/wiki/Power10
> [2] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=5d9d0c94588c8834a33eca6847b0a1401353300b
> [3] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=1424c35d071e7d49a4a219c7dee8c88ffd60ddca
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Thanks, series applied to next!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
