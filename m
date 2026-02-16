Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD33E83827
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 19:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D91060DF9;
	Mon, 16 Feb 2026 19:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XIpJwWgEffUA; Mon, 16 Feb 2026 19:49:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A466605E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771271371;
	bh=QbyhUhj8kag1Xeaaq+WkGGzKyBrmC9MzRJH2EiRs1bA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JR73i4dhBotHNsz6CW4ZgCR3DDdv1hbDMNheB2C2q58rVYfDLGANsCP6LGDVrYsQm
	 V1j9pamvdQgut6Kb65P2T/NTt/Di8F+yY45xabWXoQGPNxrlqR8/9ABr7m2KRw/KHP
	 Pinxa8qWt1Gu0NSA+JPz3exHd9mD1OYOgmwFP64VULkI2kSfQLYGgLI/QcO5v+gm26
	 dmkmS++/MWofzHDRwJywV50k0poZFj7vk/Z062SXZDkpHz+6yrcBV/NIJiYn1DmgvJ
	 ff3RiKUsoUM0btzlSjSSYo0p4okfIUCirpHXp+lsIxOykc9KBXZHArskaaF0QvH1Ci
	 whqg8lVv0luGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A466605E7;
	Mon, 16 Feb 2026 19:49:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0D6735B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5AA340A62
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZG4-5kQaqKO for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 19:49:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0948F40A5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0948F40A5B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0948F40A5B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:49:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 467202003DC;
 Mon, 16 Feb 2026 20:49:25 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Feb 2026 20:49:25 +0100
MIME-Version: 1.0
Date: Mon, 16 Feb 2026 20:49:25 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260215105358.2089856-1-peter@korsgaard.com>
References: <20260215105358.2089856-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <7dc79f5eca72bc099e12f92a0a471ff5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771271366;
 bh=QTkXv86l0lcR5P9+8nkpE8LfdOvUCWGgrbs8LUd5gTQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DoUw3jiQdbkIwGuSIiKmF3L2iX7kJhzdthvUW3j7qc4XupphzfWwM4OLgKAgZyRDy
 xFwaN5aqWTi/WaybrWTXq/UyzlIvgY2+5w8PyCsV1MsbDVT63uiPDZdPOFgJpntVTr
 WRkQR73VXgT0p0hODBfg3qoWNmwRNfrnauCs/1wmBRS1VUq1+VE4ExQ/tNnrUIWO6D
 WlAfqrc92qFjTp/TojpC1izvPP49ktdC4XK2xq5bYTsgPgNghisQbsJFxCTzYAQ4OI
 U3GPYbayjvU+5+vHBLYDi96BNGxoDkH2Em5EszvwcVbwcnqAHZIxAtXypmugcN8qKv
 4vpJ9rxdvXktg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DoUw3jiQ
Subject: Re: [Buildroot] [PATCH 1/3] linux: make license option visible for
 _CUSTOM_VERSION as well
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

On 15/02/2026 11:53, Peter Korsgaard wrote:
> Commit 50958bcdac ("linux: Add support for custom license files") added 
> a
> default value for the license files and made the option visible (E.G.
> editable) when a custom VCS or tarball version is used, but it is also
> needed for users of an older _CUSTOM_VERSION (E.G.  mainline release), 
> as
> the referenced files were only added in Linux 4.16 with commit 
> e00a844aca
> ("LICENSES: Add Linux syscall note exception"), so change that.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master. For info,  I added the missing
BR2_LINUX_KERNEL_LICENSE_FILES in openblocks_a6_defconfig.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
