Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941A6CA0EE6
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 15:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BBAD81203;
	Tue, 19 Aug 2025 15:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mXkDiWuNQ8wR; Tue, 19 Aug 2025 15:42:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5630081207
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5630081207;
	Tue, 19 Aug 2025 15:42:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 43541DE6
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21A8E400AF
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3n2BotLP2UG for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 15:42:44 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 19 Aug 2025 15:42:44 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 22343400EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22343400EA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22343400EA
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:42:44 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id EE12544075D;
 Tue, 19 Aug 2025 18:33:10 +0300 (IDT)
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250819150834.1651775-2-angelo.compagnucci@gmail.com> (Angelo
 Compagnucci's message of "Tue, 19 Aug 2025 17:08:30 +0200")
References: <20250819150834.1651775-1-angelo.compagnucci@gmail.com>
 <20250819150834.1651775-2-angelo.compagnucci@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 19 Aug 2025 18:35:35 +0300
Message-ID: <87ldnf1fzs.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1755617590;
 bh=AftPSnbg8qeQ9qqiF7GoSbu1HdG58NyKsA6bgB9sdsw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=M+BdIJ6v4LsWbqSon9qpOzwWBH8XxvvMBYwzquqi8swi8vNZkOP2JqT+PPDPTQOhV
 93v2Emxa5YiSsQQcvu49ZoV6Ik3gjuOVYc1nHuj2fK8YTMQGGibXEhH4wBp1p34w2Z
 gPK0gPnP/+RvQrnLz6k9ycz1DKWjoXLj7CzqCkWhmMCGS445d9li6PKqRSyZARdct7
 zEQE/sa6lk7uYAIw/oppufpk1pyOLrGVsLbMM7g1ejBohkTfwlXzL+eleKPmjuvnCl
 h8ym1IeNDKtGLJeowQJg596QXJy+liIQKUNre//2kk2UM1ey2q6p+/NX0Jf3I/akIr
 qsQLD/1+p71BQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=M+BdIJ6v
Subject: Re: [Buildroot] [PATCH 1/5] package/libppd: new package
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Angelo,

On Tue, Aug 19 2025, Angelo Compagnucci wrote:

> This package contains PPD library for newer versions of cups supporting
> more than ~10000 printer models.
>
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  DEVELOPERS                 |  1 +
>  package/Config.in          |  2 ++
>  package/libppd/Config.in   |  8 ++++++++
>  package/libppd/libppd.hash |  4 ++++
>  package/libppd/libppd.mk   | 22 ++++++++++++++++++++++
>  5 files changed, 37 insertions(+)
>  create mode 100644 package/libppd/Config.in
>  create mode 100644 package/libppd/libppd.hash
>  create mode 100644 package/libppd/libppd.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3efad36d70..d8f797d2c0 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -221,6 +221,7 @@ F:	package/jq/
>  F:	package/libapparmor/
>  F:	package/libb64/
>  F:	package/libdill/
> +F:	package/libppd/
>  F:	package/mender/
>  F:	package/mender-artifact/
>  F:	package/mono/
> diff --git a/package/Config.in b/package/Config.in
> index 137f74ed82..d029780241 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -352,7 +352,9 @@ comment "Graphic libraries"
>  	source "package/freerdp/Config.in"
>  	source "package/graphicsmagick/Config.in"
>  	source "package/imagemagick/Config.in"
> +	source "package/libcupsfilters/Config.in"

This belongs to the next patch.

>  	source "package/libglvnd/Config.in"
> +	source "package/libppd/Config.in"
>  	source "package/mesa3d/Config.in"
>  	source "package/mesa3d-headers/Config.in"
>  	source "package/ocrad/Config.in"
> diff --git a/package/libppd/Config.in b/package/libppd/Config.in
> new file mode 100644
> index 0000000000..124de4f7f2
> --- /dev/null
> +++ b/package/libppd/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LIBPPD
> +	bool "libppd"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_LIBCUPSFILTERS
> +	help
> +	  The Common Unix Printing System
> +
> +	  ~10000 printer models are supported with PPD-file-based classic CUPS drivers.
> diff --git a/package/libppd/libppd.hash b/package/libppd/libppd.hash
> new file mode 100644
> index 0000000000..3f698c3108
> --- /dev/null
> +++ b/package/libppd/libppd.hash
> @@ -0,0 +1,4 @@
> +# Locally calculated:
> +sha256  b356aeed1335ef0ca7f799741782a2544e7acee63fb4b047b94e4e0395a9cb62  libppd-2.1.1.tar.gz
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> +sha256  977206f041b9a6f47ac00531e1242c0fab7063da71178f8d868b167b70866b6d  NOTICE
> diff --git a/package/libppd/libppd.mk b/package/libppd/libppd.mk
> new file mode 100644
> index 0000000000..d76ecc3765
> --- /dev/null
> +++ b/package/libppd/libppd.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# libppd
> +#
> +################################################################################
> +
> +LIBPPD_VERSION = 2.1.1
> +LIBPPD_SOURCE = libppd-$(LIBPPD_VERSION).tar.gz
> +LIBPPD_SITE = https://github.com/OpenPrinting/libppd/releases/download/$(LIBPPD_VERSION)
> +LIBPPD_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
> +LIBPPD_LICENSE_FILES = LICENSE NOTICE
> +LIBPPD_CPE_ID_VENDOR = openprinting
> +LIBPPD_SELINUX_MODULES = cups
> +LIBPPD_INSTALL_STAGING = YES
> +LIBPPD_AUTORECONF = YES

Why is this needed?

> +
> +LIBPPD_DEPENDENCIES = cups libcupsfilters

libcupsfilters doesn't exist yet. You should probably reverse the order
of patches in this series.

> +
> +LIBPPD_CONF_OPTS = \
> +	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config
> +
> +$(eval $(autotools-package))

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
