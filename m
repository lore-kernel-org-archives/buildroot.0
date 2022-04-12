Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E503EC433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 10:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87BF260FF2;
	Tue, 12 Apr 2022 10:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mO0SMYIAFH2J; Tue, 12 Apr 2022 10:43:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04A5060FFE;
	Tue, 12 Apr 2022 10:43:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFA671BF9C6
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 10:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3BFF40275
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 10:43:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HwzSHaRV6rBs for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 10:43:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABD584024B
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 10:43:06 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id t25so9154434edt.9
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 03:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mU/TOu8/XFI7TqW01zWLagAYP7qvrjX+qniCvzwLQMU=;
 b=5QJ3Qo80iTgWH3xiUb1jXfR11c31s7CRftM5rJ3+PBhzGTBsuz0XFAMVdg3avQdJ79
 YOufemgdl5tjJwIqa/oZAWwDCNBgzSpLKD8nERV+g01EW77eywvkA06OSck3hAJWcS9f
 7OWuZitVYvyX3/XWSVyjJkmdo6aUATOGbcY6yV3QHcRO+1O9+YeYmhh1DhuWB6+4v5v3
 kwTZRrzya74FfNugv6z+5JFbwpUMwfYz8cKbgXbrP27OVc53uddlqLuNZ5D/n2l/7HgK
 qbYyf46d7efyjPCID9tuVi1qI0u8Dv9jecCrf3mJDDIVfWnogjsYek1XzlJ8kGww+m7M
 qArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mU/TOu8/XFI7TqW01zWLagAYP7qvrjX+qniCvzwLQMU=;
 b=KI1MZqQcEooJZWbH5Y3S3aX39dSAVLaDw4frSQxQroGsTgHgCnJc6sxk58Fq1RjpaZ
 LGH7iUe/kViN7VNiyM2RoFeU0D6P4y4hX2e4kXdvdb+4yZuLbHqIN2lkO448wY/HLYBR
 9q4jI05DFRm71w2fSk7eGBdzq+q3uFVLKM3AGLEf5VbrFuyLWZS6QoOl4IcLHhLcm15i
 QGDtfRP/6ot43c37xEevcmTwxJnq9nkMzZeMkbwZrhrp+47L1BfKoO2Fxt8b3bFXd5+g
 NW/FgxwfOT4dnje/y7iK9FjCINbw8vLCH/IuuwlftLPyfb3GPpvAh9Q60p2Cf8ovFk4M
 6VCA==
X-Gm-Message-State: AOAM5315aOCHmHDms4iCT0Ugf0hjlLpWxw9jwd/fh0gjUTlJTAHma6GP
 +/+yRHiMPAN/HpDPpzR3RKr0FRoJucelxYLFe5jCpj4sz49y8Q==
X-Google-Smtp-Source: ABdhPJwp0sPxt+EqnDZmAgcBx5+ot6MrfHJa8+u34TEalkGq3XGeOZlHGGVhEQ3hK2iv7q56WGBrwx8nPrEdTe041Go=
X-Received: by 2002:a05:6402:51d2:b0:419:7d2e:9d0 with SMTP id
 r18-20020a05640251d200b004197d2e09d0mr37816308edd.82.1649760184499; Tue, 12
 Apr 2022 03:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220407115952.56219-1-nicolas.tran@smile.fr>
 <20220407115952.56219-2-nicolas.tran@smile.fr>
 <18863202-0ccb-1714-3d05-6f0e119b613d@mind.be>
In-Reply-To: <18863202-0ccb-1714-3d05-6f0e119b613d@mind.be>
From: Nicolas TRAN <nicolas.tran@smile.fr>
Date: Tue, 12 Apr 2022 12:42:48 +0200
Message-ID: <CAJdGGv6XUfCMd8ccD4Wm6vtR12BK-enu7ZBDbXjXUjweLwhJQg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.59.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0600236178178842923=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0600236178178842923==
Content-Type: multipart/alternative; boundary="000000000000c318e105dc72b90b"

--000000000000c318e105dc72b90b
Content-Type: text/plain; charset="UTF-8"

Hello Arnout,

Thank you for the feedback! The patch implementing Rust 1.60.0 is almost
ready and I'm currently trying to figure out how to test the packages
relying on Rust you mentioned. Although following the manual section for
`utils/test-pkg`, I don't quite understand how to make a toolchain consider
the package I'm testing. For example, with a `librsvg.config` containing
"BR2_PACKAGE_LIBRSVG=y", I tried the following command to test
`package/librsvg`:
$ ./utils/test-pkg -c librsvg.config -p librsvg
It turns out all the selected toolchains are SKIPPED. Does each toolchain I
want to test need to have its config file modified to include the line
specified in the output missing.config file? I've tried writing those lines
into the `librsvg.config` I created but it does not seem to be taken into
consideration and the `missing.config` remains the same...
Another question: In the previous command found in the Buildroot manual,
`-p` is an option to be able to "test-build" the package afterhand, by
typing `make librsvg` in my case. What is the output I am supposed to
witness in case of a successful test? Is it intended that running the
test-build on the package named libcurl (just like in the manual) it seems
to be built then removed, with no success comment?

Best regards,
Nicolas

On Sun, Apr 10, 2022 at 4:45 PM Arnout Vandecappelle <arnout@mind.be> wrote:

