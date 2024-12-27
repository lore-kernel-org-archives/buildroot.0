Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F415E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFFAD80B0F;
	Fri, 27 Dec 2024 14:38:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ySzAW8obacU8; Fri, 27 Dec 2024 14:38:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D33B180B13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D33B180B13;
	Fri, 27 Dec 2024 14:37:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D3398E0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C156980B13
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:37:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2bfiLAOiS15 for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:37:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C715180B07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C715180B07
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C715180B07
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:37:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id D350013F8C2;
 Fri, 27 Dec 2024 15:37:54 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56784])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:37:54 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:37:54 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241223153019.1829912-1-james.hilliard1@gmail.com>
References: <20241223153019.1829912-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <bd86f9ace3174dd14f74820c286eca93@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310275;
 bh=VKzbDv/+Ujhil1eKEOtE2vVyUCGLh7BrDgkQp2tj+6g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GkT+E4xNu+ae3zvMSKAGL8x2OR5DYktbLwBFaxrtuWcooB9gM/g1U5VWEmDKw6814
 zrd3UETDcOa7SxXSBPXeO36lae/PRMUul8zGeTBLBmJX3pUBSHWlXnX7BWZs8oaoWN
 iK8FKhKtd34r2hpdMv/y6W89dASFkv3yx5Y/kNun4Ggas9RQREQC0ZnMFInsKnyKJP
 khzZQJqtI4YuoU1yhkCEWHaNhtCFNPHSG88OKpn9yDbjMuoHFCpXRjHcR0n4C6DcPp
 WNNsXM+Rq1MqrJXx3/hZvfCeUJ+QNfCuA0HShRDzoxUm4scP3fmd8S8LemhiQHiuoq
 0xoskmWhzjaUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GkT+E4xN
Subject: Re: [Buildroot] [PATCH 1/1] package/python-attrs: bump to version
 24.3.0
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

On 23/12/2024 16:30, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-attrs/python-attrs.hash | 4 ++--
>  package/python-attrs/python-attrs.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-attrs/python-attrs.hash 
> b/package/python-attrs/python-attrs.hash
> index 5cd15dbed7..ae13fbb552 100644
> --- a/package/python-attrs/python-attrs.hash
> +++ b/package/python-attrs/python-attrs.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/attrs/json
> -md5  031a41b703d7fc47ec204d0369b68dcd  attrs-24.2.0.tar.gz
> -sha256  
> 5cfb1b9148b5b086569baec03f20d7b6bf3bcacc9a42bebf87ffaaca362f6346  
> attrs-24.2.0.tar.gz
> +md5  85dc1d9cca54e0986f429bfd1f2a4987  attrs-24.3.0.tar.gz
> +sha256  
> 8f5c07333d543103541ba7be0e2ce16eeee8130cb0b3f9238ab904ce1e85baff  
> attrs-24.3.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 882115c95dfc2af1eeb6714f8ec6d5cbcabf667caff8729f42420da63f714e9f  
> LICENSE
> diff --git a/package/python-attrs/python-attrs.mk 
> b/package/python-attrs/python-attrs.mk
> index c0725cf847..97b72df6dd 100644
> --- a/package/python-attrs/python-attrs.mk
> +++ b/package/python-attrs/python-attrs.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_ATTRS_VERSION = 24.2.0
> +PYTHON_ATTRS_VERSION = 24.3.0
>  PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
> -PYTHON_ATTRS_SITE = 
> https://files.pythonhosted.org/packages/fc/0f/aafca9af9315aee06a89ffde799a10a582fe8de76c563ee80bbcdc08b3fb
> +PYTHON_ATTRS_SITE = 
> https://files.pythonhosted.org/packages/48/c8/6260f8ccc11f0917360fc0da435c5c9c7504e3db174d5a12a1494887b045
>  PYTHON_ATTRS_SETUP_TYPE = hatch
>  PYTHON_ATTRS_LICENSE = MIT
>  PYTHON_ATTRS_LICENSE_FILES = LICENSE
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
