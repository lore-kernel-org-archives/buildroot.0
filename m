Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB518FF885A
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 09:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 850EF61244;
	Sun,  3 May 2026 09:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKOf9rxKL6o7; Sun,  3 May 2026 09:16:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 767BF61245
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777799813;
	bh=jqigPAiFPm0GDqTClGzSBSrXMf3wNkEQi3GJcT+MMyg=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ES5Vuv/mzhD29WFuXfKxxTU33XeeYTuKAlYWcuv1RV0aSWY3Fsl5Lgx2NrAM/9GFg
	 khESNl7J1A9i1PBR+Be8X31BL/mcHGLby3xEq8+GDbVAA4My2IzOuPFHiLFa2YXCbt
	 DcV6D7AffvtZDZOphX8J9OeFqeOV4jZpW7MQ0Nr3Xpu6X0TtC4AGQkHjzbMFKrtUpZ
	 nrHuRhEqkWCjf9AteRXJaDNLqv59qwYhH1sWKg1Imf/PFRSq83qL6EirsuJ9WAljZW
	 qHOlwItLFhaDpBVi24SByxJbiBdVgAPCIMOjK0Wrjob5QZqq8pqlQv/yH4feM3wCfQ
	 ltK8K/tZV7wRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 767BF61245;
	Sun,  3 May 2026 09:16:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E362F204
 for <buildroot@buildroot.org>; Sun,  3 May 2026 09:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9A3E40620
 for <buildroot@buildroot.org>; Sun,  3 May 2026 09:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8c_miNDH4jZP for <buildroot@buildroot.org>;
 Sun,  3 May 2026 09:16:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 500A34043E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 500A34043E
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 500A34043E
 for <buildroot@buildroot.org>; Sun,  3 May 2026 09:16:50 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 7A1DD31E0C2D; Sun, 03 May 2026 11:16:47 +0200 (CEST)
Date: Sun, 3 May 2026 11:16:47 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <afcSf1Ijjwe35gdX@waldemar-brodkorb.de>
References: <20260502143839.1511519-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260502143839.1511519-1-bernd@kuhls.net>
X-Operating-System: Linux 6.12.85+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1777799807; bh=a2+AiR8wjq7GkjdCVMZADiDKAtye2ej/khRjWUpjIOo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MtgJO5j+Tv7UWOwL7giOnRfP82VRhwYYsDFrzg8TTPE7dc3v+DsSv9opYFHJuA9hy
 hNMI58tigsmI8cyXVm+dpBVPhZuZhixl+yOTZh3s2l9mBApDL83dl5WzSS/uvWEOOS
 AI3L+iFd491M2YIlbesRmactEXIpRYG2TLVXN3tAEz8J3CCYGU9Xz6A97LCR/C7qqG
 JelKU7Hc/jxzTaqujmhENoLQSJYJYzL7C5TnGusnCcKM/kb1j28N48G1avl/UnBUjK
 Jinxwv4bzidVbw+nEmDb66nKroOdxroYog4TwsMXz4nWe+MxjbSYI+L+gx37BRP13L
 MMqc0X8RuXp7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: Re: [Buildroot] [PATCH 1/1] package/asterisk: security bump version
 to 23.3.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

it seems the cleanup bug of menuselect is back:
>>> asterisk 23.3.0 Building
GIT_DIR=. PATH="/home/wbx/buildroot/output/host/bin:/home/wbx/buildroot/output/host/sbin:/home/wbx/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"  /usr/bin/make -j13 ASTVARLIBDIR="/usr/lib/asterisk" ASTDATADIR="/usr/lib/asterisk" ASTKEYDIR="/usr/lib/asterisk" ASTDBDIR="/usr/lib/asterisk" ASTLDFLAGS="-latomic" OPTIMIZE="" -C /home/wbx/buildroot/output/build/asterisk-23.3.0/
CC="cc" CXX="/home/wbx/buildroot/output/host/bin/x86_64-buildroot-linux-gnu-g++" LD="" AR="" RANLIB="" CFLAGS="" LDFLAGS="" make -C menuselect CONFIGURE_SILENT="--silent" makeopts
make[3]: 'makeopts' is up to date.
menuselect/menuselect --check-deps menuselect.makeopts
menuselect/menuselect: error while loading shared libraries: libxml2.so.16: cannot open shared object file: No such file or directory
make[2]: *** [Makefile:378: menuselect.makeopts] Error 127
make[1]: *** [package/pkg-generic.mk:273: /home/wbx/buildroot/output/build/asterisk-23.3.0/.stamp_built] Error 2
make: *** [Makefile:83: _all] Error 2
wbx@fluor:~/buildroot$

Testing with qemu_x86_64_defconfig and asterisk enabled after
applying your patch.

best regards
 Waldemar

Bernd Kuhls wrote,

