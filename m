Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FD7C25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 09:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92E20400D3;
	Sun,  2 Jun 2024 09:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qhqWoWDo_I6Y; Sun,  2 Jun 2024 09:01:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6500740468
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6500740468;
	Sun,  2 Jun 2024 09:01:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3097F1BF27C
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 09:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CD7F40468
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 09:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NVyyV4bRGl08 for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 09:01:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 04C53400D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04C53400D3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04C53400D3
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 09:01:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 193D213F88D;
 Sun,  2 Jun 2024 11:00:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 02 Jun 2024 11:00:55 +0200
Date: Sun, 2 Jun 2024 11:00:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <Zlw0x-GMNwen_N31@landeda>
References: <20240511235609.88305-1-christian@aperture.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240511235609.88305-1-christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717318859;
 bh=nHtxO2oOtNuL1GTzzqk+0jHTPDSvCIuTx/KalQAf3EA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eE88+LVHoxFB2xDKjudj5TtQo9+e8HvScBBGbHPccsWQDqXA6UFbeqCNZ8cdJqM6z
 uBCjb0sCjSrDvFBdxhRHwDLFNbPdhNufnRgnd5kpOyQt2/djrFQPzhdwFGg9DxPNFK
 PFBtNPsVoJ8iX+HcHYgeLqBq6RnIb1uaTWpGJfbDNSaEXjRWvaJB+ZgzeKgxxwL6qA
 uJ/pCowb0nOZewI8QiimJzej+OLfDyRkAvH+xLBBFrf/Nqa7ac3bXEa52/+f4YldWr
 6HmkR2bnHL2eN9G26vSj7jCuwJaKav7ohywk4iLsiGlU8ed4K+35qX3XEMgJxZ8f23
 h0tBKarPUYGyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eE88+LVH
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump version
 to v2.27.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2024-05-11 16:56 -0700, Christian Stewart via buildroot spake thusly:
> https://github.com/docker/compose/releases/tag/v2.27.0
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

We have a download failure for docker-compose (as noticed by Peter):

    http://autobuild.buildroot.net/results/cd3a19e9172fb49591fe3a1a7da28c09a4919495/build-end.log

    ERROR: while checking hashes from package/docker-compose/docker-compose.hash
    ERROR: docker-compose-2.27.0-go2.tar.gz has wrong sha256 hash:
    ERROR: expected: 448eaf225c2984a2d78b4faa3fe74a4aa1e2bb791f90ac8d4970d3d046e638df
    ERROR: got     : 42e9d2a33806656bd145ec742a3ba00b64acc3f88b500793d3b78319c39e25e0
    ERROR: Incomplete download, or man-in-the-middle (MITM) attack

I can't even reproduce localy, with this defconfig for example:

    $ cat <<_EOF_ >.config
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_PACKAGE_DOCKER_CLI=y
    BR2_PACKAGE_DOCKER_COMPOSE=y
    _EOF_
    $ make oldddefconfig

    $ make docker-compose-source
    [...]
    go: downloading dario.cat/mergo v1.0.0
    [...]
    go: downloading github.com/imdario/mergo v0.3.16
    [...]
    go: github.com/docker/compose/v2/cmd/compose imports
            github.com/docker/cli/cli/command/container imports
            github.com/docker/cli/cli/compose/loader imports
            dario.cat/mergo: unrecognized import path "dario.cat/mergo": https fetch: Get "https://dario.cat/mergo?go-get=1": dial tcp: lookup dario.cat on 127.0.0.53:53: server misbehaving

As I understand it, dario.cat is a "vanity URL" [0] so it should not be
resolved by the resolver, but by go-pkg, but apparently that did not
happen for me...

Do you have any idea what's going on?

[0] https://pkg.go.dev/dario.cat/mergo#readme-important-notes

Regards,
Yann E. MORIN.

> ---
>  package/docker-compose/docker-compose.hash | 2 +-
>  package/docker-compose/docker-compose.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
> index cda4a130d5..1fd454e3fa 100644
> --- a/package/docker-compose/docker-compose.hash
> +++ b/package/docker-compose/docker-compose.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  821aac932d0a3bbe583ea290ae777cec785a77f987c5007a30970fa6568e9322  docker-compose-2.26.1-go2.tar.gz
> +sha256  448eaf225c2984a2d78b4faa3fe74a4aa1e2bb791f90ac8d4970d3d046e638df  docker-compose-2.27.0-go2.tar.gz
>  sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
> diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
> index 66a88ac7e7..32b2236a91 100644
> --- a/package/docker-compose/docker-compose.mk
> +++ b/package/docker-compose/docker-compose.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DOCKER_COMPOSE_VERSION = 2.26.1
> +DOCKER_COMPOSE_VERSION = 2.27.0
>  DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
>  DOCKER_COMPOSE_LICENSE = Apache-2.0
>  DOCKER_COMPOSE_LICENSE_FILES = LICENSE
> -- 
> 2.43.0
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
