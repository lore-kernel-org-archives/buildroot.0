Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A718EE77188
	for <buildroot@archiver.kernel.org>; Thu, 26 Dec 2024 21:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3715F80D7E;
	Thu, 26 Dec 2024 21:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ermtlLYUUZVQ; Thu, 26 Dec 2024 21:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30A7380D7F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30A7380D7F;
	Thu, 26 Dec 2024 21:45:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06CF5F1B
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 21:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB88360771
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 21:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZLzJrfVD5Yfn for <buildroot@buildroot.org>;
 Thu, 26 Dec 2024 21:45:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B519F605DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B519F605DA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B519F605DA
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 21:45:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 17F5819F57E;
 Thu, 26 Dec 2024 22:45:28 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:54184])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 26 Dec 2024 22:45:28 +0100
MIME-Version: 1.0
Date: Thu, 26 Dec 2024 22:45:28 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241226201920.2233441-1-thomas.petazzoni@bootlin.com>
References: <20241226201920.2233441-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <42c2a4da95f981e2a32af74502c4673b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735249530;
 bh=ZYpdXCZoqJ+KNEkfnRATJ5PsxZHYfrbqj3Ozjtucuz0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fCm4RPJRY6X4vHZRx7ScmBFQ8VcTJBCKJIMdFqKQUWdgpJX/f+uykj4kWoGQONJy3
 4ySFSkSG3UEumsG8ohHc+HZewmqGMX1T0HrPdBpGn6k/D8Gdg4UgyXGzmRfPI2GH2U
 oTzoBkMeUrb/N7zJlXRxHe8FkCjQKvhZpi8geOvovcuyvL7B4GnLVX7DGgMJ9NvK6Z
 61RWy09wrcF/Ruxmw5m5EO/FF7rJOA7487oaCevpj+7drgmKadyRdibBItsWvMnRhY
 Z8xAe3kcifSOCNuTvJRiMZtuTgEkM4nDiivIvEPZsOv7XRALxgYy3hQkfGmeZ6cUkk
 qJF+nMbAhDBRA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fCm4RPJR
Subject: Re: [Buildroot] [PATCH] package/log4cxx: bump to version 1.3.1
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

Hi Thomas,

On 26/12/2024 21:19, Thomas Petazzoni via buildroot wrote:
> According to
> https://logging.apache.org/log4cxx/1.3.1/changelog.html:

[...]

> Note: the LOG4CXX_CHARSET cmake option (external character encoding) 
> default value has changed to utf-8
> 
> Within Buildroot, log4cxx has no reverse dependencies, and we tested
> building it with gcc 7.x to verify compatibility with reasonably old
> compilers.

This bump seems to introduce a build failure, detected by
"utils/test-pkg -a -p log4cxx". In my Gitlab CI:

Without the bump (log4cxx-1.1.0), see:
https://gitlab.com/jolivain/buildroot/-/pipelines/1603545610

With the bump (log4cxx-1.3.1), see:
https://gitlab.com/jolivain/buildroot/-/pipelines/1603537890

The failure is with the br-powerpc-603e-basic-cpp toolchain and
seems to be related with wchar support:
https://gitlab.com/jolivain/buildroot/-/jobs/8728007916

Can you have a look, please?

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/log4cxx/log4cxx.hash | 4 ++--
>  package/log4cxx/log4cxx.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/log4cxx/log4cxx.hash 
> b/package/log4cxx/log4cxx.hash
> index 728d49ee38..d9e9af18cf 100644
> --- a/package/log4cxx/log4cxx.hash
> +++ b/package/log4cxx/log4cxx.hash
> @@ -1,4 +1,4 @@
> -# From 
> https://www.apache.org/dist/logging/log4cxx/1.1.0/apache-log4cxx-1.1.0.tar.gz.sha512
> -sha512  
> 66a66eab933a6afd0779e3f73f65afa4fb82481208b591fd7c7c86ded805f50abcd9cdf954bdb49e1e7f5198e6c1c4fff8a7e180ff5fff9491f1946e9ba6fe2b 
>  apache-log4cxx-1.1.0.tar.gz
> +# From 
> https://downloads.apache.org/logging/log4cxx/1.3.1/apache-log4cxx-1.3.1.tar.gz.sha512
> +sha512  
> 0956fd034fd1a98d2e48ed461578c1e85da02d176850a580195b6a60b959feaf402a2743cc84ccb5d467dd924ee46422b8a7b39d2be9ee131e4e275e65ba839c 
>  apache-log4cxx-1.3.1.tar.gz
>  # Locally computed
>  sha256  
> cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  
> LICENSE
> diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
> index 8024c96d46..2d8d57a612 100644
> --- a/package/log4cxx/log4cxx.mk
> +++ b/package/log4cxx/log4cxx.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LOG4CXX_VERSION = 1.1.0
> +LOG4CXX_VERSION = 1.3.1
>  LOG4CXX_SITE = 
> https://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
>  LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
>  LOG4CXX_INSTALL_STAGING = YES
> --
> 2.47.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
