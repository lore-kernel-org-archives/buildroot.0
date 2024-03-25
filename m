Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17083C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 23:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9075960603;
	Mon, 25 Mar 2024 23:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MmgPNdzeTXAU; Mon, 25 Mar 2024 23:05:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 939D7606BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 939D7606BA;
	Mon, 25 Mar 2024 23:05:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53A241BF417
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4137940C18
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ww0v9jVSUOUO for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 23:05:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2C73940C10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C73940C10
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C73940C10
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 23:05:30 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33e285a33bdso2746032f8f.2
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 16:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711407929; x=1712012729;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YBv2cz61oqbT30tpptCGG9g0nHk31CHVuZ9YAf0Y1wo=;
 b=UTATnHKxNnx3gfk6A08b7B2sFdqGtBE7LOM5fWsy3NBwh3xTe5WenrVeGqlyB79ujV
 Ocwa3sBQcdsU0NsId9Zt34rmlxGqIvIE0fSdWZ3H0yeGqatRb5Vito1P7pfmvmLQEN5g
 lFZxtKi5BLsfNa8tA17ua2ATrd2TefsZH5FT/afX0pMfytAZT/OqA+scFW9Zl0ZxlsZd
 xkXzVKSEw5r7N5OX3PKr0ZIP6ZWmRx4WnHXNzvE75n7rmxrOl6nZoeMUPd3LMJ/I8v8s
 okXlILhHfPQBX9SrbL//1XPB346SdMbJdcqY7+qyGrGArxhz6RsXQgRAXhawAnlJhkX7
 B3lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhjtkdhSDPIPzONZogQqNE0gxMUq7+UZsrKEc1SVG6Ze3kFHTGFpCbBguPiIIq0twqIOyifnGJ271Ffm7Z+mp2OwQpdn1PTw==
X-Gm-Message-State: AOJu0YwLtHRUXKDP7ktFBEnBbdQy1nL1+hYe1EwqeyJa+Pb8ejz+8PtA
 ce9FHFVCKpwYOKFeRgGoUxrCOJLeJYEjf46aCA5W16zXPBpSDi9x7rtuioXmspR+AzR3OfC9nCE
 G
X-Google-Smtp-Source: AGHT+IH6Uq7f1/tYnDdyPnDeYG4UEz/qsf/micyzZcxj1uhii0PtD5C35aiT3HyVFPCulw5ch5xGdg==
X-Received: by 2002:adf:e90c:0:b0:33e:3d3c:46f0 with SMTP id
 f12-20020adfe90c000000b0033e3d3c46f0mr5884872wrm.0.1711407928764; 
 Mon, 25 Mar 2024 16:05:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 co1-20020a0560000a0100b00341cb22a8d4sm4949624wrb.108.2024.03.25.16.05.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 16:05:28 -0700 (PDT)
Message-ID: <20019bf1-6a19-4385-8299-8c924f1fa860@mind.be>
Date: Tue, 26 Mar 2024 00:05:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
 <20240325223424.108702-7-adam.duskett@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240325223424.108702-7-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711407929; x=1712012729; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YBv2cz61oqbT30tpptCGG9g0nHk31CHVuZ9YAf0Y1wo=;
 b=YZtNr7Rk/Qs+JHhpuFoqjTtqTAjk95EpgqX575lI/ES2lyqNyJ74kT6pujokyDCL58
 AuoKB+gyYKScvGSHIb6pgJzNyIdXOxKlcPGNyMtUsJRQa7WzlrO4tj+XpwOTbc2ZPs0C
 etZsL4trAOCQj4tc6tKmnPcIgUgTPBwANyXESJZJJbeRxMlaEsshpLUn0cGd0qadWdUQ
 WDBjAIcfBY470ggHUSIEaNPPcE1zKTkJJzVSnzWx1KaRAM7Cg7SFnRp7ddLEtvKlpt07
 PDaf1GroB1mvEUZM161DS4bpGV49t6wJGxFIwTD9JcWGc/guW9hrBjNTFV1bJ2nh4kEj
 ++RQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YZtNr7Rk
Subject: Re: [Buildroot] [PATCH v2 07/13]
 package/flutter-packages/flutter-rfw-local-example: new package
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



On 25/03/2024 23:34, Adam Duskett wrote:
> Displays a custom "Hello, World!" custom widget in a
> remote Flutter widget (RFW) for use by a remote widget.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
[snip]
> diff --git a/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.mk b/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.mk
> new file mode 100644
> index 0000000000..b57c021f8b
> --- /dev/null
> +++ b/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.mk
> @@ -0,0 +1,54 @@
> +################################################################################
> +#
> +# flutter-rfw-local-example
> +#
> +################################################################################
> +
> +FLUTTER_RFW_LOCAL_EXAMPLE_VERSION = $(FLUTTER_PACKAGES_VERSION)
> +FLUTTER_RFW_LOCAL_EXAMPLE_SITE = $(FLUTTER_PACKAGES_SITE)
> +FLUTTER_RFW_LOCAL_EXAMPLE_SITE_METHOD = $(FLUTTER_PACKAGES_SITE_METHOD)
> +FLUTTER_RFW_LOCAL_EXAMPLE_SOURCE = $(FLUTTER_PACKAGES_SOURCE)
> +FLUTTER_RFW_LOCAL_EXAMPLE_LICENSE = $(FLUTTER_PACKAGES_LICENSE)
> +FLUTTER_RFW_LOCAL_EXAMPLE_LICENSE_FILES = $(FLUTTER_PACKAGES_LICENSE_FILES)
> +FLUTTER_RFW_LOCAL_EXAMPLE_DL_SUBDIR = $(FLUTTER_PACKAGES_DL_SUBDIR)
> +FLUTTER_RFW_LOCAL_EXAMPLE_DEPENDENCIES = $(FLUTTER_PACKAGES_DEPENDENCIES)
> +FLUTTER_RFW_LOCAL_EXAMPLE_PKG_NAME = local

  Why is this simply "local" instead of the more relevant (and consistent with 
the others) "flutter_rfw_local_example"?

  Regards,
  Arnout

> +FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/rfw-$(FLUTTER_RFW_LOCAL_EXAMPLE_PKG_NAME)-example/$(FLUTTER_ENGINE_RUNTIME_MODE)
> +FLUTTER_RFW_LOCAL_EXAMPLE_SUBDIR = packages/rfw/example/local
> +
> +define FLUTTER_RFW_LOCAL_EXAMPLE_CONFIGURE_CMDS
> +	cd $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILDDIR) && \
> +		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
> +		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
> +		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
> +endef
> +
> +define FLUTTER_RFW_LOCAL_EXAMPLE_BUILD_CMDS
> +	cd $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILDDIR) && \
> +		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
> +			--native-assets $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
> +			package:$(FLUTTER_RFW_LOCAL_EXAMPLE_PKG_NAME)/main.dart && \
> +		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
> +			--deterministic \
> +			--obfuscate \
> +			--snapshot_kind=app-aot-elf \
> +			--elf=libapp.so \
> +			.dart_tool/flutter_build/*/app.dill
> +endef
> +
> +define FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_TARGET_CMDS
> +	mkdir -p $(FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR)/{data,lib}
> +	cp -dprf $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILDDIR)/build/flutter_assets $(FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR)/data/
> +
> +	$(INSTALL) -D -m 0755 $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILDDIR)/libapp.so \
> +		$(FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR)/lib/libapp.so
> +
> +	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
> +	$(FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR)/data/
> +
> +	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR)/lib/
> +	$(RM) $(FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
> +	touch $(FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
> +endef
> +
> +$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
