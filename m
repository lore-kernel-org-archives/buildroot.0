Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CE6E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 21:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAE744031E;
	Mon, 16 Dec 2024 21:47:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jwm8rysoYIpY; Mon, 16 Dec 2024 21:47:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8728D402A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8728D402A6;
	Mon, 16 Dec 2024 21:47:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04790C5
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5E8C402A6
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MjLhVUqjxIvY for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 21:47:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A10FC4028C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A10FC4028C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A10FC4028C
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:47:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7F4D813F86E;
 Mon, 16 Dec 2024 22:47:49 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41158])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Dec 2024 22:47:49 +0100
MIME-Version: 1.0
Date: Mon, 16 Dec 2024 22:47:49 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241216134631.491836-1-peter@korsgaard.com>
References: <20241216134631.491836-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <6ec142e9abd6169176407d3006c28b31@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734385670;
 bh=MND7aagPaC1YE1pUv9D8/zRu7EPSLVD79M/fNtIw7TY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Yv1weEfnIr+UX5Syg8JOhYkLge/lHOPH76EU0AtdtB7Qsj3Sf//PWz0Yjk/Objxvz
 7J7SdcpHpLIC+3wtf+jp9fFQPadJxTwxc2CFvSowY2Pth2IKspA6821DHNVTulcrQD
 fR61mNlLHKzw3XnresVXvevyFAlsileC7nOyRLxyiYdFhbrCg39uFToCjNqvUX3Pd6
 w28zSQiSgcob7VlPQWao69G8eY8uIcE4hxYDK7WSZdBjqbzMyyPx4nB7W9zX+DwhhJ
 2VbuTVPEs4w4/MuhKz4Sw9mKIe4veznFmuoApsGDOseMXdt3AqfsqdVV3a8hDA/Db4
 6IP2h4murQMnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Yv1weEfn
Subject: Re: [Buildroot] [PATCH] package/netatalk: security bump to version
 3.1.19
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

On 16/12/2024 14:46, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> CVE-2024-38439: Netatalk 3.2.0 has an off-by-one error and resultant
> heap-based buffer overflow because of setting ibuf[PASSWDLEN] to '\0' 
> in
> FPLoginExt in login in etc/uams/uams_pam.c.
> 
> https://github.com/advisories/GHSA-pcmr-ff73-xcj5
> 
> CVE-2024-38440: Netatalk 3.2.0 has an off-by-one error and resultant
> heap-based buffer overflow because of incorrectly using FPLoginExt in
> BN_bin2bn in etc/uams/uams_dhx_pam.c.
> 
> https://github.com/advisories/GHSA-52mm-rqxx-gfq6
> 
> CVE-2024-38441: Netatalk 3.2.0 has an off-by-one error and resultant
> heap-based buffer overflow because of setting ibuf[len] to '\0' in 
> FPMapName
> in afp_mapname in etc/afp/directory.c.
> 
> https://github.com/advisories/GHSA-j764-4v6h-pqp7
> 
> Release notes:
> https://github.com/Netatalk/netatalk/releases/tag/netatalk-3-1-19
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

> ---
>  package/netatalk/netatalk.hash | 8 ++++----
>  package/netatalk/netatalk.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/netatalk/netatalk.hash 
> b/package/netatalk/netatalk.hash
> index 9ab5d604a8..285484ed2c 100644
> --- a/package/netatalk/netatalk.hash
> +++ b/package/netatalk/netatalk.hash
> @@ -1,7 +1,7 @@
> -# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.18/
> -md5  b1caff4e1da534d8ca57d688c7fa3ce1  netatalk-3.1.18.tar.xz
> -sha1  cbd92c95d04cfd4a9f49977970501a623310c2d9  netatalk-3.1.18.tar.xz
> +# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.19/
> +md5  4861f0c2450ac7a6094e51090e6fdc75  netatalk-3.1.19.tar.xz
> +sha1  16900b3b14da9c2f40e1267ecb3e68021cc794b0  netatalk-3.1.19.tar.xz
>  # Locally computed
> -sha256  
> 3941effcc2c4e0dceecabc763fbb8478a2f2fbe0af4a6314983cfea452df8d47  
> netatalk-3.1.18.tar.xz
> +sha256  
> 433fa87ac23bc18a9acb0769b4f7f4047eeb14e02e0607ecd3a051c31859164f  
> netatalk-3.1.19.tar.xz
>  sha256  
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  
> COPYING
>  sha256  
> 7599ae145e53be03a08f8b558b2f2e0c828e1630f1843cc04f41981b8cefcd65  
> COPYRIGHT
> diff --git a/package/netatalk/netatalk.mk 
> b/package/netatalk/netatalk.mk
> index 53cd53876a..b6f9c3fa59 100644
> --- a/package/netatalk/netatalk.mk
> +++ b/package/netatalk/netatalk.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -NETATALK_VERSION = 3.1.18
> +NETATALK_VERSION = 3.1.19
>  NETATALK_SITE = 
> http://downloads.sourceforge.net/project/netatalk/netatalk-$(subst 
> .,-,$(NETATALK_VERSION))
>  NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.xz
>  NETATALK_CONFIG_SCRIPTS = netatalk-config
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
