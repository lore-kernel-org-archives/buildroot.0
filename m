Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741E5C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 20:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C11961259;
	Wed, 30 Aug 2023 20:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C11961259
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ejkd--P9q3qf; Wed, 30 Aug 2023 20:01:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 438096126D;
	Wed, 30 Aug 2023 20:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 438096126D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 50F661BF423
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2815841D6A
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2815841D6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bWEpvYfZnhF7 for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 20:01:26 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D1FE41B80
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 20:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D1FE41B80
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-99bf8e5ab39so1108966b.2
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 13:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693425684; x=1694030484;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YWnAFOuaxlMhOg4wXGIzbwgSKHC/nZjYjNf4g9P3sw4=;
 b=j/v+1MrtFGPaqZF/jPULM16KqUH09tZ5GHZK7fk/7MbOZ2z7XqFN/pfWLDbEG+EYzI
 wBXFLbQq0J78nFFWo00EN1WLNeiMdEqvdt2qOVoAmUGKSyGn1qZ5eMzv2bcPlqd2vvWp
 6PLrcL1c2+C1dpKMBgJJE00LA6n6nQVQ4cfv+frJI/Zhik3mAECWCw0CqRFcq13kAQ43
 l/8FGiS+Tfoitn1iZmKn+H3E3RF5UIAo54oHbhrm2IqqpbQxBuWAVR6deCVo2EIKlAb5
 +n61DoPcsTS0u1E8XsBb0V0+hj/t2eO/cviXMfm2shQ+qbphxql5Cdz8xc9pT7rSZC5c
 ztvw==
X-Gm-Message-State: AOJu0YyvltJq8JiQLMY0xKPJmFvQM4pcYv0LimuTPn7XuTgcIOYyDcIR
 EF7yB9oVoLPxMykVhLgNMILU37VxVSjgAptS1OM=
X-Google-Smtp-Source: AGHT+IHbpKDBvdrvj9QjnUqMOPvpgZNq1WJzMU6BHnt2lF7MhKaxeIh+/EfcBS8EtEdsDVaCvcoFLg==
X-Received: by 2002:a17:906:225c:b0:992:a836:a194 with SMTP id
 28-20020a170906225c00b00992a836a194mr2346144ejr.59.1693425684419; 
 Wed, 30 Aug 2023 13:01:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 sa34-20020a1709076d2200b009a5f7fb51dcsm290241ejc.42.2023.08.30.13.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 13:01:23 -0700 (PDT)
Message-ID: <78a55197-aa9c-108a-7e4b-00e5af600b72@mind.be>
Date: Wed, 30 Aug 2023 22:01:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20230828224312.2430429-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20230828224312.2430429-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1693425684; x=1694030484; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YWnAFOuaxlMhOg4wXGIzbwgSKHC/nZjYjNf4g9P3sw4=;
 b=I5BWn3p/v62Ik5W7FAdqqFQTwFvLjqZ5iRHDrhuo4sMXCN4UImo2n44edxGpHt5sWg
 bI3fNDum6V+SgOtZFQXkHg1LgBexUNhhcNLqn4Kj7w9L6a2uBTPYMtbhiW92kNSuuqQm
 QYyqiKiEqzRrUFCDUmvNAiUP7UApRgSC6QLP7R0BrA2BxSC9uu+wcBa9exnUDUYdzUVm
 jUFjIC3yFmZn/wiDrMyVG7jPErDs8ey6XiDxEGpQgPnKm2tCQ47F0zTBd2vVORl+SIkr
 IJqDBMQUVfIWv1ewBSrK9qrd0PaTXWIuNYKrnJ6TV7FR+m2irzAW5mQnWBuglg2GySW7
 uzjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=I5BWn3p/
