Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971E4C27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 15:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4291680BB2;
	Wed, 12 Jun 2024 15:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_QyX-n25PTL; Wed, 12 Jun 2024 15:48:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2753180B3E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2753180B3E;
	Wed, 12 Jun 2024 15:48:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66CD31BF36D
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 15:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5264680ADD
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 15:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhm6XGuBFbB6 for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 15:48:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1693580A50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1693580A50
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1693580A50
 for <buildroot@busybox.net>; Wed, 12 Jun 2024 15:48:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 0EEA67802D6;
 Wed, 12 Jun 2024 17:48:42 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:49208])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 12 Jun 2024 15:48:42 +0000
MIME-Version: 1.0
Date: Wed, 12 Jun 2024 15:48:42 +0000
From: Julien Olivain <ju.o@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
In-Reply-To: <20240612135727.11811-2-ps.report@gmx.net>
References: <20240612135727.11811-1-ps.report@gmx.net>
 <20240612135727.11811-2-ps.report@gmx.net>
User-Agent: Webmail Free/1.6.7
Message-ID: <d6f34e673ea426c735c30aede4f36ca2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718207325;
 bh=U51ZDfcmFw9zDyQ31giO0/WELgHwn6Y0lTdWWN8Qd4I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J1Ztf+6e929quaSDhsVfbtlHgXj0O6V7qZu829rdFUbDtfCawHq3t2RLX+XiJCgaT
 OB31zNeLyblj+XbXatFf0sa5cecDRI4HtTURUEZE/Pz/apTrRn18W/Zhqb1ieIMWwx
 8wJ7Yu3GmgzZ9yevdWb3v+Lg/EZiOHXNGVk+FOBGWxYEcv9/5Xk5q4ySlNhR62bgHp
 2Yr/BHjAzvCnFo3v9vHgPEoCbO/MpO+jmqLfpMgy2Cn9c2z7u0rYWJtshjalzoOzHO
 /PGTqXDUpJxLgDs7FmboVIs8w4fE14BXg+0HhOMqMq7NAGxe6OVec80644egn3TE4W
 wFERMmlWY6pUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=J1Ztf+6e
Subject: Re: [Buildroot] [PATCH v2 2/5] package/xz: bump version to 5.6.2
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
Cc: buildroot@busybox.net, Samuel Martin <s.martin49@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


   Hi Peter,

On 12/06/2024 13:57, Peter Seiderer via buildroot wrote:
> - bump version to 5.6.2
> - add BSD-0-Clause and update license file hash accordingly (see [1], 
> [2], [3],
>   [4], [5], [6], [7] and [8])
> 
> For details see [9].
> 
> [1] 
> https://github.com/tukaani-project/xz/commit/b1ee6cf259bb49ce91abe9f622294524e37edf4c
> [2] 
> https://github.com/tukaani-project/xz/commit/689e0228baeb95232430e90d628379db89583d71
> [3] 
> https://github.com/tukaani-project/xz/commit/28ce45e38fbed4b5f54f2013e38dab47d22bf699
> [4] 
> https://github.com/tukaani-project/xz/commit/17aa2e1a796d3f758802df29afc89dcf335db567
> [5] 
> https://github.com/tukaani-project/xz/commit/bfd0c7c478e93a1911b845459549ff94587b6ea2
> [6] 
> https://github.com/tukaani-project/xz/commit/fd7faa4c338a42a6a40e854b837d285ae2e8c609
> [7] 
> https://github.com/tukaani-project/xz/commit/62733592a1cc6f0b41f46ef52e06d1a6fe1ff38a
> [8] 
> https://github.com/tukaani-project/xz/commit/6bbec3bda02bf87d24fa095074456e723589921f
> [9] https://github.com/tukaani-project/xz/releases/tag/v5.6.2
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - bump version to first one after the backdoor incident
>   - omit homepage URL change (reverted upstream)
> 
> Notes:
>   - while searching the history, detected an previously/alterantive 
> patch
>     for the initial version bump by Julien Olivain, see
>     
> http://lists.busybox.net/pipermail/buildroot/2024-February/371577.html

I confirm I initially proposed a bump to xz 5.6.0. I marked the
patch as "Rejected" the day of the XZ backdoor announce.

On that matter, I would suggest to add a note on commit logs
about this security incident. Basically, your version bumps
from 5.4.6 -> 5.4.7 and 5.4.7 -> 5.6.2 are jumping over the
known backdoored versions (which are 5.6.0 and 5.6.1). So
Buildroot has never been impacted by this issue (without and
with this patch).

See:
https://tukaani.org/xz-backdoor/
https://cve.mitre.org/cgi-bin/cvename.cgi?name=2024-3094

> ---
>  package/xz/xz.hash | 8 ++++----
>  package/xz/xz.mk   | 6 +++---
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/xz/xz.hash b/package/xz/xz.hash
> index ff070f6775..6012e1001b 100644
> --- a/package/xz/xz.hash
> +++ b/package/xz/xz.hash
> @@ -1,11 +1,11 @@
>  # Locally calculated after checking pgp signature
> -# 
> https://github.com/tukaani-project/xz/releases/download/v5.4.7/xz-5.4.7.tar.bz2.sig
> +# 
> https://github.com/tukaani-project/xz/releases/download/v5.6.2/xz-5.6.2.tar.bz2.sig
>  # using key 3690C240CE51B4670D30AD1C38EE757D69184620 Lasse Collin 
> <lasse.collin@tukaani.org>
> -
> -sha256  
> 9976ed9cd0764e962d852d7d519ee1c3a7f87aca3b86e5d021a45650ba3ecb41  
> xz-5.4.7.tar.bz2
> +sha256  
> e12aa03cbd200597bd4ce11d97be2d09a6e6d39a9311ce72c91ac7deacde3171  
> xz-5.6.2.tar.bz2
> 
>  # Hash for license files
> -sha256  
> 72d7ef9c98be319fd34ce88b45203b36d5936f9c49e82bf3198ffee5e0c7d87e  
> COPYING
> +sha256  
> ee3b35b82f7bb0ba5fd9f13ca34ebbe757a59c05bfde5ab9d50ff4188ed33396  
> COPYING
> +sha256  
> 0b01625d853911cd0e2e088dcfb743261034a091bb379246cb25a14cc4c74bf1  
> COPYING.0BSD
>  sha256  
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  
> COPYING.GPLv2
>  sha256  
> 3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  
> COPYING.GPLv3
>  sha256  
> dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  
> COPYING.LGPLv2.1
> diff --git a/package/xz/xz.mk b/package/xz/xz.mk
> index d5dceb0eae..10590f6be8 100644
> --- a/package/xz/xz.mk
> +++ b/package/xz/xz.mk
> @@ -4,13 +4,13 @@
>  #
>  
> ################################################################################
> 
> -XZ_VERSION = 5.4.7
> +XZ_VERSION = 5.6.2
>  XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
>  XZ_SITE = 
> https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
>  XZ_INSTALL_STAGING = YES
>  XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
> -XZ_LICENSE = Public Domain, GPL-2.0+, GPL-3.0+, LGPL-2.1+
> -XZ_LICENSE_FILES = COPYING COPYING.GPLv2 COPYING.GPLv3 
> COPYING.LGPLv2.1
> +XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, 
> LGPL-2.1+
> +XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 
> COPYING.LGPLv2.1
>  XZ_CPE_ID_VENDOR = tukaani
> 
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> --
> 2.45.2
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
