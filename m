Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50635C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CC4941861;
	Fri,  2 May 2025 10:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDDWmLOnrG21; Fri,  2 May 2025 10:33:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 528284175C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 528284175C;
	Fri,  2 May 2025 10:33:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3217DEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13EFD60630
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JbrHWy-Aosfs for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:33:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7C5AE605D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C5AE605D1
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C5AE605D1
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:33:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 454DB1C1112; Fri,  2 May 2025 12:33:20 +0200 (CEST)
Message-ID: <cddaf2b3-6f10-4216-b5c1-3d1580f4b1da@rnout.be>
Date: Fri, 2 May 2025 12:33:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20250417075152.3534553-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250417075152.3534553-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182000; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=J6L+8Bn3WV0VHUlT/uYn/pywVmxH96aOc/rjom5pEj0=;
 b=e+U/VqW/ra9zRpQ3H1Mb+oZ5M1QP0sQKmtYlsKokR7Vwe/k7bQdOmOMZO6KovppzpuSPpB
 imT0rxq3AEEUvxVfs5to4cKOT5sCslpY4y3uWqohs13Gj59EgreaC7E2qD0O9svivJIHTX
 FPqEaIH0YGyAhafR0lPhL+XtJ6FzZdyT1+0Qls1BWUgLUaDcMvCyA1X4bkWcuPY2+1MHT+
 V2Gpql2krZ3EymKBZA5eUJIqxnRevszC+EJ/RKS42eOGrjUgiCdJ2obJ1qstWj3/2ZOwTt
 TtO4EJ4zYcpzNqaufvbxGdbrdtBMQNALd1JzHAF+mMdk3E6ikf6CivDW3n5bOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=e+U/VqW/
Subject: Re: [Buildroot] [PATCH] package/c-ares: security bump to version
 1.34.5
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



On 17/04/2025 09:51, Peter Korsgaard wrote:
> Fixes the following security issue:
> 
> - CVE-2025-31498: Use after free in read_answers()
>    https://github.com/c-ares/c-ares/security/advisories/GHSA-6hxc-62jh-p29v
> 
> For more details, see the announcement:
> https://github.com/c-ares/c-ares/releases/tag/v1.34.5
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/c-ares/c-ares.hash | 2 +-
>   package/c-ares/c-ares.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
> index 8dc84ada89..1c28d91e97 100644
> --- a/package/c-ares/c-ares.hash
> +++ b/package/c-ares/c-ares.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -sha256  35410aa625cc9ee95b66475f54aea7c81c673fb63d75fad5eee267711503b72a  c-ares-1.34.2.tar.gz
> +sha256  7d935790e9af081c25c495fd13c2cfcda4792983418e96358ef6e7320ee06346  c-ares-1.34.5.tar.gz
>   
>   # Hash for license file
>   sha256  460f5e768fda3752ca2169a95df062578a10fb126bfd65f3b9b1a1bed2f84807  LICENSE.md
> diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
> index 6685ade9d6..090147d0e9 100644
> --- a/package/c-ares/c-ares.mk
> +++ b/package/c-ares/c-ares.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -C_ARES_VERSION = 1.34.2
> -C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/v1.34.2
> +C_ARES_VERSION = 1.34.5
> +C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/v$(C_ARES_VERSION)
>   C_ARES_INSTALL_STAGING = YES
>   C_ARES_CONF_OPTS = --with-random=/dev/urandom
>   C_ARES_LICENSE = MIT

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
