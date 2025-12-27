Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85009E8FDD0
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 11:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E0DE4068F;
	Sat, 27 Dec 2025 11:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EjUSrlelpRI9; Sat, 27 Dec 2025 11:32:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46870405FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766835158;
	bh=7t4u9XFhHY5xTB9Bz330WTpnIjq9l+1+4DQnQGspt4c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Oq4KXzEY4UWNtiSN7MSgFkFbEigpJ71NQxpO0kx+HNq13oVR54lCUjuiFu4vNlPVC
	 /30+6WxcNLgx6I4cnOQZZmYiJqJ79Q1b99s1AJUEBvF1F30cFc1pQudnpkVyoyhodP
	 QvpFuo6YYTbE77znVgDHnbmP7yW+6BIEelcs4ht4Qv11cY/c9mKvnmqexUk70uqRwd
	 NJPOlhniXACBwrAFVCziDFTZT0EEfiNqpgl+9Aj98CNrpj3rDYWv8PaBgsMHNMqwxa
	 Y08szQI9FSgrE0dv80hf/93AZTpNyVfIMUDL/0USIbjTtKvu8lfCufmqe3E4pPjQZ3
	 Rcg2WPHIsGHaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46870405FF;
	Sat, 27 Dec 2025 11:32:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A168EC
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0076540172
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WX7G9Ba4V2Jt for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 11:32:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 13649400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13649400FE
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13649400FE
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:32:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 07DC719F57B;
 Sat, 27 Dec 2025 12:32:32 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 27 Dec 2025 12:32:32 +0100
MIME-Version: 1.0
Date: Sat, 27 Dec 2025 12:32:32 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251225213258.416296-1-thomas.petazzoni@bootlin.com>
References: <20251225213258.416296-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <29c2c8f38901902571fdae4db891eb08@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766835154;
 bh=Icklh6Kj1inn7ZXPomVS0vqVAqy34lkSdXrjNIu6QLA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Qi2m1r5rPspXm1dHr4VAZmY8Tdl9/3zFlwkJqxN7/VEPNnTNbzFXsMozZtxWZp8zb
 c7JRQKlBIedbj6kszjuLKLcuAnMsqj+AmDVScBy5aRtCebC82LnRd4mNdtWguuwLCr
 I2LO4SlWhJnuWyXvxeWrvfmk8CXqFGY55arO4fvYaj7wA9em9+7vkT4NyhgvLynXWO
 4DWqJ1Ic92Alwzl9JxQvUoPk51+aYwzBG+crzuhK+lvUgFCPAO+ZKj/YayCticPA+b
 d58SBJC19B91otwyuNcQlSsX+GmRCSRco9xQ7QjbDkrnYireMAD24RnJpCwTllL0Sm
 alIy3wmjVxw1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Qi2m1r5r
Subject: Re: [Buildroot] [PATCH] package/freerdp: fix build with CMake >= 4
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

On 25/12/2025 22:32, Thomas Petazzoni via buildroot wrote:
> freerdp upstream is now at 3.x, far far ahead of what we're using in
> Buildroot at the moment. So to fix the CMake >= 4 build, we add a very
> simple non-upstreamable patch (upstream 3.x has a much higher CMake
> minimum version already).
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/51365593ad059325e1164d36fff06905d1c6e8af/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
