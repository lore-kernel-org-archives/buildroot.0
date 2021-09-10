Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D413C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 19:08:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA477611CE
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 19:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA477611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E474401D0;
	Fri, 10 Sep 2021 19:08:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y11IVf13L8m9; Fri, 10 Sep 2021 19:08:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4967E402AB;
	Fri, 10 Sep 2021 19:08:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D50881BF82D
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 19:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C410B606B9
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 19:08:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vsD5AM4fEghf for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 19:08:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 879D561B91
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 19:08:14 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id kt8so6240154ejb.13
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 12:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QbkLVNaKJA8Ze/tIS79fDWexo0DD9P/1qB9aKrUVv/A=;
 b=GPgDNQs8ygFxlsZ0QJ02vhDMBG24zDMoS5Bv27mGkDdZ6lxkwiU75sEe8v7wAoo4WT
 R+CrkeB/qewFiHSGIKeHiRoI+sWx4ArG5WV73xPn4sPusrAQOWoHfBqYxUpRdNldq2zh
 m6kiKCCntPGr06TdMubi9TZd9HgP5Jp4yire1p/JCn6/WQoWFX29mvU2+T+O2IQFWie+
 pHbIXmexYEftgUzjfbqx44BT7dOqIxGWWm6uHMEvHJG3oLagGhTreKScErqNzUix/Uzi
 TvAInvtrGGy4H3EWg1FDvTgwRuetBg7vWXSrhERWASJyo3sfTsEfSJFOy84U/F3wfD5l
 UMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QbkLVNaKJA8Ze/tIS79fDWexo0DD9P/1qB9aKrUVv/A=;
 b=iGsafKj7Or6/v4IoeeKTK/PXqOK6b0l87S12TrpbEceZ3go+fKZ32QMD050bLxOWgy
 0psju+njg6fmAZrnGV7+ovM6Oxq/0wVgqIc3ock7VlRcDI3hAnUSYa/Y+RG1mTlKxVLw
 0uxvb8AR3AcH0Wd+eOIQdsVO3gh9WVOwwllLyFvzQELRPt09npqPK6Dtu2pcHzlEkdYA
 Iv+mwfRWi7iXLKAcfNjh81BAPldMI1BSgHuTmdS6H+5NBAfNJmjWje2ET9ta5Y9pFv+W
 bClmgmnU2ZT9bmuda4tZwjQl8L/6pWrgKQ4ilAzCSJ7tfJ8gibIxIGQLLOZO4fPnOIxM
 +4uA==
X-Gm-Message-State: AOAM530zUOZQuE4SeJdawP5XPg7n2ercZE97YmYXaY/4PCibWVkyfF39
 MQUNcqoG/Q2LL2WMaYp/eX+emw==
X-Google-Smtp-Source: ABdhPJzQsZbi3ML0N2zwSVYYpB8MYffrrupN49i9rAHgnRSS0RGQ6iDsx+1fvPHfPsLf0eIGU9H8YQ==
X-Received: by 2002:a17:906:28db:: with SMTP id
 p27mr11060461ejd.94.1631300892665; 
 Fri, 10 Sep 2021 12:08:12 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h10sm3347759edf.85.2021.09.10.12.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 12:08:12 -0700 (PDT)
To: Matthew Weber <matthew.weber@collins.com>, buildroot@buildroot.org
References: <20210827205430.39745-1-matthew.weber@collins.com>
 <20210827205430.39745-3-matthew.weber@collins.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <60accc56-a2e4-ded4-2bc4-dd3bf8988a4a@mind.be>
