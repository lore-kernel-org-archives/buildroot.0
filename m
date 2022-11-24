Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6DCC433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 14:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38FF0813B7;
	Thu, 24 Nov 2022 14:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38FF0813B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A8iI-Z4uaFmn; Thu, 24 Nov 2022 14:55:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DAB3813C2;
	Thu, 24 Nov 2022 14:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DAB3813C2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 817971BF2B1
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 14:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 676B741799
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 14:55:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 676B741799
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wV7pyLTjIdIz for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 14:55:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2FBC4177A
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2FBC4177A
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 14:55:01 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id 4so1682697pli.0
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 06:55:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UIHrIt4I79O9FhGYPLFt6Koavs/h/dgKG3fJTgHkrTs=;
 b=AOwnqQsZdPeSk5IkVRxEV90cZT57AxHOVRcgQI2uovkV0snhGdQjZr8UKcZdhsQvVe
 VVpyUf2Wzp+7guV2IIXiAfGVhAf4KUQ7tun83LeD61HIswVwtH1Uc/d4NO49CNuE5XrE
 +dggpTM/Mb1LyoBDWbtSplccWFO567GN0FI5IENzNYww9tG880ZcyCCaVysExCI9RAN9
 x0G53vIuG+mTH/S3s9CCkbTWaqWVHmQUXVzK9sVD45qnHJ3sLI3RJGqLRtfuRpR7Z+2C
 MdVDWej9qf84Fav5an5sU4aMiAxrrlFpJj9T2AbXKrKrUOpQ8D3yJQNKqyQCdrIiIR+J
 tPGw==
X-Gm-Message-State: ANoB5pk288ZJ1TBiUIwZNuzyE+2/hnAlgCn9JJB6FRn2+03nFsV3AO39
 s0xl9nMOstoYAdUWot9iyrdDR5eAtlSVNk1j0Ceqnlh91ziwAg==
X-Google-Smtp-Source: AA0mqf5RMgGP9mufL2rLXjbySuf1R+U5i3ORm/jtpzuagiKZDv9LDbxCGZMVjY8bjzBBNJAgbXF1qIwQWGDhN/vR0JU=
X-Received: by 2002:a17:903:22c4:b0:184:cb7e:ba36 with SMTP id
 y4-20020a17090322c400b00184cb7eba36mr13791302plg.57.1669301700935; Thu, 24
 Nov 2022 06:55:00 -0800 (PST)
MIME-Version: 1.0
References: <20221124140627.3269192-1-stefan.hager@ginzinger.com>
In-Reply-To: <20221124140627.3269192-1-stefan.hager@ginzinger.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 24 Nov 2022 10:54:49 -0400
Message-ID: <CADvTj4rmM5-9_qvHqKCRA3FHebK5O3po2dtUg7bXkPW+Oii8pw@mail.gmail.com>
To: Stefan Hager <stefan.hager@ginzinger.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UIHrIt4I79O9FhGYPLFt6Koavs/h/dgKG3fJTgHkrTs=;
 b=DGMWGDmsLdQrn+wYHnPcVlkBwXSS5F9PHvIegORU15Z2ZbRagdnhCovBdKCG7jrOQD
 hf3Dt3AGEpLRLGZmQmaPpMI1zr2vi//igqhNUtBvA9JX4jT5hIVgZnmK0PsDrtzRo7+s
 jeypUpbllnyi+7WvsuufkcFEv8XeKsbg0fu+kRMR7w5bSEwvl5athzifRffEQR4c4Q2A
 VZDN2aHsLO3awLwaxWJCG4Jakv/QrALzKhL97pDlc8+t5HLXFg1OkRfHP8Eh6RbbfFit
 BC7Wbbt4fbM5J9SwHsodzIgpiWpMVmb4dSUuRx+ZdLZfTLg/3BgZq5CQ0QSvZL31EXCe
 +How==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DGMWGDms
Subject: Re: [Buildroot] [RFC PATCH 00/10] tensorflow-lite: new package
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

