Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 693F6C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 00:48:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2860E60F14
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 00:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2860E60F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E236F83BAB;
	Fri,  6 Aug 2021 00:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zu9lryCE3WPB; Fri,  6 Aug 2021 00:48:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 312C283BA7;
	Fri,  6 Aug 2021 00:48:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB3851BF2C9
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 00:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2BC060814
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 00:48:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ucaQKUQM0QiF for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 00:48:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9D29605F7
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 00:48:41 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id m13so9104228iol.7
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 17:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2YBRShXx1eJQPNDpnJC91dvVaPvnWLndw5SQeE1jqMg=;
 b=OIh1FL7Khx36egDVVYtPyHCUv11kYVVfp8HcdIT5c/JkCcimS4n+FPXXQid7Y4vSL5
 fKHbHIuuUcAQyMURu6g7+86nuVHgMSqcsPesA551lOepot/CHedSVpO3HHWtjeVBJzgU
 JOx/4Tf1jx8KPHuSO4wCapLudNZCpgAjcweqmDvHHI+tCEyYv2fkNENZLommUa3Pst00
 RCUp6dp85C6IXsVgCYI9ruiMAF84Dzlipda0pP30KU9GKKUo0v1YH7P7Hj2M4TFQCT3W
 1jGwMR0uZKQJSImXeSn7j7iCupZ4zBJixcrQJtCHzT5S22qiUTa64i4JRhbefLOs0KGa
 /7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2YBRShXx1eJQPNDpnJC91dvVaPvnWLndw5SQeE1jqMg=;
 b=Jbo7Yli+2529TraVbCyZq+uNXny1iCLKPcs++aJyGCtV4IOfaKSeMhtM1BgAi12XbX
 9zTGsmiXBTzMK99CPolqp4RVO7MoRD4BJSHlD6YHCrNNRnT94Wo5QN1LzX+ldQFEkGCN
 MkAZnijtF5UWsv3l2Xx1qV02cAy/kc2o8jFfYX56KUd40sSBwaYpNj56P5Jr2O4lLvmq
 jqgv9MCy0q3HwEXpu4dIudkhqnY5YdGP0aYdlibYMh8JjNX7ItT+oo8a0Wv1A2sCxE7l
 Gpf5RRlogdzoQM2e9jrBshxCAJrC2XVmtFd36bUWFJGJg4qdI5Vl/s1EBnjiJA5IS3Ji
 GqVg==
X-Gm-Message-State: AOAM533T+8JDNdKlOyOBl514ETnNQ/EUW51n3kKpYLWJWscr4Et07yZb
 zNMqO9za7IVvFum3uS3DldVIvyy++jYUJVwWsK4=
X-Google-Smtp-Source: ABdhPJzSaS75CtiGuV7La8r3xzshvkDwt2PgUrLcI22aB2hzDlckJpqOfGpHbhfrNeeAh6ByS0mKWFvWiXfKIIrgOCA=
X-Received: by 2002:a5e:a510:: with SMTP id 16mr123875iog.42.1628210920999;
 Thu, 05 Aug 2021 17:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210806003144.455964-1-joel@jms.id.au>
In-Reply-To: <20210806003144.455964-1-joel@jms.id.au>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 6 Aug 2021 10:48:14 +1000
Message-ID: <CAKmqyKM6FToefxUF8Gx86PZGANKJeD+0s8WLgbNsOQzAm8By+g@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [Buildroot] [PATCH] package/glibc: Use 2.33 for RISC-V 32-bit
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Fri, Aug 6, 2021 at 10:32 AM Joel Stanley <joel@jms.id.au> wrote:
>
> RISC-V 32-bit was special cased to use glibc master as support was not
> in a released version.
>
> Recently 2.33 was released, so RV32 can now use the same glibc version
> as other platforms.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> I was adding some glibc patches and was confused by the version
> situation. I think this was overlooked when bumping the version to 2.33.
>
> I built qemu_riscv32_virt_defconfig and boot tested this in qemu:
>
> # /lib/ld-linux-riscv32-ilp32d.so.1 --version
> ld.so (Buildroot) release release version 2.33.
>
>  .../glibc.hash                                             | 7 -------
>  package/glibc/glibc.mk                                     | 6 ------
>  2 files changed, 13 deletions(-)
>  delete mode 100644 package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash
>
> diff --git a/package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash b/package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash
> deleted file mode 100644
> index 558591522e3a..000000000000
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
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 1c8c40987812..1eff2455881d 100644
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
>  GLIBC_VERSION = 2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f
> -endif
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
