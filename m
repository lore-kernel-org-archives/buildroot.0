Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC513CCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 20:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E9226067B;
	Tue, 14 Oct 2025 20:10:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qauYUURbncrn; Tue, 14 Oct 2025 20:10:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5C7A60782
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5C7A60782;
	Tue, 14 Oct 2025 20:10:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F2A214C4
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D978D4009D
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:10:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mYZHcnHE5ik3 for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 20:10:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D6C844007E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6C844007E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6C844007E
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:10:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 25A3F2003DC;
 Tue, 14 Oct 2025 22:09:58 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Oct 2025 22:09:58 +0200
MIME-Version: 1.0
Date: Tue, 14 Oct 2025 22:09:58 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Grzegorz Blach <grzegorz@blach.pl>, James
 Hilliard <james.hilliard1@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
In-Reply-To: <20251012202002.178080-17-bernd@kuhls.net>
References: <20251012202002.178080-1-bernd@kuhls.net>
 <20251012202002.178080-17-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <4c2f8e3f810afeaabe2249f7cf8a119a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760472603;
 bh=iVw6Gi3FHjNzVEpP80sYaGg9Z8ffRofLNe2W2UVy/jk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GThqmTYabNxsx3eF3vTskzcnicJ/6565CXgqWpB30EkPCg0XkL8s2LvwuMdl2uoFu
 mw3IZM673ts4BQalmWiBtWCtl4FHd0WvdEsFOHtpzMlWRacMnEHujhGPuw6B0LNPnb
 aeqiCyhtTH9DkfkLJpxeNXaWYwP/enoXB3oqeIqeGqsB2taTyXv4pPyWs7vn6DnHYy
 JQiZJbPKVcaqDeRJ4zuNHJUT03VYUw8PMipusuIvk0JdPLS1GHDu/FG+QmGaoRBGWj
 pU1XBHt6pzOrh1waCdXbhhcG+bbhABFzerdO1KnXyI7ssCULD8JdlZKskfeSLmVZ3y
 l8IUYERGezbTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GThqmTYa
Subject: Re: [Buildroot] [PATCH 17/23] package/python-lmdb: bump version to
 1.7.3
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

Hi Bernd,

Thanks for the patch.

On 12/10/2025 22:19, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/python-lmdb/python-lmdb.hash | 4 ++--
>  package/python-lmdb/python-lmdb.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-lmdb/python-lmdb.hash 
> b/package/python-lmdb/python-lmdb.hash
> index f729c197f8..b9812e8996 100644
> --- a/package/python-lmdb/python-lmdb.hash
> +++ b/package/python-lmdb/python-lmdb.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/lmdb/json
> -md5  f9d67b42a6d708ec1cfc860f67e20387  lmdb-1.6.2.tar.gz
> -sha256  
> d28e3fa59935ff688858760ec52f202ecb8c1089a3f68d1f162ea3078d151e73  
> lmdb-1.6.2.tar.gz
> +md5  82026a4a05f5add80fa70462a26851d1  lmdb-1.7.3.tar.gz
> +sha256  
> d4a27b7af4fe38f3409d9fbfbf47b617b3d94dee98a00bc8c2a8336ccd3f9b15  
> lmdb-1.7.3.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  
> LICENSE
> diff --git a/package/python-lmdb/python-lmdb.mk 
> b/package/python-lmdb/python-lmdb.mk
> index 1648ed7054..8005b5f8a1 100644
> --- a/package/python-lmdb/python-lmdb.mk
> +++ b/package/python-lmdb/python-lmdb.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_LMDB_VERSION = 1.6.2
> +PYTHON_LMDB_VERSION = 1.7.3

Trying to build with new version with commands:

     cat >.config <<EOF
     BR2_aarch64=y
     BR2_TOOLCHAIN_EXTERNAL=y
     BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
     BR2_PACKAGE_PYTHON3=y
     BR2_PACKAGE_PYTHON_LMDB=y
     EOF
     make olddefconfig
     make python-lmdb

fails with error:

     ERROR Missing dependencies:
	    cffi>=0.8
	    patch-ng

Could you have a look please?

>  PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
> -PYTHON_LMDB_SITE = 
> https://files.pythonhosted.org/packages/71/54/fb1d5918406a72fcf46fbfaece7c0349d88cd8685f5443a142ddd7dac05b
> +PYTHON_LMDB_SITE = 
> https://files.pythonhosted.org/packages/5e/87/b6f8bccab1ec1fe58866108c0da648715bc1488627edf9702dae6380613a
>  PYTHON_LMDB_LICENSE = OLDAP-2.8
>  PYTHON_LMDB_LICENSE_FILES = LICENSE
>  PYTHON_LMDB_CPE_ID_VENDOR = py-lmdb_project
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
