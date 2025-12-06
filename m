Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4330D3ABF5
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 05:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8098C84A8A;
	Sat,  6 Dec 2025 05:18:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e3ODB6TeUBOQ; Sat,  6 Dec 2025 05:18:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78D0A84747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764998311;
	bh=nbq80r69zw+0ocNAHsdwwY0bTU9jmmTygpOQrPmJqLU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ibeO0Gk+hOw3MZXtNGvlFQNGqx+kNfYTIDo9ZfMkTn1aO3HF1P2hB4bCjr19QACbh
	 SXOrCu9sQQVjyQIa4joMr5Bwc4aNXjMdgAonYjkKj8ImektlZH1T8ea3o8vlhM77MK
	 ftntM0jmuzpNv6luxQNVYEeiV79I6SM8e6ZtWGj5+aCaeXXzY4h1B38dg48wSv2g32
	 DqCtj54I/2674HlegW0AdZ19Kmv9M/UosVblx235YRBLk+iTtGqswC507TJI2bQVXO
	 4RD4eJ3kdYzdZQb7jlhmapU0+MRKSPgSj0lu5edixzxGkYfgbRw8atkEtDQ8hGdNEo
	 itY54u+sNWXNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78D0A84747;
	Sat,  6 Dec 2025 05:18:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DD1D151
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 05:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F33876071D
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 05:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FpaK30Wmw90n for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 05:18:28 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 51CC6606E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51CC6606E8
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51CC6606E8
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 05:18:27 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id CF673BDE0695;
 Sat, 06 Dec 2025 06:18:25 +0100 (CET)
MIME-Version: 1.0
Date: Sat, 06 Dec 2025 05:18:25 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251205193057.1884663-1-bernd@kuhls.net>
References: <20251205193057.1884663-1-bernd@kuhls.net>
Message-ID: <7ca4bb66f110e9ea76010831f7c040f0@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1764998305; bh=QiPZFZc6EHAz3B0q37YP8Db/DlrqLfOcCiVcc5l2gSM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=i3HeMN3RGfFkFiSNXv0Sf+Fd3PE88h1/LNnk2m6xWm6AT2ze2FP5ang8SUj2VaArr
 nysKqLRRQhR3hG9qTqlfhmcN1LVzq1qsYXhQwSWvp90ucvXzVhDRFxHOI2iAgiFLzA
 LwVxORWRKTxxq5RVluXmelb7Sg6qKgJW3Rih48pY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=i3HeMN3R
Subject: Re: [Buildroot] [PATCH/next 1/2] package/libsidplayfp: new package
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

Hi Bernd, Thomas, all

On 2025-12-05 19:30, Bernd Kuhls wrote:
> Replaces libsidplay2 as dependency in mpd 0.24.0:
> https://github.com/MusicPlayerDaemon/MPD/blob/v0.24.6/NEWS#L125
> https://github.com/MusicPlayerDaemon/MPD/commit/7e2538e07a80bd12baf2e7c328e7d1a64eb434f9

Apart from mpd, there are only two other packages depending on 
libsidplay2:

~/buildroot$ grep libsidplay2 package/*/*.mk
package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk:KODI_AUDIODECODER_SIDPLAY_DEPENDENCIES 
= host-pkgconf kodi libsidplay2
package/libsidplay2/libsidplay2.mk:# libsidplay2
package/mpd/mpd.mk:MPD_DEPENDENCIES += libsidplay2
package/vlc/vlc.mk:VLC_DEPENDENCIES += libsidplay2

Should we patch them and drop libsidplay2 completely? Libsidplayfp seems 
to be better maintaned. I can offer help.

> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/Config.in                      |  1 +
>  package/libsidplayfp/Config.in         | 13 +++++++++++++
>  package/libsidplayfp/libsidplayfp.hash |  3 +++
>  package/libsidplayfp/libsidplayfp.mk   | 20 ++++++++++++++++++++
>  4 files changed, 37 insertions(+)
>  create mode 100644 package/libsidplayfp/Config.in
>  create mode 100644 package/libsidplayfp/libsidplayfp.hash
>  create mode 100644 package/libsidplayfp/libsidplayfp.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 92b72194e3..1c80b779fc 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1559,6 +1559,7 @@ menu "Audio/Sound"
>  	source "package/libreplaygain/Config.in"
>  	source "package/libsamplerate/Config.in"
>  	source "package/libsidplay2/Config.in"
> +	source "package/libsidplayfp/Config.in"
>  	source "package/libsilk/Config.in"
>  	source "package/libsndfile/Config.in"
>  	source "package/libsoundtouch/Config.in"
> diff --git a/package/libsidplayfp/Config.in 
> b/package/libsidplayfp/Config.in
> new file mode 100644
> index 0000000000..43841173b1
> --- /dev/null
> +++ b/package/libsidplayfp/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_LIBSIDPLAYFP
> +	bool "libsidplayfp"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	help
> +	  libsidplayfp is a C64 music player library which integrates
> +	  the reSID SID chip emulation into a cycle-based emulator
> +	  environment, constantly aiming to improve emulation of the
> +	  C64 system and the SID chips.
> +
> +	  https://github.com/libsidplayfp/libsidplayfp
> +
> +comment "libsidplayfp needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/libsidplayfp/libsidplayfp.hash 
> b/package/libsidplayfp/libsidplayfp.hash
> new file mode 100644
> index 0000000000..880c31ee28
> --- /dev/null
> +++ b/package/libsidplayfp/libsidplayfp.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  
> 7c6ab283fda53d34973fa266fc3809e16964dd8ccb7edcc11516ef5e3f66b3cd  
> libsidplayfp-2.15.2.tar.gz
> +sha256  
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  
> COPYING
> diff --git a/package/libsidplayfp/libsidplayfp.mk 
> b/package/libsidplayfp/libsidplayfp.mk
> new file mode 100644
> index 0000000000..3aeeb19013
> --- /dev/null
> +++ b/package/libsidplayfp/libsidplayfp.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# libsidplayfp
> +#
> +################################################################################
> +
> +LIBSIDPLAYFP_VERSION = 2.15.2
> +LIBSIDPLAYFP_SITE = 
> https://github.com/libsidplayfp/libsidplayfp/releases/download/v$(LIBSIDPLAYFP_VERSION)
> +LIBSIDPLAYFP_LICENSE = GPL-2.0+
> +LIBSIDPLAYFP_LICENSE_FILES = COPYING
> +LIBSIDPLAYFP_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
> +LIBSIDPLAYFP_CONF_OPTS += --with-gcrypt
> +LIBSIDPLAYFP_DEPENDENCIES += libgcrypt
> +else
> +LIBSIDPLAYFP_CONF_OPTS += --without-gcrypt
> +endif
> +
> +$(eval $(autotools-package))
> --
> 2.47.3

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