>   Hi Nicolas,
>
> On 07/04/2022 13:59, Nicolas Tran wrote:
> > Link to Rust version 1.59.0:
> https://blog.rust-lang.org/2022/02/24/Rust-1.59.0.html
>
>   Excellent, thanks! Unfortunately, I just applied two patches that add a
> bunch
> of other tarballs, so these will have to be updated as well now.
>
>   Also, the very day that you posted this patch, rust 1.60 was released.
> So
> maybe you can update to that?
>
>   Finally, when updating rust, it's a good idea to do a build test (using
> the
> test-pkg script) of a few packages that rely on rust: rsvg,
> python-cryptography,
> ripgrep, suricata.
>
>   Oh, also: everything you put in the cover letter would actually be
> useful in
> the commit message. We just prefer if it's written in passive sense rather
> than
> first person, i.e. "Source archives were retrieved and ...". But that's
> really a
> minor thing.
>
>   Regards,
>   Arnout
>
> >
> > Signed-off-by: Nicolas Tran <nicolas.tran@smile.fr>
> > ---
> >   package/rust-bin/rust-bin.hash | 198 ++++++++++++++++-----------------
> >   package/rust-bin/rust-bin.mk   |   2 +-
> >   package/rust/rust.hash         |   6 +-
> >   package/rust/rust.mk           |   2 +-
> >   4 files changed, 104 insertions(+), 104 deletions(-)
> >
> > diff --git a/package/rust-bin/rust-bin.hash
> b/package/rust-bin/rust-bin.hash
> > index 9f8788a295..1aa166c45e 100644
> > --- a/package/rust-bin/rust-bin.hash
> > +++ b/package/rust-bin/rust-bin.hash
> > @@ -1,102 +1,102 @@
> > -# From
> https://static.rust-lang.org/dist/rust-1.58.1-i686-unknown-linux-gnu.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-1.58.1-i686-unknown-linux-gnu.tar.xz.asc
> > -sha256
> 110ca4967351d8535f3d39e24f40e2941c20346c5765d3530270e134ae50568e
> rust-1.58.1-i686-unknown-linux-gnu.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz.asc
> > -sha256
> f71b077caf0becbd0af9fd22bc1fa31c4fdf7a21fe046da8a15a7bde1286da25
> rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-aarch64-unknown-linux-gnu.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-aarch64-unknown-linux-gnu.tar.xz.asc
> > -sha256
> c7a016ac63aeb5481d661ee3e680b57d35d5ccb902c605c32937a047a02cff49
> rust-std-1.58.1-aarch64-unknown-linux-gnu.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-aarch64-unknown-linux-musl.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-aarch64-unknown-linux-musl.tar.xz.asc
> > -sha256
> 4c8d9774fb1f6cfa616f2c43395f438e887a38f0cd901a3886056cc1c1b84c30
> rust-std-1.58.1-aarch64-unknown-linux-musl.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-gnueabi.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-gnueabi.tar.xz.asc
> > -sha256
> eb58c2b72e9bbe50c80e9f2981e14d737198f7e17a4cad524d00baefdfa3bc1d
> rust-std-1.58.1-arm-unknown-linux-gnueabi.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-gnueabihf.tar.xz.asc
> > -sha256
> 58e3f4905c3e7028811971219a3222640f947062fb93dbe51c1674551e9b06a6
> rust-std-1.58.1-arm-unknown-linux-gnueabihf.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-musleabihf.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-musleabihf.tar.xz.asc
> > -sha256
> b354f0ad28d8cc7d5996d46c3a310c80aa6486ac7b89abcd1eeef7f13435e0ff
> rust-std-1.58.1-arm-unknown-linux-musleabihf.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-musleabi.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-musleabi.tar.xz.asc
> > -sha256
> 705fba2a50835354112ab86d1ee8889c39f3c7265d7ca26f1dffebaa463600a6
> rust-std-1.58.1-arm-unknown-linux-musleabi.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-armv5te-unknown-linux-gnueabi.tar.xz.asc
> > -sha256
> 0505759fa8b26c902a701f266db4bfbfe496de71c5c6548a55c562fe9d386485
> rust-std-1.58.1-armv5te-unknown-linux-gnueabi.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-armv5te-unknown-linux-musleabi.tar.xz.asc
> > -sha256
> 9ca8adb43b4e75556a99b6c7a9bc1d9aab894bbe109736c34582169ec81aee14
> rust-std-1.58.1-armv5te-unknown-linux-musleabi.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-gnueabihf.tar.xz.asc
> > -sha256
> 9f38bc3220d659ff482db9a0ace9dcb7051991d471149fad7bbb62fce8314e04
> rust-std-1.58.1-armv7-unknown-linux-gnueabihf.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-gnueabi.tar.xz.asc
> > -sha256
> 1511c675d17033737ab2bd1e87b525aaf59e0455f5a717ab0a91fd849949164f
> rust-std-1.58.1-armv7-unknown-linux-gnueabi.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-musleabihf.tar.xz.asc
> > -sha256
> 2cf8a8cc2441a1bb4b45b690c87fff4df975fac077240706c08594e26f901bdc
> rust-std-1.58.1-armv7-unknown-linux-musleabihf.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-musleabi.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-musleabi.tar.xz.asc
> > -sha256
> db86e823484f210884d7d815ffcd7dae355bba86e18151b0838ec06544bb8126
> rust-std-1.58.1-armv7-unknown-linux-musleabi.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-i586-unknown-linux-gnu.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-i586-unknown-linux-gnu.tar.xz.asc
> > -sha256
> 02bce02f929114cc60126410fceeab6c0bcc8b96c394de9516d8f449880cb585
> rust-std-1.58.1-i586-unknown-linux-gnu.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-i586-unknown-linux-musl.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-i586-unknown-linux-musl.tar.xz.asc
> > -sha256
> e80d5769f042a00388546dbd26cb40c045d5dddc84e5da3f98d174027ed9eaaa
> rust-std-1.58.1-i586-unknown-linux-musl.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-i686-unknown-linux-gnu.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-i686-unknown-linux-gnu.tar.xz.asc
> > -sha256
> d7f2bc431db551ea9019a6d50d4e3f11e14fabbea3abec1478ac72a281309152
> rust-std-1.58.1-i686-unknown-linux-gnu.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-i686-unknown-linux-musl.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-i686-unknown-linux-musl.tar.xz.asc
> > -sha256
> c70fbb13aedfb88cfec8098355a155a4edce3d52f9b099bc033b7c7ac45aab00
> rust-std-1.58.1-i686-unknown-linux-musl.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-mips-unknown-linux-gnu.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-mips-unknown-linux-gnu.tar.xz.asc
> > -sha256
> b678ac0282cbb1965f9a7485a1f56b01d0229f91ddff5a18a9628f86970f5902
> rust-std-1.58.1-mips-unknown-linux-gnu.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-mips-unknown-linux-musl.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-mips-unknown-linux-musl.tar.xz.asc
> > -sha256
> 2f571f4c9b4e86e278539e811f495fb84f44898d4333b983a3d95ef5d2c0fdd8
> rust-std-1.58.1-mips-unknown-linux-musl.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-mips64-unknown-linux-gnuabi64.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-mips64-unknown-linux-gnuabi64.tar.xz.asc
> > -sha256
> 7f2f613606f039eec83239753a83c227b1d3c39b6474647234e7788a1541e850
> rust-std-1.58.1-mips64-unknown-linux-gnuabi64.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-mips64-unknown-linux-muslabi64.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-mips64-unknown-linux-muslabi64.tar.xz.asc
> > -sha256
> 7283539843df5c8abd06b0ce3830efeab0d673447b45d3b6636d2eb296d28681
> rust-std-1.58.1-mips64-unknown-linux-muslabi64.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-mips64el-unknown-linux-gnuabi64.tar.xz.asc
> > -sha256
> 3d2935e0979a7150cc271481f5f06569005ee27f0a7ef7ed1a5393c3e34b1974
> rust-std-1.58.1-mips64el-unknown-linux-gnuabi64.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-mips64el-unknown-linux-muslabi64.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-mips64el-unknown-linux-muslabi64.tar.xz.asc
> > -sha256
> 33078d23ea70ca405b5938e5a2a74fbf4ec7dc41b729e4991e3e01d4c8370028
> rust-std-1.58.1-mips64el-unknown-linux-muslabi64.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-mipsel-unknown-linux-gnu.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-mipsel-unknown-linux-gnu.tar.xz.asc
> > -sha256
> fdade0d00dac3524348041ec915a5a96208c9c1929ce746ab6352d0d2897a3a7
> rust-std-1.58.1-mipsel-unknown-linux-gnu.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-mipsel-unknown-linux-musl.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-mipsel-unknown-linux-musl.tar.xz.asc
> > -sha256
> c747a00ac9a6ee70793002e6db2fbce3b2cd60eda277729468d18369736c6c8e
> rust-std-1.58.1-mipsel-unknown-linux-musl.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc-unknown-linux-gnu.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc-unknown-linux-gnu.tar.xz.asc
> > -sha256
> 7813f825e5d10aac0ded4b3f785970c69c25464b4edcf9c2b83eff0e55ee95f3
> rust-std-1.58.1-powerpc-unknown-linux-gnu.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc64-unknown-linux-gnu.tar.xz.asc
> > -sha256
> c68d93de3a46ec709788fee2c38a298a261d4254d299299195ab3474b316a59b
> rust-std-1.58.1-powerpc64-unknown-linux-gnu.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
> > -sha256
> a85f5f42918e8b140d7093ba49fc46a21625863538c95d2db03f831cc445f025
> rust-std-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
> > -sha256
> 2d7276fe261478c377913177dcec3e0aeed84f2c567db0ae8e415efee7bb9ce0
> rust-std-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-sparc64-unknown-linux-gnu.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-sparc64-unknown-linux-gnu.tar.xz.asc
> > -sha256
> 7a7cd002c63179f3f47d64b1140c180986322a7cc0d31de61d7c4728cedacba0
> rust-std-1.58.1-sparc64-unknown-linux-gnu.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-x86_64-unknown-linux-gnu.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-x86_64-unknown-linux-gnu.tar.xz.asc
> > -sha256
> e72367c15906f021f46801652181c917cd3328be022b93bb30506724f7b56256
> rust-std-1.58.1-x86_64-unknown-linux-gnu.tar.xz
> > -# From
> https://static.rust-lang.org/dist/rust-std-1.58.1-x86_64-unknown-linux-musl.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rust-std-1.58.1-x86_64-unknown-linux-musl.tar.xz.asc
> > -sha256
> b0d3e03c9b1eff6e241383913b02653ba80776626ca7c4a93f36c2ad829ba989
> rust-std-1.58.1-x86_64-unknown-linux-musl.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-1.59.0-i686-unknown-linux-gnu.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-1.59.0-i686-unknown-linux-gnu.tar.xz.asc
> > +sha256
> b4144c89f9482f3e76ccad09d0a3072c935b7c0abdb9a52edbd641f2e27bb4f0
> rust-1.59.0-i686-unknown-linux-gnu.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-1.59.0-x86_64-unknown-linux-gnu.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-1.59.0-x86_64-unknown-linux-gnu.tar.xz.asc
> > +sha256
> a10c4abcba4891c463612c161246706cd0e8d3ddb1ae75f514d3f02bed235af6
> rust-1.59.0-x86_64-unknown-linux-gnu.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-aarch64-unknown-linux-gnu.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-aarch64-unknown-linux-gnu.tar.xz.asc
> > +sha256
> 68e50dee4f6dddeab7330906e46022f57f2c004c847eae3f5b1bc82c59e43fc0
> rust-std-1.59.0-aarch64-unknown-linux-gnu.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-aarch64-unknown-linux-musl.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-aarch64-unknown-linux-musl.tar.xz.asc
> > +sha256
> 6b8424e9b99da7df3b842b47476fbff4c371414186ae50ca0aff050a532c1d52
> rust-std-1.59.0-aarch64-unknown-linux-musl.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-linux-gnueabi.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-linux-gnueabi.tar.xz.asc
> > +sha256
> b65ffcf5a4b4e4df3893b6da7182e2f91cd174e59fd26a69110809015635708a
> rust-std-1.59.0-arm-unknown-linux-gnueabi.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-linux-gnueabihf.tar.xz.asc
> > +sha256
> 382051a04047463430bfb4d16fe2998fcd00f0945cb99b622e94a7564796846a
> rust-std-1.59.0-arm-unknown-linux-gnueabihf.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-linux-musleabihf.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-linux-musleabihf.tar.xz.asc
> > +sha256
> f072103ccbd967ccf06c3e4366a56af1f53af89834f02d0151afc144318d9040
> rust-std-1.59.0-arm-unknown-linux-musleabihf.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-linux-musleabi.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-linux-musleabi.tar.xz.asc
> > +sha256
> e2f4944fb135c508b0c8dff46caf04eca065e5ee5f5de32494b084c667fd20eb
> rust-std-1.59.0-arm-unknown-linux-musleabi.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
> > +sha256
> 2b9042ae8d24f5d8ada3d1903e24c2cdcc464e74a506cb72054a680b1e0433bb
> rust-std-1.59.0-armv5te-unknown-linux-gnueabi.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-armv5te-unknown-linux-musleabi.tar.xz.asc
> > +sha256
> 1f0726d6b06b7b35de32af45b9f8ac597c89cc5e7236ac6a6dcb91f0412b0e1a
> rust-std-1.59.0-armv5te-unknown-linux-musleabi.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
> > +sha256
> 310ce12c01fa15f46b8f9eee4a086c818118dbd56cd8400aee04432ba96061df
> rust-std-1.59.0-armv7-unknown-linux-gnueabihf.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknown-linux-gnueabi.tar.xz.asc
> > +sha256
> 3695a3bee47cfe0624f7822243000a4ee552bf920b403b16cc633513e95498bd
> rust-std-1.59.0-armv7-unknown-linux-gnueabi.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknown-linux-musleabihf.tar.xz.asc
> > +sha256
> 6c00582c159524a87b8934a5e4cb513d6032474f9a017bf91697e72885bf70fb
> rust-std-1.59.0-armv7-unknown-linux-musleabihf.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknown-linux-musleabi.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknown-linux-musleabi.tar.xz.asc
> > +sha256
> dcf0f1ddc6dc5e32a07789408d0a2637d639e00cf214c349921d06d3f73c7b2c
> rust-std-1.59.0-armv7-unknown-linux-musleabi.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-i586-unknown-linux-gnu.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-i586-unknown-linux-gnu.tar.xz.asc
> > +sha256
> 415a93bc55da0879335a18e55552a111a23bd9d5e70598080071f6346a9b4a0d
> rust-std-1.59.0-i586-unknown-linux-gnu.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-i586-unknown-linux-musl.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-i586-unknown-linux-musl.tar.xz.asc
> > +sha256
> a0a644cb14eec96760b870b585b08a3bf2965844754f8b965b39aded5635ab77
> rust-std-1.59.0-i586-unknown-linux-musl.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-i686-unknown-linux-gnu.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-i686-unknown-linux-gnu.tar.xz.asc
> > +sha256
> 26e91818a36184998039aeaabbf0972a8610d0d250e4bc03de6f27a7843971b5
> rust-std-1.59.0-i686-unknown-linux-gnu.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-i686-unknown-linux-musl.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-i686-unknown-linux-musl.tar.xz.asc
> > +sha256
> 5821c1655adc81bc2a347329eab08b651f3312f2eeb972b0a30d93a5c49502f5
> rust-std-1.59.0-i686-unknown-linux-musl.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-mips-unknown-linux-gnu.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-mips-unknown-linux-gnu.tar.xz.asc
> > +sha256
> 05bf10c11ff845f006331ddfdd109e12b1377c156e37eb1bb3bc0402e4219d31
> rust-std-1.59.0-mips-unknown-linux-gnu.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-mips-unknown-linux-musl.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-mips-unknown-linux-musl.tar.xz.asc
> > +sha256
> af5ee07f5d98296435867ef5859ec207c57413bb61b0d656c39b1f451aaeeb38
> rust-std-1.59.0-mips-unknown-linux-musl.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
> > +sha256
> 88c6b0dbadfc7bcc2a2eba0f3328ad1ff1714a5a13f07bffe007aecae59fc9b8
> rust-std-1.59.0-mips64-unknown-linux-gnuabi64.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-mips64-unknown-linux-muslabi64.tar.xz.asc
> > +sha256
> a0533694ed62c9c3f497d94ee51bc9ba08e5f3fb24588e02cf1f1c2efbdb9b43
> rust-std-1.59.0-mips64-unknown-linux-muslabi64.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
> > +sha256
> 6a3462a10da953546412912d04228a63c5d4086a4768163f1bd5ccf81950090d
> rust-std-1.59.0-mips64el-unknown-linux-gnuabi64.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
> > +sha256
> 606d037a01cc7666594b7973c6a727c69426d85adaf94128dc9914e893ef8ed9
> rust-std-1.59.0-mips64el-unknown-linux-muslabi64.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-mipsel-unknown-linux-gnu.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-mipsel-unknown-linux-gnu.tar.xz.asc
> > +sha256
> fd747f4ef4cee6fe88692dd6e3c7b986870ce8a24eab8920adacc7ab73fb482d
> rust-std-1.59.0-mipsel-unknown-linux-gnu.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-mipsel-unknown-linux-musl.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-mipsel-unknown-linux-musl.tar.xz.asc
> > +sha256
> 4622aa633ad2d0decca59aa65b24195431e40162804352f5bdd9bafd92ee7b9d
> rust-std-1.59.0-mipsel-unknown-linux-musl.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-powerpc-unknown-linux-gnu.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-powerpc-unknown-linux-gnu.tar.xz.asc
> > +sha256
> 5ead471b53d290960d49a7cec0ba01a082f5e6cfa18825366990d46797dc7161
> rust-std-1.59.0-powerpc-unknown-linux-gnu.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-powerpc64-unknown-linux-gnu.tar.xz.asc
> > +sha256
> 1217290e951ae84998d2d04a88d154b1da205e2638a3449c02c8e9256bff589c
> rust-std-1.59.0-powerpc64-unknown-linux-gnu.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
> > +sha256
> 15dee7705967e3351aff11c64ada30c4957b54066c7ee49b87be4b8155bd0a7d
> rust-std-1.59.0-powerpc64le-unknown-linux-gnu.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
> > +sha256
> 74c1f9c94ff4993948c05df2c9c58f76708e6adbacb9b2caca368558dde9590a
> rust-std-1.59.0-riscv64gc-unknown-linux-gnu.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-sparc64-unknown-linux-gnu.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-sparc64-unknown-linux-gnu.tar.xz.asc
> > +sha256
> 6bc109f7ff1f501153cc18eebed9a0cc468eebbfed2cc728047d59456e356f9a
> rust-std-1.59.0-sparc64-unknown-linux-gnu.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-x86_64-unknown-linux-gnu.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-x86_64-unknown-linux-gnu.tar.xz.asc
> > +sha256
> c854a9ee3dd8e5be9522c1581f75838c1cbae6dece3934b0004f138c4a5024a3
> rust-std-1.59.0-x86_64-unknown-linux-gnu.tar.xz
> > +# From
> https://static.rust-lang.org/dist/rust-std-1.59.0-x86_64-unknown-linux-musl.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rust-std-1.59.0-x86_64-unknown-linux-musl.tar.xz.asc
> > +sha256
> 473b6ddf598418db49efc21c3d2702cdaf9c78ee4ae00611c7d9e384a2d4dad7
> rust-std-1.59.0-x86_64-unknown-linux-musl.tar.xz
> >   # Locally generated
> >   sha256
> 62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a
> LICENSE-APACHE
> >   sha256
> 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3
> LICENSE-MIT
> > diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
> > index d4cb8f50ea..b50465f7a6 100644
> > --- a/package/rust-bin/rust-bin.mk
> > +++ b/package/rust-bin/rust-bin.mk
> > @@ -4,7 +4,7 @@
> >   #
> >
>  ################################################################################
> >
> > -RUST_BIN_VERSION = 1.58.1
> > +RUST_BIN_VERSION = 1.59.0
> >   RUST_BIN_SITE = https://static.rust-lang.org/dist
> >   RUST_BIN_LICENSE = Apache-2.0 or MIT
> >   RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> > diff --git a/package/rust/rust.hash b/package/rust/rust.hash
> > index 7eb8f59603..63a5644176 100644
> > --- a/package/rust/rust.hash
> > +++ b/package/rust/rust.hash
> > @@ -1,6 +1,6 @@
> > -# From https://static.rust-lang.org/dist/rustc-1.58.1-src.tar.xz.sha256
> > -# Verified using
> https://static.rust-lang.org/dist/rustc-1.58.1-src.tar.xz.asc
> > -sha256
> 2b3643a48e7087053b0268971ec4154350342508922a8acb0707aaf94deb4469
> rustc-1.58.1-src.tar.xz
> > +# From https://static.rust-lang.org/dist/rustc-1.59.0-src.tar.xz.sha256
> > +# Verified using
> https://static.rust-lang.org/dist/rustc-1.59.0-src.tar.xz.asc
> > +sha256
> 375996ead731cab2203ec10a66a3c4568ab6997d7e5d3ae597658164fe27be3d
> rustc-1.59.0-src.tar.xz
> >   # Locally generated
> >   sha256
> 62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a
> LICENSE-APACHE
> >   sha256
> 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3
> LICENSE-MIT
> > diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> > index cd8c87b68d..fd02686082 100644
> > --- a/package/rust/rust.mk
> > +++ b/package/rust/rust.mk
> > @@ -4,7 +4,7 @@
> >   #
> >
>  ################################################################################
> >
> > -RUST_VERSION = 1.58.1
> > +RUST_VERSION = 1.59.0
> >   RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
> >   RUST_SITE = https://static.rust-lang.org/dist
> >   RUST_LICENSE = Apache-2.0 or MIT
>

