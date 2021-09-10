Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD4D7C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 17:48:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 522BB60F6C
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 17:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 522BB60F6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17833407B9;
	Fri, 10 Sep 2021 17:48:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i1cm__fuDX-O; Fri, 10 Sep 2021 17:47:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98F1E407BC;
	Fri, 10 Sep 2021 17:47:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B8871BF83C
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 17:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 079BF83E73
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 17:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QW0FJHFBVglY for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 17:47:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 202D983E59
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 17:47:54 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id q3so3599519edt.5
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 10:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=glq+J8crEHyWZPi/D/CTtMbkBPWHenSVZs1d0kwPdDI=;
 b=CLp2N5jtpx7HOYrRI7ns7pT0D/VtNtMsaUE9zA1G6uGmWrp76jxkYB8ssKZ26+Yods
 Zun9PL7Pcj0AwUVrW5sHybgBiBpreCacyIspRzLW/v60gFPMl/V1K/r+YGNmrtngBn3J
 zRtz+LZEZnKnWdTesED3smWu0MQ8o4rMX93ON0X6jaqQKOJWUEa6Fj5dyn6rKai29ilY
 yEbcwwBKjJwrA2ZbKBOgA1zgwguJOB7Rdt6M/XBNOzulaZc2eS4iQwwEF3+GNg9VqwRw
 NYfDUbS8ilda2VCSfd8e89psFpucaBnVaDalO4qbxja5imBUQtLu4WmGG7Be3JeDFPOk
 4VzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=glq+J8crEHyWZPi/D/CTtMbkBPWHenSVZs1d0kwPdDI=;
 b=yR/vhLvLhdmcv2MNCMupyxVfsoONXB/admGxOVCAfP2QpZSgGFTIb4BCQ2oa57UYMJ
 759S1ti5cNfgwNpwZI4DTsARPFiuDqScTNM9OiZ0pweOdHe7x4PH1SlHjM0wEy9ht7SM
 X+o0xgRM/rxOVkHFOcRKnP2uhkQMocQQbxOIjw7RUY129iv6h4XZXKtpTO+8aHiQ2BhI
 RS0xLtd7cn0dfJ+M4NHETbL51+MV3NhLZStQq4OjfJfxL/mqTxFWYEKuJ2vYmeGId13p
 lMO2fd3cSxzUyYeW4ZqgyqPfgEfeC1hj6Vv1dA5BVroF2p5xBP2bJ/u7bD08Msozs0ET
 s2jw==
X-Gm-Message-State: AOAM5307ojf8mMxo926DnsG5ANdon8zvSaFtGZYJvHeuPeXtPLJrItzy
 8xXPvXnQyMHFinEMdai0qAcuk33Ml56Nlg==
X-Google-Smtp-Source: ABdhPJwdsE/EF+3xVJf+seP0KJUhQJsFxdlLdnjppVg3JNQnFH5Bx83uPx69s1uxV+D6nzS0MoTqXw==
X-Received: by 2002:aa7:c3cb:: with SMTP id l11mr9439844edr.310.1631296072159; 
 Fri, 10 Sep 2021 10:47:52 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id l8sm2790110ejn.103.2021.09.10.10.47.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 10:47:51 -0700 (PDT)
To: Matthew Weber <matthew.weber@collins.com>, buildroot@buildroot.org
References: <20210827205430.39745-1-matthew.weber@collins.com>
 <20210827205430.39745-2-matthew.weber@collins.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <e8e227aa-14de-a59b-a657-ffa4cd0cb326@mind.be>
Date: Fri, 10 Sep 2021 19:47:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827205430.39745-2-matthew.weber@collins.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v3 1/3] package/sloci-image: new host package
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 27/08/2021 22:54, Matthew Weber via buildroot wrote:
> From: Sergio Prado <sergio.prado@e-labworks.com>
> 
> sloci-image is a simple CLI tool for packing rootfs into a single-layer
> OCI image.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> Signed-off-by: Matthew Weber <matthew.weber@collins.com>
> ---
>  DEVELOPERS                                    |  1 +
>  package/Config.in.host                        |  2 +
>  ...-from-the-contents-of-working-folder.patch | 37 +++++++++++++++++++
>  package/sloci-image/Config.in.host            |  7 ++++
>  package/sloci-image/sloci-image.hash          |  5 +++
>  package/sloci-image/sloci-image.mk            | 19 ++++++++++
>  6 files changed, 71 insertions(+)
>  create mode 100644 package/sloci-image/0001-create-OCI-tar-from-the-contents-of-working-folder.patch
>  create mode 100644 package/sloci-image/Config.in.host
>  create mode 100644 package/sloci-image/sloci-image.hash
>  create mode 100644 package/sloci-image/sloci-image.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 53448dd100..af684021f4 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2425,6 +2425,7 @@ F:	package/curlpp/
>  F:	package/daq/
>  F:	package/libgdiplus/
>  F:	package/pimd/
> +F:	package/sloci-image/

 Matt, I took the liberty of adding sloci-image to your entry as well.

>  F:	package/snort/
>  F:	package/stella/
>  F:	package/tio/
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 551352482e..209b1ff138 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -78,7 +78,9 @@ menu "Host utilities"
>  	source "package/rustc/Config.in.host"
>  	source "package/s6-rc/Config.in.host"
>  	source "package/sam-ba/Config.in.host"
> +

 Spurious empty line.

