Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24247C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A541C6112D;
	Fri, 16 May 2025 11:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D07pB6GOGr33; Fri, 16 May 2025 11:00:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C221060B2B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C221060B2B;
	Fri, 16 May 2025 11:00:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B936A13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EB0E4083A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZ1_vY1PctIw for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:00:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AEE5C40669
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEE5C40669
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AEE5C40669
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:00:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B5C2A1C10F7; Fri, 16 May 2025 13:00:15 +0200 (CEST)
Message-ID: <afb20e6d-6c5d-4178-8033-f5e75eeaa316@rnout.be>
Date: Fri, 16 May 2025 13:00:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Yair Ben Avraham <yairba@protonmail.com>
References: <20250509220542.379160-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250509220542.379160-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747393215; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4XeuOk1XDuf7zllOl/wMdt/8nZKVUHVFmkCSEV7lSLM=;
 b=kSolHjoOMy/lEzIve1LEC7JdL9oRznmkRHp+FRjRJCRtF1BX//9UR43i9lveVsEaxxbE0q
 sTcbytiBKRDxLmEw7ZsuJQ0tkMJSbZngFSSrEOQ9BUMHhCh/dGPZJ0AkSYtYx8xa5KWRE9
 Rq7bXXJLxdKvWT/qdpvkaGgWFzi7dfZVT9XUrgNeAZZI4MS/KPrGjW3kl3CzIaE8z4rpnD
 EnYkeWMNnHxf+EWdTrKlTeDX7+ytao2cZesA1ajp9hYRK54rxuoSKORcEUxGao0aqPtVzY
 aq3vBB501HbpfcC8QWoV/EFQvnaDupTUq39LthyLIRisATu7YS2PYtEaTpD7ew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=kSolHjoO
Subject: Re: [Buildroot] [PATCH] package/tpm2-pkcs11: bump to version 1.9.1
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



On 10/05/2025 00:05, Thomas Petazzoni via buildroot wrote:
> 1.9.0..1.9.1 changes described at:
> 
>    https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.9.1
> 
> Update suggested by https://gitlab.com/magerkraut at
> https://gitlab.com/buildroot.org/buildroot/-/issues/109 as "There is a
> issue with the database LOCK file".
> 
> Fixes:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/issues/109
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/tpm2-pkcs11/tpm2-pkcs11.hash | 2 +-
>   package/tpm2-pkcs11/tpm2-pkcs11.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.hash b/package/tpm2-pkcs11/tpm2-pkcs11.hash
> index 797955a69b..5f5abfbbe8 100644
> --- a/package/tpm2-pkcs11/tpm2-pkcs11.hash
> +++ b/package/tpm2-pkcs11/tpm2-pkcs11.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  35bf06c30cfa76fc0eba2c5f503cf7dd0d34a66afb2d292fee896b90362f633b  tpm2-pkcs11-1.9.0.tar.gz
> +sha256  ce24aa5ec2471545576e892b6f64fd873a424371bbf9be4ca3a0e689ea11c9b7  tpm2-pkcs11-1.9.1.tar.gz
>   sha256  793aa007f793458434d7cc60b1c827053a399308658b32fcaa6023802adc22e1  LICENSE
> diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.mk b/package/tpm2-pkcs11/tpm2-pkcs11.mk
> index c6218d772e..b26f53de27 100644
> --- a/package/tpm2-pkcs11/tpm2-pkcs11.mk
> +++ b/package/tpm2-pkcs11/tpm2-pkcs11.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TPM2_PKCS11_VERSION = 1.9.0
> +TPM2_PKCS11_VERSION = 1.9.1
>   TPM2_PKCS11_SITE = https://github.com/tpm2-software/tpm2-pkcs11/releases/download/$(TPM2_PKCS11_VERSION)
>   TPM2_PKCS11_LICENSE = BSD-2-Clause
>   TPM2_PKCS11_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
