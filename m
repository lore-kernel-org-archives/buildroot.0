Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E89E8FDD8
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 14:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E71B40252;
	Sat, 27 Dec 2025 14:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gvassXSpkJTc; Sat, 27 Dec 2025 14:50:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72B6B405FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766847040;
	bh=uXhQjcqj5K7ICTy3NFEydb82YTCeAnvFjtZ2BzXwFU4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hPztdgKI7zCR75Pb7GYanUx6qbg+jZ60qQihwSFsCvUYQNCDu+8oY67HtOU0VmXqi
	 Y9lP0m47Jv1FZ5yqMIBO/2aJK3x4BFPoNNHDAR5ZhYnneqocB1lSkUaoAW+hi1NDpC
	 prHV+jMckKu3h6TUoi742hCB5qvwFzt1hfpR79ZuxqfXuqlCMJx8CF9701mrdxTTvW
	 FKIAH9+iHb1h+Imtr6/+NSvOpt4yVYNfs3/EHWRU4FVVppK7WbpCE4wqT1QGAGLhRn
	 InVkrQ5vghzmrYq7U8D8+8I4xZmPzRwi5P07RNz3u8BZZybEpSgJyt+cjh2iHNIH+I
	 hVzbhbWZpEbgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72B6B405FD;
	Sat, 27 Dec 2025 14:50:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D1AF0B9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3879405FD
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTgIZcI5KJpc for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 14:50:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E5C8F405F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5C8F405F8
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5C8F405F8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:50:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id EF389780395;
 Sat, 27 Dec 2025 15:50:33 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 27 Dec 2025 15:50:33 +0100
MIME-Version: 1.0
Date: Sat, 27 Dec 2025 15:50:33 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251226171448.1213664-1-thomas.petazzoni@bootlin.com>
References: <20251226171448.1213664-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <8a8fce9c953dec3520e70ac13c95bb29@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766847035;
 bh=J105n4JPaT5dZvyc9R8wVndLzq+Rgr/D7V711rHEGAI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cw6P6xx/YwwEqOKertNamZYHhrR+34K6VC2vt4PgKFLgtC6se8+XJcX9qEbfF1+Wf
 NbU5XBNU+Os0U9/R55b2ib4VqxrvREZYA0xVtaQvCZlnuPjZN75TfxbxWqwF21C4oe
 YAMvzOjsRG6G8LmqlFv+NTOxQVoYfx35iz4zx3sbiJjqhqDX+lNY5rgTC4QKYQkEl9
 IZfjazPJAf+/yljI/mTJYxoeaKONbB5fuEcLpViuBzwWGX/VuDtHe9vzY+d2jjCKVf
 87yrk9XM7Vle2KFw1r9aq26yH8tGzdhJE6vKmhCsp1KAXojIXQaWxlpuYeTc12TTlL
 e77+iQ8670fcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cw6P6xx/
Subject: Re: [Buildroot] [PATCH 1/3] package/opencv3: add patch to fix CMake
 4 build issue
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

On 26/12/2025 18:14, Thomas Petazzoni via buildroot wrote:
> Add a small patch to fix CMake 4 build issues. Unfortunately, while
> cmake/OpenCVMinDepVersions.cmake provides a MIN_VER_CMAKE that we
> could pass on the command line, cmake/OpenCVGenPkgconfig.cmake doesn't
> use it, so we anyway have to patch the package.
> 
> Since opencv3 is basically unmaintained, there is no point sending
> this patch upstream.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/cc857993920607958dd817c6a877ed9386c05738/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
