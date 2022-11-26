Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708C6C4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 09:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E913C60E28;
	Sat, 26 Nov 2022 09:15:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E913C60E28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08oDxAF40FQ5; Sat, 26 Nov 2022 09:15:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 206FE60E26;
	Sat, 26 Nov 2022 09:15:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 206FE60E26
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 269DD1BF3A8
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 09:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC75641DDF
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 09:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC75641DDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gu5n3v4FN8Xc for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 09:15:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB00641D8E
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB00641D8E
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 09:15:02 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d3so903965plr.10
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 01:15:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ODgwqqJs8PNBO5sgFNh2voJSeknjx304WP2DuPD5nz4=;
 b=jdNvrAf4alEuY2P6Xjxssd7IryZM0LtD/ku80Tjy+thEwKtW7oD5sxR91fR/0TaoAL
 Da/7i0ig7odfNa1CV5bEQ4lY/UYtSsAuLl50UybF2sqfHkHjnJgOtTGkQeJWL2IRuexG
 TdXTIg6y+Tj+V2hLjOtlszaxdQpvfyeuhFXFC1NwmRQu+lHMhxoIi2jmoNdPgn05NH0H
 5m9WuhOpX0o9ld4dyy3VOqqWq6H1rnzKXjeRQSpOna3fzrgcbQ+VWIrMMiXVYVGuulmZ
 rimq5uEAQK8VbnxyW1zF/RFmUgibQLinP8tJuYXoolxZxMWHfZSsrKoyGiC8rYXXSkn6
 wmVw==
X-Gm-Message-State: ANoB5pk3OVN6Vu5jGK5s9hrc5KmBAGqj/xPNcBAh+7bO4r5yjlJJwcYP
 8ksEJtDrNFWHbOqDp2m2YeuB9YVOVJf6nKk3wzU=
X-Google-Smtp-Source: AA0mqf66OME2QooBRWItcV7p0MuS7FA+DQqkSLgD8ZHp7Bu1CfyBXES9n+6S3KYRVW+TR3G/fSybfcgdE701TEtEPjA=
X-Received: by 2002:a17:902:e40a:b0:17a:a81:2a52 with SMTP id
 m10-20020a170902e40a00b0017a0a812a52mr28637513ple.159.1669454102218; Sat, 26
 Nov 2022 01:15:02 -0800 (PST)
MIME-Version: 1.0
References: <6381c264.df0a0220.f5907.df2dSMTPIN_ADDED_MISSING@mx.google.com>
In-Reply-To: <6381c264.df0a0220.f5907.df2dSMTPIN_ADDED_MISSING@mx.google.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 26 Nov 2022 10:14:49 +0100
Message-ID: <CAEyMn7bgj1VgmCNyn89AnepPPvSfOChpA6NQbz8Rw14HAeZVxg@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ODgwqqJs8PNBO5sgFNh2voJSeknjx304WP2DuPD5nz4=;
 b=YxolXnHklsxUA+eS+MuvhCRlrekDNeJheK/sR8XVlodsxjZr8PAR503QJqgSNehhMA
 UIn606R5kT4YM0W/Cd79Zkn4Eb5tNthJsGAKXvSSvUY1zdOJalizoCxVZbbTVGvwQIxZ
 wDlKYSiufh28g20SPsxfalOwndLqvWrYYoR/+cbXZLO8FXjWdiuo70ebEqZSwnrhJR/V
 +0yg3UgpUBlSFDijPBmmVSk4n6rBjDcnwaURsrH65znDtXJn7enQHp2Qt0d23hBwZOL1
 0DulTGa96GbbkSt3nA/cx+Qn3onnZm56pOWAptxogJt7mRkDglO8x5oqZ5zif6SeV2Yf
 uQrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YxolXnHk
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-11-25
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,



Am Sa., 26. Nov. 2022 um 08:38 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello,
>
> Autobuilder failures
> ====================
>
> Below is a list of build failures reported by the Buildroot autobuilders
> in relation to packages or CPU architectures you are in charge of.
> Please help us improving the quality of Buildroot by investigating those
> build failures and sending patches to fix them.
>
> Results for the 'master' branch
> -------------------------------
>
> Build failures related to your packages:
>
>     arch     |             reason             |                                       url
> -------------+--------------------------------+---------------------------------------------------------------------------------
>    mips64    |       libnetconf2-2.1.11       | http://autobuild.buildroot.net/results/1fcfb9929b07a6b89d85dbfa4c7f2cfeb4b3ae1b
> powerpc64le  |         linuxptp-3.1.1         | http://autobuild.buildroot.net/results/8dff570499024da0f9d0c922619c8f07462633ec
>    mipsel    |         linuxptp-3.1.1         | http://autobuild.buildroot.net/results/31214bf6399e7f1bbafc96fd7055ca4629c4021f
>    s390x     |         linuxptp-3.1.1         | http://autobuild.buildroot.net/results/30e18e048fe426ec6a1522875cf37fb224b56bbf
>

The autobuild failures appear since some time. I now tried to
reproduce it on my machine but I'm not able to do so. I see that it
probably only happens on the autobuild machines of yours.

What I know so far is that there is a script [1] that looks for the
supported timestamp for PTP in the kernel sources. With that a define
is set -DHAVE_ONESTEP_P2P. But then when compiling the sources the
definition is not found.

[1] https://github.com/richardcochran/linuxptp/blob/master/incdefs.sh

-- 
Heiko

> Thanks for your contribution to Buildroot!
>
> --
> http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
