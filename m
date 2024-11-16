Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48050D68BF5
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 18:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 038E74248D;
	Sat, 16 Nov 2024 18:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dY5tjkWHkvDW; Sat, 16 Nov 2024 18:38:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C79564248E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C79564248E;
	Sat, 16 Nov 2024 18:38:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A8998B14
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 18:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8952D41FD4
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 18:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Y8NuKB4bfFb for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 18:38:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 54E0E4248D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54E0E4248D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54E0E4248D
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 18:38:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0B26B5FFA3;
 Sat, 16 Nov 2024 19:38:39 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50628])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 16 Nov 2024 19:38:39 +0100
MIME-Version: 1.0
Date: Sat, 16 Nov 2024 19:38:39 +0100
From: Julien Olivain <ju.o@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org, "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20241114223356.1629969-1-petr.vorel@gmail.com>
References: <20241114223356.1629969-1-petr.vorel@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <06e284c9484b53541184b29c1edb54f6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731782322;
 bh=Om3/PI9Cn4Jmr8dRu5wPqkV3t5RW0dtNX1/IUPVdmEE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k1VEXXVyr9dQh41U3HSP3gxgcEAdEWkwrfWgyAzCf/VEFDI23SyTGyiOa9nRt26GX
 HOim76IAkvhU7xjgJ4A+jLK7+lHmsHXxSH17yq9o243Q7dWKVj0+p145VFcHsJJ1is
 IAVJ/LyBlHKRnZqI31wGlm+/vTOdd5BE8DeREOZPZr+tHocRevHMj2s8mt+4XuWzIQ
 c7oMUtCUbjLEglnVwbmaM6SKF8m1SU3BmQ2IeN61peLoat8QXdINE4g1szQcE5Qka2
 OVhivANewcZuviyO4Zujfp7kZpxiUQ7/myC88lInyfl5Z3l/rA5BhJSD7Dcpgu1bvc
 +kgHbslB766MA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=k1VEXXVy
Subject: Re: [Buildroot] [PATCH 1/1] package/ltp-testsuite: bump version to
 20240930
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

On 14/11/2024 23:33, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to next, thanks.

> ---
> Hi,
> 
> Tested:
>                     bootlin-armv5-uclibc [1/6]: OK
>                      bootlin-armv7-glibc [2/6]: OK
>                    bootlin-armv7m-uclibc [3/6]: SKIPPED
>                      bootlin-x86-64-musl [4/6]: SKIPPED
>                       br-arm-full-static [5/6]: OK
>                              arm-aarch64 [6/6]: OK
> 
> Kind regards,
> Petr
> 
>  package/ltp-testsuite/ltp-testsuite.hash | 4 ++--
>  package/ltp-testsuite/ltp-testsuite.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ltp-testsuite/ltp-testsuite.hash 
> b/package/ltp-testsuite/ltp-testsuite.hash
> index 03aa586156..41915cd817 100644
> --- a/package/ltp-testsuite/ltp-testsuite.hash
> +++ b/package/ltp-testsuite/ltp-testsuite.hash
> @@ -1,4 +1,4 @@
> -# From: 
> https://github.com/linux-test-project/ltp/releases/download/20240524/ltp-full-20240524.tar.xz.sha256
> -sha256  
> 2b7c07bb281b7ec49981eeb06c4b66f147b103977254632678d384034f6e9663  
> ltp-full-20240524.tar.xz
> +# From: 
> https://github.com/linux-test-project/ltp/releases/download/20240930/ltp-full-20240930.tar.xz.sha256
> +sha256  
> 3e9e806405aa602e2d21d221d885fd4914ff2da23eb8bba3d0f0f468bdf60238  
> ltp-full-20240930.tar.xz
>  # Locally computed
>  sha256  
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  
> COPYING
> diff --git a/package/ltp-testsuite/ltp-testsuite.mk 
> b/package/ltp-testsuite/ltp-testsuite.mk
> index bbeb80c732..417052eae7 100644
> --- a/package/ltp-testsuite/ltp-testsuite.mk
> +++ b/package/ltp-testsuite/ltp-testsuite.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LTP_TESTSUITE_VERSION = 20240524
> +LTP_TESTSUITE_VERSION = 20240930
>  LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
>  LTP_TESTSUITE_SITE = 
> https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
> 
> --
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
