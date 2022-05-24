Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F647C433EF
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 20:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E06DC61288;
	Tue, 24 May 2022 20:24:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t8pxaukqzy6p; Tue, 24 May 2022 20:24:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C53661285;
	Tue, 24 May 2022 20:24:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96FAC1BF29D
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 20:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85FFC840FE
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 20:24:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mkG-OSvDVCfm for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 20:24:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DF61840FB
 for <buildroot@buildroot.org>; Tue, 24 May 2022 20:24:41 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id p26so24498193eds.5
 for <buildroot@buildroot.org>; Tue, 24 May 2022 13:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rdb9IOq5VCASno7UZrSFIFLkUGGKp/jEJ7/83vRTaJs=;
 b=d5vGKF38vt9+2i7CD6JsDZEbFqoBws5V+eCfgasiwx95MdVxETLrA3aN6oJSEpXeic
 uTa1RFLBwVxDqaI8c1OkXvbmoxdO0SayKpmpO+8SDcxOTC9InloH+0YkXyWnjXAM6GVa
 mR/jyxKjYcdAgNPDwkfA3K2cAXhqT2ku61hs6P3bKVcgkPjCMuDjLbh/hfXofc+zkU0H
 VpnwCKPStOc40f6s8yjTAsvwFe00+NBc0n9hdInlRGTmwYeEYXYBKCVRO5aE7vlPyjPr
 Oy2lFsXba1mZvfYIfU0gHanCL9tv/+3WQye5JQ2PmNQBGJaVxTMj12gTFRiZVuLsic7z
 pCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rdb9IOq5VCASno7UZrSFIFLkUGGKp/jEJ7/83vRTaJs=;
 b=ZPmWMOTsNGzpUJak3Fhz+yOBuw2TyHEer8Yvbf4Ef7RiNeqVQcfl8cdyD+YEDU3zRg
 Q2DyzA6vwtAM4onLKlRvhTXLLFROjNF++dUv23gqyNrolP89dxM6Rjbkq5Z7+/XU954K
 4dDXx91wHpKEU4H7yDIZ751OofHs5NpXuGs1lRYzcM9ft0uQgHGh1FJ1ojsIcaMjzRWM
 eLQMhGo4Pya/3FbiTViOjQGVbhr1lV7TVIfECiXdPniocJxxY2BNA/IozyyQOcYGha8Y
 yC2azXyBsh4eDntvv5CL09q/u9j0NZuzmzU2hWVSizkq4tarx+8b2kXZ2NkzF0nnjNAR
 ZJag==
X-Gm-Message-State: AOAM530xLTaZ1tLJVh0b3kXGWXWm61mwKzCMGmuNWaydarAYtJOLeW1Q
 HbXUPSe0q2iGkOX2VU3gIgwR5KKyZ+gWBVAk1aUXdXUAQrPbCQ==
X-Google-Smtp-Source: ABdhPJzwFZfcv6n0NGd+9stOPoJ1fhEViV4vO2AlOiG5O+uXT5W5i10BXUcr5aS7mjijZp/Q6gUf4gZ5116zls3jom0=
X-Received: by 2002:aa7:dc09:0:b0:42a:aadd:8e71 with SMTP id
 b9-20020aa7dc09000000b0042aaadd8e71mr30984530edu.41.1653423879700; Tue, 24
 May 2022 13:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <CALtfCQaLxNdrKhSjMfShjb-nQWUnqa3DSOwbyZm1+Q0fU1UUqQ@mail.gmail.com>
 <87zgjapr8a.fsf@tarshish>
 <CALtfCQaBG_p15ASxYKSyZhYOePW5uE-BW8F1KG7DkPeJ8bjLiw@mail.gmail.com>
 <87r14kq55b.fsf@tarshish>
 <CALtfCQY1a6sjLNUh42zsrsu1hPLTMHNDj4+5v5k8w8kv8u6tmg@mail.gmail.com>
 <87ilpwp82x.fsf@tarshish>
 <CALtfCQauLNMOfBb6Zm8M8v-VHakY_Bs+p6CeQh0tVuTtfKyUDg@mail.gmail.com>
In-Reply-To: <CALtfCQauLNMOfBb6Zm8M8v-VHakY_Bs+p6CeQh0tVuTtfKyUDg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 24 May 2022 17:24:30 -0300
Message-ID: <CAOMZO5C7BUTkAd+bMyYk9+7+3rptg=cYNj8t1r9f0fYkv+aw+A@mail.gmail.com>
To: Oscar Gomez Fuente <oscargomezf@gmail.com>
Subject: Re: [Buildroot] How to select python-cryptograhy package
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Oscar,

On Mon, May 23, 2022 at 1:08 PM Oscar Gomez Fuente
<oscargomezf@gmail.com> wrote:

> I have just changed the toolchain from uClibc-ng to glibc or musl, and
> it didn't appear the package BR2_PACKAGE_PYTHON_CRYPTOGRAPHY.
>
> Do you have any suggestions?

I think you should try the raspberrypi3_64_defconfig as the base defconfig.

In package/rustc/Config.in.host we have:

# The below entries match Tier 1 platforms as described at
# https://doc.rust-lang.org/nightly/rustc/platform-support.html.
config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER1_PLATFORMS
bool
# aarch64-unknown-linux-gnu
default y if BR2_aarch64 && BR2_TOOLCHAIN_USES_GLIBC
# i686-unknown-linux-gnu
default y if (BR2_i686 || BR2_x86_pentiumpro || BR2_X86_CPU_HAS_MMX)
&& BR2_TOOLCHAIN_USES_GLIBC
# x86_64-unknown-linux-gnu
default y if BR2_x86_64 && BR2_TOOLCHAIN_USES_GLIBC

Then you could select glibc, python3, and BR2_PACKAGE_PYTHON_CRYPTOGRAPHY.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
