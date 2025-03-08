Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9176C282EC
	for <buildroot@archiver.kernel.org>; Sat,  8 Mar 2025 22:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B78E607BE;
	Sat,  8 Mar 2025 22:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jwCROQcwaoYf; Sat,  8 Mar 2025 22:28:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EDFB607FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EDFB607FB;
	Sat,  8 Mar 2025 22:28:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB69B94A
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 22:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA3A1411EF
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 22:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1csoP0-cMh9 for <buildroot@buildroot.org>;
 Sat,  8 Mar 2025 22:28:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6D9BD411E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D9BD411E4
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D9BD411E4
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 22:28:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C269A19F576;
 Sat,  8 Mar 2025 23:28:39 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Mar 2025 23:28:39 +0100
MIME-Version: 1.0
Date: Sat, 08 Mar 2025 23:28:39 +0100
From: Julien Olivain <ju.o@free.fr>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: buildroot@buildroot.org, Damien Le Moal <dlemoal@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250308061245.1774235-3-kanakshilledar@gmail.com>
References: <20250308061245.1774235-2-kanakshilledar@gmail.com>
 <20250308061245.1774235-3-kanakshilledar@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <30c8349c51ad3ecd7075e1074f3f699a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741472923;
 bh=exLD1ola+1tQjUAnHAQKo3gzn0ViWWTpiHVWaNnkmbo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Gf+9IntpJH3GW27nstCQJATiL2XdpS4SvTXaVWt5aSskKnc3lFBDDfcr6VUcYweN/
 Ai/iZOLnISQOoT2S1qQ4cZQLkWuRXcSukbt5pJDD+ykRSSkTG/uQVRqM3AbljQ5RQI
 NeGA7YN4IszSSWOujlLyAQVw9+BD/q9dlqIKDbBjnCwKVyKoEJpXXDZu6YlYNsGTEZ
 FWCqchaJXsn3+9h3Dq2uQXmwkU8REVJH0/43KOW13Ao/CbGYiN9aQUf8IVG6hh0LoZ
 Y1m0FdxdBDJhK6+byt7KlGUxYZOmaWBMbhhHJDe5ZFfYTwP/bLFdgcBjXdIcshU03Y
 x7PIyCukgYUWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Gf+9Intp
Subject: Re: [Buildroot] [PATCH 1/2] package/sipeed-lpi4abin: add licheepi4a
 boot bins
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kanak,

Thanks for the patch!

I have few comments, see below.

On 08/03/2025 07:12, Kanak Shilledar wrote:
> Sipeed LicheePi 4A requires some proprietary binaries
> for booting, these are provided in the th1520-boot-firmware
> repo [1]. These binaries are also required for the onboard
> sound and wifi.
> 
> [1] https://github.com/revyos/th1520-boot-firmware
> 
> Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
> ---
>  package/Config.in                            |  1 +
>  package/sipeed-lpi4abin/Config.in            |  5 ++++
>  package/sipeed-lpi4abin/sipeed-lpi4abin.hash |  2 ++
>  package/sipeed-lpi4abin/sipeed-lpi4abin.mk   | 30 ++++++++++++++++++++
>  4 files changed, 38 insertions(+)
>  create mode 100644 package/sipeed-lpi4abin/Config.in
>  create mode 100644 package/sipeed-lpi4abin/sipeed-lpi4abin.hash
>  create mode 100644 package/sipeed-lpi4abin/sipeed-lpi4abin.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 4a81a62ec4..ce8cb95d7e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -616,6 +616,7 @@ endmenu
>  	source "package/setserial/Config.in"
>  	source "package/sg3_utils/Config.in"
>  	source "package/sigrok-cli/Config.in"
> +	source "package/sipeed-lpi4abin/Config.in"
>  	source "package/sispmctl/Config.in"
>  	source "package/smartmontools/Config.in"
>  	source "package/smstools3/Config.in"
> diff --git a/package/sipeed-lpi4abin/Config.in 
> b/package/sipeed-lpi4abin/Config.in
> new file mode 100644
> index 0000000000..b8dc9fbc9e
> --- /dev/null
> +++ b/package/sipeed-lpi4abin/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_SIPEED_LPI4ABIN
> +	bool "sipeed-lpi4abin"
> +	depends on BR2_riscv=y

