Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF7EC2A072
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 08:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AAE280719;
	Mon,  5 Jan 2026 08:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_MA7jTJk0pb; Mon,  5 Jan 2026 08:31:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CBD28073D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767601868;
	bh=YKdJRQH1ipqNtwiRcup+vrZ34JPuPGlgcxY+V7i/DPI=;
	h=Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QmzscYXyV3ULf7ybm+nfBl0bMtRvUfGyyaz5kKougEhxfp0Plt8QfNAHR3jiiLXko
	 qlwwfLNZA0WGIjqFvaDLyNa2Vs5RmrwixWwp5jWhw4MkN3po3Rkx0le6CypSr6o+eo
	 bRqWISKl9X6qgclPKN9AZXV/TqtGIiO1aqQa1MR8eg4dCyfYY7//a4tQhjc09WcZu7
	 nAsVTUzSi+4oMcgmRmj+JC88iNZUsXOP7YSlMzUiTkHOqmT3PyHXfAIB6l3msdx7uG
	 jOnkUWXkMy/gAiwQQGWT0jNn3xmx/hWOjAvwsbfiAw2TmR3z1xNu3d2XxBPCvakEHk
	 N3wqd66p8juhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CBD28073D;
	Mon,  5 Jan 2026 08:31:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB867E7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 08:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD781402EE
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 08:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KXSVrQdg8sQZ for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 08:31:02 +0000 (UTC)
X-Greylist: delayed 351 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 05 Jan 2026 08:31:01 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CB1BE40287
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB1BE40287
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=458dbad6e=horatiu.vultur@microchip.com; receiver=<UNKNOWN> 
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB1BE40287
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 08:31:01 +0000 (UTC)
X-CSE-ConnectionGUID: /gTqc7wTQRqFuY/0XEmaSQ==
X-CSE-MsgGUID: rY7+j5a3QJOO/tZ94ylZxg==
X-IronPort-AV: E=Sophos;i="6.21,203,1763449200"; d="scan'208";a="51818167"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 01:27:53 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Mon, 5 Jan 2026 01:26:46 -0700
Received: from localhost (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 5 Jan 2026 01:26:46 -0700
Date: Mon, 5 Jan 2026 09:25:54 +0100
To: Bernd Kuhls <bernd@kuhls.net>
CC: <buildroot@buildroot.org>
Message-ID: <20260105082554.j27vypydtt2jxvim@DEN-DL-M31836.microchip.com>
References: <20260103141300.460719-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260103141300.460719-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1767601862; x=1799137862;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=68wzDI0wlhvmFlafqMSMzTIAPKrIWtPC0gmDJ4pkpew=;
 b=tDOUKYflA6TtPIpy8r0cW4el1G/MOcJYoMVVNcz1176n6KdEmC7cQJJi
 D8o7BI81RkLD/wCH+0uhTMP73OszmmTi2YmiAyjoEwCBEyG3+XFwmInTd
 BvAECKccluwSOW27+7wruKmcK01K4Xz2uKf6G8PjEaCf4XtWN6wPnfPFQ
 0GuFmO5hMT3UoHJPam9jYnFk3PjJkfrV4GgQLY8RpZYWiebBblV2saJmh
 FP+OsURZCF5wPYohMAmkxxLogUswVg7gW6VHcM4InIVkHhfoNakqjwDOA
 ipae73OhWSFdmG3zb3yYs6mzLOd0HMHj2UlbGdEKIPo7I9i1ALADrEg/R
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=tDOUKYfl
Subject: Re: [Buildroot] [PATCH 1/1] package/cfm: fix build with cmake 4
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

The 01/03/2026 15:13, Bernd Kuhls wrote:
> 
> Fixes:
> https://autobuild.buildroot.net/results/d01/d01d8fe3a63128246ce242de450b016b4ef13baa/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>

> ---
>  ...01-CMakeLists-fix-build-with-cmake-4.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/cfm/0001-CMakeLists-fix-build-with-cmake-4.patch
> 
> diff --git a/package/cfm/0001-CMakeLists-fix-build-with-cmake-4.patch b/package/cfm/0001-CMakeLists-fix-build-with-cmake-4.patch
> new file mode 100644
> index 0000000000..1219a98056
> --- /dev/null
> +++ b/package/cfm/0001-CMakeLists-fix-build-with-cmake-4.patch
> @@ -0,0 +1,33 @@
> +From d2a823ef01396cd148074a99ccbbf1ca1115b24d Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Sat, 3 Jan 2026 14:56:38 +0100
> +Subject: [PATCH] CMakeLists: fix build with cmake 4
> +
> +Using CMake 4 the build is broken:
> +
> +CMake Error at CMakeLists.txt:6 (cmake_minimum_required):
> +  Compatibility with CMake < 3.5 has been removed from CMake.
> +
> +Upstream: https://github.com/microchip-ung/cfm/pull/1
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 5de2e0a..378e98d 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -3,7 +3,7 @@
> +
> + project (cfm C)
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
