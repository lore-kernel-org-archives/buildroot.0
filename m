Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0507AC77B61
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 21:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B020760AE1;
	Sun,  9 Apr 2023 21:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B020760AE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id shKWTWR3z6Ut; Sun,  9 Apr 2023 21:03:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32D2860B06;
	Sun,  9 Apr 2023 21:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32D2860B06
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB55D1BF82D
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 21:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0F9E60B06
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 21:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0F9E60B06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jPzZ_-W375Ow for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 21:03:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CC0D60AE1
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CC0D60AE1
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 21:03:40 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id e2so2958429wrc.10
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 14:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681074218;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5lVTQHHhR67CUyGY33euN7CyOJpey/XRNs0BH/s/8D4=;
 b=eyM+LKyekFiMtBTh4HXdvgcI2g6rrHCh9qmjH20ieyDafoPU+krLuXa4jHGH1iBUVz
 QHVAJL7h4aUYY3VBSdyZB/s3iLGWLSYNPx7nHlQYj63jYmtRmJtxXbW8y7uS+o7mETJV
 fKpEcrt2gM9ZwnDe+EXx99OZ9hVKqpOR79s2e0ql6AQxLPVxoS727uHbs2LItXD2maJs
 biJU/+/61/vPp/3yQ8KxkKteXgs+h8zTrdzOzx20euXlY9tyOQDVZHUh1PJyjIvu5yfR
 WmJMmB24jYaJfiR7Z6UIzAVkoY6SYrFjlFqU6rd2DKDtUhrNZQttyqGY3FmfchtYGuFE
 +UeA==
X-Gm-Message-State: AAQBX9e6Fri7L0v2XA5QWZ3U6hThmdNZ7eYS9qm9+exsO09tE31O3YGW
 k4k/wHjlMIAFqGVK7tRUrzV+LnSiRpwgdOkXCGY=
X-Google-Smtp-Source: AKy350an+ly0kHB0oiJUlVc4cBcWi2qjKK0liECHUY8KOfBxh8KajD5KfLsMsAf38uS9On4/wyuNtA==
X-Received: by 2002:adf:da4b:0:b0:2d0:33aa:26da with SMTP id
 r11-20020adfda4b000000b002d033aa26damr5391243wrl.7.1681074218582; 
 Sun, 09 Apr 2023 14:03:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 e10-20020adfdbca000000b002ceac2ccc4asm9998581wrj.23.2023.04.09.14.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 14:03:38 -0700 (PDT)
Message-ID: <4afe6a75-0e57-0a38-9273-5d20323f639b@mind.be>
Date: Sun, 9 Apr 2023 23:03:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
 <20220724054912.2354219-14-ricardo.martincoski@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220724054912.2354219-14-ricardo.martincoski@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681074218;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5lVTQHHhR67CUyGY33euN7CyOJpey/XRNs0BH/s/8D4=;
 b=HXH77y43L3S1sGWo7yNeNBD7AWb87qHaddQk2hYBMK5LaJo/A5k5vxUxrUBak+saOi
 9ES+HdIj2pv8T5QQaiLpTFEdBY9JbydKbKJYzJx2NYAow4e+nUtTvD/wxTQf4ohRb2dF
 9RMLTZkjATWkZFeGM/9uJBlReEZTucOlFr63h+BNzrc5/0ua6ky5JNnwkTE9C/KWJfGE
 RPYrlRuwDlrw6rbRBUVHaSUP+3JLgo6vV6O8JtPZWxGlOElxNkGnUQc2mrjuT8AkXBpE
 BMjX5+au/PpheZLSAnD/VKXWljX9Er14i65gAuJ93Jk8gAt08y0JveDJ6xWIJyGsSgIh
 DEEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HXH77y43
Subject: Re: [Buildroot] [PATCH 13/16] utils/check-package: check files in
 support/
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/07/2022 07:49, Ricardo Martincoski wrote:
> The .mk files inside both support/dependencies and support/misc are not
> package recipes, they are makefiles, so check-package doesn't understand
> them. Therefore ignore such files.
> 
> In the test infra, some br2-externals are used as fixtures to provide
> (sometimes) failure cases, so ignore files in these directories.
> 
> Files inside support/kconfig are files copied from linux upstream, so do
> not generate warnings for them.
> 
> support/gnuconfig contains auto-generated config.{guess,sub} files,
> so do not generate shellcheck warnings for them.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> NOTE to the maintainer applying this patch: please re-generate the list
> of ignored warnings while applying:
> $ ./utils/docker-run
> br-user@...$ ./utils/check-package --failed-only `git ls-tree -r --name-only HEAD` > .checkpackageignore

  Applied to master after regenerating the ignore list.

  Regards,
  Arnout