Here, the condition should be simplified to:

	depends on BR2_riscv

> +	help
> +	  This package provides TH1520 SoC binary blobs for LicheePi 4A.
> diff --git a/package/sipeed-lpi4abin/sipeed-lpi4abin.hash 
> b/package/sipeed-lpi4abin/sipeed-lpi4abin.hash
> new file mode 100644
> index 0000000000..f7a8abdfdd
> --- /dev/null
> +++ b/package/sipeed-lpi4abin/sipeed-lpi4abin.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 
> e5b29e1267009617dcf7cf3d0d59d7de62b06b96bb1981de3206b9a53123481f  
> sipeed-lpi4abin-master-git4.tar.gz
> diff --git a/package/sipeed-lpi4abin/sipeed-lpi4abin.mk 
> b/package/sipeed-lpi4abin/sipeed-lpi4abin.mk
> new file mode 100644
> index 0000000000..c0aadef35f
> --- /dev/null
> +++ b/package/sipeed-lpi4abin/sipeed-lpi4abin.mk
> @@ -0,0 +1,30 @@
> +################################################################################
> +#
> +# sipeed-lpi4abin
> +#
> +################################################################################
> +
> +SIPEED_LPI4ABIN_VERSION = master

Branch names should not be used in _VERSION. The downloaded data
will be cached in the download directory and will not be updated if
the remote changes.

If you want to use the "latest" version as of today, for example:
https://github.com/revyos/th1520-boot-firmware/commit/44ec4e1cc82141963842ec45db0d1617f9f07e75

You can then set:
SIPEED_LPI4ABIN_VERSION = 44ec4e1cc82141963842ec45db0d1617f9f07e75

You'll also need to update the hash file accordingly.

> +SIPEED_LPI4ABIN_SITE = 
> https://github.com/revyos/th1520-boot-firmware.git
> +SIPEED_LPI4ABIN_SITE_METHOD = git
> +# SIPEED_LPI4ABIN_LICENSE = PROPRIETARY

The _LICENSE should not be commented here. Could you uncomment it?

> +# SIPEED_LPI4ABIN_LICENSE_FILES = LICENSE

There is no real license file in the upstream repository.

Technically, there is the "copyright" file:
https://github.com/revyos/th1520-boot-firmware/blob/master/debian/copyright
but its content does not really give information on the actual
license terms.

So this comment line should be removed.

> +SIPEED_LPI4ABIN_INSTALL_IMAGES = YES
> +SIPEED_LPI4ABIN_INSTALL_TARGET = NO
> +
> +SIPEED_LPI4ABIN_AON_FPGA_FILENAME = addons/boot/light_aon_fpga.bin
> +SIPEED_LPI4ABIN_C906_AUDIO_FILENAME = addons/boot/light_c906_audio.bin
> +SIPEED_LPI4ABIN_STR_FILENAME = addons/boot/str.bin

Since those variables are not reused anywhere else, this could be
simplified as:

SIPEED_LPI4ABIN_FILES = \
	addons/boot/light_aon_fpga.bin \
	addons/boot/light_c906_audio.bin \
	addons/boot/str.bin

> +define SIPEED_LPI4ABIN_INSTALL_IMAGES_CMDS
> +	$(foreach f, \
> +		$(SIPEED_LPI4ABIN_AON_FPGA_FILENAME) \
> +		$(SIPEED_LPI4ABIN_C906_AUDIO_FILENAME) \
> +		$(SIPEED_LPI4ABIN_STR_FILENAME) \
> +		, \
> +		$(INSTALL) -D -m 0644 -t $(BINARIES_DIR)/bootbins $(@D)/$(f)
> +	)

Then, this could be simplified to:

	$(foreach f,$(SIPEED_LPI4ABIN_FILES), \
		$(INSTALL) -D -m 0644 -t $(BINARIES_DIR)/bootbins $(@D)/$(f)
	)

> +endef
> +
> +$(eval $(generic-package))
> --
> 2.43.0

Could you send an updated patch with those changes please?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
