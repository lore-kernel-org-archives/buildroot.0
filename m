Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE288C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DD2260C00;
	Tue,  4 Jan 2022 17:51:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2qd4jwK8zeU6; Tue,  4 Jan 2022 17:51:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AD2F60B91;
	Tue,  4 Jan 2022 17:51:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A2EDB1BF2EF
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0B5B40920
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UxaUBxx8kJXZ for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:51:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F8424091E
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:51:17 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id q14so143695880edi.3
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=H8p4/KGtwmlslsDM90fBciPiInZq1JowWOskGt6vdik=;
 b=CoIjnBG+AW9iMIPS33Yv4J44cjMxyUGB9SWbLPtsl/2nViMZZMhA4yTtZ0Ye2WAXCR
 1SCMiH7ZQlKSSExIWjTnNRAVG+3KT94nBW8j9V9TOMMVv95yIWF1mRdug0TCtFGxkd9J
 T+hf3qwat0UDmhwkurOR7FJpmlivlT/n3UrGzN1DQU4WW5leueilQJtX43Y3oKBnfE5V
 1I6DAAhKX1SsfQ9dRQKyYffGPXWweG+NCZfpaBG3aCvplpe0tDAnxsAzNYceigZidVN3
 MX/eWNeReQC3nx3fyQHqDwUkhYyGt5TgjuPeMcocjLaixeWfYU8iblGvSkM2iKXKp/JW
 nnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=H8p4/KGtwmlslsDM90fBciPiInZq1JowWOskGt6vdik=;
 b=SK/BpGeA8NfP7ats6y+pi7NJf9rHE0sqmMe7rMVmslbisKd9QLff3a1Lf3Ryybs708
 D60T7AtZg/zt98kmJOFXKa3/KBE9IS4l8F3v+jhia6DsOu0SVw0WjEnPs7GXqrVy3Nhx
 FlhpCMAfanMZT6AVGx5ivBgn/scYmcEZMxAQtvnTz4gqD00OuplDWzNuo636H89Sb+nh
 ehs/qUm/GxqEwBr9auWoAJN7L1PbQCM9T63Jutd8Sz5CIVRhAeCBL+Pk2MDleGTMPEcJ
 gDzRIic75fKJecXvAcvi3B60Io5KVT1nEubR8+wLQQQMYadPIBoA6oe1UjW9InLPdF9m
 QhWg==
X-Gm-Message-State: AOAM533XldWuAANubup/6dIYujbyGgop39IR8Hr3prQanKI4L+ohZclg
 99w0dZ8PUajG1Z4UH5piHFyQk7UmtZaoSQ==
X-Google-Smtp-Source: ABdhPJzg23unyFajN9EcMFjmon454tf5WRvxyICzrwQjIs0TMKJzNgMsiQxU1kV+kDp8cyDQvkKyAg==
X-Received: by 2002:a17:907:3d8e:: with SMTP id
 he14mr39588319ejc.167.1641318676215; 
 Tue, 04 Jan 2022 09:51:16 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 24sm11620763ejg.47.2022.01.04.09.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:51:15 -0800 (PST)
Message-ID: <02ad5067-f0ed-884c-478c-3e7e83062e72@mind.be>
Date: Tue, 4 Jan 2022 18:51:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Erik Larsson <who+buildroot@cnackers.org>, buildroot@buildroot.org
References: <20220101223900.2970405-2-who+buildroot@cnackers.org>
 <20220102212559.43475-1-who+buildroot@cnackers.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220102212559.43475-1-who+buildroot@cnackers.org>
Subject: Re: [Buildroot] [PATCH 2/3] package/tpm2-tools: bump version to 5.2
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



