Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E754E77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 10:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B66CA40167;
	Mon, 30 Dec 2024 10:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zlnz0IpZ-eKd; Mon, 30 Dec 2024 10:23:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B512405ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B512405ED;
	Mon, 30 Dec 2024 10:23:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DAAB6CA
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C820F405ED
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 61TMngBCVjMt for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 10:23:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 34B6740167
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34B6740167
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34B6740167
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:23:47 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-3047818ac17so71864741fa.3
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 02:23:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735554225; x=1736159025;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2FFZjiz1kdUTHFiqoNevbX2e1Yup82QsEGke+S2vxdk=;
 b=qZu8n5wh7sWck7WRBFA/hDf2EQNd0i1X45tdWc918/rItycb20iYQZAn9AYI57Qrtx
 2u6beEXfCrNcEechDRystHAvzQxuCT49cuG3WzgBq2Lrrw+OrJWlbrlbgVlRgBFk/xWT
 iCTKMsfOXLPoWu0pUzXtY6Habd2dkmgMsV2B4JAamlzwTzK8WAVU26ZUebFKSXR1n9pA
 5MwTeaV4og1detwnO+dYAazSx7K7x0jmAnjmybj12k1bZ64X/WhZ+4RsWWAR7aSEj5XY
 Okq+lmTDlioeRxLZPp8HBxGg3wqgb/U80uIgpWMIi4BIuOauAodhJYhEmtNHU7QVQ4Wd
 cOAg==
X-Gm-Message-State: AOJu0Yy/1VPXPdCkDQw16iVU52X9TK2DMpEV/0yW6L+79PEQBMP0vUdO
 Umkk0+My3oXJXN8XWdL7XH9m2QE+3nhZfB+WYPehhQxiK4+Q3ONcLDCVT9Ztyv9iRKgKdcGP7gh
 0YQVjW2rU6XyGAM2hX7qKoBEX3KhgtqPj
X-Gm-Gg: ASbGncv/QuQEIJNFBoQLft8X8Jk/bVwONYAsXPgq/KD3EH7OhRs1MQIA/mGZ1gv2oyq
 YERwqe4jJ6Z9xSMLDh4Bj0zEbK+LsVRSfFmVLt0BzPxhDCahZOTp2SK/zqzTAxiwU/Ij97AlW
X-Google-Smtp-Source: AGHT+IHiaFANufHyyywwz9IliGfkeAMo4hPcpVO6IgOlu1cXf8ETTdKJfIPy0/sZAc8vPP+wslOe85mPsfMZTG0SIWE=
X-Received: by 2002:a05:651c:544:b0:2fa:cdac:8732 with SMTP id
 38308e7fff4ca-304685c1ac7mr124805061fa.30.1735554224422; Mon, 30 Dec 2024
 02:23:44 -0800 (PST)
MIME-Version: 1.0
References: <20241219152105.298310-1-heiko.thiery@gmail.com>
 <20241219152105.298310-6-heiko.thiery@gmail.com>
 <20241229000204.764dcc66@windsurf>
In-Reply-To: <20241229000204.764dcc66@windsurf>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 30 Dec 2024 11:23:32 +0100
Message-ID: <CAEyMn7boA4k+Uv=MU_SRmjPt8EnG7N7BMYaki1w5fdwzUeCjCg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>, 
 =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735554225; x=1736159025; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2FFZjiz1kdUTHFiqoNevbX2e1Yup82QsEGke+S2vxdk=;
 b=Y1loiANVT7UYntIrGghbBm1TfcUz3TsYEVSKEwOCvN20aY8Ecog6vOjRBYG/cP1ZnQ
 WFYDH3AuhlUvJXTPyST8TdhvAI2w+W1a135x6TmkX/v8jQcc7CYlvLcIBq2I5cIXzO9Y
 x1EyP++dJKpzpBsfSYNKheknXb6nhGmK35HPsXRCDiLrHmEnjaNNctN+dIf43NBGpHR/
 ibTeH8z555Rvulmu9XuaV3GYtNfqI0kvjk5wFxwCYZ94T137Dwpys0qFKS54pDcImCEC
 R++f/aSSEEIy24xgY4ksGrABs6O90YO/dCKFi6oUX1AAtYPR+277dOseAj0f6kLFiZL8
 e/ww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Y1loiANV
Subject: Re: [Buildroot] [PATCH 6/6]
 support/testing/tests/package/test_netopeer2.py: add new test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Am So., 29. Dez. 2024 um 00:02 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Heiko,
>
> On Thu, 19 Dec 2024 16:21:11 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>
> I wanted to merge this test with the current version of netopeer2 and
> related packages in Buildroot, i.e without your version bumps, and the
> build fails with:
>
> -- Could NOT find CURL (missing: CURL_LIBRARY CURL_INCLUDE_DIR)
> -- libcurl not found, url capability will not be supported
> -- Could NOT find LibSystemd (missing: LIBSYSTEMD_LIBRARY LIBSYSTEMD_INCLUDE_DIR SYSTEMD_UNIT_DIR)
> CMake Warning at CMakeLists.txt:301 (message):
>   Disabling netopeer2-server systemd support because libsystemd was not
>   found.
>
>
> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD
> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
> -- Found Threads: TRUE
> -- Found LibYANG: /home/thomas/projets/outputs/TestNetopeer2/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libyang.so (found suitable version "2.46.3", minimum required is "2.28.0")
> -- Found Sysrepo: /home/thomas/projets/outputs/TestNetopeer2/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libsysrepo.so (found suitable version "7.23.1", minimum required is "7.12.0")
> CMake Error at cli/CMakeLists.txt:49 (message):
>   c_rehash Perl OpenSSL script not found!
>
>
> -- Configuring incomplete, errors occurred!
> make[1]: *** [package/pkg-generic.mk:279: /home/thomas/projets/outputs/TestNetopeer2/build/netopeer2-2.1.49/.stamp_configured] Error 1
> make: *** [Makefile:23: _all] Error 2
>
> So it looks like there is an existing issue in Buildroot?

I suspect that the config here does not match the old packages. I have
tested the test with the updated ones.

>
> > +class TestNetopeer2(infra.basetest.BRTest):
> > +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> > +        f"""
>
> Please drop the "f" here, since you're not using this as an f-formatted
> string, flake8 complains when checking this Python script.

ok

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
