Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCE8D7235E
	for <buildroot@archiver.kernel.org>; Fri, 23 Jan 2026 09:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 655A9607F2;
	Fri, 23 Jan 2026 09:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6z89QDZEXCrp; Fri, 23 Jan 2026 09:41:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FA62607EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769161267;
	bh=hnLfT93hC5mci11MYj6ro4A5d5cq1H/xPvnx7BkTm/Y=;
	h=Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G3iEhAjONURnNKGLxYPJ6FR6Ub+wCrUT2TKf14kCEuX61xqwefO6e3Tw4U/wd2kIN
	 XskhWcbKBWmcBvu/IUzTwZlzQXjYkn2lNVBhCr6CaT7dTUCS3Tkd0H1z87irgM2Alf
	 UfQzDKdO1w1cQYCblgf1PpA76Ra/31gdI9XLR30DKhhmxdTnFoMbbbnttffF/o8Cod
	 cKoUr5Rj2c9oda1r6XpCiEL35oGLua/A10+fZ3GfKV2kgko0aKWAtNBZqe79/Hi4ZF
	 E1bPR0RXornrpRrDs6k6zRxmJjhrIfJR9PEvUmgkyCIx7/5nhz1IFh/fU0G/wWQ/4f
	 AnBkXItWzQMlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FA62607EC;
	Fri, 23 Jan 2026 09:41:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DAE8358
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 09:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E597640990
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 09:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgGr2L2EdgA0 for <buildroot@buildroot.org>;
 Fri, 23 Jan 2026 09:41:02 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 23 Jan 2026 09:41:01 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 975F1405DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 975F1405DA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=47635ea44=horatiu.vultur@microchip.com; receiver=<UNKNOWN> 
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 975F1405DA
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 09:41:01 +0000 (UTC)
X-CSE-ConnectionGUID: PGZze3boQdO7YJPg38jFlA==
X-CSE-MsgGUID: ZoDidChhReeww4HIyxO6lw==
X-IronPort-AV: E=Sophos;i="6.21,248,1763449200"; d="scan'208";a="52340062"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jan 2026 02:33:53 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 23 Jan 2026 02:33:24 -0700
Received: from localhost (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 23 Jan 2026 02:33:24 -0700
Date: Fri, 23 Jan 2026 10:33:24 +0100
To: Bernd Kuhls <bernd@kuhls.net>
CC: <buildroot@buildroot.org>
Message-ID: <20260123093324.3jrei7qltshbwbrb@DEN-DL-M31836.microchip.com>
References: <20260118133155.1910082-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260118133155.1910082-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1769161262; x=1800697262;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=C+ZBSntvxbWLoj8FsIrlzOJuegULnrnORJGzykrl87U=;
 b=fIVoPn6/Ts67KBUqvEFFumjXndpE+uQHWjWjiF8qmR69VBIT3N2z2j9a
 7VnsEN1vTGj2gIQ7t6sH6DI2PM77I59uGJ30QsDoqzwZTGYVLpwpk647Y
 KAFso1CrSE6pfMUVXZxRpDLWMtlJUNj62LZvn44NI0KJ9DZQ0wUV1J+dp
 xjZPUYKMtE0d/GfCrtwlP9R+KDaSAvNY7sUieEAqVQkaaQ3+48fOlbDEf
 dgvDVhCHm+reTkVFf7EKup0CcLmuU7LiKNqzFCVEI+z0GmWovGXwIGYKc
 N143HYlJ9drCdRMW87FJtU2UUbTuB46jYUQJ/JfjVOVDLJeOSuEtH3DuZ
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=fIVoPn6/
Subject: Re: [Buildroot] [PATCH 1/1] package/mrp: fix cmake 4 compatibility
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
From: Horatiu Vultur via buildroot <buildroot@buildroot.org>
Reply-To: Horatiu Vultur <horatiu.vultur@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 01/18/2026 14:31, Bernd Kuhls wrote:

Hi Bernd,

> 
> Fixes:
> https://autobuild.buildroot.net/results/d93/d938025a881a14003c1b50065f163115e36cf33e/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...m-required-version-to-3.5-for-CMake-.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/mrp/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch
> 
> diff --git a/package/mrp/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch b/package/mrp/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch
> new file mode 100644
> index 0000000000..7ddf08cd6d
> --- /dev/null
> +++ b/package/mrp/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch
> @@ -0,0 +1,41 @@
> +From 23877eaf1042b56e1bdca1883447e9a83d5e8263 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Sun, 18 Jan 2026 14:26:05 +0100
> +Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
> + compatibility
> +
> +Fixes:
> +CMake Error at CMakeLists.txt:6 (cmake_minimum_required):
> +  Compatibility with CMake < 3.5 has been removed from CMake.
> +
> +  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
> +  to tell CMake that the project requires at least <min> but has been updated
> +  to work with policies introduced by <max> or earlier.
> +
> +  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
> +
> +-- Configuring incomplete, errors occurred!
> +
> +Upstream: https://github.com/microchip-ung/mrp/pull/2
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>

> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index d7a3798..a0ae196 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -3,7 +3,7 @@
> +
> + project (mrp C)
> +
> +-cmake_minimum_required(VERSION 2.6)
> ++cmake_minimum_required(VERSION 3.5)
> +
> + ## libnl ################################################
> + find_path(LibNL_INCLUDE_DIR netlink/netlink.h
> +--
> +2.47.3
> +
> --
> 2.47.3
> 

-- 
/Horatiu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
