Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD18CC5B559
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 06:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9848D6158D;
	Tue,  3 Jun 2025 06:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3QCZB7593kXt; Tue,  3 Jun 2025 06:22:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B774C6154B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B774C6154B;
	Tue,  3 Jun 2025 06:22:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 83A00DA
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7544D6103F
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdoHJDOpcEu2 for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 06:22:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1086060FF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1086060FF7
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1086060FF7
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0670E1C140E; Tue,  3 Jun 2025 08:22:05 +0200 (CEST)
Message-ID: <05709ba7-6ae4-4c12-a0a6-b9dc476fe59a@rnout.be>
Date: Sat, 31 May 2025 19:01:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kadambini Nema <kadambini.nema@gmail.com>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20250426053630.37164-1-kadambini.nema@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250426053630.37164-1-kadambini.nema@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748931726; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Sm/KZ2L9uZWqelo1zYOkRwa18VKRamP9Xj5xxdIouPI=;
 b=k8z9IYHow5fOwUm6s4zwLJazpLadnqtoxiOzS+dalB4LSsyeQBpn4UDr0YYycKhYoIV8Py
 XRGR6I5CVuMM2QA1LbojSNCWWcHsFE1Nd4o60BDRAqDhHzWrx6Z8nYRhvOobAyAlMPDCPO
 LXzeyhq7mS/6X4XEjNB5/lUsMZSq2ScrvTv4N41RHy/rysKzDg7Gs+lkQxOdKmpXasTMhN
 SIB+FUulAf9Y+x82CHNGfUpPzAJK6YPvT5L/rwcbYaPimUqKuOSDpgH+mJWn8QTdiqactJ
 HupFDvSNRXmEbzBClcZIbVA9uHArKFty9q++pbIxJuiSPZzKlXIqb586Zeskfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=k8z9IYHo
Subject: Re: [Buildroot] [PATCH 1/1] package/libuv: bump to version 1.51.0
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



On 26/04/2025 07:36, Kadambini Nema wrote:
> Release notes:
> https://github.com/libuv/libuv/releases/tag/v1.51.0
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/libuv/libuv.hash | 2 +-
>   package/libuv/libuv.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
> index 6618450af7..8becf44d50 100644
> --- a/package/libuv/libuv.hash
> +++ b/package/libuv/libuv.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  c42c51d4e630f95dcefcafff95bf003ea52939e312d5e6584e7d9e102ead3e9e  libuv-v1.50.0-dist.tar.gz
> +sha256  2ceca1a7577633cf92794db5bf5512370f6cd45a5746d6e14f8c20aeab0a547b  libuv-v1.51.0-dist.tar.gz
>   sha256  16de0c32b265cb7d46a6d3bd614f259dd4d693a5e26b3407b04aae8d73041f0c  LICENSE
>   sha256  262c44bd2cdba037e6d2a82fba15f5800d292bc993a6f5d6b6ea487744d02836  LICENSE-extra
> diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
> index 57c128abf0..b38f3c62ac 100644
> --- a/package/libuv/libuv.mk
> +++ b/package/libuv/libuv.mk
> @@ -6,7 +6,7 @@
>   
>   # When bumping libuv, check if a new version of uvw is available
>   # and bump it too.
> -LIBUV_VERSION = 1.50.0
> +LIBUV_VERSION = 1.51.0
>   LIBUV_SOURCE = libuv-v$(LIBUV_VERSION)-dist.tar.gz
>   LIBUV_SITE = https://dist.libuv.org/dist/v$(LIBUV_VERSION)
>   LIBUV_DEPENDENCIES = host-pkgconf

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
