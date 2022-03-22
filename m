Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A632C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 05:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C18D84319;
	Tue, 22 Mar 2022 05:19:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id or8QfL_LsB8Y; Tue, 22 Mar 2022 05:19:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B7AA84244;
	Tue, 22 Mar 2022 05:19:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C31831BF31C
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 05:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF217611AA
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 05:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1_pRhTnfcjQ9 for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 05:19:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8532A611A9
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 05:19:16 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id e22so19025549ioe.11
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 22:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lP6thzM7qrcNR4KiJXyCQp8Qd4HjWZonBHzbYW5xsos=;
 b=ep8zzHz4dHbHdhl1BCQZ83aPnEAvFpdJP3Wrdhfvvhv2EMQhakq3qORfbbcUpaJ0lj
 YObUJyp/w9Xzsl+2vTs81Ui49UhBaG3Q3Ohh3SvKmkz+w8IDlVtJl1PsQJVPg4Ymvdh2
 hZ8KQMyJa26rtqfPP5okSsl/xXhYb5KSWygz8ID7Q99usw96AdfluNh/um4WsyAP7nwF
 AiTC29Sr/g9W5SkxekA5fjKomj0jAYQqa1vPol6wTuQxT5sC35StVkHBg0BxAiqVWwAR
 9Bbd64Vik8Sq7U6t9CHIpvl/45Kon84TOHNsYEASSz/4F7uLB2lNctc4KcsyAjQKKLNY
 +TFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lP6thzM7qrcNR4KiJXyCQp8Qd4HjWZonBHzbYW5xsos=;
 b=s3IZ3XxIUID6M5o9/pg0GUPrW0ve1XiudJQCQlQ/zDkpztX1bjz1DyKMVORCYh6TNc
 lWwf4vKBgR0FYRkuZrccXybkneVcqail2MzxiKO+M3X969c7U3J141RGwOZTmw5i3Yb3
 g7PwVpjZi4Sdzwrw+FjvozkNVQAbjM64uFBtqb7BWeD7Q3430yRJKIDgmkbD61wHaUEr
 ZUMdU3r6e17Dayup+cJxkqrEUx0qGHsAnlY95zXr9GJbmZ68/i4CUrla2n6FbFhqfe+u
 ttFIvdETjhb2UWaHhu19sXcqLXErLYqQiPI4/9suU3chB8kfqxnGD4iLOYLmqZ6U37pS
 ob9g==
X-Gm-Message-State: AOAM533OYaOPD7Xsh+L5w/xibRmSwkUv29k2tBxLfdBg7zbMtUGwPKFM
 gSwdtqqEYg6/CM1gjKd/JDpI0BHswHrtfQ==
X-Google-Smtp-Source: ABdhPJzwFrA8fqwrjMzjyrW4v65HJtDZGHVuNz+S4f2K0Vm/VzoOZ4C3GFLUMACoPRVTw3x3S2d5nA==
X-Received: by 2002:a6b:fd0c:0:b0:645:d261:ba25 with SMTP id
 c12-20020a6bfd0c000000b00645d261ba25mr11757653ioi.124.1647926355205; 
 Mon, 21 Mar 2022 22:19:15 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com.
 [209.85.166.52]) by smtp.gmail.com with ESMTPSA id
 t13-20020a056e02160d00b002c808d68c60sm5983599ilu.15.2022.03.21.22.19.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 22:19:14 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id z6so9535126iot.0
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 22:19:14 -0700 (PDT)
X-Received: by 2002:a05:6602:42:b0:648:d477:5876 with SMTP id
 z2-20020a056602004200b00648d4775876mr11790590ioz.211.1647926354528; Mon, 21
 Mar 2022 22:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220322051448.2589854-1-christian@paral.in>
In-Reply-To: <20220322051448.2589854-1-christian@paral.in>
Date: Mon, 21 Mar 2022 22:18:58 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qzrqF-1i9w1T0aCOp5MJCk_fPxPQFC+Uj7CsF9pgc3uA@mail.gmail.com>
Message-ID: <CA+h8R2qzrqF-1i9w1T0aCOp5MJCk_fPxPQFC+Uj7CsF9pgc3uA@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
Subject: Re: [Buildroot] [PATCH 1/1] package/go: bump to version 1.18
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On Mon, Mar 21, 2022 at 10:14 PM Christian Stewart <christian@paral.in> wrote:
>
> The latest Go release, version 1.18, is a significant release, including changes
> to the language, implementation of the toolchain, runtime, and libraries.
>
> https://go.dev/doc/go1.18
>

>  # From https://golang.org/dl/
> -sha256  2effcd898140da79a061f3784ca4f8d8b13d811fb2abe9dad2404442dabbdf7a  go1.17.8.src.tar.gz
> +sha256  38f423db4cc834883f2b52344282fa7a39fbb93650dc62a11fdf0be6409bdad6  go1.18.src.tar.gz
>  sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE

I should note that this upgrade also will change a lot of the Go
package hashes...

Due to the way the "go mod vendor" step works, there's some
incompatibility with the go 1.17 vendor format:

go: inconsistent vendoring in /build/containerd-1.5.9:
        github.com/containerd/containerd: is marked as replaced in
vendor/modules.txt, but not replaced in go.mod

        To ignore the vendor directory, use -mod=readonly or -mod=mod.
        To sync the vendor directory, run:
                go mod vendor

We will need to update the hashes and the archives for these packages.

Unfortunately I don't know of any way to avoid this, other than
re-running "go mod vendor" if there's any conflict.

Thanks & best regards,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
