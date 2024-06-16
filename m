Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9845C27C53
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 16:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D1BC405F6;
	Sun, 16 Jun 2024 16:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QS-qLf7COU6n; Sun, 16 Jun 2024 16:05:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90456405DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90456405DE;
	Sun, 16 Jun 2024 16:05:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B6711BF2BF
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 16:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9366581DE4
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 16:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i2HCjBOiCiqu for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 16:05:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C710A81DE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C710A81DE2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C710A81DE2
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 16:05:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 05DA613F88E;
 Sun, 16 Jun 2024 18:04:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Jun 2024 18:04:55 +0200
Date: Sun, 16 Jun 2024 18:04:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alex Suykov <alex.suykov@gmail.com>
Message-ID: <Zm8NJ4LTq0YMe3Wy@landeda>
References: <Zm8HqxlyfhIbYhdt@latitude.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zm8HqxlyfhIbYhdt@latitude.localdomain>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718553898;
 bh=oKcksI2KG92DIJQADhUMFZ/aVa0WAVxU/sJfqzUUpj8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lQegk/lkVdhpRqExk3SeonW6NtnjzcHIEc8tTT8B7X3ZyWo780QzKAXlQ0EbraHup
 HuqvrAMIRi56MY2pCDytp+QrWJHxAHr1i4yAuVEZ1wVrWd69mEl4Z9R1rnxUr2t9tc
 /X7FEYZY6DW/HdSXUX2ew8ZcAOfBTTcxj3TgA/6+xHxVxKrFwRoUzTzc9ra/P8Kqa1
 kXJpXBes9LVptVc+eN2ZxFozv5pNZfKHJfJ9yG0Ek1WzTTpNomGZKKGocIlCl5fGN+
 OI3FrMx1yJUZ7OTgjuA3ngy0IrJJAbwfXoZvCT3SDf7og4KLqSI1lbYPHg6RzYLXLe
 Zubkqnnh6r+YA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lQegk/lk
Subject: Re: [Buildroot] [PATCH] vboot-utils: fix failing builds
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

Alex, All,

Thanks for your patch. :-)

On 2024-06-16 18:41 +0300, Alex Suykov spake thusly:
> A typo in the RSA patch and a missing include, which current gcc
> apparently treats as hard errors and earlier ones probably didn't.
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> 
> diff --git a/package/vboot-utils/0003-Avoid-RSA-type-redefinition.patch b/package/vboot-utils/0003-Avoid-RSA-type-redefinition.patch
> index 86374ca854..259b2bb7b4 100644
> --- a/package/vboot-utils/0003-Avoid-RSA-type-redefinition.patch
> +++ b/package/vboot-utils/0003-Avoid-RSA-type-redefinition.patch
> @@ -35,7 +35,7 @@ index 9f98ccc..c2d01a5 100644
>   /* Private key data */
>   typedef struct VbPrivateKey {
>  -  RSA* rsa_private_key;  /* Private key data */
> -+  struct rsa_rt* rsa_private_key;  /* Private key data */
> ++  struct rsa_st* rsa_private_key;  /* Private key data */

Whaoo, that's a hell of a typo, indeed. Good catch!

Since you changed that patch, please add your own SoB line below that of
Thomas and a small nit to explain what you did, e.g.:

    [alex.suykov@gmail.com: fix typo: s/rsa_rt/rsa_st/]
    Signed-off-by: You real Name <your email>

This way, that records all the people that touched that file.

>     uint64_t algorithm;    /* Algorithm to use when signing */
>   } VbPrivateKey;
>   
> diff --git a/package/vboot-utils/0008-firmware-stub-assert.patch b/package/vboot-utils/0008-firmware-stub-assert.patch
> new file mode 100644
> index 0000000000..01fc2c5abd
> --- /dev/null
> +++ b/package/vboot-utils/0008-firmware-stub-assert.patch
> @@ -0,0 +1,17 @@
> +Missing include, assert() is used without <assert.h>.
> +
> +Most likely it was getting included indirectly somehow but that
> +changed in some recent glibc version so it fails to compile now.
> +
> +Signed-off-by: Alex Suykov <alex.suykov@gmail.com>

Please, provide a git-formatted patch, and add an Upstream tag to
explain what the upstream status of that patch is:

    $ ./utils/docker-run make check-package
    package/vboot-utils/0003-Avoid-RSA-type-redefinition.patch:0: missing Upstream in the header (https://nightly.buildroot.org/#_additional_patch_documentation)
    package/vboot-utils/0008-firmware-stub-assert.patch:0: missing Upstream in the header (https://nightly.buildroot.org/#_additional_patch_documentation)

Also, I see that we are usig a very old version of vboot-utils, which
dates from 2015-11-06, almost 9 years ago now. Updating may also help
fix build failures with newer tools.

Could you alse look at doing the update, please?

Incidentally, I also recently sent two patches for the chromebook-snow
defconfig. It would be nice if you could review them (you were in Cc).

Thanks again for your patch!

Regards,
Yann E. MORIN.

> +--- a/firmware/stub/tpm_lite_stub.c
> ++++ b/firmware/stub/tpm_lite_stub.c
> +@@ -25,6 +25,7 @@
> + #include <sys/stat.h>
> + #include <time.h>
> + #include <unistd.h>
> ++#include <assert.h>
> + 
> + 
> + #define TPM_DEVICE_PATH "/dev/tpm0"
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
