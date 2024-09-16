Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5311BC3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 10:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5406560DC2;
	Mon, 16 Sep 2024 10:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x6g6XWnLLmOl; Mon, 16 Sep 2024 10:02:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A8BC61125
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A8BC61125;
	Mon, 16 Sep 2024 10:02:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FF081BF397
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DAAE40270
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6GCKZfukYK75 for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 10:02:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0377A40264
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0377A40264
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0377A40264
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 10:02:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.117.145])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 359F9B00592;
 Mon, 16 Sep 2024 12:02:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Sep 2024 12:02:23 +0200
Date: Mon, 16 Sep 2024 12:02:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZugCL-3fPlrYNkqS@landeda>
References: <20240915204244.1595894-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240915204244.1595894-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726480948;
 bh=9JfTR/7QYTDf/Mvh8mhNUrd4KE3pfCNLdb/Zjxla5d0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nIjyMJOs6tRKDi3a46SUpSSpzR5+JM2Zts2K4DSVnxjm3Vjm0RaUMTuD/0ZqNqqJ8
 BCaQZfMH81xizu55BMon6lucfiGjp9wtxqd6uYtstQzRAg+vvS76q/gM+t0+gADL/D
 J+0NdwHoD2G1RH4yTHK4E6HuoUbP93xGj1Yymvvw0SjwHbmj1PGencseFivHZbpXuN
 kzecUQyQQnD7Hx3yp4pqhrGQt31dSUFM5DcQAdt3JoWZnTfB2ZL+WO8HXYNOAwkl3j
 OmtUlH8YJO9A8sZO5ufEizxX+jpeftFUCUzud/J9KnPo7oZ1pnjh0G8BoWI1G6BF5b
 YiaIXGwTeRNEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nIjyMJOs
Subject: Re: [Buildroot] [PATCH 1/1] package/python-jsonschema: bump to
 version 4.23.0
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

On 2024-09-15 14:42 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I've applied a few of your python package bumps to master:

    [PWID   ] Short hash    Title
    [1985968] b7839f4737a5  package/python-multidict: bump to version 6.1.0
    [1985967] 8a3cb57f4683  package/python-msgpack: bump to version 1.1.0
    [1985966] c79803260766  package/python-more-itertools: bump to version 10.5.0
    [1985965] dfa741945b51  package/python-ml-dtypes: bump to version 0.5.0
    [1985964] f9c7e7c343a3  package/python-mimeparse: bump to version 2.0.0
    [1985963] 860e746fc7aa  package/python-matplotlib: bump to version 3.9.2
    [1985956] 20828475d198  package/python-matplotlib-inline: bump to version 0.1.7
    [1985955] 73c654ed4b52  package/python-marshmallow: bump to version 3.22.0
    [1985954] ee974c03f0e5  package/python-marshmallow-sqlalchemy: bump to version 1.1.0
    [1985953] 8ce8c3621763  package/python-markdown2: bump to version 2.5.0
    [1985952] fe3e645aa15e  package/python-markdown: bump to version 3.7
    [1985951] d86debb6b0dc  package/python-mako: bump to version 1.3.5
    [1985944] 032b33d4fa33  package/python-lmdb: bump to version 1.5.1
    [1985924] 764929349087  package/python-kiwisolver: bump to version 1.4.7
    [1985923] fe7f48fe4994  package/python-keyring: bump to version 25.3.0
    [1985921] faf00146427e  package/python-jsonschema: bump to version 4.23.0

Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/python-jsonschema/python-jsonschema.hash | 4 ++--
>  package/python-jsonschema/python-jsonschema.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-jsonschema/python-jsonschema.hash b/package/python-jsonschema/python-jsonschema.hash
> index 645a6657fe..79d64f4846 100644
> --- a/package/python-jsonschema/python-jsonschema.hash
> +++ b/package/python-jsonschema/python-jsonschema.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/jsonschema/json
> -md5  e758f0f6a8f3f59d754e7e35ea9f0792  jsonschema-4.20.0.tar.gz
> -sha256  4f614fd46d8d61258610998997743ec5492a648b33cf478c1ddc23ed4598a5fa  jsonschema-4.20.0.tar.gz
> +md5  a2cb5fee4da011118708ab275b34f30b  jsonschema-4.23.0.tar.gz
> +sha256  d71497fef26351a33265337fa77ffeb82423f3ea21283cd9467bb03999266bc4  jsonschema-4.23.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  4f92a015a13c4d1a040bef018aa13430b4f1bc73b41b16bb846c346766de7439  COPYING
>  sha256  837402bd25fad9b704265801ca3f92566a98157c1f9a7acd6f446299ba1c305a  json/LICENSE
> diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
> index 9e8b6e18b8..21e4adab48 100644
> --- a/package/python-jsonschema/python-jsonschema.mk
> +++ b/package/python-jsonschema/python-jsonschema.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_JSONSCHEMA_VERSION = 4.20.0
> +PYTHON_JSONSCHEMA_VERSION = 4.23.0
>  PYTHON_JSONSCHEMA_SOURCE = jsonschema-$(PYTHON_JSONSCHEMA_VERSION).tar.gz
> -PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/a8/74/77bf12d3dd32b764692a71d4200f03429c41eee2e8a9225d344d91c03aff
> +PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/38/2e/03362ee4034a4c917f697890ccd4aec0800ccf9ded7f511971c75451deec
>  PYTHON_JSONSCHEMA_SETUP_TYPE = pep517
>  PYTHON_JSONSCHEMA_LICENSE = MIT
>  PYTHON_JSONSCHEMA_LICENSE_FILES = COPYING json/LICENSE
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