> https://community.asterisk.org/t/asterisk-release-23-3-0/112566
> 
> https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.9.0.html
> Security Advisories Resolved: 0
> 
> https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-23.0.0.html
> Security Advisories Resolved: 1 (also included in 22.5.2)
> 
> https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-23.1.0.html
> https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-23.2.0.html
> https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-23.2.1.html
> Security Advisories Resolved: 0
> 
> https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-23.2.2.html
> Security Advisories Resolved: 4 (also included in 22.8.2)
> 
> https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-23.3.0.html
> Security Advisories Resolved: 0
> 
> Follow upstream bump of the bundled pjproject version to 2.16 in
> asterisk 23.3.0:
> https://github.com/asterisk/asterisk/commit/104b908fe95f542692f49ee8d600ad1347369688
> https://github.com/pjsip/pjproject/releases/tag/2.16
> Fixes CVE-2025-65102: https://github.com/pjsip/pjproject/security/advisories/GHSA-w5vr-39x7-h8g5
> 
> Also several upstream security fixes were added to pjproject in asterisk
> 23.3.0:
> https://github.com/asterisk/asterisk/commit/d0a0dc8b6d5efc65ee9a8038363196d7c84da5a2
> Fixes CVE-2026-25994, CVE-2026-28799, CVE-2026-32942 & CVE-2026-33069.
> 
> Remove db.h license file due to upstream removal in version 23.0.0:
> https://github.com/asterisk/asterisk/commit/03f1c246746655a21e4f6d66fb4be5aef8b301f8
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/asterisk/asterisk.hash |  5 ++---
>  package/asterisk/asterisk.mk   | 11 +++++------
>  2 files changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
> index 3a8274b458..4c52be9d74 100644
> --- a/package/asterisk/asterisk.hash
> +++ b/package/asterisk/asterisk.hash
> @@ -1,8 +1,8 @@
>  # Locally computed
> -sha256  6669a8d2e50481a3b70c6099a21a100ab7d7ae9ac00e2182eabb94c68c94bcc9  asterisk-22.8.2.tar.gz
> +sha256  8662d367da1451acb08e8b7f217ea7bb961a44ef751190bc63e006d65053a2d3  asterisk-23.3.0.tar.gz
>  
>  # Locally computed
> -sha256  58bb83cec4d431f48d006e455d821668450f8cf6b6c95f090def47062fa3a60c  pjproject-2.15.1.tar.bz2
> +sha256  633c3dc34ffb21af8ac9ee160245c9c174379391e35cace1b6c9f516a260f683  pjproject-2.16.tar.bz2
>  sha256  6775095bcd417d375faddc1f17cdd7706ad8aa9b9b02404990c4b0ee218ee379  libjwt-1.15.3.tar.gz
>  
>  # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
> @@ -16,4 +16,3 @@ sha256  449fb810d16502c3052fedf02f7e77b36206ac5a145f3dacf4177843a2fcb538  asteri
>  sha256  82af40ed7f49c08685360811993d9396320842f021df828801d733e8fdc0312f  COPYING
>  sha256  3ce4755b8da872a0de93ecdbbe2f940763cc95c9027bbf3c4a2e914fcd8bf4c6  main/sha1.c
>  sha256  6215e3ed73c3982a5c6701127d681ec0b9f1121ac78a28805bd93f93c3eb84c0  codecs/speex/speex_resampler.h
> -sha256  ea69cc96ab8a779c180a362377caeada71926897d1b55b980f04d74ba5aaa388  utils/db1-ast/include/db.h
> diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> index e2fdb189fa..a5ad9ff44b 100644
> --- a/package/asterisk/asterisk.mk
> +++ b/package/asterisk/asterisk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ASTERISK_VERSION = 22.8.2
> +ASTERISK_VERSION = 23.3.0
>  # Use the github mirror: it's an official mirror maintained by Digium, and
>  # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
>  ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
> @@ -12,21 +12,20 @@ ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
>  # compilation with the external pjsip produces a non-working asterisk, which
>  # segfaults. The reason behind this is unclear.
>  # https://github.com/asterisk/asterisk/issues/671
> -ASTERISK_PJSIP_URL = https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.15.1/
> +ASTERISK_PJSIP_URL = https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.16/
>  ASTERISK_LIBJWT_URL = https://raw.githubusercontent.com/asterisk/third-party/master/libjwt/1.15.3/
>  ASTERISK_SOUNDS_BASE_URL = http://downloads.asterisk.org/pub/telephony/sounds/releases
>  ASTERISK_EXTRA_DOWNLOADS = \
>  	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-core-sounds-en-gsm-1.6.1.tar.gz \
>  	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-moh-opsound-wav-2.03.tar.gz \
> -	$(ASTERISK_PJSIP_URL)/pjproject-2.15.1.tar.bz2 \
> +	$(ASTERISK_PJSIP_URL)/pjproject-2.16.tar.bz2 \
>  	$(ASTERISK_LIBJWT_URL)/libjwt-1.15.3.tar.gz
>  
> -ASTERISK_LICENSE = GPL-2.0, BSD-3-Clause (SHA1, resample), BSD-4-Clause (db1-ast)
> +ASTERISK_LICENSE = GPL-2.0, BSD-3-Clause (SHA1, resample)
>  ASTERISK_LICENSE_FILES = \
>  	COPYING \
>  	main/sha1.c \
> -	codecs/speex/speex_resampler.h \
> -	utils/db1-ast/include/db.h
> +	codecs/speex/speex_resampler.h
>  
>  ASTERISK_CPE_ID_VENDOR = sangoma
>  ASTERISK_SELINUX_MODULES = asterisk
> -- 
> 2.47.3
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