On Thu, Nov 24, 2022 at 10:14 AM Stefan Hager
<stefan.hager@ginzinger.com> wrote:
>
> Hello,
>
> this RFC patch series proposes a way to integrate the Tensorflow-lite runtime (TFLite) into Buildroot.
>
> This first RFC just integrates the TFLite C++ sahred library.
> After a sucessful first integration the next step wuld be to activate the python library for TFlite.
> As a third step i plan to integrate the NPU Backend Driver for TFLite to use accelerated inference on the i.MX8MP NPU (neural processing unit) for C++ an Python.
> All of this currently works locally as a proof of concept for a few users.
>
> The currently used Version of TFLite is 2.8.0 (official) which is proven to work.

This is an outdated release right? Are there issues with 2.11.0?

>
> TFlite comes with a bunch of external source dependencies which are downloaded by separate hidden packages and then built by the main TFLite package.
> TFLite needs its own versions of libabseil, eigen and flatbuffers wich may conflict with the Versions provided by Buildroot.

I'm unable to find any documentation indicating this is actually the case.

I skimmed the cmakelists and it doesn't seem to have strict version
requirements:
https://github.com/tensorflow/tensorflow/blob/v2.11.0/tensorflow/lite/CMakeLists.txt

Have you tried building against the normal buildroot versions of these packages?

> Since i can not gurantee that TFlite will work with other Versions of this packages i decided to only let TFlite be activated if this packages are not activated in Buildroot.

This is probably not the right approach, other packages may depend on
or select the normal versions(flatbuffers seems especially problematic).

