Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E14C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B84E183D48;
	Fri,  2 May 2025 10:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KIU2O2BQGJRu; Fri,  2 May 2025 10:30:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93B4F83A55
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93B4F83A55;
	Fri,  2 May 2025 10:30:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB787229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1CDB60AEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:30:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJ96MyvpG3Ju for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:30:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 08B2660B27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08B2660B27
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08B2660B27
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:30:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0D8131C1113; Fri,  2 May 2025 12:30:30 +0200 (CEST)
Message-ID: <4f1a0fde-3b09-417f-a066-193664651da3@rnout.be>
Date: Fri, 2 May 2025 12:30:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Baruch Siach <baruch@tkos.co.il>, buildroot@buildroot.org
References: <4789a09c12708cbd48172f0c6964e6a7f18f36a4.1744784815.git.baruch@tkos.co.il>
Content-Language: en-GB, fr-BE
In-Reply-To: <4789a09c12708cbd48172f0c6964e6a7f18f36a4.1744784815.git.baruch@tkos.co.il>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746181830; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pCulGJVkFMYrRmWNpDbQ1hFQAyjWsUtqfKyiWpf1jFI=;
 b=bqFPvSKhHt/bwM7/9sPUm72RolbiPyiINnMNvlqT5fjNsKbohBcgt4qO3astCXW/6uuqQA
 SXl+gvI2SUnsr/g9M2SFIugakFCRC3l5FAHsBjT1g8i1sUmINTKemewHcesoltEUL+wipP
 5TK8DSeHLWyZBlm2HiH7MxD2XZuw6r6MFu5PDLcYLZvVc98uMMrzfIT5PgVBWd3S5dgDsp
 5AVsFVWSseFTYal6XlghpX8ocaeKl66msNhQDUI1oHZ7X7avEGIGVOgDaw1WO8iRerweIs
 EQl/rsHzuDYpC17OrJbtdvrt44V+RY+rNw9QHpmchXScY40LI5gAV+fueGJo6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=bqFPvSKh
Subject: Re: [Buildroot] [PATCH] package/socat: bump to version 1.8.0.3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/04/2025 08:26, Baruch Siach via buildroot wrote:
> List of changes in this release:
> http://www.dest-unreach.org/socat/CHANGES
> 
> Refresh patch.
> 
> Update README hash for changes that are unrelated to license.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/socat/0001-no-documentation.patch | 4 ++--
>   package/socat/socat.hash                  | 6 +++---
>   package/socat/socat.mk                    | 2 +-
>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/socat/0001-no-documentation.patch b/package/socat/0001-no-documentation.patch
> index b4c3e1ffde41..5dbce0576e40 100644
> --- a/package/socat/0001-no-documentation.patch
> +++ b/package/socat/0001-no-documentation.patch
> @@ -10,7 +10,7 @@ the package Makefile.in to not build/install its documentation.
>   
>   Upstream: N/A
>   Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -[baruch: update for 1.8.0.0; git patch format]
> +[baruch: update for 1.8.0.0 and 1.8.0.3; git patch format]
>   Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>   ---
>    Makefile.in | 7 ++-----
> @@ -22,7 +22,7 @@ index c01b1a4a2306..fd89acb06f3c 100644
>   +++ b/Makefile.in
>   @@ -82,7 +82,7 @@ SHFILES = socat-chain.sh socat-mux.sh socat-broker.sh \
>    TESTFILES = test.sh socks4echo.sh proxyecho.sh readline-test.sh \
> - 	proxy.sh socks4a-echo.sh
> + 	proxy.sh socks4a-echo.sh socks5server-echo.sh
>    
>   -all: progs doc
>   +all: progs
> diff --git a/package/socat/socat.hash b/package/socat/socat.hash
> index 136dce4a712c..b1c3d3cd11e1 100644
> --- a/package/socat/socat.hash
> +++ b/package/socat/socat.hash
> @@ -1,8 +1,8 @@
>   # From http://www.dest-unreach.org/socat/download.md5sum
> -md5  7272fe53d51c63ca0e08e0339681803a  socat-1.8.0.2.tar.bz2
> +md5  8ef0bc4f602636797917f8574c3b249e  socat-1.8.0.3.tar.bz2
>   # From http://www.dest-unreach.org/socat/download.sha256sum
> -sha256  adc07a9c2723527cf6568d2fb96559794cf9c254a4bc2edd36f7f3789e9f7625  socat-1.8.0.2.tar.bz2
> +sha256  01eb017361d95bb3a6941e840b59e4463a3fabf92df4154ed02b16a2ed6a0095  socat-1.8.0.3.tar.bz2
>   # Locally calculated
> -sha256  a18cf021c6380e8ef212c7a95460aff2d96fe9e2146bb09058651bc3b86f4d43  README
> +sha256  f51653b61cf2516c39e8f2edefc11604d0f9d14f0c6ae988bef228a1f0283ad2  README
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>   sha256  fd9e48ca316a5032069b9521f4f4b4d9b1c60365012bae1e62286bcd5bd2e761  COPYING.OpenSSL
> diff --git a/package/socat/socat.mk b/package/socat/socat.mk
> index aa9a94aec44b..69f8f4045281 100644
> --- a/package/socat/socat.mk
> +++ b/package/socat/socat.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SOCAT_VERSION = 1.8.0.2
> +SOCAT_VERSION = 1.8.0.3
>   SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
>   SOCAT_SITE = http://www.dest-unreach.org/socat/download
>   SOCAT_LICENSE = GPL-2.0 with OpenSSL exception

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
