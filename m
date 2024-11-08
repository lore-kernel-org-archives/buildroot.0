Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC6FD64072
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 18:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B75E846F8;
	Fri,  8 Nov 2024 18:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfoNGVa6MyW0; Fri,  8 Nov 2024 18:22:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CBE6846F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CBE6846F7;
	Fri,  8 Nov 2024 18:22:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61CF5D8F
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 18:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42B96846F8
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 18:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Za9xpaptwXfO for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 18:22:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB24C846F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB24C846F7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB24C846F7
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 18:22:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5873119F72F;
 Fri,  8 Nov 2024 19:22:18 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46624])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 Nov 2024 19:22:18 +0100
MIME-Version: 1.0
Date: Fri, 08 Nov 2024 19:22:18 +0100
From: Julien Olivain <ju.o@free.fr>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20241108050442.191767-1-fido_max@inbox.ru>
References: <20241108050442.191767-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.9
Message-ID: <f70c8febbb5fdbbec918741e88abf7af@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731090139;
 bh=SiuboaWM7X1b6aCXMGlRzQmH9sw/c6GEv8A7z0D1P1E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mKLatAuo3FcanOcw3dqIBC8AB/6ga64QxYb5k165R35KLqd9BjpUe6Aro5tOTgiYs
 o9ItoFsMUtOsVI4Y3rvc0fcHh0IU8W3k0m6r3ut3uDO9zgX6N3vi1eUx5+uZLFwnN/
 YjZYGxjWzrh+jfAUoBd/+Ew9tY5ts9/XtUJ8doPJPtpr78wwzvKoPmLRJGUc7K6iAQ
 Z9pQs+tRhN+hdCFKiGb5pCBYVqVDmwHGSwzGw7H+j6GADwpp5Wq6WQWeVpj3c6GHxG
 BtGM+kNRRvrXbF0Zo8TNtplwJ3ci+75ebPEA+ajMtJgvWqBx0pntCtrCe+ifKkU40L
 hG6uru00eVFWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mKLatAuo
Subject: Re: [Buildroot] [PATCH 1/1] package/postgis: bump to version 3.5.0
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

On 08/11/2024 06:04, Maxim Kochetkov via buildroot wrote:
> Changelog: https://github.com/postgis/postgis/blob/3.4.2/NEWS
> 
> Licenses updates:
> - extensions/address_goecoder is released under MIT License
>  
> https://github.com/postgis/postgis/commit/12b699aebaa4cb817adacfba8ea48dba2d5204f5
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to master, thanks.

> ---
>  package/postgis/postgis.hash | 4 ++--
>  package/postgis/postgis.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/postgis/postgis.hash 
> b/package/postgis/postgis.hash
> index 7e62e8e168..9e283f5ac7 100644
> --- a/package/postgis/postgis.hash
> +++ b/package/postgis/postgis.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  
> c8c874c00ba4a984a87030af6bf9544821502060ad473d5c96f1d4d0835c5892  
> postgis-3.4.2.tar.gz
> -sha256  
> 2a3bde0a77224496ea6d8efa686da7e29ab0dd6b1a8f90ba12beaf7ae28e878a  
> LICENSE.TXT
> +sha256  
> ca698a22cc2b2b3467ac4e063b43a28413f3004ddd505bdccdd74c56a647f510  
> postgis-3.5.0.tar.gz
> +sha256  
> 81749eea887e78402c9b85896cd629b155bc29256927f818f01001f038146391  
> LICENSE.TXT
> diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
> index 867aa4caea..a2b121e6f5 100644
> --- a/package/postgis/postgis.mk
> +++ b/package/postgis/postgis.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -POSTGIS_VERSION = 3.4.2
> +POSTGIS_VERSION = 3.5.0
>  POSTGIS_SITE = https://download.osgeo.org/postgis/source
>  # parallel build issues
>  POSTGIS_MAKE = $(MAKE1)
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
