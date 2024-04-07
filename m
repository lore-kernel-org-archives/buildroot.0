Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23C6CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78080408F0;
	Sun,  7 Apr 2024 15:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKPiFUtkEy6A; Sun,  7 Apr 2024 15:47:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CB43408F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CB43408F6;
	Sun,  7 Apr 2024 15:47:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA2D41BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3B0160A67
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4azN5iNIEGTM for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:47:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C2EA860A71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2EA860A71
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2EA860A71
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:47:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1656313F899;
 Sun,  7 Apr 2024 17:47:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Apr 2024 17:47:45 +0200
Date: Sun, 7 Apr 2024 17:47:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZhLAIYOTYcgk-cUK@landeda>
References: <20240407135951.1868714-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240407135951.1868714-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712504869;
 bh=xWoz7M6ZC4Znn/BcJNnkZUoyYFm5KjfIHdKDXJfLebo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bOgQOkTCH0b3KS4YV0Ei3GlUgYftZQUUbJarE6yjPhtGzP6I5BzVhNoC7ps+voUbI
 KX1RSyYMPRVZHuexXZ20tM6DNbPTsCr4kUfpKlcwRL0NfTgtCNrLPzX6Idgv+vyBv+
 4rNKsr42cME8u5oqiJrv5qw6GdDpuYyN6hOjCBe8/nvPnV8x+a8cP0KeevM+YVtUZX
 r5hFunK4kr0trvl9ZnIws7h9AULYEdhoiQhHJBYCCnv3TfaLr3kinD3ndEf7OLWTck
 SIq4jqw4aplFVK7UFgApqqtcwdmpHIqlZZdetSfmb96qx7ZJUxofYgNe2IDt4I3x+m
 8aDucuZ6iJQsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bOgQOkTC
Subject: Re: [Buildroot] [PATCH 1/1] package/oatpp: disable tests
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
Cc: Alessandro Partesotti <a.partesotti@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-04-07 15:59 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since the addition of the package
> in commit d5bba26801b352f591451cf73e0b7509de0e6850:
> 
> [100%] Linking CXX executable oatppAllTests
> /home/buildroot/instance-0/output-1/per-package/oatpp/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real: cannot find -latomic: No such file or directory
> 
> Fixes: d5bba26801b352f591451cf73e0b7509de0e6850
>  - http://autobuild.buildroot.org/results/1587b391baecdbb5a24a0c0b2c33d63cb71a2f7f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

I guess we'll leave it to users of oatpp, of which we have none in
Buildroot, to properly link with the required libraries, then...

Regards,
Yann E. MORIN.

> ---
>  package/oatpp/oatpp.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/oatpp/oatpp.mk b/package/oatpp/oatpp.mk
> index c8b0c9694a..d3f6e1a9c2 100644
> --- a/package/oatpp/oatpp.mk
> +++ b/package/oatpp/oatpp.mk
> @@ -8,7 +8,7 @@ OATPP_VERSION = 1.3.0
>  OATPP_SITE = $(call github,oatpp,oatpp,$(OATPP_VERSION))
>  OATPP_LICENSE = Apache-2.0
>  OATPP_LICENSE_FILES = LICENSE
> -OATPP_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
> +OATPP_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF -DOATPP_BUILD_TESTS=OFF
>  OATPP_INSTALL_STAGING = YES
>  # Only builds a static lib and headers
>  OATPP_INSTALL_TARGET = NO
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
