Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2402BC5AD49
	for <buildroot@archiver.kernel.org>; Thu, 29 May 2025 12:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8E3983B5A;
	Thu, 29 May 2025 12:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GB3h-sruHBCn; Thu, 29 May 2025 12:18:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F17F81F7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F17F81F7B;
	Thu, 29 May 2025 12:18:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AB036236
 for <buildroot@buildroot.org>; Thu, 29 May 2025 12:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90B8041D4F
 for <buildroot@buildroot.org>; Thu, 29 May 2025 12:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYUD8lEQ86EM for <buildroot@buildroot.org>;
 Thu, 29 May 2025 12:18:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D966F41884
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D966F41884
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D966F41884
 for <buildroot@buildroot.org>; Thu, 29 May 2025 12:18:33 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 55B5C4409E9;
 Thu, 29 May 2025 15:17:52 +0300 (IDT)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org,  linux-amarula@amarulasolutions.com
In-Reply-To: <20250529103129.2349689-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Thu, 29 May 2025 12:31:28 +0200")
References: <20250529103129.2349689-1-dario.binacchi@amarulasolutions.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 29 May 2025 15:18:29 +0300
Message-ID: <874ix3ehka.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1748521072;
 bh=gBzjRl/eiW/bzC8kc2zTfSCPZzg3M5CJa7Gw+1b7aTU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=tXGDIM2NZXKMOxWooz4oaDzkM65F6swhtGGcj6mEIXmqfTmy77hi1HRe4muPTU0yj
 Ydl9LwtytF43D+Q2fRjS7Uz9jclRV7CBGVlotDg8x3kJKYca9HBohBTq1mhpSK80q+
 jaL7dbKqNw2ffHDqLegn8Zze+JbFrmMzUoDxG0tndArVV4SacfgHREs6kBuyKxlAQt
 I3a3STufvHX9WFY0MjKOFBY3XzR+H6No/gnzyKTZt+QQxz6y0IqQXS1Qa0yjzph9n8
 oJzr7yjdzcam2S50ZVA8lP90FFIzFmZ6QEw4M1GQu1nH6fQ0smRMld7e6MiFB+yqs5
 +sJex6pKEcrVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=tXGDIM2N
Subject: Re: [Buildroot] [PATCH 1/2] package/pocketpy: new package
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

Hi Dario,

On Thu, May 29 2025, Dario Binacchi wrote:
> diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
> new file mode 100644
> index 000000000000..d81086859890
> --- /dev/null
> +++ b/package/pocketpy/pocketpy.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# pocketpy
> +#
> +################################################################################
> +
> +POCKETPY_VERSION = 2.0.8
> +POCKETPY_SITE = $(call github,pocketpy,pocketpy,v$(POCKETPY_VERSION))
> +POCKETPY_LICENSE = MIT
> +POCKETPY_LICENSE_FILES = LICENSE
> +
> +POCKETPY_CONF_OPTS = -DPK_BUILD_SHARED_LIB=ON
> +
> +define POCKETPY_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/libpocketpy.so* $(TARGET_DIR)/usr/lib
> +	$(INSTALL) -D -m 0755 $(@D)/libpocketpy.so* $(STAGING_DIR)/usr/lib
> +	$(INSTALL) -m 755 -d $(STAGING_DIR)/usr/include/pocketpy
> +	cp -r $(@D)/include/* $(STAGING_DIR)/usr/include/pocketpy

Why install to STAGING_DIR in target install command? This should be in
INSTALL_STAGING_CMDS.

baruch

> +endef
> +
> +$(eval $(cmake-package))

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
