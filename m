Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12169C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 21:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC8D6847C1;
	Sat,  1 Jun 2024 21:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vf3NkqFs4C6D; Sat,  1 Jun 2024 21:01:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 896D28479A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 896D28479A;
	Sat,  1 Jun 2024 21:01:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C5AE1BF4E5
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 21:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 693734056E
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 21:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lwS_3O-WZIVl for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 21:01:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 605554053D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 605554053D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 605554053D
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 21:01:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A10AB13F8B3;
 Sat,  1 Jun 2024 23:01:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 23:01:28 +0200
Date: Sat, 1 Jun 2024 23:01:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <ZluMKNFicss1Lf9S@landeda>
References: <ZlsWbN4ndrbor49a@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZlsWbN4ndrbor49a@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717275690;
 bh=u9TBcqnDE6QQDj8WpAminIEptHnhmIcQ1/WmDyFCUoc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZLTYzcORciNq4YBeG4AX0L6SMBlRoJ2PNBrZOdIhgBO5VvCLzI4z7OOb1cvPK3bPw
 XmzKigwnie6RLPwpI1pWS3COiRZc/HZNiM+vPIqGM+MvY5Ii5vgXvFO7vxQDkBkfWs
 dWMwyGU5uiEuxx9Ljk4FLD7iY8if37SYHtFdZEf+gVr2+RLX/rbRM9e25B17YS6Jdy
 bROXch4SAiJLh0+7cVxT/9vlH7z6r81EW6zoKCbZ9/cxIkrjAGHonnwaL7/eJaI5Uu
 8BHMN1um5nXlGX9tgZfjFBt2jmz0FVCuZx/U2PHAzE2umeoNGnbCcz9u3PrXQZo7bf
 Q86F9WdukilLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZLTYzcOR
Subject: Re: [Buildroot] [PATCH] package/gcc: update to 13.3.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Waldemar, All,

On 2024-06-01 14:39 +0200, Waldemar Brodkorb spake thusly:
> See here for changes made to this release:
> https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=13.3
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .checkpackageignore                                           | 2 +-
>  .../0001-disable-split-stack-for-non-thread-builds.patch      | 0
>  .../0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch          | 0
>  .../0003-Remove-crypt-and-crypt_r-interceptors.patch          | 0
>  package/gcc/Config.in.host                                    | 2 +-
>  package/gcc/gcc.hash                                          | 4 ++--
>  6 files changed, 4 insertions(+), 4 deletions(-)
>  rename package/gcc/{13.2.0 => 13.3.0}/0001-disable-split-stack-for-non-thread-builds.patch (100%)
>  rename package/gcc/{13.2.0 => 13.3.0}/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch (100%)
>  rename package/gcc/{13.2.0 => 13.3.0}/0003-Remove-crypt-and-crypt_r-interceptors.patch (100%)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 8f5fc0a476..102b3cfcbc 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -670,7 +670,7 @@ package/gamin/0001-no-abstract-sockets.patch lib_patch.Upstream
>  package/gamin/0002-no-const-return.patch lib_patch.Sob lib_patch.Upstream
>  package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch lib_patch.Upstream
>  package/gcc/12.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
> -package/gcc/13.2.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
> +package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
>  package/gcc/14.1.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
>  package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch lib_patch.Upstream
>  package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch lib_patch.Upstream
> diff --git a/package/gcc/13.2.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch
> similarity index 100%
> rename from package/gcc/13.2.0/0001-disable-split-stack-for-non-thread-builds.patch
> rename to package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch
> diff --git a/package/gcc/13.2.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch b/package/gcc/13.3.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
> similarity index 100%
> rename from package/gcc/13.2.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
> rename to package/gcc/13.3.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
> diff --git a/package/gcc/13.2.0/0003-Remove-crypt-and-crypt_r-interceptors.patch b/package/gcc/13.3.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
> similarity index 100%
> rename from package/gcc/13.2.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
> rename to package/gcc/13.3.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index a0377cc0a3..ac20591e5c 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -76,7 +76,7 @@ config BR2_GCC_VERSION
>  	string
>  	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
>  	default "12.3.0"    if BR2_GCC_VERSION_12_X
> -	default "13.2.0"    if BR2_GCC_VERSION_13_X
> +	default "13.3.0"    if BR2_GCC_VERSION_13_X
>  	default "14.1.0"    if BR2_GCC_VERSION_14_X
>  	default "arc-2023.09-release" if BR2_GCC_VERSION_ARC
>  
> diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
> index 08d4fca6e7..0b48a1acdd 100644
> --- a/package/gcc/gcc.hash
> +++ b/package/gcc/gcc.hash
> @@ -4,8 +4,8 @@ sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b
>  sha512  440c08ca746da450d9a1b35e8fd2305cb27e7e6987cd9d0f7d375f3b1fc9e4b0bd7acb3cd7bf795e72fcbead59cdef5b6c152862f5d35cd9fbfe6902101ce648  gcc-10.4.0.tar.xz
>  # From https://gcc.gnu.org/pub/gcc/releases/gcc-12.3.0/sha512.sum
>  sha512  8fb799dfa2e5de5284edf8f821e3d40c2781e4c570f5adfdb1ca0671fcae3fb7f794ea783e80f01ec7bfbf912ca508e478bd749b2755c2c14e4055648146c204  gcc-12.3.0.tar.xz
> -# From https://gcc.gnu.org/pub/gcc/releases/gcc-13.2.0/sha512.sum
> -sha512  d99e4826a70db04504467e349e9fbaedaa5870766cda7c5cab50cdebedc4be755ebca5b789e1232a34a20be1a0b60097de9280efe47bdb71c73251e30b0862a2  gcc-13.2.0.tar.xz
> +# From https://gcc.gnu.org/pub/gcc/releases/gcc-13.3.0/sha512.sum
> +sha512  ed5f2f4c6ed2c796fcf2c93707159e9dbd3ddb1ba063d549804dd68cdabbb6d550985ae1c8465ae9a336cfe29274a6eb0f42e21924360574ebd8e5d5c7c9a801  gcc-13.3.0.tar.xz
>  # From https://gcc.gnu.org/pub/gcc/releases/gcc-14.1.0/sha512.sum
>  sha512  e9e224f2b26646fcf038d28dfa08b94c623bc57941f99894a321d01c600f7c68aff6b8837fd25e73e540de1f8de5606e98694a62cdcdfb525ce768b3ef6879ea  gcc-14.1.0.tar.xz
>  
> -- 
> 2.30.2
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
