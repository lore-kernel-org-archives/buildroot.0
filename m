Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9088EE7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EA3360831;
	Fri, 27 Dec 2024 14:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5YuMlBgKx2Xl; Fri, 27 Dec 2024 14:36:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 496BC607CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 496BC607CF;
	Fri, 27 Dec 2024 14:36:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EDBAE0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17AE240B0D
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_rI1c_gMcMB for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:36:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CAC8840582
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAC8840582
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CAC8840582
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:36:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 11170B00583;
 Fri, 27 Dec 2024 15:36:17 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56784])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:36:17 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:36:17 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241223145716.1722689-1-james.hilliard1@gmail.com>
References: <20241223145716.1722689-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <72a826cb08eebd29cc77351f2cc582b5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310179;
 bh=ctsINrbQMno5ZJiRAx9Ri0yQBEgwuafmrFAG8XeSPFw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pUrtbMhgV8qeOnit1opJ0BaQC6popAeiFeP53Kaxzth9U7wcZz3HJ0N6hKw4E6K8Q
 b84S/6umseBaKwK0FsG7CZqaIPQ4QEFbaMmnTU4iNhleXztRKoEv0wRRU3kzmJdPul
 C4FD6HtewAQbdF4wo0Fmw7ftLBj5VvEPQpe9fmnvLUpNEeeE2G77/UclKXIudCQhnG
 qRxi3rQAMLtvo2JW4+oHc/aw0QzMvNkTYfyKghChdDhkLBxVSRREoJx7kpzgNr9WbL
 hGWy7dsxgIjYZ6ZPYqNWYXCTdwMR70nTtq8sgjWfqfVtOL/RQVkunKJo8AOUiLXYVU
 pTy96gOVPKBiw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pUrtbMhg
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiosignal: bump to
 version 1.3.2
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

On 23/12/2024 15:57, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-aiosignal/python-aiosignal.hash | 4 ++--
>  package/python-aiosignal/python-aiosignal.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aiosignal/python-aiosignal.hash 
> b/package/python-aiosignal/python-aiosignal.hash
> index 061816a66e..53c7bbf51d 100644
> --- a/package/python-aiosignal/python-aiosignal.hash
> +++ b/package/python-aiosignal/python-aiosignal.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/aiosignal/json
> -md5  2a15f4008b899377590cef4773020902  aiosignal-1.3.1.tar.gz
> -sha256  
> 54cd96e15e1649b75d6c87526a6ff0b6c1b0dd3459f43d9ca11d48c339b68cfc  
> aiosignal-1.3.1.tar.gz
> +md5  b40f0e0d5d442b6c1bc79e4e4c8eb7a6  aiosignal-1.3.2.tar.gz
> +sha256  
> a8c255c66fafb1e499c9351d0bf32ff2d8a0321595ebac3b93713656d2436f54  
> aiosignal-1.3.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  
> LICENSE
> diff --git a/package/python-aiosignal/python-aiosignal.mk 
> b/package/python-aiosignal/python-aiosignal.mk
> index ffd581cfba..9e8597f504 100644
> --- a/package/python-aiosignal/python-aiosignal.mk
> +++ b/package/python-aiosignal/python-aiosignal.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_AIOSIGNAL_VERSION = 1.3.1
> +PYTHON_AIOSIGNAL_VERSION = 1.3.2
>  PYTHON_AIOSIGNAL_SOURCE = aiosignal-$(PYTHON_AIOSIGNAL_VERSION).tar.gz
> -PYTHON_AIOSIGNAL_SITE = 
> https://files.pythonhosted.org/packages/ae/67/0952ed97a9793b4958e5736f6d2b346b414a2cd63e82d05940032f45b32f
> +PYTHON_AIOSIGNAL_SITE = 
> https://files.pythonhosted.org/packages/ba/b5/6d55e80f6d8a08ce22b982eafa278d823b541c925f11ee774b0b9c43473d
>  PYTHON_AIOSIGNAL_SETUP_TYPE = setuptools
>  PYTHON_AIOSIGNAL_LICENSE = Apache-2.0
>  PYTHON_AIOSIGNAL_LICENSE_FILES = LICENSE
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
