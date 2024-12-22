Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA50BE77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 14:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7660A80BA4;
	Sun, 22 Dec 2024 14:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hn6gdYyXN2vz; Sun, 22 Dec 2024 14:15:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 803B0829FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 803B0829FD;
	Sun, 22 Dec 2024 14:15:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FF7B5E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E48194298C
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hsf7kSV0rAWY for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 14:15:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D065B41564
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D065B41564
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D065B41564
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:15:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 41D635FFB1;
 Sun, 22 Dec 2024 15:15:05 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56276])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 15:15:05 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 15:15:05 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20241219024926.295334-1-james.hilliard1@gmail.com>
References: <20241219024926.295334-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <fdcd59420a9e5d1ba7d0d9c47ad82dcf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734876907;
 bh=1LK28yL8uFr9iczEUIgDr1dI2BoS9048cHgh1/+1jLc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PYFbaDMUDPNZEFuRwMyilXF9Co8VNLWVgPlxkTEDOdg5NNNXhiVIvnD3ki3iDBCsn
 IcUocjSnMtbJYjyEyjuWeVGHcdVO78PJ22Q3MztEnUs8LjtqEI2dt5q5kUASbIpjIn
 J3I19WycJsPMq8LBc+G1WDpcBU0h1bVGKEe5j+3bBfrS+ewZSiPR5plGqzOZbbcKwC
 8aIi9dzclQgYUHcbvRs7DNcnzQQJN+vVBbAsDUu47llAXD60tQdGxI0DuC/nRXSgov
 vAdVzYxY579DDkj3NPTiP87vF5FUm0w8YiDjb58YH3CTeUBd7sAUtOxkOaOak2aPmd
 QDmw0ItWHXBIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PYFbaDMU
Subject: Re: [Buildroot] [PATCH 1/1] package/python-websockets: bump to
 version 14.1
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

On 19/12/2024 03:49, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-websockets/python-websockets.hash | 4 ++--
>  package/python-websockets/python-websockets.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-websockets/python-websockets.hash 
> b/package/python-websockets/python-websockets.hash
> index 5d24d5f6c4..4ecc4868ad 100644
> --- a/package/python-websockets/python-websockets.hash
> +++ b/package/python-websockets/python-websockets.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/websockets/json
> -md5  ff1293b549e8177a5272e54208659d0d  websockets-13.1.tar.gz
> -sha256  
> a3b3366087c1bc0a2795111edcadddb8b3b59509d5db5d7ea3fdd69f954a8878  
> websockets-13.1.tar.gz
> +md5  eaef5161b6d36f8f66a1328c7e3bde7f  websockets-14.1.tar.gz
> +sha256  
> 398b10c77d471c0aab20a845e7a60076b6390bfdaac7a6d2edb0d2c59d75e8d8  
> websockets-14.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 3d6a0c050d8bec52fabad502e45fb25bd02bcadbd70dea34d447b6a0ff4e6da8  
> LICENSE
> diff --git a/package/python-websockets/python-websockets.mk 
> b/package/python-websockets/python-websockets.mk
> index 6fbdf983e9..f918bba383 100644
> --- a/package/python-websockets/python-websockets.mk
> +++ b/package/python-websockets/python-websockets.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_WEBSOCKETS_VERSION = 13.1
> +PYTHON_WEBSOCKETS_VERSION = 14.1
>  PYTHON_WEBSOCKETS_SOURCE = 
> websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
> -PYTHON_WEBSOCKETS_SITE = 
> https://files.pythonhosted.org/packages/e2/73/9223dbc7be3dcaf2a7bbf756c351ec8da04b1fa573edaf545b95f6b0c7fd
> +PYTHON_WEBSOCKETS_SITE = 
> https://files.pythonhosted.org/packages/f4/1b/380b883ce05bb5f45a905b61790319a28958a9ab1e4b6b95ff5464b60ca1
>  PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
>  PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
>  PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
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
