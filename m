Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE548CDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 17:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A97F421CA;
	Wed, 18 Oct 2023 17:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A97F421CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nMeiDJmMiwVC; Wed, 18 Oct 2023 17:43:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 702A4421B9;
	Wed, 18 Oct 2023 17:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 702A4421B9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45DB81BF27A
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 17:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28D9F6F4E7
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 17:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28D9F6F4E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B9okK3yk6WzU for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 17:43:32 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0116861045
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 17:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0116861045
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-99bdeae1d0aso1159174766b.1
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 10:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697651009; x=1698255809;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JFaD+0WyKqfcZIN1nZKpGeVImjdYj1eNqqJRDu7RnLE=;
 b=kWM72STchcc/NwiQrC7EU/wIS+b8DgVRete2LgHn3i81bOpJCueAEsjgfl0Ti3tmnb
 sHJb5ciQRfCtOaBVCpDUyLJD3IZc+5Qp7531AdtdWbei5ddgrTR0mCZCY+V06Wg8Mfek
 HvLF5iIpiIFKiE32Fi1v89GkZmGuUzA0Frd3hdDv6/tWyN0E15xaKEBFsfRg48bwYqIu
 7tWt7vezQmsphJGZjYLZ5pCzLbyA3obEzEU+ZgiPjr4uededgwMBETdxX0m484v7U3Ma
 EVhvJ5XcXrNcOSi+SH8TnmHDb29CgteCf6eByObfOROT/JUDYpEY0dJFDFbrvWqCMXbD
 RpgA==
X-Gm-Message-State: AOJu0Yyvz9rDTX+7yfmDClz0zK/FnN1TyIWgzgHoxhYPElH1iQkPdzgb
 5X9qHK7qqVo4DQ/mPQRSq+i4ZA==
X-Google-Smtp-Source: AGHT+IEz8IHc1gNzWmiUHZ4q/xG5lczPYC3RwFoGz5NqoyDYaD68B8AxiT8cdNnGOYnHhp4mfVTeqw==
X-Received: by 2002:a17:907:1c1c:b0:9a9:e4ba:2da7 with SMTP id
 nc28-20020a1709071c1c00b009a9e4ba2da7mr5494867ejc.49.1697651008627; 
 Wed, 18 Oct 2023 10:43:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 bo16-20020a170906d05000b00977eec7b7e8sm2111909ejb.68.2023.10.18.10.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 10:43:28 -0700 (PDT)
Message-ID: <fc416325-98e6-04e2-6ea9-e48053c2c302@mind.be>
Date: Wed, 18 Oct 2023 19:43:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Vincent Fazio <vfazio@gmail.com>, buildroot@buildroot.org
References: <20231018141155.533944-1-vfazio@gmail.com>
In-Reply-To: <20231018141155.533944-1-vfazio@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1697651009; x=1698255809; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JFaD+0WyKqfcZIN1nZKpGeVImjdYj1eNqqJRDu7RnLE=;
 b=dk88N8gzzooV4AhJTCxfbWW1uFjq+Ep+1vI7DSnei6ZYT9a4PWr0jfDEWfOPTGVTyx
 9lAUZ+OoQ812dGo+i/nhhTySVOsbb2i5/Da9qmIc9EBx4fxemalmZcOi6muNlhV9AFv1
 fEaDskMmuDSaq42JOBhLTvyj/O5/2LexfK+MCoApGa7ValzRt21etFcNM8S8d/QqgjGK
 2RHgeodIBx+cVsmzxDAYl8LFZ9bPAQNK3Jx8Ks829LFIrn+S7kYsW2fi5NNUbSMLNER8
 DwUcLHi+EdAqlnWpPXCxAq3IurYcsv0Ff1cQ5KDsGwx7yB7udotv7iqRS1/8bnm0uJl5
 6ZgQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dk88N8gz
