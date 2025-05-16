Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5913FC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B46B406BC;
	Fri, 16 May 2025 10:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EIlrARhkHI4J; Fri, 16 May 2025 10:44:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B7E34180F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B7E34180F;
	Fri, 16 May 2025 10:44:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BDB2713D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A35C260B26
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zUSSCP14HvhC for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:44:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A68DE60B52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A68DE60B52
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A68DE60B52
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:44:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7758E1C10FB; Fri, 16 May 2025 12:44:20 +0200 (CEST)
Message-ID: <01188e3b-f1d7-4a86-9f59-824bc41e673a@rnout.be>
Date: Fri, 16 May 2025 12:44:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com
References: <20250428122005.3952218-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250428122005.3952218-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392260; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=NxpccxrW7OZWc87h1dQOWmZpoph1ZrlQqxpV6+B7Cfw=;
 b=cwXhf7LBeH87enZrNWE4Go3c8l+Ev1QIS7xoyLAVM6PknJm5qHVym5kS2eXE612iN8hoIE
 0OijDw5WYKLwW3LKEbgEM3n4LgD1W9vNGrwYPEX0gg+5JkMw6jCzwGJPhEldXLhIcEUnco
 NWAg4HHvigyQUP+mFbJZzQ+Qn9574nABc/o50uLliPjVVz5uIp/Y+GXlgNrw01/be3xjJ6
 9+nRat7YOpLvqBowhT/7EfRQ2+y6W9Oo+rA4Mkap1sR/6/Kp2S75fAb+SHcsyCz5HZi1We
 0ehZrtYqElFO6Y+DkPTMRcarYaHfwy08bwrBJPWNNzrShOwnIW3WskNay7W8Ag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=cwXhf7LB
Subject: Re: [Buildroot] [PATCH 1/1] package/armadillo: bump to version
 14.4.2
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



On 28/04/2025 14:20, Dario Binacchi wrote:
> Release notes:
> https://arma.sourceforge.net/docs.html#changelog
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/armadillo/armadillo.hash | 2 +-
>   package/armadillo/armadillo.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
> index 3161d2df8797..61ed4d85283d 100644
> --- a/package/armadillo/armadillo.hash
> +++ b/package/armadillo/armadillo.hash
> @@ -1,4 +1,4 @@
>   # Locally computed:
> -sha256  26ce272bfdc8246c278e6f8cfa53777a1efb14ef196e88082fee05da1a463491  armadillo-14.4.1.tar.xz
> +sha256  6dfddcfbd91e70679d7c11e94a5963a7efda002fec351e6f4875ac8e245c5117  armadillo-14.4.2.tar.xz
>   # License files, locally calculated
>   sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
> diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
> index c41e60625e2f..3ebec29cf3b6 100644
> --- a/package/armadillo/armadillo.mk
> +++ b/package/armadillo/armadillo.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ARMADILLO_VERSION = 14.4.1
> +ARMADILLO_VERSION = 14.4.2
>   ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
>   ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
>   ARMADILLO_INSTALL_STAGING = YES

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
