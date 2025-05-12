Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84173C3ABCB
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 20:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48D3F60E7D;
	Mon, 12 May 2025 20:28:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u7sx9H22I3Ny; Mon, 12 May 2025 20:28:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74BD660E70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74BD660E70;
	Mon, 12 May 2025 20:28:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 31550154
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2300C60E70
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h4TswvJ_tSSm for <buildroot@buildroot.org>;
 Mon, 12 May 2025 20:28:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3782260A37
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3782260A37
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3782260A37
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:28:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 20C4313F86A;
 Mon, 12 May 2025 22:28:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 12 May 2025 22:28:25 +0200
MIME-Version: 1.0
Date: Mon, 12 May 2025 22:28:25 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250512132735.1251491-1-buildroot@bubu1.eu>
References: <20250512132735.1251491-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.10
Message-ID: <730bc5d399c429ae1cf212d945c5e6e7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747081707;
 bh=aAjMCA0e4DmwHPcxFHTl2uxA1dtdakwF4HumTHMHLSQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IKkZVQVz8CMvzv4gtBNl5p+M6Kp7fRZ43oLcaamITtbOYqPsF4j3xFCSAnPF73ySA
 HFfkaQMH47OQjdPyrEiYYYRCqNBgAZRytY3tsoB1+KZabrvqINhWOq4N//uEtDsafx
 G+osAx4JTPCS+o2Lxduk7zknw4ayLMUr2mO0mRooeF5tAIIPJnrGWwnEZElp9Go2Rj
 fsy5UMmxRfHJrDAqEJ27vfB/SAPcZwKQc6sT3RVeO/pP52xS0MfSMIl5hibo7OB5QS
 iJqIEABTFcUraU3s3AyGFKC8ravtr0pgOgTDqfvdetaH6rY4wxxVybbNaPPs7vBphP
 6hdB+enkE73Pg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IKkZVQVz
Subject: Re: [Buildroot] [PATCH] package/python-dotenv: bump to 1.1.0
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

Hi Marcus,

Thanks for the patch.

The archive download failed (with a 404) when I tested. See below.

On 12/05/2025 15:27, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-dotenv/python-dotenv.hash | 4 ++--
>  package/python-dotenv/python-dotenv.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-dotenv/python-dotenv.hash 
> b/package/python-dotenv/python-dotenv.hash
> index 710922fba3..c591dcf9b9 100644
> --- a/package/python-dotenv/python-dotenv.hash
> +++ b/package/python-dotenv/python-dotenv.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/python-dotenv/json
> -md5  68abb78e05460ce558ca255de550e1ea  python-dotenv-1.0.1.tar.gz
> -sha256  
> e324ee90a023d808f1959c46bcbc04446a10ced277783dc6ee09987c37ec10ca  
> python-dotenv-1.0.1.tar.gz
> +md5  9bdf50416b1c59832d2f77ad6afdf0d8  python_dotenv-1.1.0.tar.gz
> +sha256  
> 41f90bc6f5f177fb41f53e87666db362025010eb28f60a01c9143bfa33a2b2d5  
> python_dotenv-1.1.0.tar.gz

The archive name has changed from "python-dotenv" (with a dash) to
"python_dotenv" (with an underscore)...

>  # Locally computed sha256 checksums
>  sha256  
> 80619b7049f08c81683ad0e01f08f257a840652dd71ee83146d36658c7d2c2b9  
> LICENSE
> diff --git a/package/python-dotenv/python-dotenv.mk 
> b/package/python-dotenv/python-dotenv.mk
> index 324eea239e..5238d9f476 100644
> --- a/package/python-dotenv/python-dotenv.mk
> +++ b/package/python-dotenv/python-dotenv.mk
> @@ -4,8 +4,8 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_DOTENV_VERSION = 1.0.1
> -PYTHON_DOTENV_SITE = 
> https://files.pythonhosted.org/packages/bc/57/e84d88dfe0aec03b7a2d4327012c1627ab5f03652216c63d49846d7a6c58
> +PYTHON_DOTENV_VERSION = 1.1.0

So it likely missing here a line such as:
PYTHON_DOTENV_SOURCE = python_dotenv-$(PYTHON_DOTENV_VERSION).tar.gz

> +PYTHON_DOTENV_SITE = 
> https://files.pythonhosted.org/packages/88/2c/7bb1416c5620485aa793f2de31d3df393d3686aa8a8506d11e10e13c5baf
>  PYTHON_DOTENV_SETUP_TYPE = setuptools
>  PYTHON_DOTENV_LICENSE = BSD-3-Clause
>  PYTHON_DOTENV_LICENSE_FILES = LICENSE

Could you send an updated version of this patch, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