> ---
>   .checkpackageignore | 43 +++++++++++++++++++++++++++++++++++++++++++
>   utils/check-package |  6 ++++++
>   2 files changed, 49 insertions(+)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 58c05416c4..8f9ab48674 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1021,6 +1021,49 @@ package/yad/yad.hash HashSpaces
>   package/zip/zip.hash HashSpaces
>   package/zmqpp/zmqpp.hash HashSpaces
>   package/zxing-cpp/zxing-cpp.hash HashSpaces
> +support/dependencies/check-host-asciidoc.sh Shellcheck
> +support/dependencies/check-host-cmake.sh Shellcheck
> +support/dependencies/check-host-gzip.sh Shellcheck
> +support/dependencies/check-host-lzip.sh Shellcheck
> +support/dependencies/check-host-make.sh Shellcheck
> +support/dependencies/check-host-python3.sh Shellcheck
> +support/dependencies/check-host-tar.sh Shellcheck
> +support/dependencies/check-host-xzcat.sh Shellcheck
> +support/dependencies/dependencies.sh Shellcheck
> +support/download/bzr ConsecutiveEmptyLines Shellcheck
> +support/download/cargo-post-process Shellcheck
> +support/download/check-hash Shellcheck
> +support/download/cvs Shellcheck
> +support/download/dl-wrapper Shellcheck
> +support/download/file Shellcheck
> +support/download/git Shellcheck
> +support/download/go-post-process Shellcheck
> +support/download/hg Shellcheck
> +support/download/scp Shellcheck
> +support/download/sftp Shellcheck
> +support/download/svn Shellcheck
> +support/download/wget Shellcheck
> +support/gnuconfig/update Shellcheck
> +support/legal-info/buildroot.hash HashSpaces
> +support/libtool/buildroot-libtool-v1.5.patch ApplyOrder Sob
> +support/libtool/buildroot-libtool-v2.2.patch ApplyOrder Sob
> +support/libtool/buildroot-libtool-v2.4.4.patch ApplyOrder
> +support/libtool/buildroot-libtool-v2.4.patch ApplyOrder Sob
> +support/misc/relocate-sdk.sh Shellcheck
> +support/scripts/apply-patches.sh Shellcheck
> +support/scripts/br2-external Shellcheck
> +support/scripts/check-bin-arch Shellcheck
> +support/scripts/check-host-rpath Shellcheck
> +support/scripts/eclipse-register-toolchain Shellcheck
> +support/scripts/fix-configure-powerpc64.sh EmptyLastLine
> +support/scripts/fix-rpath Shellcheck
> +support/scripts/generate-gitlab-ci-yml Shellcheck
> +support/scripts/mkmakefile ConsecutiveEmptyLines Shellcheck
> +support/scripts/mkusers Shellcheck
> +support/scripts/setlocalversion Shellcheck
> +support/testing/tests/core/post-build.sh Shellcheck
> +support/testing/tests/package/test_opkg/post-build.sh Shellcheck
> +support/testing/tests/utils/test_get_developers/0001-package-binutils-change-.mk.patch NumberedSubject
>   toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash HashSpaces
>   toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash HashSpaces
>   toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.hash HashSpaces
> diff --git a/utils/check-package b/utils/check-package
> index 874f58e0d2..601d899d3d 100755
> --- a/utils/check-package
> +++ b/utils/check-package
> @@ -106,6 +106,7 @@ DO_CHECK_INTREE = re.compile(r"|".join([
>       r"fs/",
>       r"linux/",
>       r"package/",
> +    r"support/",
>       r"system/",
>       r"toolchain/",
>       r"utils/",
> @@ -115,6 +116,11 @@ DO_NOT_CHECK_INTREE = re.compile(r"|".join([
>       r"fs/common\.mk$",
>       r"package/doc-asciidoc\.mk$",
>       r"package/pkg-\S*\.mk$",
> +    r"support/dependencies/[^/]+\.mk$",
> +    r"support/gnuconfig/config\.",
> +    r"support/kconfig/",
> +    r"support/misc/[^/]+\.mk$",
> +    r"support/testing/tests/.*br2-external/",
>       r"toolchain/helpers\.mk$",
>       r"toolchain/toolchain-external/pkg-toolchain-external\.mk$",
>       ]))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