Subject: Re: [Buildroot] [PATCH 1/1] support/dependencies: bump minimal tar
 version to 1.35
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/10/2023 16:11, Vincent Fazio wrote:
> GNU tar 1.35 includes a breaking change [0] that changes the tar header
> created for each regular file even for "stable" formats like pax (which
> we use in support/download/helpers::mk_tar_gz).

  The funny thing is that the tar docs have a section about making the archive 
reproducible [1]. They call it "more reproducible", though, so perhaps they 
realize that they fail...


> Previously, normal files had the devmajor/devminor fields of the header
> filled with ASCII zero (0x30). These fields are now null which also
> affects the checksum value in the header as well.
> 
>    $ diff <(head -n 100 xxd.1.34.output) <(head -n 100 xxd.1.35.output)
>    10c10
>    < 00000090: 3037 3500 3031 3531 3637 0020 3000 0000  075.015167. 0...
>    ---
>    > 00000090: 3037 3500 3031 3337 3237 0020 3000 0000  075.013727. 0...
>    21,22c21,22
>    < 00000140: 0000 0000 0000 0000 0030 3030 3030 3030  .........0000000
>    < 00000150: 0030 3030 3030 3030 0000 0000 0000 0000  .0000000........
>    ---
>    > 00000140: 0000 0000 0000 0000 0000 0000 0000 0000  ................
>    > 00000150: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 
> This has the consequence of causing hash mismatches for any tarball
> created with a version prior to 1.35.
> 
> Instead of reverting back to a host specific version (see 37a909cacf)
> and adding a cap to the maximal tar version (see ec50e407be), just
> establish that 1.35+ should be used going forward.
> 
> This change requires an updated BR_FMT_VERSION for both git and svn.
> 
> [0] https://git.savannah.gnu.org/cgit/tar.git/commit/?id=738de9ecdec45ebfeb999628742373b5f8253bd0
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
> This patch should be coordinated with other patches [1] that update the
> BR_FMT_VERSION revision for git or svn as all of the tarball hashes will
> need to be regenerated tree-wide.
> 
> [1] https://patchwork.ozlabs.org/project/buildroot/list/?series=373742
> ---
>   package/pkg-download.mk                |  4 ++--
>   support/dependencies/check-host-tar.sh | 10 ++++++----
>   2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index e5cd83d859..d33eb2d811 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -20,8 +20,8 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
>   
>   # Version of the format of the archives we generate in the corresponding
>   # download backend:
> -BR_FMT_VERSION_git = -br1
> -BR_FMT_VERSION_svn = -br3
> +BR_FMT_VERSION_git = -br2
> +BR_FMT_VERSION_svn = -br4

  Vendored cargo and go packages will have the same issue, no? Those will need 
to be updated as well...

  Perhaps we should look for an alternative archive format that is actually 
reproducible. If we anyway have to do a mass update, then it's better if now is 
the last time... Though I don't know if an actually reproducible format exists. 
GNU cpio has the --reproducible option, but I don't know if it guarantees 
reproducibility across cpio versions. Also, we still have gzip to contend with.

  Regards,
  Arnout

[1] 
https://www.gnu.org/software/tar/manual/html_chapter/Formats.html#Reproducibility


>   
>   DL_WRAPPER = support/download/dl-wrapper
>   
> diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
> index b7d607a47a..d56d0242a9 100755
> --- a/support/dependencies/check-host-tar.sh
> +++ b/support/dependencies/check-host-tar.sh
> @@ -27,11 +27,13 @@ if [ -n "${version_bsd}" ] ; then
>       exit 1
>   fi
>   
> -# Minimal version = 1.27 (previous versions do not correctly unpack archives
> -# containing hard-links if the --strip-components option is used or create
> -# different gnu long link headers for path elements > 100 characters).
> +# Minimal version = 1.35
> +# GNU tar upstream commit 738de9ecd introduced a "breaking" change that
> +# affects tarballs regardless of mode (pax/ustar/v7) such that tarballs
> +# generated with 1.35 will not hash to the same value as those generated
> +# by previous versions of tar.
>   major_min=1
> -minor_min=27
> +minor_min=35
>   
>   if [ $major -lt $major_min ]; then
>   	# echo nothing: no suitable tar found
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
