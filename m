Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5CEE77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 14:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CDE18087B;
	Sun, 22 Dec 2024 14:11:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmmGQ0-YH3Q8; Sun, 22 Dec 2024 14:11:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39C6B8201F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39C6B8201F;
	Sun, 22 Dec 2024 14:11:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 30EF1D3
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BA4D60AF4
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YKvSYMlJVz5O for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 14:11:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 273AF60AC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 273AF60AC6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 273AF60AC6
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:11:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 023D52003B4;
 Sun, 22 Dec 2024 15:11:50 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53540])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 15:11:50 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 15:11:50 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241219021056.273976-1-james.hilliard1@gmail.com>
References: <20241219021056.273976-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <7e7136137ee66f6bc9bac193d4fefbde@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734876712;
 bh=id3qpabipuKHiJd9JBQ+3q3sHwqQ2NFkJ4GbkIUgn/Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k4dDk/HpvJvbjxDmo+is21rE1SNBUMPPGBW6oimDIKts7WCAM9LGcrKoTK3PCkh8P
 PE7aKqNFJkqFPoaOHq2BQgynHBshk0CkTiCcAt8Lo27TZFlam92gzPLsNVhXBMokl3
 NcywQd+QFW04OBhFALHmVEIqWH817seoHzGfhooVUnimbAE/twNaHAOvImI8eMg1r9
 T4O4oVukUfGsAdvzZLnytK0cn3grZmLUq2Q1MwrgbIf2fLgEX06tXQTqOe4rLa+4EE
 A2GwzMratjuf+cHDS87awxM77NZriwHTpGGNRrwF8kPVj7rv0+/Hq5KEtmYS4tsXnx
 +fyUlLLo1oUnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=k4dDk/Hp
Subject: Re: [Buildroot] [PATCH 1/1] package/python-multipart: bump to
 version 0.0.20
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

On 19/12/2024 03:10, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-multipart/python-multipart.hash | 4 ++--
>  package/python-multipart/python-multipart.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-multipart/python-multipart.hash 
> b/package/python-multipart/python-multipart.hash
> index d68be9e0e3..594c7cd497 100644
> --- a/package/python-multipart/python-multipart.hash
> +++ b/package/python-multipart/python-multipart.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/python-multipart/json
> -md5  7051f07d9645d3f2e72c0a889329057b  python_multipart-0.0.17.tar.gz
> -sha256  
> 41330d831cae6e2f22902704ead2826ea038d0419530eadff3ea80175aec5538  
> python_multipart-0.0.17.tar.gz
> +md5  fa3ee0a8ee83e24b66ab40a841922244  python_multipart-0.0.20.tar.gz
> +sha256  
> 8dd0cab45b8e23064ae09147625994d090fa46f5b0d1e13af944c331a7fa9d13  
> python_multipart-0.0.20.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> a8e833176cd617daf00b9d6d39fa15ca8edebc6d1643079cd2f4893c0c289be2  
> LICENSE.txt
> diff --git a/package/python-multipart/python-multipart.mk 
> b/package/python-multipart/python-multipart.mk
> index 1f8d581d68..8c49e2df9c 100644
> --- a/package/python-multipart/python-multipart.mk
> +++ b/package/python-multipart/python-multipart.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_MULTIPART_VERSION = 0.0.17
> +PYTHON_MULTIPART_VERSION = 0.0.20
>  PYTHON_MULTIPART_SOURCE = 
> python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
> -PYTHON_MULTIPART_SITE = 
> https://files.pythonhosted.org/packages/40/22/edea41c2d4a22e666c0c7db7acdcbf7bc8c1c1f7d3b3ca246ec982fec612
> +PYTHON_MULTIPART_SITE = 
> https://files.pythonhosted.org/packages/f3/87/f44d7c9f274c7ee665a29b885ec97089ec5dc034c7f3fafa03da9e39a09e
>  PYTHON_MULTIPART_SETUP_TYPE = hatch
>  PYTHON_MULTIPART_LICENSE = Apache-2.0
>  PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
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
