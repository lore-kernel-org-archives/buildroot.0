Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5C2E77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 14:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC9E960A58;
	Sun, 22 Dec 2024 14:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fU4TtvwmuaV; Sun, 22 Dec 2024 14:10:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F314A60AA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F314A60AA1;
	Sun, 22 Dec 2024 14:10:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0980D3
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB6024033F
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UL_yruZS8A0r for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 14:10:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C11D40106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C11D40106
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C11D40106
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:10:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E8FA3B0053E;
 Sun, 22 Dec 2024 15:10:48 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53540])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 15:10:48 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 15:10:48 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241219015418.262875-1-james.hilliard1@gmail.com>
References: <20241219015418.262875-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <5044040d69fccb66032c99047e3b8e23@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734876650;
 bh=gfwPDOV+v4zb7vArommTZTOihaeOdv7CuvhcKdg6gzo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gGtvSn+tLv+cQKfJD3awJAYcJ1sndJkC+/a84iuA1jfP7Mgkpe3Gcxa0vD+yw1a6E
 cd+lPjpVnubxD++L7f3Xmx3YFnGmAtwcOfjWDdfxP3g95KDn5+MrpBcJL5KDs+Sa50
 AQBsdfMtjjYDCtdBi6RiHFcdFH3dnUokF3L5PKV85Wst4oxkhMwwGgyl9AkG9gsqG1
 25Bfa2628zonCIGJTYGSawYJJgIGyCWc7v/L+xwsGeJoK5Poi5b1B2MQGwsQqyHWYW
 EI5aWcjrdUYVl2eBnSICmtAe5rKKHqgqRXeW3B9a0jS2cdiBmBaKE2okzeBlDbGBPl
 a/x6Gjre1IKTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gGtvSn+t
Subject: Re: [Buildroot] [PATCH 1/1] package/python-fastapi: bump to version
 0.115.6
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

On 19/12/2024 02:54, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-fastapi/python-fastapi.hash | 4 ++--
>  package/python-fastapi/python-fastapi.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-fastapi/python-fastapi.hash 
> b/package/python-fastapi/python-fastapi.hash
> index 6c7451ebd0..11e5837a3a 100644
> --- a/package/python-fastapi/python-fastapi.hash
> +++ b/package/python-fastapi/python-fastapi.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/fastapi/json
> -md5  feecf6d0db305d63ee9e6fcb77c81673  fastapi-0.115.4.tar.gz
> -sha256  
> db653475586b091cb8b2fec2ac54a680ac6a158e07406e1abae31679e8826349  
> fastapi-0.115.4.tar.gz
> +md5  977d2052173cde94dd66c669110c2ac4  fastapi-0.115.6.tar.gz
> +sha256  
> 9ec46f7addc14ea472958a96aae5b5de65f39721a46aaf5705c480d9a8b76654  
> fastapi-0.115.6.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  
> LICENSE
> diff --git a/package/python-fastapi/python-fastapi.mk 
> b/package/python-fastapi/python-fastapi.mk
> index 95eb565b23..9f275ad8a8 100644
> --- a/package/python-fastapi/python-fastapi.mk
> +++ b/package/python-fastapi/python-fastapi.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_FASTAPI_VERSION = 0.115.4
> +PYTHON_FASTAPI_VERSION = 0.115.6
>  PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
> -PYTHON_FASTAPI_SITE = 
> https://files.pythonhosted.org/packages/a9/db/5781f19bd30745885e0737ff3fdd4e63e7bc691710f9da691128bb0dc73b
> +PYTHON_FASTAPI_SITE = 
> https://files.pythonhosted.org/packages/93/72/d83b98cd106541e8f5e5bfab8ef2974ab45a62e8a6c5b5e6940f26d2ed4b
>  PYTHON_FASTAPI_SETUP_TYPE = pep517
>  PYTHON_FASTAPI_LICENSE = MIT
>  PYTHON_FASTAPI_LICENSE_FILES = LICENSE
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
