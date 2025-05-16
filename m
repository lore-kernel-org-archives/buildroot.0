Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55520C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 101EB4059E;
	Fri, 16 May 2025 10:41:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XNieISDj1bN3; Fri, 16 May 2025 10:41:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34E91405BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34E91405BD;
	Fri, 16 May 2025 10:41:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01B5913D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4A35608B0
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:41:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OVXtVdkcUgPA for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:41:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A89B5605EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A89B5605EB
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A89B5605EB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:41:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 93D461C10FB; Fri, 16 May 2025 12:41:45 +0200 (CEST)
Message-ID: <bf7d7d9d-a00f-4ec5-be79-b6affd753e89@rnout.be>
Date: Fri, 16 May 2025 12:41:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Lance Fredrickson <lancethepants@gmail.com>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Dimitrios Siganos <dimitris@siganos.org>
References: <20250415140519.1939298-1-lancethepants@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250415140519.1939298-1-lancethepants@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392105; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=8Z0q4Nipe1rGzOmP4RAkUXrbtrU8HMH6o+A17Lud2Xs=;
 b=NR/Wx3DpixxC23pLMn2CClMoCznxl4Gca6HRWrzbijQc3Ohzfbw+ZPlVSAztDlKLC9YidN
 7Zk31e3A3K9RGRRkjMmKcXuppQeANwTUX3BJGNgsVOsZS5U7630jg8ys5X3r5vLnwseUSa
 fy2qt+AjQDMWvpl+8RpVPN2jAka7SlYhvBB5ps1KeZBrOrTrmn6VNTrnVZaSmxIAUEjxet
 x6H1SVg8hToHpCbuTmLwfVgQMLuG3QtsoyHpcinx2WVXf8sHWz8wWS7OixlnnOTswupyDU
 JI3fk8wPNa4aUV9QBEkM1Ksm5dqyfClq8ELrCFjrNueZhV8l8vUSSDxlhiU2tw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=NR/Wx3Dp
Subject: Re: [Buildroot] [PATCH] package/wireless-regdb: bump version to
 2025.02.20
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



On 15/04/2025 16:05, Lance Fredrickson wrote:
> From: Lance Fredrickson <lancethepants@gmail.com>
> 
> See release announce:
> https://lists.infradead.org/pipermail/wireless-regdb/2025-February/001686.html
> 
> Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/wireless-regdb/wireless-regdb.hash | 2 +-
>   package/wireless-regdb/wireless-regdb.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
> index a3b5973bad..cb915c4415 100644
> --- a/package/wireless-regdb/wireless-regdb.hash
> +++ b/package/wireless-regdb/wireless-regdb.hash
> @@ -1,4 +1,4 @@
>   # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
> -sha256  f76f2bd79a653e9f9dd50548d99d03a4a4eb157da056dfd5892f403ec28fb3d5  wireless-regdb-2024.10.07.tar.xz
> +sha256  57f8e7721cf5a880c13ae0c202edbb21092a060d45f9e9c59bcd2a8272bfa456  wireless-regdb-2025.02.20.tar.xz
>   # Locally computed
>   sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
> diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
> index 2aec19c507..999a986de2 100644
> --- a/package/wireless-regdb/wireless-regdb.mk
> +++ b/package/wireless-regdb/wireless-regdb.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WIRELESS_REGDB_VERSION = 2024.10.07
> +WIRELESS_REGDB_VERSION = 2025.02.20
>   WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
>   WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
>   WIRELESS_REGDB_LICENSE = ISC

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