Subject: Re: [Buildroot] [PATCH] boot/grub2: backport fixes for numerous CVEs
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/08/2023 00:43, Thomas Petazzoni via buildroot wrote:
> Grub 2.06 is affected by a number of CVEs, which have been fixed in
> the master branch of Grub, but are not yet part of any release (there
> is a 2.12-rc1 release, but nothing else between 2.06 and 2.12-rc1).
> 
> So this patch backports the relevant fixes for CVE-2022-28736,
> CVE-2022-28735, CVE-2021-3695, CVE-2021-3696, CVE-2021-3697,
> CVE-2022-28733, CVE-2022-28734, CVE-2022-2601 and CVE-2022-3775.
> 
> It should be noted that CVE-2021-3695, CVE-2021-3696, CVE-2021-3697
> are not reported as affecting Grub by our CVE matching logic because
> the NVD database uses an incorrect CPE ID in those CVEs: it uses
> "grub" as the product instead of "grub2" like all other CVEs for
> grub. This issue has been reported to the NVD maintainers.
> 
> This requires backporting a lot of patches, but jumping from 2.06 to
> 2.12-rc1 implies getting 592 commits, which is quite a lot.
> 
> All Grub test cases are working fine:
> 
>    https://gitlab.com/tpetazzoni/buildroot/-/pipelines/984500585
>    https://gitlab.com/tpetazzoni/buildroot/-/pipelines/984500679
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>   ...onfig-Restore-umask-for-the-grub.cfg.patch |   4 +-
>   ...hainloader-Simplify-the-loader-state.patch | 126 ++++
>   ...ot-Add-API-to-pass-context-to-loader.patch | 165 +++++
>   ...i-chainloader-Use-grub_loader_set_ex.patch |  80 ++
>   ...ct-non-kernel-files-in-the-shim_lock.patch | 105 +++
>   ...07-video-Remove-trailing-whitespaces.patch | 689 ++++++++++++++++++
>   ...g-Abort-sooner-if-a-read-operation-f.patch | 204 ++++++
>   ...g-Refuse-to-handle-multiple-image-he.patch |  34 +
>   ...g-Drop-greyscale-support-to-fix-heap.patch | 173 +++++
>   ...g-Avoid-heap-OOB-R-W-inserting-huff-.patch |  44 ++
>   ...eg-Block-int-underflow-wild-pointer-.patch |  78 ++
>   ...3-net-ip-Do-IP-fragment-maths-safely.patch |  56 ++
>   ...Fix-OOB-write-for-split-http-headers.patch |  50 ++
>   ...or-out-on-headers-with-LF-without-CR.patch |  52 ++
>   ...erflow-in-grub_font_get_glyph_intern.patch | 116 +++
>   ...-integer-overflows-in-grub_font_cons.patch |  83 +++
>   ...ix-an-integer-underflow-in-blit_comb.patch |  93 +++
>   boot/grub2/grub2.mk                           |  19 +
>   18 files changed, 2169 insertions(+), 2 deletions(-)
>   create mode 100644 boot/grub2/0003-loader-efi-chainloader-Simplify-the-loader-state.patch
>   create mode 100644 boot/grub2/0004-commands-boot-Add-API-to-pass-context-to-loader.patch
>   create mode 100644 boot/grub2/0005-loader-efi-chainloader-Use-grub_loader_set_ex.patch
>   create mode 100644 boot/grub2/0006-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch
>   create mode 100644 boot/grub2/0007-video-Remove-trailing-whitespaces.patch
>   create mode 100644 boot/grub2/0008-video-readers-png-Abort-sooner-if-a-read-operation-f.patch
>   create mode 100644 boot/grub2/0009-video-readers-png-Refuse-to-handle-multiple-image-he.patch
>   create mode 100644 boot/grub2/0010-video-readers-png-Drop-greyscale-support-to-fix-heap.patch
>   create mode 100644 boot/grub2/0011-video-readers-png-Avoid-heap-OOB-R-W-inserting-huff-.patch
>   create mode 100644 boot/grub2/0012-video-readers-jpeg-Block-int-underflow-wild-pointer-.patch
>   create mode 100644 boot/grub2/0013-net-ip-Do-IP-fragment-maths-safely.patch
>   create mode 100644 boot/grub2/0014-net-http-Fix-OOB-write-for-split-http-headers.patch
>   create mode 100644 boot/grub2/0015-net-http-Error-out-on-headers-with-LF-without-CR.patch
>   create mode 100644 boot/grub2/0016-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
>   create mode 100644 boot/grub2/0017-font-Fix-several-integer-overflows-in-grub_font_cons.patch
>   create mode 100644 boot/grub2/0018-font-Fix-an-integer-underflow-in-blit_comb.patch
> 
> diff --git a/boot/grub2/0002-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch b/boot/grub2/0002-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
> index 0d6a1a6e01..a485aacc22 100644
> --- a/boot/grub2/0002-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
> +++ b/boot/grub2/0002-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
> @@ -1,4 +1,4 @@
> -From 8418defaf0902bdd8af188221ae54c5a3d6ad05d Mon Sep 17 00:00:00 2001
> +From 4c1ad500e73d46c83dec369da85db39ae2fe62dd Mon Sep 17 00:00:00 2001
>   From: Michael Chang <mchang@suse.com>
>   Date: Fri, 3 Dec 2021 16:13:28 +0800
>   Subject: [PATCH] grub-mkconfig: Restore umask for the grub.cfg

  Since this file is modified, my pre-commit hook unconditionally runs 
check-package on it. I therefore fixed the incorrectly formatted Upstream tag in 
it and removed the .checkpackageignore line.

[snip]
> diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
> index 875884cf5c..46ded77118 100644
> --- a/boot/grub2/grub2.mk
> +++ b/boot/grub2/grub2.mk
> @@ -34,6 +34,25 @@ GRUB2_IGNORE_CVES += CVE-2020-15705
>   GRUB2_IGNORE_CVES += CVE-2021-3981
>   # vulnerability is specific to the SUSE distribution
>   GRUB2_IGNORE_CVES += CVE-2021-46705
> +# 0004-loader-efi-chainloader-Use-grub_loader_set_ex.patch

  All the numbers here were one or two off, i.e. this is actually patch 0005...

  I corrected all that and applied to master, thanks.

  Regards,
  Arnout

> +GRUB2_IGNORE_CVES += CVE-2022-28736
> +# 0005-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch
> +GRUB2_IGNORE_CVES += CVE-2022-28735
> +# 0009-video-readers-png-Drop-greyscale-support-to-fix-heap.patch
> +GRUB2_IGNORE_CVES += CVE-2021-3695
> +# 0010-video-readers-png-Avoid-heap-OOB-R-W-inserting-huff-.patch
> +GRUB2_IGNORE_CVES += CVE-2021-3696
> +# 0011-video-readers-jpeg-Block-int-underflow-wild-pointer-.patch
> +GRUB2_IGNORE_CVES += CVE-2021-3697
> +# 0012-net-ip-Do-IP-fragment-maths-safely.patch
> +GRUB2_IGNORE_CVES += CVE-2022-28733
> +# 0013-net-http-Fix-OOB-write-for-split-http-headers.patch
> +# 0014-net-http-Error-out-on-headers-with-LF-without-CR.patch
> +GRUB2_IGNORE_CVES += CVE-2022-28734
> +# 0015-font-Fix-several-integer-overflows-in-grub_font_cons.patch
> +GRUB2_IGNORE_CVES += CVE-2022-2601
> +# 0016-font-Fix-an-integer-underflow-in-blit_comb.patch
> +GRUB2_IGNORE_CVES += CVE-2022-3775
>   
>   ifeq ($(BR2_TARGET_GRUB2_INSTALL_TOOLS),y)
>   GRUB2_INSTALL_TARGET = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
