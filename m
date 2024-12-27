Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7607E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8BF06059A;
	Fri, 27 Dec 2024 14:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9iMBvd3iLZW; Fri, 27 Dec 2024 14:42:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C905D606C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C905D606C7;
	Fri, 27 Dec 2024 14:42:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C9572F1B
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B691340165
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:42:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0yCtWxZs91vN for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:42:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75E42400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75E42400AB
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75E42400AB
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:42:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8E87B780513;
 Fri, 27 Dec 2024 15:42:09 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42118])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:42:09 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:42:09 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Lionel Flandrin <lionel@svkt.org>
In-Reply-To: <20241223163611.1871560-1-james.hilliard1@gmail.com>
References: <20241223163611.1871560-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <368a91a7a7a71450b97bfc22584681a8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310531;
 bh=R6s6zdMAwzSZpPBQl/N4tg6mSosIMM40H9Kz6FxFgP4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z9rklLsX5eeFxEs5gqV8/5ywDv+Wd5f6pNCMiCUbvWoVMJXpu1l54v7rnWBCD36fg
 1+5WwT1Sl8ORD8c5QaduasCP/AcH88xlnXNwmw9lXhwrbEP8X60/oEXgmxs0pcwCt2
 yuEBkicwcWIulE/C6qEdoUjkxTE664/9+k6viYp5fsFkYVGVjKsZxZIF5sWDgyVAvY
 FG2CA68d/q3Y4NQDcSRIZAR9oKL5Of0nRL8ZYsFWOLBWhnj8nlsze5Cy1rpLBTW0np
 eUE3zNINFO3dX3JMMchgtzUv75m1MBmXnYW0Zl3MVIM5T5XehQYteY6eflhVcym1+X
 jtHWNNTVPiuEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z9rklLsX
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask: bump to version
 3.1.0
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

On 23/12/2024 17:36, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-flask/python-flask.hash | 4 ++--
>  package/python-flask/python-flask.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-flask/python-flask.hash 
> b/package/python-flask/python-flask.hash
> index 415e2068b0..97982f99d5 100644
> --- a/package/python-flask/python-flask.hash
> +++ b/package/python-flask/python-flask.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/flask/json
> -md5  4658b022a07f6d8df51ef24c717fe162  flask-3.0.3.tar.gz
> -sha256  
> ceb27b0af3823ea2737928a4d99d125a06175b8512c445cbd9a9ce200ef76842  
> flask-3.0.3.tar.gz
> +md5  c95d81666442bf04f7de7db7edbe2aff  flask-3.1.0.tar.gz
> +sha256  
> 5f873c5184c897c8d9d1b05df1e3d01b14910ce69607a117bd3277098a5836ac  
> flask-3.1.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  
> LICENSE.txt
>  sha256  
> 1e07e9c25f2618a040560b70e63f42259eab24e558d0f3532e6163d751cb4eea  
> docs/license.rst
> diff --git a/package/python-flask/python-flask.mk 
> b/package/python-flask/python-flask.mk
> index a4a19efba0..d44c2e68ef 100644
> --- a/package/python-flask/python-flask.mk
> +++ b/package/python-flask/python-flask.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_FLASK_VERSION = 3.0.3
> +PYTHON_FLASK_VERSION = 3.1.0
>  PYTHON_FLASK_SOURCE = flask-$(PYTHON_FLASK_VERSION).tar.gz
> -PYTHON_FLASK_SITE = 
> https://files.pythonhosted.org/packages/41/e1/d104c83026f8d35dfd2c261df7d64738341067526406b40190bc063e829a
> +PYTHON_FLASK_SITE = 
> https://files.pythonhosted.org/packages/89/50/dff6380f1c7f84135484e176e0cac8690af72fa90e932ad2a0a60e28c69b
>  PYTHON_FLASK_SETUP_TYPE = flit
>  PYTHON_FLASK_LICENSE = BSD-3-Clause
>  PYTHON_FLASK_LICENSE_FILES = LICENSE.txt docs/license.rst
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
