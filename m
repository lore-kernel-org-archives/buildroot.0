Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB89C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 360CC60C14;
	Fri, 16 May 2025 17:59:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VzewwgRE2uGh; Fri, 16 May 2025 17:59:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 623EC612C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 623EC612C1;
	Fri, 16 May 2025 17:59:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F020513D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D66B1612EE
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J3_HZ7q-Tzrr for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:59:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F546612C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F546612C1
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F546612C1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7B34B1C1014; Fri, 16 May 2025 19:59:23 +0200 (CEST)
Message-ID: <bfd812e3-42c1-4028-a441-c974a8592e9c@rnout.be>
Date: Fri, 16 May 2025 13:06:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>, buildroot@buildroot.org
References: <20250507185311.7581-1-fl@n621.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250507185311.7581-1-fl@n621.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747418363; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EycnZMV8CzxSLNeBx6IRRP626Al41GJ7U0lDKp50XXQ=;
 b=DGF+4etZklRyRS1f6c1DwUFRb2yobWIPebfo2FGW6h+6GWv7HWuiliw4y+oFoQOTt6wcMZ
 56svTkC+xjzaH25R8xjiEH6knVhdvZbgC1jEIKDrF2Lqj8Tdqowf++3pRaT0uddr4g+jG5
 4VlTGdUDIC3ljH7SXa2unj7H2QGRLBwH9SOG16QOQnD19OZQTefPZ6bce9hir7LJBG+d+i
 IGV18o/Mj6czVrrrZbusR1aJ2ssnPX+vEMg/EsJtB0vLtV26VExGhpjqVV/noBavKRcWXQ
 oO4WB+SbvqpRKW+4HbpMi/4hx6hmqoo2lwWnwxN7ZwDdywhhcBUkHJeMJwERdA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=DGF+4etZ
Subject: Re: [Buildroot] [PATCH 1/1] package/bash: fix build with host GCC 15
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



On 07/05/2025 20:53, Florian Larysch wrote:
> bash uses K&R function declarations which have been removed in C23.
> 
> Since part of the build process (like the mkbuiltins helper) is written
> in C, building bash now fails on hosts with GCC 15 (which defaults to
> C23).
> 
> Since properly fixing this on the source code level is a larger
> endeavor, just set the C standard to an old enough version for now.
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/bash/bash.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/bash/bash.mk b/package/bash/bash.mk
> index 81f698f166..84f581da79 100644
> --- a/package/bash/bash.mk
> +++ b/package/bash/bash.mk
> @@ -26,6 +26,10 @@ BASH_CONF_ENV += \
>   	bash_cv_func_sigsetjmp=present \
>   	bash_cv_printf_a_format=yes
>   
> +ifeq ($(BR2_HOST_GCC_AT_LEAST_15),y)
> +BASH_CONF_ENV += CFLAGS_FOR_BUILD="$(HOST_CFLAGS) -std=gnu17"
> +endif
> +
>   # The static build needs some trickery
>   ifeq ($(BR2_STATIC_LIBS),y)
>   BASH_CONF_OPTS += --enable-static-link

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