>
> Currently TFlite only supports a limited set of processor architectures (ARMV8A: only 64-bit Support no 32-bit (doesn't build); ARMV7A: only 32-bit Support).
> Anyone else may activate further platforms if needed, but testing needs to then be done by them.
>
> How to build a minimal config with TFLite:
> ===============================================
> $ make raspberrypi4_64_defconfig menuconfig
> Activate TFLite in menuconfig: Target packages -> Libraries -> [*] tensorflow-lite
> $ make tensorflow-lite
>
> I'm hoping for Comments to prepare a first patchset.
>
> Stefan Hager (10):
>   tensorflow-lite-abseil-cpp: new package
>   tensorflow-lite-clog: new package
>   tensorflow-lite-abseil-cpuinfo: new package
>   tensorflow-lite-eigen: new package
>   tensorflow-lite-farmhash: new package
>   tensorflow-lite-fft2d: new package
>   tensorflow-lite-flatbuffers: new package
>   tensorflow-lite-gemmlowp: new package
>   tensorflow-lite-ruy: new package
>   tensorflow-lite: new package
>
>  package/Config.in                             |   1 +
>  package/tensorflow-lite-abseil-cpp/Config.in  |   5 +
>  .../tensorflow-lite-abseil-cpp.hash           |   3 +
>  .../tensorflow-lite-abseil-cpp.mk             |  14 ++
>  package/tensorflow-lite-clog/Config.in        |   5 +
>  .../tensorflow-lite-clog.hash                 |   3 +
>  .../tensorflow-lite-clog.mk                   |  14 ++
>  package/tensorflow-lite-cpuinfo/Config.in     |   5 +
>  .../tensorflow-lite-cpuinfo.hash              |   3 +
>  .../tensorflow-lite-cpuinfo.mk                |  14 ++
>  package/tensorflow-lite-eigen/Config.in       |   5 +
>  .../tensorflow-lite-eigen.hash                |   9 +
>  .../tensorflow-lite-eigen.mk                  |  14 ++
>  package/tensorflow-lite-farmhash/Config.in    |   5 +
>  .../tensorflow-lite-farmhash.hash             |   3 +
>  .../tensorflow-lite-farmhash.mk               |  14 ++
>  package/tensorflow-lite-fft2d/Config.in       |   5 +
>  .../tensorflow-lite-fft2d.hash                |   3 +
>  .../tensorflow-lite-fft2d.mk                  |  15 ++
>  package/tensorflow-lite-flatbuffers/Config.in |   5 +
>  .../tensorflow-lite-flatbuffers.hash          |   3 +
>  .../tensorflow-lite-flatbuffers.mk            |  14 ++
>  package/tensorflow-lite-gemmlowp/Config.in    |   5 +
>  .../tensorflow-lite-gemmlowp.hash             |   3 +
>  .../tensorflow-lite-gemmlowp.mk               |  14 ++
>  package/tensorflow-lite-ruy/Config.in         |   5 +
>  .../tensorflow-lite-ruy.hash                  |   3 +
>  .../tensorflow-lite-ruy.mk                    |  14 ++
>  ...2sse-since-this-is-only-useful-on-x8.patch |  34 +++
>  ...build-a-shared-library-instead-of-st.patch |  55 +++++
>  ...build-tflite-with-external-delegates.patch |  59 +++++
>  ...epositories-and-git-pull-configurati.patch | 203 +++++++++++++++
>  package/tensorflow-lite/Config.in             |  56 +++++
>  package/tensorflow-lite/tensorflow-lite.hash  |   3 +
>  package/tensorflow-lite/tensorflow-lite.mk    | 232 ++++++++++++++++++
>  35 files changed, 848 insertions(+)
>  create mode 100644 package/tensorflow-lite-abseil-cpp/Config.in
>  create mode 100644 package/tensorflow-lite-abseil-cpp/tensorflow-lite-abseil-cpp.hash
>  create mode 100644 package/tensorflow-lite-abseil-cpp/tensorflow-lite-abseil-cpp.mk
>  create mode 100644 package/tensorflow-lite-clog/Config.in
>  create mode 100644 package/tensorflow-lite-clog/tensorflow-lite-clog.hash
>  create mode 100644 package/tensorflow-lite-clog/tensorflow-lite-clog.mk
>  create mode 100644 package/tensorflow-lite-cpuinfo/Config.in
>  create mode 100644 package/tensorflow-lite-cpuinfo/tensorflow-lite-cpuinfo.hash
>  create mode 100644 package/tensorflow-lite-cpuinfo/tensorflow-lite-cpuinfo.mk
>  create mode 100644 package/tensorflow-lite-eigen/Config.in
>  create mode 100644 package/tensorflow-lite-eigen/tensorflow-lite-eigen.hash
>  create mode 100644 package/tensorflow-lite-eigen/tensorflow-lite-eigen.mk
>  create mode 100644 package/tensorflow-lite-farmhash/Config.in
>  create mode 100644 package/tensorflow-lite-farmhash/tensorflow-lite-farmhash.hash
>  create mode 100644 package/tensorflow-lite-farmhash/tensorflow-lite-farmhash.mk
>  create mode 100644 package/tensorflow-lite-fft2d/Config.in
>  create mode 100644 package/tensorflow-lite-fft2d/tensorflow-lite-fft2d.hash
>  create mode 100644 package/tensorflow-lite-fft2d/tensorflow-lite-fft2d.mk
>  create mode 100644 package/tensorflow-lite-flatbuffers/Config.in
>  create mode 100644 package/tensorflow-lite-flatbuffers/tensorflow-lite-flatbuffers.hash
>  create mode 100644 package/tensorflow-lite-flatbuffers/tensorflow-lite-flatbuffers.mk
>  create mode 100644 package/tensorflow-lite-gemmlowp/Config.in
>  create mode 100644 package/tensorflow-lite-gemmlowp/tensorflow-lite-gemmlowp.hash
>  create mode 100644 package/tensorflow-lite-gemmlowp/tensorflow-lite-gemmlowp.mk
>  create mode 100644 package/tensorflow-lite-ruy/Config.in
>  create mode 100644 package/tensorflow-lite-ruy/tensorflow-lite-ruy.hash
>  create mode 100644 package/tensorflow-lite-ruy/tensorflow-lite-ruy.mk
>  create mode 100644 package/tensorflow-lite/0001-Deactivated-neon2sse-since-this-is-only-useful-on-x8.patch
>  create mode 100644 package/tensorflow-lite/0002-Added-option-to-build-a-shared-library-instead-of-st.patch
>  create mode 100644 package/tensorflow-lite/0003-Added-option-to-build-tflite-with-external-delegates.patch
>  create mode 100644 package/tensorflow-lite/0004-Removed-source-repositories-and-git-pull-configurati.patch
>  create mode 100644 package/tensorflow-lite/Config.in
>  create mode 100644 package/tensorflow-lite/tensorflow-lite.hash
>  create mode 100644 package/tensorflow-lite/tensorflow-lite.mk
>
> --
> 2.36.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
