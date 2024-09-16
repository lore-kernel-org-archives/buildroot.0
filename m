Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E51C3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 09:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 000C8605C7;
	Mon, 16 Sep 2024 09:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rfgR-ox-g4k8; Mon, 16 Sep 2024 09:47:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9729606D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9729606D3;
	Mon, 16 Sep 2024 09:47:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 519C71BF397
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 09:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4064F40279
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 09:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bI5uofiDUWj3 for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 09:46:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 11F084015E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11F084015E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11F084015E
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 09:46:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.117.145])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9B0B7B0054E;
 Mon, 16 Sep 2024 11:46:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Sep 2024 11:46:50 +0200
Date: Mon, 16 Sep 2024 11:46:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zuf-iqFoHtIMwdcm@landeda>
References: <20240915210214.1603251-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240915210214.1603251-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726480015;
 bh=0mWcLrkGePkfSnZXPjMd80O8TGPVVKw2RddF1FsUYIg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EzsnAxcPWfgzIpfQKq323gczizNxOp1Hxv1JbQAevHneAF17pOsRjWAsAX3fMiYj+
 XuDZdz9vO0FDMScViqaolrjDQYFI7m+fy0cxV2CdZhfSIQIoK6Q/faO5L40BGOCgil
 1Z2zuCC3Om41uPdVhZ6d/r/ApxU4AMg9mgJ7rMLaaexBcDkMUNE5/FrzwqU+tfvXgy
 HlHYwx+aefmNlALbJGviiMYX6P9PuX6lEnsqyvOqKn5bhyiUX20xHMSzSXF7t5M5QL
 hl02KTmAFUtBONv/br8M2uQYU0z0GlAeie2Xym5FebjoKFwHKH/9TCk09+iQtd07vz
 Ae4rh10fnVvdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EzsnAxcP
Subject: Re: [Buildroot] [PATCH 1/1] package/python-lark: bump to version
 1.2.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-09-15 15:02 -0600, James Hilliard spake thusly:
> Verified license remains MIT after hash changed.

OK, great, but what was the actual change, then?

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-lark/python-lark.hash | 6 +++---
>  package/python-lark/python-lark.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-lark/python-lark.hash b/package/python-lark/python-lark.hash
> index 9ea778c8da..35ee842a4a 100644
> --- a/package/python-lark/python-lark.hash
> +++ b/package/python-lark/python-lark.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/lark/json
> -md5  124c36ea3b68783f06cea5fe6ee8a6f2  lark-1.1.8.tar.gz
> -sha256  7ef424db57f59c1ffd6f0d4c2b705119927f566b68c0fe1942dddcc0e44391a5  lark-1.1.8.tar.gz
> +md5  99760ed81904c56b2db2b7ab7723063e  lark-1.2.2.tar.gz
> +sha256  ca807d0162cd16cef15a8feecb862d7319e7a09bdb13aef927968e45040fed80  lark-1.2.2.tar.gz
>  # Locally computed sha256 checksums
> -sha256  8263e5652d07cecb3adadf05140b65e70cfa169ecec5f520fe1671479ce12a83  LICENSE
> +sha256  2eee60f52d4e11357bf89e72b034d050e285e47fda1361e5662fb322ee27d771  LICENSE
> diff --git a/package/python-lark/python-lark.mk b/package/python-lark/python-lark.mk
> index 9cb30abb65..1a85b49bd3 100644
> --- a/package/python-lark/python-lark.mk
> +++ b/package/python-lark/python-lark.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_LARK_VERSION = 1.1.8
> +PYTHON_LARK_VERSION = 1.2.2
>  PYTHON_LARK_SOURCE = lark-$(PYTHON_LARK_VERSION).tar.gz
> -PYTHON_LARK_SITE = https://files.pythonhosted.org/packages/12/1c/b466b58dacac15ffefce9bcb5128e18948a143849610a7d5300f31920be0
> +PYTHON_LARK_SITE = https://files.pythonhosted.org/packages/af/60/bc7622aefb2aee1c0b4ba23c1446d3e30225c8770b38d7aedbfb65ca9d5a
>  PYTHON_LARK_SETUP_TYPE = setuptools
>  PYTHON_LARK_LICENSE = MIT
>  PYTHON_LARK_LICENSE_FILES = LICENSE
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
