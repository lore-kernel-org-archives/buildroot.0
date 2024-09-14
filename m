Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E13C02190
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 11:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25679606CB;
	Sat, 14 Sep 2024 11:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqcbtuXvNlkW; Sat, 14 Sep 2024 11:22:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35EA16059A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35EA16059A;
	Sat, 14 Sep 2024 11:22:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0511C1BF2C8
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E79496059A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y6joaWgI57Np for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 11:22:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9B477600B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B477600B9
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B477600B9
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 11:22:06 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-374b5f27cf2so2028732f8f.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 04:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726312924; x=1726917724;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2WhyupbfCz0kZLxE0CDawB0bbbSBTuTGHMpDbgz9Qrc=;
 b=L77+9P6vGHTMnsUVu+dtjvq7j7pzNYeS6YrGIPdZOgHZmtOkH3asBb5V00LGV+xbg6
 Ft+rPjV0zjmjGsUDKnBFJieSmcLQRLqTrI/vjV664+uCux1CtruWfZ7UjI7n00E+sZlu
 5EYucjW860r6i3aoxkvKlFosZvolvTVv7L2otuTg+fZKn/ptwRm6Xl0HHCoZrcJhKUhg
 PQfF2cDwr+3uHr5WzF+3Akwr4vqxnSJ3gQxXUWhbXDsMSf3dGNDb9qwkl0T7VuBrUPk+
 CBviKmf3hIuoXveq2+wj2ytADDjzGtsBPDNRcph58K6MkbyFnoS4ZnP8UQ7IUv7ik4k0
 yCEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX70c/jmnWjAA8OigS1KnSD2JA2ER1T+PTul7hMeNaoHU7+hizg7goeHYcoL4ygHwxMCxu9PlaqmY0=@buildroot.org
X-Gm-Message-State: AOJu0Yxd7HykZQA7LtTa2Zgy6z3d22JR8xRoEDKnXpIBLGp7zhfVsyLJ
 TvMPY0SbT+EO5kyNfLfcyDXommDrU7dtlg0e4XSK5jGhymddRNWydidRV2TW1RA=
X-Google-Smtp-Source: AGHT+IFuDfLI5lWxGbbmzx87Z7Yr/9e5QoIbyrZtK2E9FdyUdxbMDE/1VOQW3TnfCRyU1zIldLV43w==
X-Received: by 2002:a5d:42c7:0:b0:374:bfb2:39d with SMTP id
 ffacd0b85a97d-378c2d4d6d5mr5428738f8f.38.1726312923848; 
 Sat, 14 Sep 2024 04:22:03 -0700 (PDT)