Date: Fri, 10 Sep 2021 21:08:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827205430.39745-3-matthew.weber@collins.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v3 2/3] fs: new OCI filesystem type
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
> Add support to generate OCI (Open Container Initiative) images.
> 
> An OCI image consists of a manifest, an image index (optional), a set of
> filesystem layers, and a configuration. The complete specification is
> available in the link below:
> 
> https://github.com/opencontainers/image-spec/blob/master/spec.md
> 
> The image is generated with the host tool sloci-image, and config
> options can be used to configure image parameters.
> 
> By default, the image is generated in a directory called rootfs-oci:
> 
> $ cd output/images
> $ ls rootfs-oci/
> blobs  index.json  oci-layout
> 
> Optionally, the image can be packed into a tar archive.
> 
> The image can be pushed to a registry using containers tools like
> skopeo:
> 
> $ skopeo copy --dest-creds <user>:<pass> oci:rootfs-oci:<tag> \
> 	docker://<user>/<image>[:tag]
> 
> And then we can pull/run the container image with tools like docker:
> 
> $ docker run -it <user>/<image>[:tag]
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> Signed-off-by: Matthew Weber <matthew.weber@collins.com>

[snip]
> +
> +config BR2_TARGET_ROOTFS_OCI_ENTRYPOINT
> +	string "entrypoint"
> +	default "sh"
> +	help
> +	  Command to execute when the container starts.
> +
> +config BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS
> +	string "entrypoint arguments"
> +	help
> +	  Default arguments to the entrypoint of the container.
> +
> +config BR2_TARGET_ROOTFS_OCI_WORKDIR
> +	string "working directory"
> +	help
> +	  Working directory of the entrypoint process in the
> +	  container.
> +
> +config BR2_TARGET_ROOTFS_OCI_UID
> +	string "username or UID"
> +	default "0"
> +	help
> +	  The username or UID of user the process run as.
> +
> +config BR2_TARGET_ROOTFS_OCI_ENV_VARS
> +	string "environment variables"
> +	help
> +	  Default environment variables for the container.

 I've added here that variable assignments are space separated.

> +
> +config BR2_TARGET_ROOTFS_OCI_PORTS
> +	string "ports"
> +	help
> +	  Default set of ports to expose from a container running
> +	  this image in the following format:
> +
> +	  <port>/tcp, <port>/udp, <port> (same as <port>/tcp).
> +
> +config BR2_TARGET_ROOTFS_OCI_LABELS
> +	string "labels"
> +	help
> +	  Metadata in the format KEY=VALUE for the container compliant
> +	  with OCI annotation rules. If KEY starts with a dot, it will
> +	  be prefixed with "org.opencontainers.image"
> +	  (e.g. .url -> org.opencontainers.image.url).
> +
> +config BR2_TARGET_ROOTFS_OCI_ARCHIVE
> +	bool "pack oci image into a tar archive"
> +	default n

 default n is not needed.

> +	help
> +	  Select whether the image should be packed into a TAR archive.
> +
> +endif
> diff --git a/fs/oci/oci.mk b/fs/oci/oci.mk
> new file mode 100644
> index 0000000000..09c3e88069
> --- /dev/null
> +++ b/fs/oci/oci.mk
> @@ -0,0 +1,99 @@
> +################################################################################
> +#
> +# Build the oci image
> +#
> +################################################################################
> +
> +ROOTFS_OCI_IMAGE_NAME = rootfs-oci
> +
> +ROOTFS_OCI_DEPENDENCIES = host-sloci-image
> +
> +# architecture
> +OCI_SLOCI_IMAGE_OPTS = --arch $(BR2_ARCH)

 That's unlikely to be correct... For example, the typical 32-bit Intel target
is i686 in Buildroot, not 386 as expected by OCI.

 The specification says it has to correspond to GOARCH - and we have that, in
GO_GOARCH. So I replaced it with that.

 Ideally, the Config.in option should also depend on
BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS. Unfortunately, that symbol includes a
dependency on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS, which is not needed
here. I decided that no sane person would try to build an OCI image for an
architecture which doesn't support containers, so I left it as is.


> +# architecture variant (typically used only for arm)
> +ifeq ($(BR2_ARM_CPU_HAS_ARM),y)
> +ifeq ($(BR2_ARM_CPU_ARMV5),y)
> +OCI_SLOCI_IMAGE_OPTS += --arch-variant v5
> +else ifeq ($(BR2_ARM_CPU_ARMV6),y)
> +OCI_SLOCI_IMAGE_OPTS += --arch-variant v6
> +else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
> +OCI_SLOCI_IMAGE_OPTS += --arch-variant v7
> +else ifeq ($(BR2_ARM_CPU_ARMV8A),y)
> +OCI_SLOCI_IMAGE_OPTS += --arch-variant v8

 Same here, I replaced all that with

