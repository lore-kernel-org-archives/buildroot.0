Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E171E77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 14:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F2FD8087B;
	Sun, 22 Dec 2024 14:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2lIedLanuOnx; Sun, 22 Dec 2024 14:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 384D481E4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 384D481E4C;
	Sun, 22 Dec 2024 14:11:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 99FC45E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 866BA4298C
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDSgiO0svwMh for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 14:11:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C76B4138E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C76B4138E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C76B4138E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:11:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 49BCCB00535;
 Sun, 22 Dec 2024 15:11:06 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53540])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 15:11:06 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 15:11:06 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241219015742.266634-1-james.hilliard1@gmail.com>
References: <20241219015742.266634-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <080ea8a5bd0079e9976fbb63b1b7b904@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734876667;
 bh=zopv3MBaCg8oWYlbJLLKv1/dQJrEeqFgif5dbCtANH0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=esmjscZMpfWA/fTGgwofM464IF9/GCvR5CvqGzMUNJLbORD3rl4Ndq/zPODYI4nX7
 FdumXr9jhFigMy8oQZ4dda40kUtPBUuSWBK5lMnUN6i0pOp8Voia5T78ajsY93HIMC
 yi0gvo46mTgBSGhAeDuqsnrtufHPBc/3Td3RHOIduFS79w+jPSn0bQNt0DR4aRpJG6
 d3taDBXXCDXmIresOvpNKXhnlKQSUdb84H7MZt3s4ZcSHi4zHfDKuY4QYFjTHooJED
 KZca0ucj0kgA1LNNnWWH86Drbxw19TRDmsWvPgom8OKvydVjSMdjHZwVUwFo0YPyrj
 pDsu5Iqe8hwHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=esmjscZM
Subject: Re: [Buildroot] [PATCH 1/1] package/python-httpcore: bump to
 version 1.0.7
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

On 19/12/2024 02:57, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-httpcore/python-httpcore.hash | 4 ++--
>  package/python-httpcore/python-httpcore.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-httpcore/python-httpcore.hash 
> b/package/python-httpcore/python-httpcore.hash
> index 68c0450f94..ced9020a1e 100644
> --- a/package/python-httpcore/python-httpcore.hash
> +++ b/package/python-httpcore/python-httpcore.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/httpcore/json
> -md5  458f9b56367cf547425bf2347bffd784  httpcore-1.0.6.tar.gz
> -sha256  
> 73f6dbd6eb8c21bbf7ef8efad555481853f5f6acdeaff1edb0694289269ee17f  
> httpcore-1.0.6.tar.gz
> +md5  4cdb4739273f33bfd49b6d2aa6f011c6  httpcore-1.0.7.tar.gz
> +sha256  
> 8551cb62a169ec7162ac7be8d4817d561f60e08eaa485234898414bb5a8a0b4c  
> httpcore-1.0.7.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> fdcb59154c74cbaba16a11242f7740bea9f23d6feb5547917d8c5f94a80392a5  
> LICENSE.md
> diff --git a/package/python-httpcore/python-httpcore.mk 
> b/package/python-httpcore/python-httpcore.mk
> index a432433884..29d1ba1b7c 100644
> --- a/package/python-httpcore/python-httpcore.mk
> +++ b/package/python-httpcore/python-httpcore.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_HTTPCORE_VERSION = 1.0.6
> +PYTHON_HTTPCORE_VERSION = 1.0.7
>  PYTHON_HTTPCORE_SOURCE = httpcore-$(PYTHON_HTTPCORE_VERSION).tar.gz
> -PYTHON_HTTPCORE_SITE = 
> https://files.pythonhosted.org/packages/b6/44/ed0fa6a17845fb033bd885c03e842f08c1b9406c86a2e60ac1ae1b9206a6
> +PYTHON_HTTPCORE_SITE = 
> https://files.pythonhosted.org/packages/6a/41/d7d0a89eb493922c37d343b607bc1b5da7f5be7e383740b4753ad8943e90
>  PYTHON_HTTPCORE_SETUP_TYPE = hatch
>  PYTHON_HTTPCORE_LICENSE = BSD-3-Clause
>  PYTHON_HTTPCORE_LICENSE_FILES = LICENSE.md
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
