Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD75C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:36:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 036AF60C3F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 036AF60C3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4B41401FF;
	Wed,  4 Aug 2021 21:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QvfNEcVRtpRw; Wed,  4 Aug 2021 21:36:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 712EE4020C;
	Wed,  4 Aug 2021 21:36:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 953811BF5DB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83FDA8399E
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vX5uqGf45Jgg for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 21:36:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1D1382B75
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 21:36:11 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id r5so2992158ilc.13
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 14:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zoumac9V81j8pb2IQRxJwiRfUEns9S9yHZu5txrozK8=;
 b=ZVZBqkcNFBa8HJKxC2n1NZ0bbZceZpbwJGUFWk4yVD7D72YaIuV9jL08l8WUXZzYlJ
 Xqhhalmk5ns0Cm3PGgmC9m66gYpfyC7o6dDw0C+gBxXslu2IAcadH7/neqQ43JKzvxts
 7pfEWLZKKRkjdNjlcahWNAsCmfwEEZ9BGhuwEdADqn1YTjXdqqKCNKJ6q8o+nXHMMzgT
 smaBvowhIuK998MVdiU5bl0EHjjxYHwzECr9aNHZV9G6DAybp7yhx2wDE33jU1Xl8jrc
 +5J8wHuXmgrdQxCJL0nMYidQz6RY2XdXZsSiL/YaKrXFT9kOiXTq2621Yh9cOukV1SYz
 qbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zoumac9V81j8pb2IQRxJwiRfUEns9S9yHZu5txrozK8=;
 b=eciCCW2xulZGNas120G3Wk5HKRfU1nJfPgfwcU4ktTBXxuXqL27oEjjCnE+pxLH57E
 d1/VYVpReg6gAE7ACnwI1DIYv51SCXRMdKYlkLtN/80wHrmaTBQGgh4G43ICmsY+YIX2
 3u/yy+RT98rD7VJ93GDYwoK1mDGYK2pitfZLnODRHIrfk34frIVN7StaIkQBhwN6j/bY
 MIp3MiheSP63qCeAEum0desA9pT5DN9WN/mvqco6+4kuCF7KSTynsHjMglfXZeBluyIu
 AJepReTznIDRctEm71VMskk3gjj/t8aA2D7NAk7CAP1SJL7HWVQTdw5PeY6Rj5JpeIKG
 R/wQ==
X-Gm-Message-State: AOAM533QPG+wEnmQWx4SGc0xdzoDjA/jXtjR0qMRYDdG/N2CSEbQKZP+
 9170zi3MeIOFPNgtSbT59//rN1EUZVIGnXoWgT0=
X-Google-Smtp-Source: ABdhPJzLqfDEzdCqGl2FDkXA75yFyoxthqNRwxrgY31ackDBWRjrxuK3ggXdYXTjPP8VgNpsZIEJgDe9MmzH4VF3Ua0=
X-Received: by 2002:a92:8707:: with SMTP id m7mr1278381ild.177.1628112970877; 
 Wed, 04 Aug 2021 14:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210804172259.9143-1-petr.vorel@gmail.com>
In-Reply-To: <20210804172259.9143-1-petr.vorel@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 5 Aug 2021 07:35:44 +1000
Message-ID: <CAKmqyKMe1XOPsR2WvjJSvyJA6caRJj5HfhPC1=Ge0JgeEAu7=w@mail.gmail.com>
To: Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [Buildroot] [RFC][PATCH 1/1] package/glibc: bump version to
 2.34-5-g9995d0588f4f9adc68419224d2b3698e2ca4f77e
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Romain Naour <romain.naour@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Thu, Aug 5, 2021 at 3:23 AM Petr Vorel <petr.vorel@gmail.com> wrote:
>
> Also upgrade to on RISC-V (that could have been done in d5ce3b5db5)
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi,
>
> I tested it with building pc_x86_64_efi_defconfig, adding nfs-utils,
> ltp-testsuite and few other tools. Not sure if this is enough for
> testing.
>
> Kind regards,
> Petr
>
>  .../glibc.hash                                            | 7 -------
>  .../glibc.hash                                            | 2 +-
>  package/glibc/glibc.mk                                    | 8 +-------
>  3 files changed, 2 insertions(+), 15 deletions(-)
>  delete mode 100644 package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash
>  rename package/glibc/{2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f => 2.34-5-g9995d0588f4f9adc68419224d2b3698e2ca4f77e}/glibc.hash (70%)
>
> diff --git a/package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash b/package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash
> deleted file mode 100644
> index 558591522e..0000000000
> --- a/package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Locally calculated (fetched from Github)
> -sha256 c3828224d69a42f5b6982cbec8ae01cf494fe975ce9023e36ff2c10a2fb93e42 glibc-2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99.tar.gz
> -
> -# Hashes for license files
> -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> -sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> -sha256  b33d0bd9f685b46853548814893a6135e74430d12f6d94ab3eba42fc591f83bc  LICENSES
> diff --git a/package/glibc/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/glibc.hash b/package/glibc/2.34-5-g9995d0588f4f9adc68419224d2b3698e2ca4f77e/glibc.hash
> similarity index 70%
> rename from package/glibc/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/glibc.hash
> rename to package/glibc/2.34-5-g9995d0588f4f9adc68419224d2b3698e2ca4f77e/glibc.hash
> index 4b8d8297ec..8b5aacb535 100644
> --- a/package/glibc/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/glibc.hash
> +++ b/package/glibc/2.34-5-g9995d0588f4f9adc68419224d2b3698e2ca4f77e/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from Github)
> -sha256  3e2004b16ec6b79a19a88ed4736719ef9e419f9d8e7013faced654c0339e23dc  glibc-2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f.tar.gz
> +sha256  77af51b251591d013ad4634863a42ac8ce62f4b2c7c29cba38a2ad5098d2727f  glibc-2.34-5-g9995d0588f4f9adc68419224d2b3698e2ca4f77e.tar.gz
>
>  # Hashes for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 1c8c409878..320848bd01 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -11,13 +11,7 @@ else
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -ifeq ($(BR2_RISCV_32),y)
> -# RISC-V 32-bit (RV32) requires glibc 2.33 or newer
> -# Until 2.33 is released, just use master
> -GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99
> -else
> -GLIBC_VERSION = 2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f
> -endif
> +GLIBC_VERSION = 2.34-5-g9995d0588f4f9adc68419224d2b3698e2ca4f77e

Woo! For the RISC-V part

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>  # Upstream doesn't officially provide an https download link.
>  # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
>  # sometimes the connection times out. So use an unofficial github mirror.
> --
> 2.32.0
>
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