--000000000000c318e105dc72b90b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Arnout,</div><div><br></div><div>Thank you for =
the feedback! The patch implementing Rust 1.60.0 is almost ready and I&#39;=
m currently trying to figure out how to test the packages relying on Rust y=
ou mentioned. Although following the manual section for `utils/test-pkg`, I=
 don&#39;t quite understand how to make a toolchain consider the package I&=
#39;m testing. For example, with a `librsvg.config` containing &quot;BR2_PA=
CKAGE_LIBRSVG=3Dy&quot;, I tried the following command to test `package/lib=
rsvg`:</div><div>$ ./utils/test-pkg -c librsvg.config -p librsvg<br></div><=
div>It turns out all the selected toolchains are SKIPPED. Does each toolcha=
in I want to test need to have its config file modified to include the line=
 specified in the output missing.config file? I&#39;ve tried writing those =
lines into the `librsvg.config` I created but it does not seem to be taken =
into consideration and the `missing.config` remains the same...</div><div>A=
nother question: In the previous command found in the Buildroot manual, `-p=
` is an option to be able to &quot;test-build&quot; the package afterhand, =
by typing `make librsvg` in my case. What is the output I am supposed to wi=
tness in case of a successful test? Is it intended that running the test-bu=
ild on the package named libcurl (just like in the manual) it seems to be b=
uilt then removed, with no success comment?</div><div><br></div><div>Best r=
egards,</div><div>Nicolas<br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 10, 2022 at 4:45 PM Arnout V=
andecappelle &lt;<a href=3D"mailto:arnout@mind.be" target=3D"_blank">arnout=
@mind.be</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">=C2=A0 Hi Nicolas,<br>
<br>
On 07/04/2022 13:59, Nicolas Tran wrote:<br>
&gt; Link to Rust version 1.59.0: <a href=3D"https://blog.rust-lang.org/202=
2/02/24/Rust-1.59.0.html" rel=3D"noreferrer" target=3D"_blank">https://blog=
.rust-lang.org/2022/02/24/Rust-1.59.0.html</a><br>
<br>
=C2=A0 Excellent, thanks! Unfortunately, I just applied two patches that ad=
d a bunch <br>
of other tarballs, so these will have to be updated as well now.<br>
<br>
=C2=A0 Also, the very day that you posted this patch, rust 1.60 was release=
d. So <br>
maybe you can update to that?<br>
<br>
=C2=A0 Finally, when updating rust, it&#39;s a good idea to do a build test=
 (using the <br>
test-pkg script) of a few packages that rely on rust: rsvg, python-cryptogr=
aphy, <br>
ripgrep, suricata.<br>
<br>
=C2=A0 Oh, also: everything you put in the cover letter would actually be u=
seful in <br>
the commit message. We just prefer if it&#39;s written in passive sense rat=
her than <br>
first person, i.e. &quot;Source archives were retrieved and ...&quot;. But =
that&#39;s really a <br>
minor thing.<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; <br>
&gt; Signed-off-by: Nicolas Tran &lt;<a href=3D"mailto:nicolas.tran@smile.f=
r" target=3D"_blank">nicolas.tran@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/rust-bin/rust-bin.hash | 198 ++++++++++++++++-----=
------------<br>
&gt;=C2=A0 =C2=A0package/rust-bin/<a href=3D"http://rust-bin.mk" rel=3D"nor=
eferrer" target=3D"_blank">rust-bin.mk</a>=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<b=
r>
&gt;=C2=A0 =C2=A0package/rust/rust.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 =C2=A0package/rust/<a href=3D"http://rust.mk" rel=3D"noreferrer"=
 target=3D"_blank">rust.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A04 files changed, 104 insertions(+), 104 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bi=
