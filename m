Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE8BC19F32
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 11:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8FCF40761;
	Fri,  7 Mar 2025 11:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvTcgsA-yk89; Fri,  7 Mar 2025 11:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E81F140753
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E81F140753;
	Fri,  7 Mar 2025 11:49:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F325D1C9
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 11:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE8126077B
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 11:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5OxehQM8jKw for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 11:49:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F990607E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F990607E9
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F990607E9
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 11:49:21 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 11235440E7B;
 Fri,  7 Mar 2025 13:43:28 +0200 (IST)
To: Luc BEAUFILS <luc.beaufils@savoirfairelinux.com>
Cc: buildroot@buildroot.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Thomas Perrot <thomas.perrot@bootlin.com>
In-Reply-To: <20250307095904.19075-3-luc.beaufils@savoirfairelinux.com> (Luc
 BEAUFILS's message of "Fri, 7 Mar 2025 10:59:04 +0100")
References: <20250307095904.19075-1-luc.beaufils@savoirfairelinux.com>
 <20250307095904.19075-3-luc.beaufils@savoirfairelinux.com>
User-Agent: mu4e 1.12.8; emacs 30.1
Date: Fri, 07 Mar 2025 13:49:17 +0200
Message-ID: <87r039xdqa.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1741347808;
 bh=YdhVtN4ZJH1TeGd6bCxudN4a5Ew3W9wt4KvRbI4/qaM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=syjy0SMfvjMOKIq1TaI4TKgLDCWjiYds8plyvnjU0wqOzlJPv4aWbYPD/8tvU1vN6
 eKE8H7RCENq1jqUH7k4W2Q2d0P7/E+cUjoBcGgMJ2awAew6Tx1Yu/JpQWHUT5v21b4
 OHh0vFu070+ku1N07hFbWKs0OkuZCnT3QeSt+27Mjo86NVyjkFK7JZ07s+Bzpz4/lX
 4HYiSt4f1Ozkfwh37ojcuVxLWjwCqy4/Kz/acQFGa2sGkAgvD60VqeaSu9IX5S76xb
 rz/Xab09UGyRtqImvNXWl2BabuPppYkTcwJhZ5cHseW2boBoPjYzdNiUG8ae5vVh3F
 7vWABQJu+kZ1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=syjy0SMf
Subject: Re: [Buildroot] [PATCH v2 2/2] package/imx-cst: add new package
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

Hi Luc,

On Fri, Mar 07 2025, Luc BEAUFILS wrote:
> diff --git a/package/imx-cst/imx-cst.mk b/package/imx-cst/imx-cst.mk
> new file mode 100644
> index 0000000000..a3f1cdf6a4
> --- /dev/null
> +++ b/package/imx-cst/imx-cst.mk
> @@ -0,0 +1,50 @@
> +################################################################################
> +#
> +# imx-cst
> +#
> +################################################################################
> +
> +# debian/3.4.0-dfsg
> +IMX_CST_VERSION = 3.4.0+dfsg
> +IMX_CST_SOURCE = imx-code-signing-tool_$(IMX_CST_VERSION).orig.tar.xz
> +IMX_CST_SITE = https://deb.debian.org/debian/pool/main/i/imx-code-signing-tool

Debian source packages are removed from main once the release they
belong to are retired. Buildroot usually uses the Debian snapshot
archive. See example in alsamixergui, cdrkit, cvs, and a few more
packages.

baruch

> +IMX_CST_LICENSE = BSD-3-Clause
> +IMX_CST_LICENSE_FILES = LICENSE.bsd3
> +
> +HOST_IMX_CST_DEPENDENCIES = host-byacc host-flex host-openssl
> +
> +ifneq ($(filter %64,$(HOSTARCH)),)
> +HOST_IMX_CST_OSTYPE = linux64
> +else
> +HOST_IMX_CST_OSTYPE = linux32
> +endif
> +
> +HOST_CFLAGS += -Wno-error=unused-result
> +
> +# We don't use HOST_CONFIGURE_OPTS when building cst, because we need
> +# to preserve the CFLAGS/LDFLAGS used by their Makefile.
> +define HOST_IMX_CST_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) \
> +		OSTYPE=$(HOST_IMX_CST_OSTYPE) \
> +		OPENSSL_PATH=$(HOST_DIR)/include/openssl \
> +		ENCRYPTION=yes \
> +		AR="$(HOSTAR)" \
> +		CC="$(HOSTCC)" \
> +		LD="$(HOSTCC)" \
> +		OBJCOPY="$(HOSTOBJCOPY)" \
> +		RANLIB="$(HOSTRANLIB)" \
> +		EXTRACFLAGS="$(HOST_CFLAGS) $(HOST_CPPFLAGS)" \
> +		EXTRALDFLAGS="$(HOST_LDFLAGS)" \
> +		-C $(@D)
> +	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
> +		COPTS="$(HOST_CFLAGS) $(HOST_CPPFLAGS) $(HOST_LDFLAGS)" \
> +		-C $(@D)/add-ons/hab_csf_parser
> +endef
> +
> +define HOST_IMX_CST_INSTALL_CMDS
> +	$(INSTALL) -D -m 755 $(@D)/code/obj.$(HOST_IMX_CST_OSTYPE)/cst $(HOST_DIR)/bin/cst
> +	$(INSTALL) -D -m 755 $(@D)/code/obj.$(HOST_IMX_CST_OSTYPE)/srktool $(HOST_DIR)/bin/srktool
> +	$(INSTALL) -D -m 755 $(@D)/add-ons/hab_csf_parser/csf_parser $(HOST_DIR)/bin/csf_parser
> +endef
> +
> +$(eval $(host-generic-package))

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