OCI_SLOCI_IMAGE_OPTS += $(and $(GO_GOARM),--arch-variant $(GO_GOARM))

> +endif
> +endif
> +
> +# entrypoint
> +OCI_ENTRYPOINT = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_ENTRYPOINT))
> +ifneq ($(OCI_ENTRYPOINT),)
> +OCI_SLOCI_IMAGE_OPTS += --entrypoint $(OCI_ENTRYPOINT)

 For consistency, I've added quotes around all options. It's a string so it may
contain spaces.


> +endif
> +
> +# entrypoint arguments
> +OCI_ENTRYPOINT_ARGS = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS))
> +ifneq ($(OCI_ENTRYPOINT_ARGS),)
> +OCI_SLOCI_IMAGE_OPTS += --cmd "$(OCI_ENTRYPOINT_ARGS)"
> +endif
> +
> +# author
> +OCI_AUTHOR = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_AUTHOR))
> +ifneq ($(OCI_AUTHOR),)
> +OCI_SLOCI_IMAGE_OPTS += --author "$(OCI_AUTHOR)"
> +endif
> +
> +# username or UID
> +OCI_UID = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_UID))
> +ifneq ($(OCI_UID),)
> +OCI_SLOCI_IMAGE_OPTS += --user $(OCI_UID)
> +endif
> +
> +# labels
> +OCI_LABELS = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_LABELS))
> +ifneq ($(OCI_LABELS),)
> +OCI_SLOCI_IMAGE_OPTS += \
> +	$(foreach label,$(OCI_LABELS),--label $(label))
> +endif
> +
> +# environment variables
> +OCI_ENV_VARS = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_ENV_VARS))
> +ifneq ($(OCI_ENV_VARS),)
> +OCI_SLOCI_IMAGE_OPTS += \
> +	$(foreach var,$(OCI_ENV_VARS),--env $(var))
> +endif
> +
> +# working directory
> +OCI_WORKDIR = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_WORKDIR))
> +ifneq ($(OCI_WORKDIR),)
> +OCI_SLOCI_IMAGE_OPTS += --working-dir $(OCI_WORKDIR)
> +endif
> +
> +# ports
> +OCI_PORTS = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_PORTS))
> +ifneq ($(OCI_PORTS),)
> +OCI_SLOCI_IMAGE_OPTS += \
> +	$(foreach port,$(OCI_PORTS),--port $(port))
> +endif
> +
> +# tag
> +OCI_TAG = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_TAG))
> +ifeq ($(OCI_TAG),)
> +# we need a tag, so if it is empty, it is safe to override here
> +# check-package OverriddenVariable
> +OCI_TAG = latest
> +endif

 This can also be simplified to

OCI_TAG = $(or $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_TAG)),latest)

> +
> +# enable tar archive
> +ifeq ($(BR2_TARGET_ROOTFS_OCI_ARCHIVE),y)
> +OCI_SLOCI_IMAGE_OPTS += --tar
> +endif
> +
> +define ROOTFS_OCI_CMD
> +	(cd $(BINARIES_DIR); \
> +		rm -rf $(ROOTFS_OCI_IMAGE_NAME)*
> +		$(HOST_DIR)/bin/sloci-image $(OCI_SLOCI_IMAGE_OPTS) $(TARGET_DIR) \
> +			$(ROOTFS_OCI_IMAGE_NAME):$(OCI_TAG)
> +	)

 The iamge name is just a file name, so the cd is not needed. I just added
$(BINARIES_DIR)/ in front and get the same result.

 I've also removed the ROOTFS_OCI_IMAGE_NAME, it serves no purpose IMHO.

 And i've removed the wildcard after the rm -rf. Only the directory needs to be
removed; if there's a tarball, it will simply be overwritten.

 Applied to master with all those fixed.

 Regards,
 Arnout

> +endef
> +
> +$(eval $(rootfs))
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
