Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D857CE7718D
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 14:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98C2C81E4C;
	Sun, 22 Dec 2024 14:10:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VMGWpvHdVgGA; Sun, 22 Dec 2024 14:10:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E35981F69
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E35981F69;
	Sun, 22 Dec 2024 14:10:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D5C625E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7B7681F69
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-YqWGIK3V33 for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 14:10:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C43D981E4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C43D981E4C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C43D981E4C
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:10:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D749E780389;
 Sun, 22 Dec 2024 15:10:16 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43048])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 15:10:16 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 15:10:16 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241219012843.244249-1-james.hilliard1@gmail.com>
References: <20241219012843.244249-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <b39adc167403dcf507b338e3e478ba65@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734876617;
 bh=DPsr93UEfV2bTjIlwjb+7s0KqeFLZcZxuzop1mEtVWA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hlgm01pu52DuJuxTYW8PKqfOR01suIiYz/0eeGahNdXS+GcoGUzDiBPGLXErWXl2R
 tiCHX39fY57TzYylWiD82easKyiKisf3ANA3MZv2sqjKsSAzNREzFMR+fMPU8C/PXy
 kmkn/Q8RnjykDs0pj2ph8LrZW7GqQQzHe90fhKJykQJn7aKlLpLSudpS07RErcVdrp
 V+BrEwSAxwoBXgTpWgKQjzEcp6wed7XBO6t4JeXgMVIB62TRSDr7Z7NO9DdpJVktkL
 mY/+DaUPxz9O2ap/k6uTMEOLHV/6u8JRpeuPxKQ22ItgoaEWjzg4EJ+sujI/HG7TSL
 93wyq8Wxwe9wA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hlgm01pu
Subject: Re: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2024.12.14
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

On 19/12/2024 02:28, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-certifi/python-certifi.hash | 4 ++--
>  package/python-certifi/python-certifi.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-certifi/python-certifi.hash 
> b/package/python-certifi/python-certifi.hash
> index 6f8e0241b5..bf722c97e8 100644
> --- a/package/python-certifi/python-certifi.hash
> +++ b/package/python-certifi/python-certifi.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/certifi/json
> -md5  f842fc7a8ef562539e07873475eed593  certifi-2024.8.30.tar.gz
> -sha256  
> bec941d2aa8195e248a60b31ff9f0558284cf01a52591ceda73ea9afffd69fd9  
> certifi-2024.8.30.tar.gz
> +md5  e7e7a03aeed4290cc28cc62975aa0149  certifi-2024.12.14.tar.gz
> +sha256  
> b650d30f370c2b724812bee08008be0c4163b163ddaec3f2546c1caf65f191db  
> certifi-2024.12.14.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  
> LICENSE
> diff --git a/package/python-certifi/python-certifi.mk 
> b/package/python-certifi/python-certifi.mk
> index 7cdd65941a..fe5b4ff690 100644
> --- a/package/python-certifi/python-certifi.mk
> +++ b/package/python-certifi/python-certifi.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_CERTIFI_VERSION = 2024.8.30
> +PYTHON_CERTIFI_VERSION = 2024.12.14
>  PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
> -PYTHON_CERTIFI_SITE = 
> https://files.pythonhosted.org/packages/b0/ee/9b19140fe824b367c04c5e1b369942dd754c4c5462d5674002f75c4dedc1
> +PYTHON_CERTIFI_SITE = 
> https://files.pythonhosted.org/packages/0f/bd/1d41ee578ce09523c81a15426705dd20969f5abf006d1afe8aeff0dd776a
>  PYTHON_CERTIFI_SETUP_TYPE = setuptools
>  PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
>  PYTHON_CERTIFI_LICENSE_FILES = LICENSE
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