Received: from ?IPV6:2a02:61:a2::9b5? ([2a02:61:a2::9b5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e78002a4sm1502060f8f.78.2024.09.14.04.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Sep 2024 04:22:03 -0700 (PDT)
Message-ID: <c8ac474f-a126-49dd-b7db-7ab6f0f4574a@mind.be>
Date: Sat, 14 Sep 2024 13:22:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wilfred Mallawa <wilfred.mallawa@wdc.com>, buildroot@buildroot.org
References: <20240723022623.37350-2-wilfred.mallawa@wdc.com>
Content-Language: en-GB
In-Reply-To: <20240723022623.37350-2-wilfred.mallawa@wdc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726312924; x=1726917724; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2WhyupbfCz0kZLxE0CDawB0bbbSBTuTGHMpDbgz9Qrc=;
 b=JR2Cb2HlaAVXIVrs/A5y2udrtPvXV8NSc1KIw0TEDNLDuJll+GlDvtC8IQF6YOJz2N
 WHu51xQxaKkTmR9bUMAM3KjrXMiLPXshqcTiIWCPCDUnOmubuAwUBt7MzJdzgeCJWgnI
 WNNPCGpLXN7gkVxgZ/mpGNEaruTQpLYZFHtg+p3K0F1xeu55ppykrKtXnIp0rmrfnU31
 HDA5VYXmshX1d8OSPO4TvGlh5gz4DUION6RzDZyvMBPkHMS9O3RY9WJQ0loANoISC8Tr
 wbb74ZzLewbxXS1BLF9RJA2uBcA7LoXeaPbSYh88rjcVLnElHA9KSuxrzPtEC97FDkDl
 C0SA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JR2Cb2Hl
Subject: Re: [Buildroot] [PATCH v4 1/1] package/spdm-utils: new package
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Alistair Francis <alistair.francis@wdc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Wilfred Mallawa <wilfred.opensource@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Wilfred, Alistair,

  I tried to apply but there are still a number of issues :-(

On 23/07/2024 04:26, Wilfred Mallawa via buildroot wrote:
> From: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

[snip]
> diff --git a/package/spdm-utils/Config.in b/package/spdm-utils/Config.in
> new file mode 100644
> index 0000000000..a2ea4d7f2e
> --- /dev/null
> +++ b/package/spdm-utils/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_SPDM_UTILS
> +	bool "spdm-utils"
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # host-clang, host-ruby
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS

  depends on BR2_PACKAGE_LIBSPDM_ARCH_SUPPORTS is missing here.

> +	depends on BR2_PACKAGE_HAS_UDEV
> +	select BR2_PACKAGE_HOST_RUSTC
> +	select BR2_PACKAGE_PCIUTILS
> +	select BR2_PACKAGE_LIBSPDM
> +	help
> +	  SPDM-Utils is a Linux application designed to support,
> +	  test and develop SPDM requesters and responders.
> +	  SPDM-Utils uses libspdm as the backend to perform SPDM
> +	  communication. SPDM-Utils currently supports the
> +	  PCIe Data Object Exchange (DOE) Capability.
> +
> +	  https://github.com/westerndigitalcorporation/spdm-utils
> +
> +comment "spdm-utils needs udev /dev management"
> +	depends on BR2_PACKAGE_LIBSPDM_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	depends on !BR2_PACKAGE_HAS_UDEV
> +
> +comment "spdm-utils requires host gcc >= 7"
> +	depends on !BR2_HOST_GCC_AT_LEAST_7

  The two comments should be merged, like this:

comment "spdm-utils needs udev /dev management, host gcc >= 7"
	depends on BR2_PACKAGE_LIBSPDM_ARCH_SUPPORTS
	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
	depends on !BR2_PACKAGE_HAS_UDEV || \
		!BR2_HOST_GCC_AT_LEAST_7


> diff --git a/package/spdm-utils/spdm-utils.hash b/package/spdm-utils/spdm-utils.hash
> new file mode 100644
> index 0000000000..0f923b6ad0
> --- /dev/null
> +++ b/package/spdm-utils/spdm-utils.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  2816ff5ed5f27d565708441259ba295b32ae1ed3fe1366730e76f7bedde5e783  spdm-utils-0.6.0-cargo2.tar.gz

  Hashes for the license files are missing.

> diff --git a/package/spdm-utils/spdm-utils.mk b/package/spdm-utils/spdm-utils.mk
> new file mode 100644
> index 0000000000..706c69ef5b
> --- /dev/null
> +++ b/package/spdm-utils/spdm-utils.mk
> @@ -0,0 +1,61 @@
> +################################################################################
> +#
> +# spdm-utils
> +#
> +################################################################################
> +
> +SPDM_UTILS_VERSION = 0.6.0
> +SPDM_UTILS_SITE = $(call github,westerndigitalcorporation,spdm-utils,v$(SPDM_UTILS_VERSION))
> +SPDM_UTILS_LICENSE = Apache-2.0 or MIT

  Oh, the license files are actually missing...

SPDM_UTILS_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT NOTICES

  We want NOTICES in there because it tells us when any of the vendored 
dependencies change license. BTW I haven't checked if any of those have a 
different license.


> +SPDM_UTILS_DEPENDENCIES = udev host-clang host-ruby pciutils libspdm

  I like it if the dependencies are ordered alphabetically.

> +SPDM_UTILS_CBOR_DIAG_VERSION = 0.8.7
> +
> +SPDM_UTILS_ALIAS_CERTS = \
> +		openssl.cnf \
> +		slot0/immutable.der \
> +		slot0/device.cert.der \
> +		slot0/device.der \
> +		slot0/device.key \
> +		slot0/bundle_responder.certchain.der
> +
> +# Used to generate SPDM Alias certificate model certificates,
> +# required by `setup_certs.sh`
> +SPDM_UTILS_GENERIC_CERTS = \
> +		slot0/param.pem \
> +		slot0/end_requester.req \
> +		slot0/end_requester.key \
> +		slot0/end_responder.key \
> +		slot0/end_responder.req
> +
> +# SPDM-Utils expects the following certificates to be present for SPDM
> +# functionality, make sure they are all copied.
> +#
> +# `setup_certs.sh` shall be used by a responder to regenerate it's mutable
> +# certificate chain, typically on start up.
> +define SPDM_UTILS_INSTALL_CERTS
> +	$(INSTALL) -D -m 0755 $(@D)/certs/setup_certs.sh $(TARGET_DIR)/usr/share/spdm/certs/setup_certs.sh
> +	$(INSTALL) -D -m 0644 $(@D)/certs/openssl.cnf $(TARGET_DIR)/usr/share/spdm/certs/openssl.cnf
> +
> +	$(foreach f,$(SPDM_UTILS_ALIAS_CERTS),
> +		$(INSTALL) -D -m 0644 $(@D)/certs/alias/$(f) $(TARGET_DIR)/usr/share/spdm/certs/alias/$(f)
> +	)
> +
> +	$(foreach f,$(SPDM_UTILS_GENERIC_CERTS),
> +		$(INSTALL) -D -m 0644 $(@D)/certs/$(f) $(TARGET_DIR)/usr/share/spdm/certs/$(f)
> +	)
> +	$(INSTALL) -D -m 0644 $(@D)/manifest/manifest.out.cbor $(TARGET_DIR)/usr/share/spdm/manifest/manifest.out.cbor
> +endef
> +
> +# SPDM-Utils uses the `cbor-diag` ruby gem to encode/decode SPDM measurement
> +# manifests. It is checked at compile time by SPDM-Utils, as such it must
> +# be available in the host environment.
> +# `--bindir` allows the respective  binaries to be placed at the specified path.
> +define SPDM_UTILS_INSTALL_CBOR_DIAG
> +	# check-package DoNotInstallToHostdirUsr
> +	$(HOST_DIR)/bin/gem install -v $(SPDM_UTILS_CBOR_DIAG_VERSION) --bindir $(HOST_DIR)/usr/bin cbor-diag
> +endef

  This is not OK. `gem install` will download something, and we want to have 
control over the downloads, in order to:
- make sure the are cached in DOWNLOAD_DIR;
- make sure that BR2_PRIMARY_SITE and BR2_BACKUP_SITE work;
- make sure that the download is always the same, i.e. check hashes.
- make it possible to build offline (once DOWNLOAD_DIR has been populated).

  It's not sufficient to move this hook to the download step, because that 
doesn't solve all of the above issues.

  One solution could be to create a cbor-diag package. However, you still can't 
use `gem install` there, because we still want to be able to separate the 
download step and to cache the downloaded artifact. And cbor-diag has 
dependencies, those have to be handled as well. I guess it will be possible to 
do that (a bit similar to how dependencies are vendored for cargo), but we don't 
have any infrastructure for that at the moment.

  Another solution is to just avoid the use of this ruby gem. AFAICS it's only 
used to parse a cbor file - why not just use the cbor crate for that?


  Regards,
  Arnout



> +
> +SPDM_UTILS_POST_INSTALL_TARGET_HOOKS += SPDM_UTILS_INSTALL_CERTS
> +SPDM_UTILS_PRE_BUILD_HOOKS += SPDM_UTILS_INSTALL_CBOR_DIAG
> +
> +$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
