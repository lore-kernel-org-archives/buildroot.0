Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDAECAC5A7
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 19:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E65F83CC1;
	Sat, 20 Sep 2025 19:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id afOl_Nto57sF; Sat, 20 Sep 2025 19:53:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 000F3840F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 000F3840F2;
	Sat, 20 Sep 2025 19:53:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BCE16D3
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 19:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AACC24147F
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 19:53:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LaXOz1Bp8R9G for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 19:53:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B36DE41462
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B36DE41462
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B36DE41462
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 19:53:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7BB4B78034E;
 Sat, 20 Sep 2025 21:53:48 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Sep 2025 21:53:48 +0200
MIME-Version: 1.0
Date: Sat, 20 Sep 2025 21:53:48 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>
In-Reply-To: <20250920111028.2574590-1-dario.binacchi@amarulasolutions.com>
References: <20250920111028.2574590-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <0a188387b727fbb3a466fba5a7d2c84a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758398030;
 bh=owlthC4oaHDac86NytrhfXLLjVRfqdwImDonS1NMwuk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mTEmMUf57eE5zrHn8PB6Iix7pxVgwLfi5nk7XLFRwwncnLHF05xcxjGv5+5WAHA8k
 frACu0eyc8K5WE2lJwIWOPl8FQYmiG0iIAQ0+XCD9UhTUdbCRCy649Us40x/gDimGM
 F1l2+UQa0wm+WgbDWmOVUjGHBUTUjm5vZuGEvnUg/Cw5jMk92z5EkWVxoMBV7MpGGx
 dAMW0ijt2qFXc2NdiKhbF9OdWYpHde+FiP313Qr/Z0MLdv77n6AVhdpGmtuBgc/U1/
 7YQTtjquz/NOykra6X/UJdL+3typx7T9+gDv+3rIxDO/WDJ04wKD6R8PMouE6yx3Ta
 r2E0o4LXCWbRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mTEmMUf5
Subject: Re: [Buildroot] [PATCH 1/1] package/atop: bump to version 2.12.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

Thanks for the patch.

On 20/09/2025 13:10, Dario Binacchi wrote:
> Patch 0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch
> was removed because it has been integrated with commit
> 631defdd22e3b6872c440d368d7acf459150eea5.
> 
> Release notes:
> https://www.atoptool.nl/downloadatop.php

This patch bumps directly from version 2.11.0 to 2.12.0. The release 
note
mention that version 2.11.1 contains a security fix for CVE-2025-31160.

Could you send a new patch series doing this update in two steps?
One patch from 2.11.0 to 2.11.1 marked as a security update (that will 
be
cherry-picked in Buildroot LTS maintenance branches), and a second one
from 2.11.1 to 2.12.0.

> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  ...he-user-to-pass-additional-CFLAGS-an.patch | 32 -------------------
>  package/atop/atop.hash                        |  2 +-
>  package/atop/atop.mk                          |  2 +-
>  3 files changed, 2 insertions(+), 34 deletions(-)
>  delete mode 100644 
> package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch
> 
> diff --git 
> a/package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch 
> b/package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch
> deleted file mode 100644
> index 0fc8f142b14a..000000000000
> --- 
> a/package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From c8e9d2b885deca065bd7955019a6aa071974042d Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> -Date: Mon, 5 Aug 2024 23:38:08 +0200
> -Subject: [PATCH] Makefile: allow the user to pass additional CFLAGS 
> and
> - LDFLAGS
> -
> -This is needed for some build systems. For example, Buildroot needs to
> -disable optimizations on some CPU architectures.
> -
> -Upstream: https://github.com/Atoptool/atop/pull/314
> -[Waldemar: rebase on top of 2.11.0]
> -Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ----
> - Makefile | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 3a63f69..ab44eaa 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -21,8 +21,8 @@ PMPATH2  = /usr/lib64/pm-utils/sleep.d
> - PMPATHD  = /usr/lib/systemd/system-sleep
> -
> - PKG_CONFIG ?= pkg-config
> --CFLAGS  += -O2 -I. -Wall $(shell $(PKG_CONFIG) --cflags glib-2.0)  
> -Wno-stringop-truncation -Wmissing-prototypes -Wmissing-declarations 
> -Wformat-security # -DNOPERFEVENT   # -DHTTPSTATS
> --LDFLAGS += $(shell $(PKG_CONFIG) --libs glib-2.0)
> -+override CFLAGS  += -O2 -I. -Wall $(shell $(PKG_CONFIG) --cflags 
> glib-2.0)  -Wno-stringop-truncation -Wmissing-prototypes 
> -Wmissing-declarations -Wformat-security # -DNOPERFEVENT   # 
> -DHTTPSTATS
> -+override LDFLAGS += $(shell $(PKG_CONFIG) --libs glib-2.0)
> - OBJMOD0  = version.o
> - OBJMOD1  = various.o  deviate.o   procdbase.o
> - OBJMOD2  = acctproc.o photoproc.o photosyst.o cgroups.o rawlog.o 
> ifprop.o parseable.o
> diff --git a/package/atop/atop.hash b/package/atop/atop.hash
> index 8774fb577dea..aeb9a469d7d3 100644
> --- a/package/atop/atop.hash
> +++ b/package/atop/atop.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256  
> 9b94c666602efff7bf402ecce706c347f38c39cb63498f9d39626861e5646e20  
> atop-2.11.0.tar.gz
> +sha256  
> 0d09ecc90c14e6ef41c22e3c57c142c3e4fb9cf3c94379077a33c961d5343086  
> atop-2.12.0.tar.gz
> 
>  # Hash for license file:
>  sha256  
> 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  
> COPYING
> diff --git a/package/atop/atop.mk b/package/atop/atop.mk
> index f7dfed5e8df3..b4a5bda52e40 100644
> --- a/package/atop/atop.mk
> +++ b/package/atop/atop.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -ATOP_VERSION = 2.11.0
> +ATOP_VERSION = 2.12.0
>  ATOP_SITE = http://www.atoptool.nl/download
>  ATOP_LICENSE = GPL-2.0+
>  ATOP_LICENSE_FILES = COPYING
> --
> 2.43.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
