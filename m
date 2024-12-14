Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84BEE7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 19:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84D5B60664;
	Sat, 14 Dec 2024 19:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HfQ8sZ-n1KNJ; Sat, 14 Dec 2024 19:02:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81504605E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81504605E7;
	Sat, 14 Dec 2024 19:02:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B1B40C5
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 19:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0876600C7
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 19:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 57wRZemCNpSO for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 19:02:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 85CEF605CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85CEF605CA
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85CEF605CA
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 19:02:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 95CE42003C1;
 Sat, 14 Dec 2024 20:02:28 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56938])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Dec 2024 20:02:28 +0100
MIME-Version: 1.0
Date: Sat, 14 Dec 2024 20:02:28 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20241214161213.3283227-1-bernd@kuhls.net>
References: <20241214161213.3283227-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <0592c80c1ca0ca61dcbdb3dbb506e959@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734202949;
 bh=zzKJW+iusiIrCeFuLgyG11aISjEpaR0hsikrDS+j3gw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vAh701p4wNougxmSBt7NHua/CG9QOsfQ46L3QnGPjvsfsUmGHuoMWJJvbE1J5cUT4
 xrlSQEB2jYkbPDEmxhJpF2IV56KpErlMMhIg6GuAWmUxPrJ7eEfPwhR+MTarLV4kf3
 +8BMtxUFJoSmdJ6W3m+q9xzSvGlHfweqmVX36+/7Zl8ZbpxtH/zt1fBYVnEYFqHPwV
 fpLHw6qJi/sagdIs86dr6PZIPmHZQGr39AHucMTNmUvmAKY6wmaYfI8kzrmeTiC/xa
 EItpNiwJ7lik4LXSUoA9uQ3zOcNzct69qqW8s64IpdT6D6zBekmUyiO0jcFZ7vH2Om
 BD0SccyhDChmA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vAh701p4
Subject: Re: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.47.2
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

On 14/12/2024 17:12, Bernd Kuhls wrote:
> Release notes: https://sqlite.org/releaselog/3_47_2.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

> ---
>  package/sqlite/sqlite.hash | 2 +-
>  package/sqlite/sqlite.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
> index ba2c0956d8..788e89f99d 100644
> --- a/package/sqlite/sqlite.hash
> +++ b/package/sqlite/sqlite.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  
> 83eb21a6f6a649f506df8bd3aab85a08f7556ceed5dbd8dea743ea003fc3a957  
> sqlite-autoconf-3470000.tar.gz
> +sha256  
> f1b2ee412c28d7472bc95ba996368d6f0cdcf00362affdadb27ed286c179540b  
> sqlite-autoconf-3470200.tar.gz
>  sha256  
> 66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  
> tea/license.terms
> diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
> index e6d681e501..30505a9dbc 100644
> --- a/package/sqlite/sqlite.mk
> +++ b/package/sqlite/sqlite.mk
> @@ -4,8 +4,8 @@
>  #
>  
> ################################################################################
> 
> -SQLITE_VERSION = 3.47.0
> -SQLITE_TAR_VERSION = 3470000
> +SQLITE_VERSION = 3.47.2
> +SQLITE_TAR_VERSION = 3470200
>  SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
>  SQLITE_SITE = https://www.sqlite.org/2024
>  SQLITE_LICENSE = blessing
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
