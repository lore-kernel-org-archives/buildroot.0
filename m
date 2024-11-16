Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC24D68BE7
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 17:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EBA160634;
	Sat, 16 Nov 2024 17:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_qgw0JAMwmo; Sat, 16 Nov 2024 17:39:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7833606E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7833606E8;
	Sat, 16 Nov 2024 17:39:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 729E21EB9
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 17:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53BCB606E8
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 17:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3qyzKGvw1zs for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 17:39:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 374E760634
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 374E760634
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 374E760634
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 17:39:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 81417780507;
 Sat, 16 Nov 2024 18:39:38 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42432])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 16 Nov 2024 18:39:38 +0100
MIME-Version: 1.0
Date: Sat, 16 Nov 2024 18:39:38 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20241115155921.29410-1-vjardin@free.fr>
References: <20241115155921.29410-1-vjardin@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <d0a4d750635e8050e7f1631a1951bb14@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731778779;
 bh=uvksJMEZUmuqKccHp/Vj1lU/Q3DGEFHtQ/3zIcdhbTA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WIF3J0aDSm41vqxCbUmvmFtBG7xfki1gyU7hd2yY9iWWMg8mrsbJhiyIDa5kkgRy1
 58o8UtOJ9kwm/c27HP0Eq8kvKSp7B1obhPmV/VqgNUb5xlFp8xM9yHfa+3U2lFMiHB
 mHa/Q85hcowK+iB0pX1N3bM8TBy/VaeIMwMgW6GMf1MVpVSQ7vsJoH0W91PXx999cP
 RaganZ8kmmY+OBa8WP8b7SjM2sW3SCohTh3Yu7+tBHHcwa0e9InHM/Ts106FvS8oPJ
 0L+53o1lJjFfuGLrnJYBWcfMTzsArADebHsIYBXSwZ7dCg95BcgiqlsfIbTin5x7Ij
 aiNECTa1VCIhA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WIF3J0aD
Subject: Re: [Buildroot] [PATCH 1/1] package/dpdk: install to staging
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

On 15/11/2024 16:59, Vincent Jardin wrote:
> It will be needed for the upcoming user packages
> that will use the DPDK.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Applied to next, thanks.

> ---
>  package/dpdk/dpdk.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
> index b685e12408..2200f5fa00 100644
> --- a/package/dpdk/dpdk.mk
> +++ b/package/dpdk/dpdk.mk
> @@ -35,6 +35,8 @@ DPDK_LICENSE_FILES = \
>  	license/exceptions.txt \
>  	license/mit.txt
> 
> +DPDK_INSTALL_STAGING = YES
> +
>  DPDK_DEPENDENCIES = \
>  	host-pkgconf \
>  	host-python-pyelftools
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
