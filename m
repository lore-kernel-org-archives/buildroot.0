Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC22E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 10:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10BCA403A1;
	Sat, 28 Dec 2024 10:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PyTqAixXz17i; Sat, 28 Dec 2024 10:54:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA0C6401DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA0C6401DC;
	Sat, 28 Dec 2024 10:54:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B065757
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8647660681
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JEPYYsr59J4H for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 10:53:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3EF9B605A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EF9B605A3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3EF9B605A3
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:53:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3CA6513F8A9;
 Sat, 28 Dec 2024 11:53:54 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:48968])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Dec 2024 11:53:53 +0100
MIME-Version: 1.0
Date: Sat, 28 Dec 2024 11:53:53 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241228093213.3047356-1-thomas.petazzoni@bootlin.com>
References: <20241228093213.3047356-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <75e688887d95948c57a11416de3047b5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735383235;
 bh=pAyv7hSA2kzDGs1vA91uSphR/Vc5+qAQfcrxIFGpz4I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZoYy7K+o3UKeKz0QOS18TVLFSMZPkFO7RxYz+WbhB4hbdy/Ax+xHpyoo/1ENME43f
 iySGlj6WRnFOwil29t7z4POjPrGhRa4nIlvVTuDdD1ETj1nzgPPpa9nRD7+yTl5QKS
 kpH4643wHCvwFik4kzlROidj8V8JWNACdeHHFXkprjXj/tTL52efEfwLGzZGh1YuRt
 ZP1UrqM6uuyXzkRUJgCfRumZ6pUMmwq0y3FQfZ+pvUuUHRGP5IDZvnUkw8leZvqkRU
 2G7+hp0COnLdE5qIHePdI0q+5GYmoPBFa89oZsF05UIhmFUccCs6tM4a+eGgKFRc4S
 YDQpPLpq6apgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZoYy7K+o
Subject: Re: [Buildroot] [PATCH] package/mpdecimal: bump to version 4.0.0
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

On 28/12/2024 10:32, Thomas Petazzoni via buildroot wrote:
> While 2.5.1 -> 4.0.0 may seems like a big jump with lots of versions
> skipped, in fact 4.0.0 is the immediate next release after 2.5.1.
> 
> Changelog at:
> https://www.bytereef.org/mpdecimal/changelog.html
> 
> Build tested successfully with test-pkg, including with the one
> reverse dependency of mpdecimal: the python3 decimal module:
> https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1604635008.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/mpdecimal/mpdecimal.hash | 2 +-
>  package/mpdecimal/mpdecimal.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mpdecimal/mpdecimal.hash 
> b/package/mpdecimal/mpdecimal.hash
> index 81150c7575..6e5f4cfcf8 100644
> --- a/package/mpdecimal/mpdecimal.hash
> +++ b/package/mpdecimal/mpdecimal.hash
> @@ -1,4 +1,4 @@
>  # From http://www.bytereef.org/mpdecimal/download.html
> -sha256  
> 9f9cd4c041f99b5c49ffb7b59d9f12d95b683d88585608aa56a6307667b2b21f  
> mpdecimal-2.5.1.tar.gz
> +sha256  
> 942445c3245b22730fd41a67a7c5c231d11cb1b9936b9c0f76334fb7d0b4468c  
> mpdecimal-4.0.0.tar.gz
>  # Locally computed
>  sha256  
> b07528d8b1dbf1e2d2741052996f0876e23342ce2d30d0effa39c5457716c25a  
> LICENSE.txt

It seems the license file LICENSE.txt has be reformatted and renamed
to COPYRIGHT.txt in mpdecimal-4.0.0. Running the command:

     make mpdecimal-legal-info

fails with output:

     ...
     >>> mpdecimal 4.0.0 Collecting legal info
     sha256sum: /buildroot/output/build/mpdecimal-4.0.0/LICENSE.txt: No 
such file or directory
     ERROR: while checking hashes from package/mpdecimal/mpdecimal.hash
     ...

I thought this would have been detected by the "test-pkg -a" in the
Gitlab CI. Should we add a "make legal-info" in the gitlab-ci.yaml.in? 
Here:
https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11/support/misc/gitlab-ci.yml.in?ref_type=tags#L137
to make sure the Gitlab CI behave like the "utils/test-pkg -a" script
when executed manually?

> diff --git a/package/mpdecimal/mpdecimal.mk 
> b/package/mpdecimal/mpdecimal.mk
> index aa322df340..212af5b7ee 100644
> --- a/package/mpdecimal/mpdecimal.mk
> +++ b/package/mpdecimal/mpdecimal.mk
> @@ -5,7 +5,7 @@
>  
> ################################################################################
> 
>  MPDECIMAL_SITE = http://www.bytereef.org/software/mpdecimal/releases
> -MPDECIMAL_VERSION = 2.5.1
> +MPDECIMAL_VERSION = 4.0.0
>  MPDECIMAL_INSTALL_STAGING = YES
>  MPDECIMAL_LICENSE = BSD-2-Clause
>  MPDECIMAL_LICENSE_FILES = LICENSE.txt

The _LICENSE_FILES here needs to be updated too.

Can you send a v2 fixing the license file, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
