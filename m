Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37342C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 18:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8344605A6;
	Wed,  1 May 2024 18:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4XbXWBm2VBtM; Wed,  1 May 2024 18:20:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8FE36061B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8FE36061B;
	Wed,  1 May 2024 18:20:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C715D1BF429
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 18:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B43364011C
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 18:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6eSIFYMrH2g for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 18:20:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5B9D64010D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B9D64010D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B9D64010D
 for <buildroot@buildroot.org>; Wed,  1 May 2024 18:20:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BBE0A13F838;
 Wed,  1 May 2024 20:20:45 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 01 May 2024 20:20:45 +0200
Date: Wed, 1 May 2024 20:20:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Message-ID: <ZjKH_Uakhe1v0SFB@landeda>
References: <20240501093725.325194-1-dm.chestnykh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501093725.325194-1-dm.chestnykh@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714587647;
 bh=wNYCUUvv9xq3/mKkTwwso/SWXl9LuaV86/jK9PSwiBo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bBd1GPXwgEXYwBga99eklNgWAFFSw44G91UUWtUEJrOGSLWYkKwOr4cs3Ok7GXHcc
 IQz+S//LIrEGAe0+xEReiJw5itLb49bmtZux4H1aBGaVELZOE35CakbsJ32uv292Te
 ANvv3mv9/zj4nIKwjUOmHP2MsiBzvW0GLC4ttv/FbsU+U/+j7jst66+I4t/Dlczxop
 dPDzLRU+3UJCJphzCU9/JfhGlhl5/SlzzpRBwQeSGVd2Wqa9QcWSHw7iND1kVKIJqr
 n2P/nysorXhjda0bmO6uH4LMsuzRFFBHEInfJSotof1RGcbXJrg/9dQUw9Ojkd41IO
 xnqsn5ngGSO/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bBd1GPXw
Subject: Re: [Buildroot] [PATCH v2 1/3] package/uclibc: Bump to 1.0.48.
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

Dimitry, All,

Thanks for working on this version bump! :-)

When resending a patch in a series, resend the full series, not just the
fixed patch.

Also...

On 2024-05-01 12:37 +0300, Dmitry Chestnykh spake thusly:
> In 1.0.48 release uClibc-ng has provided the fix
> for SPARC related to https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
> 
> Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
> ---

... when you send a v2 (v3...) of a patch, you must include a little
explanations about what changed between the versions. See for example:

    https://lore.kernel.org/buildroot/ZjI4anypCjkVxtjO@waldemar-brodkorb.de/

It would have helped spot the fact that the licnese hash has changed,
see below...

>  package/uclibc/uclibc.hash | 6 +++---
>  package/uclibc/uclibc.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
> index a10ceab54c..7097bbf99a 100644
> --- a/package/uclibc/uclibc.hash
> +++ b/package/uclibc/uclibc.hash
> @@ -1,4 +1,4 @@
> -# From https://downloads.uclibc-ng.org/releases/1.0.47/uClibc-ng-1.0.47.tar.xz.sha256
> -sha256  29a4d684a06da344ee3ee09acc2ca7649d592ae3ff848f698145c46def05efcb  uClibc-ng-1.0.47.tar.xz
> +# From https://downloads.uclibc-ng.org/releases/1.0.47/uClibc-ng-1.0.48.tar.xz.sha256
> +sha256  3bf5fc6cc5cbc454b6c478424755c6f71e7c15578a2c966f02606aa5c5596e21  uClibc-ng-1.0.48.tar.xz
>  # Locally calculated
> -sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
> +sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB

We have hashes for license files, so that we notice when the license
file changes. In which case we must assess the reason for that change,
and it must be explained in the commit log, even if briefly:

  - did the licensing terms change, and if so, what is the new license?
  - was there just a minor update, like copyright years?
  - something else?

In any case, updating the hash of a license file should not be done
without explanations.

Can you respin your series with the requested changes, please?

Do not hesitate to carry Waldemar's tested-by tags where appropriate
(i.e. on the version bump, the patch drop, but not on the internal
toolchain backend and defconfig, because it is not obvious what it
applies to).

Regards,
Yann E. MORIN.

> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index a7b18133ff..9593e18d45 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UCLIBC_VERSION = 1.0.47
> +UCLIBC_VERSION = 1.0.48
>  UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
>  UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
>  UCLIBC_LICENSE = LGPL-2.1+
> -- 
> 2.44.0
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
