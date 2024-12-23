Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC70E7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 20:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ADEB81335;
	Mon, 23 Dec 2024 20:23:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vNa8vdqnyLPp; Mon, 23 Dec 2024 20:23:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98E5981338
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98E5981338;
	Mon, 23 Dec 2024 20:23:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04222757
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 20:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5C0C81335
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 20:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xnX2ABT7t-JG for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 20:23:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C84D81331
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C84D81331
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C84D81331
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 20:23:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E3549780502;
 Mon, 23 Dec 2024 21:23:15 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:33158])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 23 Dec 2024 21:23:15 +0100
MIME-Version: 1.0
Date: Mon, 23 Dec 2024 21:23:15 +0100
From: Julien Olivain <ju.o@free.fr>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20241223135908.2267889-1-m.niestroj@grinn-global.com>
References: <20241223135908.2267889-1-m.niestroj@grinn-global.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <9693ae568e74ff589afa5d86cd30dc69@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734985398;
 bh=O/p3rvv9sDHSANr+F3fMUKhhu9TuirSRxtCqSGR8FTs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WPDvQUseEmlCeSMc3j/xTuSc5DJeBI+RMZ3P9eI17nJC2GXXAzBaJf8l/aOkdmvdo
 4VZMGE2ejqR6UiZ455Em1KECZjpPnCfpwvUkL0rAMXpAYSE9x84sXCyAgtgQRYxsQe
 vtHrOmnLHFDC9gyFbk2rDWG/H8DMxoHSxP7UMMJ8q+aW4IGTSvX6shhRUrggrStR0v
 zpps/iPGwwCRwk8Z1Ca2eHqm6DJx6ZnEUTE1nmU6rU4R6Seo8KpW4L8qez25jkcMK1
 nDavfhAdIpFWKJY30mBHmRnqEjSdEyiBSCj1rwDXaO4lOqRrl9IpY2fIVnmYY1cB+n
 cm2lEddzF4ebg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WPDvQUse
Subject: Re: [Buildroot] [PATCH 1/2] package/pytest: bump to 8.3.4
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

On 23/12/2024 14:59, Marcin Niestroj wrote:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Series applied to master, thanks.

> ---
>  package/python-pytest/python-pytest.hash | 4 ++--
>  package/python-pytest/python-pytest.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pytest/python-pytest.hash 
> b/package/python-pytest/python-pytest.hash
> index 15ac04a6ea..31983da0b5 100644
> --- a/package/python-pytest/python-pytest.hash
> +++ b/package/python-pytest/python-pytest.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pytest/json
> -md5  71466867181a5a7aefdb298b7146bcad  pytest-8.3.3.tar.gz
> -sha256  
> 70b98107bd648308a7952b06e6ca9a50bc660be218d53c257cc1fc94fda10181  
> pytest-8.3.3.tar.gz
> +md5  542c4e802eeac1d196482e90a36533ed  pytest-8.3.4.tar.gz
> +sha256  
> 965370d062bce11e73868e0335abac31b4d3de0e82f4007408d242b4f8610761  
> pytest-8.3.4.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> ca836a5f9ecca3b2f350230faa20a48fb8b145653b5568d784862df864706b9b  
> LICENSE
> diff --git a/package/python-pytest/python-pytest.mk 
> b/package/python-pytest/python-pytest.mk
> index 256b6954f0..be40fdb0fd 100644
> --- a/package/python-pytest/python-pytest.mk
> +++ b/package/python-pytest/python-pytest.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_PYTEST_VERSION = 8.3.3
> +PYTHON_PYTEST_VERSION = 8.3.4
>  PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
> -PYTHON_PYTEST_SITE = 
> https://files.pythonhosted.org/packages/8b/6c/62bbd536103af674e227c41a8f3dcd022d591f6eed5facb5a0f31ee33bbc
> +PYTHON_PYTEST_SITE = 
> https://files.pythonhosted.org/packages/05/35/30e0d83068951d90a01852cb1cef56e5d8a09d20c7f511634cc2f7e0372a
>  PYTHON_PYTEST_SETUP_TYPE = setuptools
>  PYTHON_PYTEST_LICENSE = MIT
>  PYTHON_PYTEST_LICENSE_FILES = LICENSE
> --
> 2.47.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