On 02/01/2022 22:25, Erik Larsson wrote:
> Depedency on libuuid was removed in:
> https://github.com/tpm2-software/tpm2-tools/commit/210b2d639c216df7fa68e38427b13b96edbf78fd
> 
> Drop 0001-configure-make-build-gnu99.patch as it is in 5.2
> 
> Signed-off-by: Erik Larsson <who+buildroot@cnackers.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0001-configure-make-build-gnu99.patch     | 30 -------------------
>   package/tpm2-tools/Config.in                  |  2 --
>   package/tpm2-tools/tpm2-tools.hash            |  2 +-
>   package/tpm2-tools/tpm2-tools.mk              |  6 ++--
>   4 files changed, 3 insertions(+), 37 deletions(-)
>   delete mode 100644 package/tpm2-tools/0001-configure-make-build-gnu99.patch
> 
> diff --git a/package/tpm2-tools/0001-configure-make-build-gnu99.patch b/package/tpm2-tools/0001-configure-make-build-gnu99.patch
> deleted file mode 100644
> index 37ca6c5873..0000000000
> --- a/package/tpm2-tools/0001-configure-make-build-gnu99.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 521c3cc506b18c5c84d86e1e90d1daee39849b0c Mon Sep 17 00:00:00 2001
> -From: William Roberts <william.c.roberts@intel.com>
> -Date: Mon, 8 Feb 2021 11:57:28 -0600
> -Subject: [PATCH] configure: make build gnu99
> -
> -Signed-off-by: William Roberts <william.c.roberts@intel.com>
> -
> -[Retrieved from:
> -https://github.com/tpm2-software/tpm2-tools/commit/521c3cc506b18c5c84d86e1e90d1daee39849b0c
> -and updated to set gnu99 instead of c99 as done by
> -https://github.com/tpm2-software/tpm2-tools/commit/5d0267428e96989afce406d096994ec5091ee107]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - configure.ac | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/configure.ac b/configure.ac
> -index dc15b5595..25039a0d9 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -287,6 +287,9 @@ AC_DEFUN([add_c_flag], [
> - # -D_GNU_SOURCE is required for execvpe() in options.c
> - add_c_flag([-D_GNU_SOURCE], [AC_MSG_ERROR([Cannot enable -D_GNU_SOURCE])])
> -
> -+# Enable gnu99 mode, since we use some of these features.
> -+add_c_flag([-std=gnu99], [AC_MSG_ERROR([Cannot enable -std=gnu99])])
> -+
> - # Best attempt compiler options that are on newer versions of GCC that
> - # we can't widely enforce without killing other peoples builds.
> - # Works with gcc only. Needs to be disabled on BSD and clang
> diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
> index 3be947648f..1a6698570a 100644
> --- a/package/tpm2-tools/Config.in
> +++ b/package/tpm2-tools/Config.in
> @@ -7,8 +7,6 @@ config BR2_PACKAGE_TPM2_TOOLS
>   	select BR2_PACKAGE_LIBCURL
>   	select BR2_PACKAGE_OPENSSL
>   	select BR2_PACKAGE_TPM2_TSS
> -	select BR2_PACKAGE_UTIL_LINUX
> -	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>   	help
>   	  TPM (Trusted Platform Module) 2.0 CLI tools based on system
>   	  API of TPM2-TSS. These tools can be used to manage keys,
> diff --git a/package/tpm2-tools/tpm2-tools.hash b/package/tpm2-tools/tpm2-tools.hash
> index bfb7e9b220..f50a896363 100644
> --- a/package/tpm2-tools/tpm2-tools.hash
> +++ b/package/tpm2-tools/tpm2-tools.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  e2802d4093a24b2c65b1f913d0f4c68eadde9b8fd8a9b7a3b17a6e50765e8350  tpm2-tools-4.3.2.tar.gz
> +sha256  c0b402f6a7b3456e8eb2445211e2d41c46c7e769e05fe4d8909ff64119f7a630  tpm2-tools-5.2.tar.gz
>   sha256  f6995d52c8b8e4d2c3bace7fc9c330a77a90d808166fbad4d7ead7e8ba2fc66c  doc/LICENSE
> diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
> index 41f5bcf201..8675344805 100644
> --- a/package/tpm2-tools/tpm2-tools.mk
> +++ b/package/tpm2-tools/tpm2-tools.mk
> @@ -4,15 +4,13 @@
>   #
>   ################################################################################
>   
> -TPM2_TOOLS_VERSION = 4.3.2
> +TPM2_TOOLS_VERSION = 5.2
>   TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
>   TPM2_TOOLS_LICENSE = BSD-3-Clause
>   TPM2_TOOLS_LICENSE_FILES = doc/LICENSE
>   TPM2_TOOLS_CPE_ID_VENDOR = tpm2-tools_project
>   TPM2_TOOLS_SELINUX_MODULES = tpm2
> -TPM2_TOOLS_DEPENDENCIES = libcurl openssl tpm2-tss host-pkgconf util-linux
> -# We're patching configure.ac
> -TPM2_TOOLS_AUTORECONF = YES
> +TPM2_TOOLS_DEPENDENCIES = libcurl openssl tpm2-tss host-pkgconf
>   
>   # -fstack-protector-all and FORTIFY_SOURCE=2 is used by
>   # default. Disable that so the BR2_SSP_* / BR2_FORTIFY_SOURCE_* options
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
