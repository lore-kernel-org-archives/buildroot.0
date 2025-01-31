Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7417C0218D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 09:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 771E183B4E;
	Fri, 31 Jan 2025 09:42:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4xVkVEmD-CFb; Fri, 31 Jan 2025 09:42:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75F4983B4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75F4983B4B;
	Fri, 31 Jan 2025 09:42:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10E2416C
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 09:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF4F840B0A
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 09:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrvQwADYLDBV for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 09:42:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 67DE9400BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67DE9400BB
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67DE9400BB
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 09:42:01 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id 26F7E440F80;
 Fri, 31 Jan 2025 11:36:49 +0200 (IST)
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Cc: Christian Stewart <christian@aperture.us>,  Joachim Wiberg
 <troglobit@gmail.com>,  Tian Yuanhao <tianyuanhao3@163.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250131054001.74407-1-christian@aperture.us> (Christian Stewart
 via buildroot's message of "Thu, 30 Jan 2025 21:40:01 -0800")
References: <20250131054001.74407-1-christian@aperture.us>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 31 Jan 2025 11:41:56 +0200
Message-ID: <87zfj7721n.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1738316209;
 bh=VUtH5a+wLroaUS88AiUq2sucwfDtYGypeFhvdWYsz3w=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=k8HU/ysALGU6+19KGMO5pt+vBIsPLVJJiq9x5CyFNNM0BC1rUAlYYTs5sBy7JyS0D
 W8upnLIJVSUzTxCT7KutG3AOoLjm8yqhAOx7epARRoN38u/S3qlUEIjJOINaVs2+Qq
 e7b6PAVEa5NugRjebh7oLfMEjUiJBCY3QpgSnX5t4v5nKJge2zVsVZKMU6wHYyhnSo
 IJe3d543D+3/W89rw6wElGp0yrclzAUOglHYBOJnbaa4ZEZMB6EKIbXkMegsz8lUnS
 OIeaMVDd7n4iGt6JA81ZDxo4N+Mc8q9VvVYrhKupQcKa/cmLpgpAdmc6Q+smNp5pIA
 5kc2t3Zoyplsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=k8HU/ysA
Subject: Re: [Buildroot] [PATCH v1 1/1] package/containerd: bump to version
 v2.0.2
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Christian,

On Thu, Jan 30 2025, Christian Stewart via buildroot wrote:
> Major release v1 -> v2.
>
> Dropped patch as it is no longer necessary:
> https://github.com/containerd/containerd/pull/8924

Which patch is dropped? I don't see any below.

baruch

> containerd-shim and containerd-shim-runc-v1 were removed.
>
> https://github.com/containerd/containerd/releases/tag/v2.0.2
>
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/containerd/containerd.hash | 2 +-
>  package/containerd/containerd.mk   | 6 ++----
>  2 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
> index e3f8434192..4ec78897d9 100644
> --- a/package/containerd/containerd.hash
> +++ b/package/containerd/containerd.hash
> @@ -1,3 +1,3 @@
>  # Computed locally
> -sha256  393bfde8ca1766a0bca3441e18eddc3f5a5c8d97ef676bde0d6c9903e1b0ec0c  containerd-1.7.23-go2.tar.gz
> +sha256  472747a7a6b360a0864bab0ee00a8a6f51da5795171e6a60ab17aa80cbd850a2  containerd-2.0.2-go2.tar.gz
>  sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
> diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
> index 88b53caf51..ee07c22495 100644
> --- a/package/containerd/containerd.mk
> +++ b/package/containerd/containerd.mk
> @@ -4,21 +4,19 @@
>  #
>  ################################################################################
>  
> -CONTAINERD_VERSION = 1.7.23
> +CONTAINERD_VERSION = 2.0.2
>  CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
>  CONTAINERD_LICENSE = Apache-2.0
>  CONTAINERD_LICENSE_FILES = LICENSE
>  CONTAINERD_CPE_ID_VENDOR = linuxfoundation
>  
> -CONTAINERD_GOMOD = github.com/containerd/containerd
> +CONTAINERD_GOMOD = github.com/containerd/containerd/v2
>  
>  CONTAINERD_LDFLAGS = \
>  	-X $(CONTAINERD_GOMOD)/version.Version=$(CONTAINERD_VERSION)
>  
>  CONTAINERD_BUILD_TARGETS = \
>  	cmd/containerd \
> -	cmd/containerd-shim \
> -	cmd/containerd-shim-runc-v1 \
>  	cmd/containerd-shim-runc-v2 \
>  	cmd/ctr

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
