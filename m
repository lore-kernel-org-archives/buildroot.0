Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FAFC27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 09:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FC52607AD;
	Thu,  6 Jun 2024 09:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-MtSIJInMOT; Thu,  6 Jun 2024 09:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80D1760816
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80D1760816;
	Thu,  6 Jun 2024 09:52:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FDB71BF23C
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 09:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C42C60816
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 09:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8NBHutWHfuvw for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 09:52:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 42A80607AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42A80607AD
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42A80607AD
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 09:52:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 854FF13FA41;
 Thu,  6 Jun 2024 11:52:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 11:52:42 +0200
Date: Thu, 6 Jun 2024 11:52:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kadir Yilmaz <kadir.c.yilmaz@gmail.com>
Message-ID: <ZmGG6tmBhLTeFhbx@landeda>
References: <20231025212924.1957581-1-kadir.c.yilmaz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231025212924.1957581-1-kadir.c.yilmaz@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717667566;
 bh=8/5Ln+j2FtK6a09mGd5OmZ4hK9AmzZHbwfLrOuO9KSs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jyOAKFhKCI+g0veLj0jZUrazTQKn/k/TA2be9NxRjSS13LP5qWStFExju/Lg5k7Yw
 MubFEACs6ph6FYa4zncJdDvkOHjARRJ3TbMze5v4fwyQ7He2Q2zneYs59EV2V9cP0m
 ou7Ii1r50ZOjl3t2yMOoXvfavN+dc2AP6kXtIv8bKLlsCDTFLdppRRsQnpenEaNsng
 jXelEs8Elxodf4tG94ohq9a9gxK1IQk/tW0LylldqZY90eRpblphPlEMs9Kf8118iJ
 bUDxSrx41u8hUBTp909GZGCyoi8JNQtToEpzKnevFlj+LrQ3IXE6pIFKtcBe/2p7aN
 x2gZbRgYz0kuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jyOAKFhK
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5webengine: don't use system
 ICU libraries
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kadir, All,

Thank you for the patch, and again, sorry to come back to it so late...

+James, who bumped to a version that had the hos-icu dependency

On 2023-10-25 23:29 +0200, Kadir Yilmaz spake thusly:
> With the "-webengine-icu" config option qt5webengine uses icu headers
> on the build host. If (for ubuntu) libicu-dev is not installed on the
> system, build fails with:
> 
> In file included from ../../3rdparty/chromium/v8/src/regexp/gen-regexp-special-case.cc:10:
> ../../3rdparty/chromium/v8/src/regexp/special-case.h:12:10: fatal error: unicode/uchar.h: No such file or directory
>    12 | #include "unicode/uchar.h"
>       |          ^~~~~~~~~~~~~~~~~
> compilation terminated.
> 
> Otherwise, if (for ubuntu) libicu-dev is installed on the system, build
> fails later at linking stage.
> 
> Using icu bundled with qt solves this problem

This is weird, because qt5webengine already contains a dependency on
host-icu, so ehther the host distro has or does not have icu development
files, the build should use our owns,

> Signed-off-by: Kadir Yilmaz <kadir.c.yilmaz@gmail.com>
> ---
>  package/qt5/qt5webengine/qt5webengine.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
> index 836ba62189..c028246589 100644
> --- a/package/qt5/qt5webengine/qt5webengine.mk
> +++ b/package/qt5/qt5webengine/qt5webengine.mk
> @@ -87,7 +87,6 @@ QT5WEBENGINE_DEPENDENCIES += \
>  QT5WEBENGINE_CONF_OPTS += \
>  	-webengine-embedded-build \
>  	-webengine-ffmpeg \
> -	-webengine-icu \
>  	-webengine-opus \
>  	-webengine-webchannel \
>  	-webengine-webp \
> -- 
> 2.25.1
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