>  	source "package/sdbusplus/Config.in.host"
> +	source "package/sloci-image/Config.in.host"
>  	source "package/squashfs/Config.in.host"
>  	source "package/sunxi-tools/Config.in.host"
>  	source "package/swig/Config.in.host"
> diff --git a/package/sloci-image/0001-create-OCI-tar-from-the-contents-of-working-folder.patch b/package/sloci-image/0001-create-OCI-tar-from-the-contents-of-working-folder.patch
> new file mode 100644
> index 0000000000..3d048e3843
> --- /dev/null
> +++ b/package/sloci-image/0001-create-OCI-tar-from-the-contents-of-working-folder.patch
> @@ -0,0 +1,37 @@
> +From 66c73c2ba3057634f19f37d3cfbbe752638c9f9f Mon Sep 17 00:00:00 2001
> +From: Matthew Weber <matthew.weber@collins.com>
> +Date: Fri, 27 Aug 2021 12:24:19 -0500
> +Subject: [PATCH] create OCI tar from the contents of working folder
> +
> +When testing with containerd, it was found that the tarfile
> +created with sloci can't import because the contents are inside
> +a folder.  Looking around online, it seems that the an oci tar
> +should container the blob/index.json/oci-layout in the . of the
> +tarfile.
> +
> +Upstream: https://github.com/jirutka/sloci-image/pull/3

 It was accepted, great!

> +
> +Refs:
> +https://snyk.io/blog/container-image-formats/
> +https://github.com/opencontainers/image-spec/blob/main/image-layout.md
> +
> +Signed-off-by: Matthew Weber <matthew.weber@collins.com>
> +---
> + sloci-image | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/sloci-image b/sloci-image
> +index 90dba26..7f3c775 100755
> +--- a/sloci-image
> ++++ b/sloci-image
> +@@ -425,6 +425,6 @@ if [ "$OUT_TYPE" = tar ]; then
> + 	file_name="$IMAGE_NAME-$CFG_REF_NAME-$CFG_ARCH"
> + 	file_name="$file_name${CFG_ARCH_VARIANT:+"-$CFG_ARCH_VARIANT"}-$CFG_OS.oci-image"
> + 
> +-	tar ${DEBUG:+-v} -cf "$file_name.tar" "$IMAGE_NAME"
> ++	tar ${DEBUG:+-v} -cf "$file_name.tar" -C "$IMAGE_NAME" .
> + 	rm -Rf "$IMAGE_NAME"
> + fi
> +-- 
> +2.17.1
> +
> diff --git a/package/sloci-image/Config.in.host b/package/sloci-image/Config.in.host
> new file mode 100644
> index 0000000000..d809f1f3c7
> --- /dev/null
> +++ b/package/sloci-image/Config.in.host
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_HOST_SLOCI_IMAGE
> +	bool "host sloci-image"
> +	help
> +	  A simple CLI tool for packing rootfs into a single-layer OCI
> +	  image.
> +
> +	  https://github.com/jirutka/sloci-image
> diff --git a/package/sloci-image/sloci-image.hash b/package/sloci-image/sloci-image.hash
> new file mode 100644
> index 0000000000..117f0ba6e0
> --- /dev/null
> +++ b/package/sloci-image/sloci-image.hash
> @@ -0,0 +1,5 @@
> +# Locally computed
> +sha256  56fbc335c193eccc3992f0a723c6dabe762f6d4854fc52059be074bdf5060d9e  sloci-image-0.1.1.tar.gz
> +
> +# Hash for license files:
> +sha256  8ea53673b084576813fc40cd63817c5a1619438942b5e6c30dac1d10707c27e4  LICENSE
> diff --git a/package/sloci-image/sloci-image.mk b/package/sloci-image/sloci-image.mk
> new file mode 100644
> index 0000000000..f6db7e2060
> --- /dev/null
> +++ b/package/sloci-image/sloci-image.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# sloci-image
> +#
> +################################################################################
> +
> +SLOCI_IMAGE_VERSION = 0.1.1

 It doesn't look like upstream is going to make a release any time soon, so you
could just as well update to the most recent sha1 and drop the patch. Oh well,
I've applied as is.

> +SLOCI_IMAGE_SITE = $(call github,jirutka,sloci-image,v$(SLOCI_IMAGE_VERSION))
> +
> +SLOCI_IMAGE_LICENSE = MIT
> +SLOCI_IMAGE_LICENSE_FILES = LICENSE
> +
> +HOST_SLOCI_IMAGE_DEPENDENCIES = host-gawk
> +
> +define HOST_SLOCI_IMAGE_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) DESTDIR=$(HOST_DIR) PREFIX=/usr -C $(@D) install

 This is wrong! For host packages, DESTDIR should be empty and PREFIX should be
set to $(HOST_DIR) without /usr. It doesn't make a difference in practice
because PREFIX is only used to construct the install path and the usr symlink
makes it work, but it's the principle!


 I fixed all of the above and applied to master, thanks.

 Regards,
 Arnout

> +endef
> +
> +$(eval $(host-generic-package))
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
