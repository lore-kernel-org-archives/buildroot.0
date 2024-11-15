Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78273D68BDB
	for <buildroot@archiver.kernel.org>; Fri, 15 Nov 2024 22:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45FAD610A7;
	Fri, 15 Nov 2024 22:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QgatPQur1zAL; Fri, 15 Nov 2024 22:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44DA4610A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44DA4610A4;
	Fri, 15 Nov 2024 22:31:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A6DAA27DF
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 22:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84CF64314E
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 22:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xrlm6Rq_XJQO for <buildroot@buildroot.org>;
 Fri, 15 Nov 2024 22:31:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1C0E54314A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C0E54314A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C0E54314A
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 22:31:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6658E2003B4;
 Fri, 15 Nov 2024 23:31:30 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46778])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 15 Nov 2024 23:31:30 +0100
MIME-Version: 1.0
Date: Fri, 15 Nov 2024 23:31:30 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20241115201140.363683-1-bernd@kuhls.net>
References: <20241115201140.363683-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <2192210e30a45b7f812acf987b419a59@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731709891;
 bh=xo1/e0CfK6AWshxSQmQRzKWUoB7+JEB38JvaTDh+3dc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XdNVDUxAHMWt0tkLpss8YMtwXgV4jW2EETuaZdGZGB6EDiz9AR8UqltN0EnSWJXur
 Zqz+CKO0lGokhh2reTb8ithsJfLvf9CMVr8XrRr5DGoYf83GWT9NF9mLokh9K28WQ+
 1GfWyQ43jLA+k9Jzb5nrPJKOBSRa9Y/NbKSt2sJLB6h+4iyCWsMYlVre2Mt2NrzZjF
 ihW7IyPsss1UnFeV4+Ba1zsr1GuNtq7EDOe8DNpmkJQ7sG0Yl/viWAwG105Lc+PIbs
 VlfhGuz0gDPzyvst1z+jr8B8NteYGFyNiDBOdTKkVoQtGiY89OdW1nXh/xwj+XPbH1
 SxT80bDvYOAQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XdNVDUxA
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20241112
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

On 15/11/2024 21:11, Bernd Kuhls wrote:
> Release notes:
> https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases
> 
> CVE-2024-21853
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01101.html
> 
> CVE-2024-23918
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01079.html
> 
> CVE-2024-24968
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01097.html
> 
> CVE-2024-23984
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01103.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

> ---
>  package/intel-microcode/intel-microcode.hash | 2 +-
>  package/intel-microcode/intel-microcode.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-microcode/intel-microcode.hash 
> b/package/intel-microcode/intel-microcode.hash
> index 20dfaa41b4..81a4573110 100644
> --- a/package/intel-microcode/intel-microcode.hash
> +++ b/package/intel-microcode/intel-microcode.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  
> 8b7582eac7e9a691356e18b3bdcbc7b2db09494e040ec980a4a5fb6d0da261bf  
> intel-microcode-20240910.tar.gz
> +sha256  
> 37246208ef68039be752438c72400a688a2238df13a7f5282497c80be2d8366d  
> intel-microcode-20241112.tar.gz
>  sha256  
> 03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  
> license
> diff --git a/package/intel-microcode/intel-microcode.mk 
> b/package/intel-microcode/intel-microcode.mk
> index 24729494d0..17f25edc83 100644
> --- a/package/intel-microcode/intel-microcode.mk
> +++ b/package/intel-microcode/intel-microcode.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -INTEL_MICROCODE_VERSION = 20240910
> +INTEL_MICROCODE_VERSION = 20241112
>  INTEL_MICROCODE_SITE = $(call 
> github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
>  INTEL_MICROCODE_LICENSE = PROPRIETARY
>  INTEL_MICROCODE_LICENSE_FILES = license
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
