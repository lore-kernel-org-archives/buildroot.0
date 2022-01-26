Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C35DC28CF5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 13:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA43B60F5C;
	Wed, 26 Jan 2022 13:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6npKxObS5B2c; Wed, 26 Jan 2022 13:17:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1977F60F5A;
	Wed, 26 Jan 2022 13:17:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF7EB1BF3AD
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 13:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DB12828AF
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 13:17:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1rCoWIM0PEJi for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 13:17:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C3F2826C8
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 13:17:44 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id j14so19734494lja.3
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 05:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=feBG6iAiM0t4eq+mUmjd/09ISWCJQ+uxNHWME2ADRtU=;
 b=IJ0AkoWVY/51THIMabjGuNSaZXsF+dw2kSNASkpopKuWqctw3K49nbZ5nrngfnlTN3
 3xylEAIgKUGoBRxM0wwA1v5lO5E+Z3Uk1Pcglzs+2QrvS6ZIBwJ4s9BqXfxSClNZxvEg
 hjir4Fz9srLggUhSKGsj8cZKkv4tCvf2Newi8wjiDKR2XFbz6ABBnIvevFmG8+ppLI/R
 92Z6fx7R6o/cYbV0rIq/ARF67jBEW2HSB3d913LN7FhWrH9kc2isPZht36qYQb87cyej
 kvTcFvK6bDnuC194ZBP7SyyMa0xB5JX6qgacHCCTYX3QLENy0epm/oY5yNfJa01KJ1D4
 zk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=feBG6iAiM0t4eq+mUmjd/09ISWCJQ+uxNHWME2ADRtU=;
 b=PJlGiaCL/rY959HfnwJ0aBBAIyCP9QHd84VH6vYJIvIoSVKu4iR6PSzKwjN0jenjoc
 8WFzsXohxOoLObZWyr2eDHRDcK4gFtLkwS8SmOX8xQ0qUd5OzHhoBBTTIxwBsqPDOaqK
 T4TY8bywq0fGMYMjk6r8KP1FtX0FhcGYmgjoL3+7sHFUkFijHrVBXjnixJa89uYrzu5v
 RGaSa0IIpv+C3nYMtp9VsrUXgTOan8RNdp01cLBEeKiQHMmOJ0nr0nOt3E+ufOW5rUdX
 0C2jcwsDr7xfsyFwR8PLfZQNWEvuZASRQO3YUV9/wOIhB4pX1J93kD7IFan4FjSA5YgV
 ztaw==
X-Gm-Message-State: AOAM533el+gNTxejEKgx5dOTd/TEIWlVh8ZXU2693dPphXOYQRKdq1NE
 aTUwz0dMEAJtSMpRjNzyjlymAyDPIHve1uFLnuhqA3m4JxE=
X-Google-Smtp-Source: ABdhPJz4NKMCRwL637uWqzeq84WrpNv+28Hug2XmeB2zKwBegNO3XrMiA1kXxATN2kXfPZMAkbaYxZvmebFMgfnaVNg=
X-Received: by 2002:a2e:b557:: with SMTP id a23mr9080804ljn.294.1643203062044; 
 Wed, 26 Jan 2022 05:17:42 -0800 (PST)
MIME-Version: 1.0
References: <20220125210800.299916-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20220125210800.299916-1-fontaine.fabrice@gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 26 Jan 2022 14:17:30 +0100
Message-ID: <CAEyMn7bdGv16A4wVpR2_KFaJUuunVAUBLUY1jZd58mwW30oruQ@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/netopeer2: disable tests
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

Hi Fabrice,

Am Di., 25. Jan. 2022 um 22:09 Uhr schrieb Fabrice Fontaine
<fontaine.fabrice@gmail.com>:
>
> Disable tests which are enabled since bump to version 2.0.35 in commit
> 13d4856b916d797c3c771669edd3eb883336766f and
> https://github.com/CESNET/netopeer2/commit/466a0b3c268ee319b4f65980404715a2723b4c0a
> to avoid the following build failure if cmocka is built before
> netopeer2:
>
> In file included from /home/buildroot/autobuild/instance-2/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/stdint.h:20,
>                  from /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/lib/gcc/riscv64-buildroot-linux-musl/10.3.0/include/stdint.h:9,
>                  from /home/buildroot/autobuild/instance-2/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/libyang/libyang.h:18,
>                  from /home/buildroot/autobuild/instance-2/output-1/build/netopeer2-2.0.35/tests/test_sub_ntf.c:27:
> /home/buildroot/autobuild/instance-2/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/bits/alltypes.h:53:24: error: conflicting types for 'uintptr_t'
>    53 | typedef unsigned _Addr uintptr_t;
>       |                        ^~~~~~~~~
>
> Fixes:
>  - http://autobuild.buildroot.org/results/0660a4f767d5cdaf07b28a508101b87f0300850f
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>

> ---
>  package/netopeer2/netopeer2.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
> index c8b6763313..43f22b7e4c 100644
> --- a/package/netopeer2/netopeer2.mk
> +++ b/package/netopeer2/netopeer2.mk
> @@ -11,7 +11,9 @@ NETOPEER2_LICENSE = BSD-3-Clause
>  NETOPEER2_LICENSE_FILES = LICENSE
>  NETOPEER2_DEPENDENCIES = libnetconf2 libyang sysrepo host-sysrepo
>
> -NETOPEER2_CONF_OPTS = -DBUILD_CLI=$(if $(BR2_PACKAGE_NETOPEER2_CLI),ON,OFF)
> +NETOPEER2_CONF_OPTS = \
> +       -DBUILD_CLI=$(if $(BR2_PACKAGE_NETOPEER2_CLI),ON,OFF) \
> +       -DENABLE_TESTS=OFF
>
>  # Set a build specific SYSREPO_SHM_PREFIX to ensure we can safely delete the
>  # files. This also ensures that concurrent parallel builds will not be
> --
> 2.34.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