n.hash<br>
&gt; index 9f8788a295..1aa166c45e 100644<br>
&gt; --- a/package/rust-bin/rust-bin.hash<br>
&gt; +++ b/package/rust-bin/rust-bin.hash<br>
&gt; @@ -1,102 +1,102 @@<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-1.58.1-i686-=
unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank">https=
://static.rust-lang.org/dist/rust-1.58.1-i686-unknown-linux-gnu.tar.xz.sha2=
56</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-1.=
58.1-i686-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=3D"_blank=
">https://static.rust-lang.org/dist/rust-1.58.1-i686-unknown-linux-gnu.tar.=
xz.asc</a><br>
&gt; -sha256=C2=A0 110ca4967351d8535f3d39e24f40e2941c20346c5765d3530270e134=
ae50568e=C2=A0 rust-1.58.1-i686-unknown-linux-gnu.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-1.58.1-x86_6=
4-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank">htt=
ps://static.rust-lang.org/dist/rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz.=
sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-1.=
58.1-x86_64-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=3D"_bla=
nk">https://static.rust-lang.org/dist/rust-1.58.1-x86_64-unknown-linux-gnu.=
tar.xz.asc</a><br>
&gt; -sha256=C2=A0 f71b077caf0becbd0af9fd22bc1fa31c4fdf7a21fe046da8a15a7bde=
1286da25=C2=A0 rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-a=
arch64-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank=
">https://static.rust-lang.org/dist/rust-std-1.58.1-aarch64-unknown-linux-g=
nu.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-aarch64-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=3D=
"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-aarch64-unknown-=
linux-gnu.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 c7a016ac63aeb5481d661ee3e680b57d35d5ccb902c605c32937a047=
a02cff49=C2=A0 rust-std-1.58.1-aarch64-unknown-linux-gnu.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-a=
arch64-unknown-linux-musl.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blan=
k">https://static.rust-lang.org/dist/rust-std-1.58.1-aarch64-unknown-linux-=
musl.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-aarch64-unknown-linux-musl.tar.xz.asc" rel=3D"noreferrer" target=
=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-aarch64-unkno=
wn-linux-musl.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 4c8d9774fb1f6cfa616f2c43395f438e887a38f0cd901a3886056cc1=
c1b84c30=C2=A0 rust-std-1.58.1-aarch64-unknown-linux-musl.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-a=
rm-unknown-linux-gnueabi.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank=
">https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-gnuea=
bi.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-arm-unknown-linux-gnueabi.tar.xz.asc" rel=3D"noreferrer" target=3D=
"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linu=
x-gnueabi.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 eb58c2b72e9bbe50c80e9f2981e14d737198f7e17a4cad524d00baef=
dfa3bc1d=C2=A0 rust-std-1.58.1-arm-unknown-linux-gnueabi.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-a=
rm-unknown-linux-gnueabihf.tar.xz.sha256" rel=3D"noreferrer" target=3D"_bla=
nk">https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-gnu=
eabihf.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-arm-unknown-linux-gnueabihf.tar.xz.asc" rel=3D"noreferrer" target=
=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-l=
inux-gnueabihf.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 58e3f4905c3e7028811971219a3222640f947062fb93dbe51c167455=
1e9b06a6=C2=A0 rust-std-1.58.1-arm-unknown-linux-gnueabihf.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-a=
rm-unknown-linux-musleabihf.tar.xz.sha256" rel=3D"noreferrer" target=3D"_bl=
ank">https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-mu=
sleabihf.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-arm-unknown-linux-musleabihf.tar.xz.asc" rel=3D"noreferrer" target=
=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-l=
inux-musleabihf.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 b354f0ad28d8cc7d5996d46c3a310c80aa6486ac7b89abcd1eeef7f1=
3435e0ff=C2=A0 rust-std-1.58.1-arm-unknown-linux-musleabihf.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-a=
rm-unknown-linux-musleabi.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blan=
k">https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-musl=
eabi.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-arm-unknown-linux-musleabi.tar.xz.asc" rel=3D"noreferrer" target=
=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-l=
inux-musleabi.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 705fba2a50835354112ab86d1ee8889c39f3c7265d7ca26f1dffebaa=
463600a6=C2=A0 rust-std-1.58.1-arm-unknown-linux-musleabi.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-a=
rmv5te-unknown-linux-gnueabi.tar.xz.sha256" rel=3D"noreferrer" target=3D"_b=
lank">https://static.rust-lang.org/dist/rust-std-1.58.1-armv5te-unknown-lin=
ux-gnueabi.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-armv5te-unknown-linux-gnueabi.tar.xz.asc" rel=3D"noreferrer" targe=
t=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-armv5te-unkn=
own-linux-gnueabi.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 0505759fa8b26c902a701f266db4bfbfe496de71c5c6548a55c562fe=
9d386485=C2=A0 rust-std-1.58.1-armv5te-unknown-linux-gnueabi.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-a=
rmv5te-unknown-linux-musleabi.tar.xz.sha256" rel=3D"noreferrer" target=3D"_=
blank">https://static.rust-lang.org/dist/rust-std-1.58.1-armv5te-unknown-li=
nux-musleabi.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-armv5te-unknown-linux-musleabi.tar.xz.asc" rel=3D"noreferrer" targ=
et=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-armv5te-unk=
nown-linux-musleabi.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 9ca8adb43b4e75556a99b6c7a9bc1d9aab894bbe109736c34582169e=
c81aee14=C2=A0 rust-std-1.58.1-armv5te-unknown-linux-musleabi.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-a=
rmv7-unknown-linux-gnueabihf.tar.xz.sha256" rel=3D"noreferrer" target=3D"_b=
lank">https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux=
-gnueabihf.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-armv7-unknown-linux-gnueabihf.tar.xz.asc" rel=3D"noreferrer" targe=
t=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknow=
n-linux-gnueabihf.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 9f38bc3220d659ff482db9a0ace9dcb7051991d471149fad7bbb62fc=
e8314e04=C2=A0 rust-std-1.58.1-armv7-unknown-linux-gnueabihf.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-a=
rmv7-unknown-linux-gnueabi.tar.xz.sha256" rel=3D"noreferrer" target=3D"_bla=
nk">https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-g=
nueabi.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-armv7-unknown-linux-gnueabi.tar.xz.asc" rel=3D"noreferrer" target=
=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown=
-linux-gnueabi.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 1511c675d17033737ab2bd1e87b525aaf59e0455f5a717ab0a91fd84=
9949164f=C2=A0 rust-std-1.58.1-armv7-unknown-linux-gnueabi.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-a=
rmv7-unknown-linux-musleabihf.tar.xz.sha256" rel=3D"noreferrer" target=3D"_=
blank">https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linu=
x-musleabihf.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-armv7-unknown-linux-musleabihf.tar.xz.asc" rel=3D"noreferrer" targ=
et=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unkno=
wn-linux-musleabihf.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 2cf8a8cc2441a1bb4b45b690c87fff4df975fac077240706c08594e2=
6f901bdc=C2=A0 rust-std-1.58.1-armv7-unknown-linux-musleabihf.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-a=
rmv7-unknown-linux-musleabi.tar.xz.sha256" rel=3D"noreferrer" target=3D"_bl=
ank">https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-=
musleabi.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-armv7-unknown-linux-musleabi.tar.xz.asc" rel=3D"noreferrer" target=
=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown=
-linux-musleabi.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 db86e823484f210884d7d815ffcd7dae355bba86e18151b0838ec065=
44bb8126=C2=A0 rust-std-1.58.1-armv7-unknown-linux-musleabi.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-i=
586-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank">h=
ttps://static.rust-lang.org/dist/rust-std-1.58.1-i586-unknown-linux-gnu.tar=
.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-i586-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=3D"_b=
lank">https://static.rust-lang.org/dist/rust-std-1.58.1-i586-unknown-linux-=
gnu.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 02bce02f929114cc60126410fceeab6c0bcc8b96c394de9516d8f449=
880cb585=C2=A0 rust-std-1.58.1-i586-unknown-linux-gnu.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-i=
586-unknown-linux-musl.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank">=
https://static.rust-lang.org/dist/rust-std-1.58.1-i586-unknown-linux-musl.t=
ar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-i586-unknown-linux-musl.tar.xz.asc" rel=3D"noreferrer" target=3D"_=
blank">https://static.rust-lang.org/dist/rust-std-1.58.1-i586-unknown-linux=
-musl.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 e80d5769f042a00388546dbd26cb40c045d5dddc84e5da3f98d17402=
7ed9eaaa=C2=A0 rust-std-1.58.1-i586-unknown-linux-musl.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-i=
686-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank">h=
ttps://static.rust-lang.org/dist/rust-std-1.58.1-i686-unknown-linux-gnu.tar=
.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-i686-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=3D"_b=
lank">https://static.rust-lang.org/dist/rust-std-1.58.1-i686-unknown-linux-=
gnu.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 d7f2bc431db551ea9019a6d50d4e3f11e14fabbea3abec1478ac72a2=
81309152=C2=A0 rust-std-1.58.1-i686-unknown-linux-gnu.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-i=
686-unknown-linux-musl.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank">=
https://static.rust-lang.org/dist/rust-std-1.58.1-i686-unknown-linux-musl.t=
ar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-i686-unknown-linux-musl.tar.xz.asc" rel=3D"noreferrer" target=3D"_=
blank">https://static.rust-lang.org/dist/rust-std-1.58.1-i686-unknown-linux=
-musl.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 c70fbb13aedfb88cfec8098355a155a4edce3d52f9b099bc033b7c7a=
c45aab00=C2=A0 rust-std-1.58.1-i686-unknown-linux-musl.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-m=
ips-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank">h=
ttps://static.rust-lang.org/dist/rust-std-1.58.1-mips-unknown-linux-gnu.tar=
.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-mips-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=3D"_b=
lank">https://static.rust-lang.org/dist/rust-std-1.58.1-mips-unknown-linux-=
gnu.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 b678ac0282cbb1965f9a7485a1f56b01d0229f91ddff5a18a9628f86=
970f5902=C2=A0 rust-std-1.58.1-mips-unknown-linux-gnu.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-m=
ips-unknown-linux-musl.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank">=
https://static.rust-lang.org/dist/rust-std-1.58.1-mips-unknown-linux-musl.t=
ar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-mips-unknown-linux-musl.tar.xz.asc" rel=3D"noreferrer" target=3D"_=
blank">https://static.rust-lang.org/dist/rust-std-1.58.1-mips-unknown-linux=
-musl.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 2f571f4c9b4e86e278539e811f495fb84f44898d4333b983a3d95ef5=
d2c0fdd8=C2=A0 rust-std-1.58.1-mips-unknown-linux-musl.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-m=
ips64-unknown-linux-gnuabi64.tar.xz.sha256" rel=3D"noreferrer" target=3D"_b=
lank">https://static.rust-lang.org/dist/rust-std-1.58.1-mips64-unknown-linu=
x-gnuabi64.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-mips64-unknown-linux-gnuabi64.tar.xz.asc" rel=3D"noreferrer" targe=
t=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-mips64-unkno=
wn-linux-gnuabi64.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 7f2f613606f039eec83239753a83c227b1d3c39b6474647234e7788a=
1541e850=C2=A0 rust-std-1.58.1-mips64-unknown-linux-gnuabi64.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-m=
ips64-unknown-linux-muslabi64.tar.xz.sha256" rel=3D"noreferrer" target=3D"_=
blank">https://static.rust-lang.org/dist/rust-std-1.58.1-mips64-unknown-lin=
ux-muslabi64.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-mips64-unknown-linux-muslabi64.tar.xz.asc" rel=3D"noreferrer" targ=
et=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-mips64-unkn=
own-linux-muslabi64.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 7283539843df5c8abd06b0ce3830efeab0d673447b45d3b6636d2eb2=
96d28681=C2=A0 rust-std-1.58.1-mips64-unknown-linux-muslabi64.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-m=
ips64el-unknown-linux-gnuabi64.tar.xz.sha256" rel=3D"noreferrer" target=3D"=
_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-mips64el-unknown-=
linux-gnuabi64.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-mips64el-unknown-linux-gnuabi64.tar.xz.asc" rel=3D"noreferrer" tar=
get=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-mips64el-u=
nknown-linux-gnuabi64.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 3d2935e0979a7150cc271481f5f06569005ee27f0a7ef7ed1a5393c3=
e34b1974=C2=A0 rust-std-1.58.1-mips64el-unknown-linux-gnuabi64.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-m=
ips64el-unknown-linux-muslabi64.tar.xz.sha256" rel=3D"noreferrer" target=3D=
"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-mips64el-unknown=
-linux-muslabi64.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-mips64el-unknown-linux-muslabi64.tar.xz.asc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-mips64el-=
unknown-linux-muslabi64.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 33078d23ea70ca405b5938e5a2a74fbf4ec7dc41b729e4991e3e01d4=
c8370028=C2=A0 rust-std-1.58.1-mips64el-unknown-linux-muslabi64.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-m=
ipsel-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank"=
>https://static.rust-lang.org/dist/rust-std-1.58.1-mipsel-unknown-linux-gnu=
.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-mipsel-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=3D"=
_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-mipsel-unknown-li=
nux-gnu.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 fdade0d00dac3524348041ec915a5a96208c9c1929ce746ab6352d0d=
2897a3a7=C2=A0 rust-std-1.58.1-mipsel-unknown-linux-gnu.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-m=
ipsel-unknown-linux-musl.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank=
">https://static.rust-lang.org/dist/rust-std-1.58.1-mipsel-unknown-linux-mu=
sl.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-mipsel-unknown-linux-musl.tar.xz.asc" rel=3D"noreferrer" target=3D=
"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-mipsel-unknown-l=
inux-musl.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 c747a00ac9a6ee70793002e6db2fbce3b2cd60eda277729468d18369=
736c6c8e=C2=A0 rust-std-1.58.1-mipsel-unknown-linux-musl.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-p=
owerpc-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank=
">https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc-unknown-linux-g=
nu.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-powerpc-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=3D=
"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc-unknown-=
linux-gnu.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 7813f825e5d10aac0ded4b3f785970c69c25464b4edcf9c2b83eff0e=
55ee95f3=C2=A0 rust-std-1.58.1-powerpc-unknown-linux-gnu.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-p=
owerpc64-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_bla=
nk">https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc64-unknown-lin=
ux-gnu.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-powerpc64-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=
=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc64-unk=
nown-linux-gnu.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 c68d93de3a46ec709788fee2c38a298a261d4254d299299195ab3474=
b316a59b=C2=A0 rust-std-1.58.1-powerpc64-unknown-linux-gnu.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-p=
owerpc64le-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_b=
lank">https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc64le-unknown=
-linux-gnu.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" targe=
t=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc64le-=
unknown-linux-gnu.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 a85f5f42918e8b140d7093ba49fc46a21625863538c95d2db03f831c=
c445f025=C2=A0 rust-std-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-r=
iscv64gc-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_bla=
nk">https://static.rust-lang.org/dist/rust-std-1.58.1-riscv64gc-unknown-lin=
ux-gnu.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=
=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-riscv64gc-unk=
nown-linux-gnu.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 2d7276fe261478c377913177dcec3e0aeed84f2c567db0ae8e415efe=
e7bb9ce0=C2=A0 rust-std-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-s=
parc64-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank=
">https://static.rust-lang.org/dist/rust-std-1.58.1-sparc64-unknown-linux-g=
nu.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-sparc64-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=3D=
"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-sparc64-unknown-=
linux-gnu.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 7a7cd002c63179f3f47d64b1140c180986322a7cc0d31de61d7c4728=
cedacba0=C2=A0 rust-std-1.58.1-sparc64-unknown-linux-gnu.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-x=
86_64-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank"=
>https://static.rust-lang.org/dist/rust-std-1.58.1-x86_64-unknown-linux-gnu=
.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-x86_64-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=3D"=
_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-x86_64-unknown-li=
nux-gnu.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 e72367c15906f021f46801652181c917cd3328be022b93bb30506724=
f7b56256=C2=A0 rust-std-1.58.1-x86_64-unknown-linux-gnu.tar.xz<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.58.1-x=
86_64-unknown-linux-musl.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank=
">https://static.rust-lang.org/dist/rust-std-1.58.1-x86_64-unknown-linux-mu=
sl.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.58.1-x86_64-unknown-linux-musl.tar.xz.asc" rel=3D"noreferrer" target=3D=
"_blank">https://static.rust-lang.org/dist/rust-std-1.58.1-x86_64-unknown-l=
inux-musl.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 b0d3e03c9b1eff6e241383913b02653ba80776626ca7c4a93f36c2ad=
829ba989=C2=A0 rust-std-1.58.1-x86_64-unknown-linux-musl.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-1.59.0-i686-=
unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank">https=
://static.rust-lang.org/dist/rust-1.59.0-i686-unknown-linux-gnu.tar.xz.sha2=
56</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-1.=
59.0-i686-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=3D"_blank=
">https://static.rust-lang.org/dist/rust-1.59.0-i686-unknown-linux-gnu.tar.=
xz.asc</a><br>
&gt; +sha256=C2=A0 b4144c89f9482f3e76ccad09d0a3072c935b7c0abdb9a52edbd641f2=
e27bb4f0=C2=A0 rust-1.59.0-i686-unknown-linux-gnu.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-1.59.0-x86_6=
4-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank">htt=
ps://static.rust-lang.org/dist/rust-1.59.0-x86_64-unknown-linux-gnu.tar.xz.=
sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-1.=
59.0-x86_64-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=3D"_bla=
nk">https://static.rust-lang.org/dist/rust-1.59.0-x86_64-unknown-linux-gnu.=
tar.xz.asc</a><br>
&gt; +sha256=C2=A0 a10c4abcba4891c463612c161246706cd0e8d3ddb1ae75f514d3f02b=
ed235af6=C2=A0 rust-1.59.0-x86_64-unknown-linux-gnu.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-a=
arch64-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank=
">https://static.rust-lang.org/dist/rust-std-1.59.0-aarch64-unknown-linux-g=
nu.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-aarch64-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=3D=
"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-aarch64-unknown-=
linux-gnu.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 68e50dee4f6dddeab7330906e46022f57f2c004c847eae3f5b1bc82c=
59e43fc0=C2=A0 rust-std-1.59.0-aarch64-unknown-linux-gnu.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-a=
arch64-unknown-linux-musl.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blan=
k">https://static.rust-lang.org/dist/rust-std-1.59.0-aarch64-unknown-linux-=
musl.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-aarch64-unknown-linux-musl.tar.xz.asc" rel=3D"noreferrer" target=
=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-aarch64-unkno=
wn-linux-musl.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 6b8424e9b99da7df3b842b47476fbff4c371414186ae50ca0aff050a=
532c1d52=C2=A0 rust-std-1.59.0-aarch64-unknown-linux-musl.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-a=
rm-unknown-linux-gnueabi.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank=
">https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-linux-gnuea=
bi.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-arm-unknown-linux-gnueabi.tar.xz.asc" rel=3D"noreferrer" target=3D=
"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-linu=
x-gnueabi.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 b65ffcf5a4b4e4df3893b6da7182e2f91cd174e59fd26a6911080901=
5635708a=C2=A0 rust-std-1.59.0-arm-unknown-linux-gnueabi.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-a=
rm-unknown-linux-gnueabihf.tar.xz.sha256" rel=3D"noreferrer" target=3D"_bla=
nk">https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-linux-gnu=
eabihf.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-arm-unknown-linux-gnueabihf.tar.xz.asc" rel=3D"noreferrer" target=
=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-l=
inux-gnueabihf.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 382051a04047463430bfb4d16fe2998fcd00f0945cb99b622e94a756=
4796846a=C2=A0 rust-std-1.59.0-arm-unknown-linux-gnueabihf.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-a=
rm-unknown-linux-musleabihf.tar.xz.sha256" rel=3D"noreferrer" target=3D"_bl=
ank">https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-linux-mu=
sleabihf.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-arm-unknown-linux-musleabihf.tar.xz.asc" rel=3D"noreferrer" target=
=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-l=
inux-musleabihf.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 f072103ccbd967ccf06c3e4366a56af1f53af89834f02d0151afc144=
318d9040=C2=A0 rust-std-1.59.0-arm-unknown-linux-musleabihf.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-a=
rm-unknown-linux-musleabi.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blan=
k">https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-linux-musl=
eabi.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-arm-unknown-linux-musleabi.tar.xz.asc" rel=3D"noreferrer" target=
=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-l=
inux-musleabi.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 e2f4944fb135c508b0c8dff46caf04eca065e5ee5f5de32494b084c6=
67fd20eb=C2=A0 rust-std-1.59.0-arm-unknown-linux-musleabi.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-a=
rmv5te-unknown-linux-gnueabi.tar.xz.sha256" rel=3D"noreferrer" target=3D"_b=
lank">https://static.rust-lang.org/dist/rust-std-1.59.0-armv5te-unknown-lin=
ux-gnueabi.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-armv5te-unknown-linux-gnueabi.tar.xz.asc" rel=3D"noreferrer" targe=
t=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-armv5te-unkn=
own-linux-gnueabi.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 2b9042ae8d24f5d8ada3d1903e24c2cdcc464e74a506cb72054a680b=
1e0433bb=C2=A0 rust-std-1.59.0-armv5te-unknown-linux-gnueabi.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-a=
rmv5te-unknown-linux-musleabi.tar.xz.sha256" rel=3D"noreferrer" target=3D"_=
blank">https://static.rust-lang.org/dist/rust-std-1.59.0-armv5te-unknown-li=
nux-musleabi.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-armv5te-unknown-linux-musleabi.tar.xz.asc" rel=3D"noreferrer" targ=
et=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-armv5te-unk=
nown-linux-musleabi.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 1f0726d6b06b7b35de32af45b9f8ac597c89cc5e7236ac6a6dcb91f0=
412b0e1a=C2=A0 rust-std-1.59.0-armv5te-unknown-linux-musleabi.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-a=
rmv7-unknown-linux-gnueabihf.tar.xz.sha256" rel=3D"noreferrer" target=3D"_b=
lank">https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknown-linux=
-gnueabihf.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-armv7-unknown-linux-gnueabihf.tar.xz.asc" rel=3D"noreferrer" targe=
t=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknow=
n-linux-gnueabihf.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 310ce12c01fa15f46b8f9eee4a086c818118dbd56cd8400aee04432b=
a96061df=C2=A0 rust-std-1.59.0-armv7-unknown-linux-gnueabihf.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-a=
rmv7-unknown-linux-gnueabi.tar.xz.sha256" rel=3D"noreferrer" target=3D"_bla=
nk">https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknown-linux-g=
nueabi.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-armv7-unknown-linux-gnueabi.tar.xz.asc" rel=3D"noreferrer" target=
=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknown=
-linux-gnueabi.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 3695a3bee47cfe0624f7822243000a4ee552bf920b403b16cc633513=
e95498bd=C2=A0 rust-std-1.59.0-armv7-unknown-linux-gnueabi.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-a=
rmv7-unknown-linux-musleabihf.tar.xz.sha256" rel=3D"noreferrer" target=3D"_=
blank">https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknown-linu=
x-musleabihf.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-armv7-unknown-linux-musleabihf.tar.xz.asc" rel=3D"noreferrer" targ=
et=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unkno=
wn-linux-musleabihf.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 6c00582c159524a87b8934a5e4cb513d6032474f9a017bf91697e728=
85bf70fb=C2=A0 rust-std-1.59.0-armv7-unknown-linux-musleabihf.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-a=
rmv7-unknown-linux-musleabi.tar.xz.sha256" rel=3D"noreferrer" target=3D"_bl=
ank">https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknown-linux-=
musleabi.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-armv7-unknown-linux-musleabi.tar.xz.asc" rel=3D"noreferrer" target=
=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknown=
-linux-musleabi.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 dcf0f1ddc6dc5e32a07789408d0a2637d639e00cf214c349921d06d3=
f73c7b2c=C2=A0 rust-std-1.59.0-armv7-unknown-linux-musleabi.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-i=
586-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank">h=
ttps://static.rust-lang.org/dist/rust-std-1.59.0-i586-unknown-linux-gnu.tar=
.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-i586-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=3D"_b=
lank">https://static.rust-lang.org/dist/rust-std-1.59.0-i586-unknown-linux-=
gnu.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 415a93bc55da0879335a18e55552a111a23bd9d5e70598080071f634=
6a9b4a0d=C2=A0 rust-std-1.59.0-i586-unknown-linux-gnu.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-i=
586-unknown-linux-musl.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank">=
https://static.rust-lang.org/dist/rust-std-1.59.0-i586-unknown-linux-musl.t=
ar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-i586-unknown-linux-musl.tar.xz.asc" rel=3D"noreferrer" target=3D"_=
blank">https://static.rust-lang.org/dist/rust-std-1.59.0-i586-unknown-linux=
-musl.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 a0a644cb14eec96760b870b585b08a3bf2965844754f8b965b39aded=
5635ab77=C2=A0 rust-std-1.59.0-i586-unknown-linux-musl.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-i=
686-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank">h=
ttps://static.rust-lang.org/dist/rust-std-1.59.0-i686-unknown-linux-gnu.tar=
.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-i686-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=3D"_b=
lank">https://static.rust-lang.org/dist/rust-std-1.59.0-i686-unknown-linux-=
gnu.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 26e91818a36184998039aeaabbf0972a8610d0d250e4bc03de6f27a7=
843971b5=C2=A0 rust-std-1.59.0-i686-unknown-linux-gnu.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-i=
686-unknown-linux-musl.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank">=
https://static.rust-lang.org/dist/rust-std-1.59.0-i686-unknown-linux-musl.t=
ar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-i686-unknown-linux-musl.tar.xz.asc" rel=3D"noreferrer" target=3D"_=
blank">https://static.rust-lang.org/dist/rust-std-1.59.0-i686-unknown-linux=
-musl.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 5821c1655adc81bc2a347329eab08b651f3312f2eeb972b0a30d93a5=
c49502f5=C2=A0 rust-std-1.59.0-i686-unknown-linux-musl.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-m=
ips-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank">h=
ttps://static.rust-lang.org/dist/rust-std-1.59.0-mips-unknown-linux-gnu.tar=
.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-mips-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=3D"_b=
lank">https://static.rust-lang.org/dist/rust-std-1.59.0-mips-unknown-linux-=
gnu.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 05bf10c11ff845f006331ddfdd109e12b1377c156e37eb1bb3bc0402=
e4219d31=C2=A0 rust-std-1.59.0-mips-unknown-linux-gnu.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-m=
ips-unknown-linux-musl.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank">=
https://static.rust-lang.org/dist/rust-std-1.59.0-mips-unknown-linux-musl.t=
ar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-mips-unknown-linux-musl.tar.xz.asc" rel=3D"noreferrer" target=3D"_=
blank">https://static.rust-lang.org/dist/rust-std-1.59.0-mips-unknown-linux=
-musl.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 af5ee07f5d98296435867ef5859ec207c57413bb61b0d656c39b1f45=
1aaeeb38=C2=A0 rust-std-1.59.0-mips-unknown-linux-musl.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-m=
ips64-unknown-linux-gnuabi64.tar.xz.sha256" rel=3D"noreferrer" target=3D"_b=
lank">https://static.rust-lang.org/dist/rust-std-1.59.0-mips64-unknown-linu=
x-gnuabi64.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-mips64-unknown-linux-gnuabi64.tar.xz.asc" rel=3D"noreferrer" targe=
t=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-mips64-unkno=
wn-linux-gnuabi64.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 88c6b0dbadfc7bcc2a2eba0f3328ad1ff1714a5a13f07bffe007aeca=
e59fc9b8=C2=A0 rust-std-1.59.0-mips64-unknown-linux-gnuabi64.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-m=
ips64-unknown-linux-muslabi64.tar.xz.sha256" rel=3D"noreferrer" target=3D"_=
blank">https://static.rust-lang.org/dist/rust-std-1.59.0-mips64-unknown-lin=
ux-muslabi64.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-mips64-unknown-linux-muslabi64.tar.xz.asc" rel=3D"noreferrer" targ=
et=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-mips64-unkn=
own-linux-muslabi64.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 a0533694ed62c9c3f497d94ee51bc9ba08e5f3fb24588e02cf1f1c2e=
fbdb9b43=C2=A0 rust-std-1.59.0-mips64-unknown-linux-muslabi64.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-m=
ips64el-unknown-linux-gnuabi64.tar.xz.sha256" rel=3D"noreferrer" target=3D"=
_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-mips64el-unknown-=
linux-gnuabi64.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc" rel=3D"noreferrer" tar=
get=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-mips64el-u=
nknown-linux-gnuabi64.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 6a3462a10da953546412912d04228a63c5d4086a4768163f1bd5ccf8=
1950090d=C2=A0 rust-std-1.59.0-mips64el-unknown-linux-gnuabi64.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-m=
ips64el-unknown-linux-muslabi64.tar.xz.sha256" rel=3D"noreferrer" target=3D=
"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-mips64el-unknown=
-linux-muslabi64.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-mips64el-unknown-linux-muslabi64.tar.xz.asc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-mips64el-=
unknown-linux-muslabi64.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 606d037a01cc7666594b7973c6a727c69426d85adaf94128dc9914e8=
93ef8ed9=C2=A0 rust-std-1.59.0-mips64el-unknown-linux-muslabi64.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-m=
ipsel-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank"=
>https://static.rust-lang.org/dist/rust-std-1.59.0-mipsel-unknown-linux-gnu=
.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-mipsel-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=3D"=
_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-mipsel-unknown-li=
nux-gnu.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 fd747f4ef4cee6fe88692dd6e3c7b986870ce8a24eab8920adacc7ab=
73fb482d=C2=A0 rust-std-1.59.0-mipsel-unknown-linux-gnu.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-m=
ipsel-unknown-linux-musl.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank=
">https://static.rust-lang.org/dist/rust-std-1.59.0-mipsel-unknown-linux-mu=
sl.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-mipsel-unknown-linux-musl.tar.xz.asc" rel=3D"noreferrer" target=3D=
"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-mipsel-unknown-l=
inux-musl.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 4622aa633ad2d0decca59aa65b24195431e40162804352f5bdd9bafd=
92ee7b9d=C2=A0 rust-std-1.59.0-mipsel-unknown-linux-musl.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-p=
owerpc-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank=
">https://static.rust-lang.org/dist/rust-std-1.59.0-powerpc-unknown-linux-g=
nu.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-powerpc-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=3D=
"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-powerpc-unknown-=
linux-gnu.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 5ead471b53d290960d49a7cec0ba01a082f5e6cfa18825366990d467=
97dc7161=C2=A0 rust-std-1.59.0-powerpc-unknown-linux-gnu.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-p=
owerpc64-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_bla=
nk">https://static.rust-lang.org/dist/rust-std-1.59.0-powerpc64-unknown-lin=
ux-gnu.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-powerpc64-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=
=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-powerpc64-unk=
nown-linux-gnu.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 1217290e951ae84998d2d04a88d154b1da205e2638a3449c02c8e925=
6bff589c=C2=A0 rust-std-1.59.0-powerpc64-unknown-linux-gnu.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-p=
owerpc64le-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_b=
lank">https://static.rust-lang.org/dist/rust-std-1.59.0-powerpc64le-unknown=
-linux-gnu.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-powerpc64le-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" targe=
t=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-powerpc64le-=
unknown-linux-gnu.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 15dee7705967e3351aff11c64ada30c4957b54066c7ee49b87be4b81=
55bd0a7d=C2=A0 rust-std-1.59.0-powerpc64le-unknown-linux-gnu.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-r=
iscv64gc-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_bla=
nk">https://static.rust-lang.org/dist/rust-std-1.59.0-riscv64gc-unknown-lin=
ux-gnu.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-riscv64gc-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=
=3D"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-riscv64gc-unk=
nown-linux-gnu.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 74c1f9c94ff4993948c05df2c9c58f76708e6adbacb9b2caca368558=
dde9590a=C2=A0 rust-std-1.59.0-riscv64gc-unknown-linux-gnu.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-s=
parc64-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank=
">https://static.rust-lang.org/dist/rust-std-1.59.0-sparc64-unknown-linux-g=
nu.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-sparc64-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=3D=
"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-sparc64-unknown-=
linux-gnu.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 6bc109f7ff1f501153cc18eebed9a0cc468eebbfed2cc728047d5945=
6e356f9a=C2=A0 rust-std-1.59.0-sparc64-unknown-linux-gnu.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-x=
86_64-unknown-linux-gnu.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank"=
>https://static.rust-lang.org/dist/rust-std-1.59.0-x86_64-unknown-linux-gnu=
.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-x86_64-unknown-linux-gnu.tar.xz.asc" rel=3D"noreferrer" target=3D"=
_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-x86_64-unknown-li=
nux-gnu.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 c854a9ee3dd8e5be9522c1581f75838c1cbae6dece3934b0004f138c=
4a5024a3=C2=A0 rust-std-1.59.0-x86_64-unknown-linux-gnu.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rust-std-1.59.0-x=
86_64-unknown-linux-musl.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank=
">https://static.rust-lang.org/dist/rust-std-1.59.0-x86_64-unknown-linux-mu=
sl.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rust-st=
d-1.59.0-x86_64-unknown-linux-musl.tar.xz.asc" rel=3D"noreferrer" target=3D=
"_blank">https://static.rust-lang.org/dist/rust-std-1.59.0-x86_64-unknown-l=
inux-musl.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 473b6ddf598418db49efc21c3d2702cdaf9c78ee4ae00611c7d9e384=
a2d4dad7=C2=A0 rust-std-1.59.0-x86_64-unknown-linux-musl.tar.xz<br>
&gt;=C2=A0 =C2=A0# Locally generated<br>
&gt;=C2=A0 =C2=A0sha256=C2=A0 62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2=
796e7d6905db8a3636a=C2=A0 LICENSE-APACHE<br>
&gt;=C2=A0 =C2=A0sha256=C2=A0 23f18e03dc49df91622fe2a76176497404e46ced8a715=
d9d2b67a7446571cca3=C2=A0 LICENSE-MIT<br>
&gt; diff --git a/package/rust-bin/<a href=3D"http://rust-bin.mk" rel=3D"no=
referrer" target=3D"_blank">rust-bin.mk</a> b/package/rust-bin/<a href=3D"h=
ttp://rust-bin.mk" rel=3D"noreferrer" target=3D"_blank">rust-bin.mk</a><br>
&gt; index d4cb8f50ea..b50465f7a6 100644<br>
&gt; --- a/package/rust-bin/<a href=3D"http://rust-bin.mk" rel=3D"noreferre=
r" target=3D"_blank">rust-bin.mk</a><br>
&gt; +++ b/package/rust-bin/<a href=3D"http://rust-bin.mk" rel=3D"noreferre=
r" target=3D"_blank">rust-bin.mk</a><br>
&gt; @@ -4,7 +4,7 @@<br>
&gt;=C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0##########################################################=
######################<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -RUST_BIN_VERSION =3D 1.58.1<br>
&gt; +RUST_BIN_VERSION =3D 1.59.0<br>
&gt;=C2=A0 =C2=A0RUST_BIN_SITE =3D <a href=3D"https://static.rust-lang.org/=
dist" rel=3D"noreferrer" target=3D"_blank">https://static.rust-lang.org/dis=
t</a><br>
&gt;=C2=A0 =C2=A0RUST_BIN_LICENSE =3D Apache-2.0 or MIT<br>
&gt;=C2=A0 =C2=A0RUST_BIN_LICENSE_FILES =3D LICENSE-APACHE LICENSE-MIT<br>
&gt; diff --git a/package/rust/rust.hash b/package/rust/rust.hash<br>
&gt; index 7eb8f59603..63a5644176 100644<br>
&gt; --- a/package/rust/rust.hash<br>
&gt; +++ b/package/rust/rust.hash<br>
&gt; @@ -1,6 +1,6 @@<br>
&gt; -# From <a href=3D"https://static.rust-lang.org/dist/rustc-1.58.1-src.=
tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank">https://static.rust-lan=
g.org/dist/rustc-1.58.1-src.tar.xz.sha256</a><br>
&gt; -# Verified using <a href=3D"https://static.rust-lang.org/dist/rustc-1=
.58.1-src.tar.xz.asc" rel=3D"noreferrer" target=3D"_blank">https://static.r=
ust-lang.org/dist/rustc-1.58.1-src.tar.xz.asc</a><br>
&gt; -sha256=C2=A0 2b3643a48e7087053b0268971ec4154350342508922a8acb0707aaf9=
4deb4469=C2=A0 rustc-1.58.1-src.tar.xz<br>
&gt; +# From <a href=3D"https://static.rust-lang.org/dist/rustc-1.59.0-src.=
tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank">https://static.rust-lan=
g.org/dist/rustc-1.59.0-src.tar.xz.sha256</a><br>
&gt; +# Verified using <a href=3D"https://static.rust-lang.org/dist/rustc-1=
.59.0-src.tar.xz.asc" rel=3D"noreferrer" target=3D"_blank">https://static.r=
ust-lang.org/dist/rustc-1.59.0-src.tar.xz.asc</a><br>
&gt; +sha256=C2=A0 375996ead731cab2203ec10a66a3c4568ab6997d7e5d3ae597658164=
fe27be3d=C2=A0 rustc-1.59.0-src.tar.xz<br>
&gt;=C2=A0 =C2=A0# Locally generated<br>
&gt;=C2=A0 =C2=A0sha256=C2=A0 62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2=
796e7d6905db8a3636a=C2=A0 LICENSE-APACHE<br>
&gt;=C2=A0 =C2=A0sha256=C2=A0 23f18e03dc49df91622fe2a76176497404e46ced8a715=
d9d2b67a7446571cca3=C2=A0 LICENSE-MIT<br>
&gt; diff --git a/package/rust/<a href=3D"http://rust.mk" rel=3D"noreferrer=
" target=3D"_blank">rust.mk</a> b/package/rust/<a href=3D"http://rust.mk" r=
el=3D"noreferrer" target=3D"_blank">rust.mk</a><br>
&gt; index cd8c87b68d..fd02686082 100644<br>
&gt; --- a/package/rust/<a href=3D"http://rust.mk" rel=3D"noreferrer" targe=
t=3D"_blank">rust.mk</a><br>
&gt; +++ b/package/rust/<a href=3D"http://rust.mk" rel=3D"noreferrer" targe=
t=3D"_blank">rust.mk</a><br>
&gt; @@ -4,7 +4,7 @@<br>
&gt;=C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0##########################################################=
######################<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -RUST_VERSION =3D 1.58.1<br>
&gt; +RUST_VERSION =3D 1.59.0<br>
&gt;=C2=A0 =C2=A0RUST_SOURCE =3D rustc-$(RUST_VERSION)-src.tar.xz<br>
&gt;=C2=A0 =C2=A0RUST_SITE =3D <a href=3D"https://static.rust-lang.org/dist=
" rel=3D"noreferrer" target=3D"_blank">https://static.rust-lang.org/dist</a=
><br>
&gt;=C2=A0 =C2=A0RUST_LICENSE =3D Apache-2.0 or MIT<br>
</blockquote></div>

--000000000000c318e105dc72b90b--

--===============0600236178178842923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0600236178178842923==--
