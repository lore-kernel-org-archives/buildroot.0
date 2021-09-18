Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101A3C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:33:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F3276127B
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F3276127B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 571608423F;
	Sat, 18 Sep 2021 15:33:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EkmWR1pt8oG9; Sat, 18 Sep 2021 15:33:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9785C84206;
	Sat, 18 Sep 2021 15:33:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D09741BF861
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC90560776
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:33:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j0feSCX6S2W8 for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 15:33:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B70D16075D
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 15:33:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E09EAB0057C;
 Sat, 18 Sep 2021 17:33:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631979224;
 bh=zKh6ZiaDU8WBnI7SmnR2Lxp1oTJxqSW7tLUws4JBoug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ihotx5GBmsh97kzXuv+8C2SBoHKilzsU4ZEPUEmlW8gf4CH5SWP9vK8SDJWGCTTHA
 dQExkHKDwNGindC4WEhH85N7twp03/4Hz2cWJNZKnKz6F0gjedcxOVSNoxicPWdFtu
 /xuLHf/rskxIymBFAz0fS8zXigH6UAD6VHkB3gY/08XeQyXiJ5ZDeO1KiQt7SPZxoV
 bHwnow4u6t76cn1VBONzBPhUXMP0G0EM/zzYGWth5kJaPzfBxWfxp5hORK/zEYj9Sw
 uSOOTyQul3a5nq60hAxgboTiXg/3IQKpA3C8N+HEYF6H8ABC72nHr8WY1FXGPU00zb
 JzvF6ZDe2zg2Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 17:33:37 +0200
Date: Sat, 18 Sep 2021 17:33:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andreas Ziegler <br015@umbiko.net>
Message-ID: <20210918153337.GB1053080@scaer>
References: <20210915052807.1981697-1-br015@umbiko.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210915052807.1981697-1-br015@umbiko.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 3/3] package/mpd: update to version 0.22.11
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: =?utf-8?B?SsO2cmc=?= Krause <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Andreas, All,

On 2021-09-15 07:28 +0200, Andreas Ziegler spake thusly:
> mpd 0.22.10 terminates with segmentation fault on graphical clients while retrieving album information. This bug was fixed in version 0.22.11

Please, wrap your commit log to ~72 chars.

Also, the mail subject is:
    [PATCH 3/3] package/mpd: update to version 0.22.11

But I could not see patches 1/3 and 2/3. Did they miss the mailing list?
If so, can you respin the series, please?

Regards,
Yann E. MORIN.

> Tested on x86_64 using M.A.L.P. Android client
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> ---
>  package/mpd/mpd.hash | 2 +-
>  package/mpd/mpd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
> index 3847fc6724..2501be65de 100644
> --- a/package/mpd/mpd.hash
> +++ b/package/mpd/mpd.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated after checking pgp signature
> -sha256  07c82535e9999c3d4a099d8e652c88724635125b3c9f265ba9b6f2974ff9e614  mpd-0.22.10.tar.xz
> +sha256  143f7f34aaee6e87888f3dd35d49aade6656052651b960ca42b46cbb518ca0a0  mpd-0.22.11.tar.xz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index 62e31860c0..fe6b8d539b 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  MPD_VERSION_MAJOR = 0.22
> -MPD_VERSION = $(MPD_VERSION_MAJOR).10
> +MPD_VERSION = $(MPD_VERSION_MAJOR).11
>  MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
>  MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
>  MPD_DEPENDENCIES = host-pkgconf boost
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
