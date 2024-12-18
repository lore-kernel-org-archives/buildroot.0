Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B08E77188
	for <buildroot@archiver.kernel.org>; Wed, 18 Dec 2024 23:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82E99426A3;
	Wed, 18 Dec 2024 23:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TkpFClQj87ct; Wed, 18 Dec 2024 23:04:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E57984269E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E57984269E;
	Wed, 18 Dec 2024 23:03:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DB78E3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 23:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF84A42681
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 23:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_VepoQcbZ_s for <buildroot@buildroot.org>;
 Wed, 18 Dec 2024 23:03:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3BA124269E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BA124269E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BA124269E
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 23:03:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C024813F861;
 Thu, 19 Dec 2024 00:03:50 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51728])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 19 Dec 2024 00:03:50 +0100
MIME-Version: 1.0
Date: Thu, 19 Dec 2024 00:03:50 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Vincent Jardin <vjardin@free.fr>
In-Reply-To: <20241218220907.762527-1-peter@korsgaard.com>
References: <20241218220907.762527-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <347c6f7297fe983edb7a5658a19605e0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734563033;
 bh=g1bcSTvX4kncuyVBhxmgbVFvoRG+ijWHG6HLoUZ5b0A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ARygTY2vnP28i1jjpdZ7wrScR8uJiZGnB8Wp3P/GuN6F8cXGGCWVClSY1I3cLpJwi
 LPQiD2GjD8rMEVkQ3s8mVLsMRzWkSKo1HfvX4e9JieA2djFamjOYxsxB+YxOOazkf4
 AFwoHcq8sNvs8aJJHIeUS6Xff7X150VLn3uA0T5X6zipCcO3Xbs+quYH9ucLk/S1ne
 EsCajCTZgq9UP10cO3fXCSNjui5n6C07XbfJwk6lMETwRd78kFIO8gffgtUpoeiGhA
 5A5ycFEjSjFtWhNGdeHB29w9ZTr7k6cdbzPKFyKh8kdJx0e/H8Bf1T9KM/eq/96b9y
 g3PLXTu4mSbdw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ARygTY2v
Subject: Re: [Buildroot] [PATCH] package/dpdk: security bump to version
 24.11.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 18/12/2024 23:09, Peter Korsgaard wrote:
> Fixes the following security issue:
> 
> CVE-2024-11614: An out-of-bounds read vulnerability was found in DPDK's
> Vhost library checksum offload feature.  This issue enables an 
> untrusted or
> compromised guest to crash the hypervisor's vSwitch by forging Virtio
> descriptors to cause out-of-bounds reads.  This flaw allows an attacker 
> with
> a malicious VM using a virtio driver to cause the vhost-user side to 
> crash
> by sending a packet with a Tx checksum offload request and an invalid
> csum_start offset.
> 
> https://www.openwall.com/lists/oss-security/2024/12/17/3
> 
> Release notes: 
> http://doc.dpdk.org/guides-24.11/rel_notes/release_24_11.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

> ---
>  package/dpdk/dpdk.hash | 2 +-
>  package/dpdk/dpdk.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
> index 27c06476e7..e9a22736b0 100644
> --- a/package/dpdk/dpdk.hash
> +++ b/package/dpdk/dpdk.hash
> @@ -1,5 +1,5 @@
>  # Locally computed
> -sha256  
> 9944f7e5f268e7ac9b4193e2cd54ef6d98f6e1d7dddc967c77ae4f6616d6fbbd  
> dpdk-24.07.tar.xz
> +sha256  
> bcae7d42c449fc456dfb279feabcbe0599a29bebb2fe2905761e187339d96b8e  
> dpdk-24.11.1.tar.xz
>  sha256  
> 9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  
> license/bsd-3-clause.txt
>  sha256  
> e19808bccd90c238fac06da2fc3683e094c64f7ba647e9d86f03a98cf5f2ce05  
> license/exceptions.txt
>  sha256  
> 6c54c4d44faf3cba829b3d0c21c6955953e758767018fd7244f809b01d4f4845  
> license/mit.txt
> diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
> index 2200f5fa00..0cbdc67e87 100644
> --- a/package/dpdk/dpdk.mk
> +++ b/package/dpdk/dpdk.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -DPDK_VERSION = 24.07
> +DPDK_VERSION = 24.11.1
>  DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
>  DPDK_SITE = https://fast.dpdk.org/rel
>  DPDK_LICENSE = \
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
