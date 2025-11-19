Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C25BCF3187
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 10:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91DEA60888;
	Wed, 19 Nov 2025 10:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3gheCE_lyO9i; Wed, 19 Nov 2025 10:32:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD6A860A6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD6A860A6D;
	Wed, 19 Nov 2025 10:32:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1275E37D
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 10:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED5F48447C
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 10:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bm_sQ00NV5dV for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 10:32:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C393E8447B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C393E8447B
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C393E8447B
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 10:32:33 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 031742C893F8;
 Wed, 19 Nov 2025 11:32:30 +0100 (CET)
Message-ID: <1fa115ac-beb0-463c-b64a-091d20ec9d81@bubu1.eu>
Date: Wed, 19 Nov 2025 11:32:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20251003201528.2430591-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20251003201528.2430591-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1763548351; bh=mBv5edqy7PzJCnjJF00wjFUWOfv4TU8WiiX+/iMbw98=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=OKKIDdvGkAKa+N7sqhZW89H/WYhxaqHHLLPgJns6mgZY7q8s5UAO95WUE1cuRSDLT
 617IEZZXY98bkP5zLyTVMiaFq6YM4KD0nQvntaaOf7X3YZnE4as5vuuToAwIKoL22a
 V4qX1yS1jkjHbGaybYNPKtzNsuCoIkjFrhLFqAdIl3JHU7QfkQh8kfSAogsGUD2d0W
 wiLL5ZY5V+VTLPJr2e16LeW5TE5p/VEJuNr3ovsKFhsxpHusomhk9VMsYqL1USpxiE
 QZ4AS5NrxUIRVhQzzSZyul8DqIydlkskk1L8e85yTLuDZHoKc7JGfRIQ50OXAEFvi9
 Y4ESQjGJzbs0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=OKKIDdvG
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump version to 1.9.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/3/25 22:15, Bernd Kuhls wrote:
> Release notes: https://mesonbuild.com/Release-notes-for-1-9-0.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>
Tested-by: Marcus Hoffmann <buildroot@bubu1.eu>

> ---
>   package/meson/meson.hash | 4 ++--
>   package/meson/meson.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/meson/meson.hash b/package/meson/meson.hash
> index c83daae6c9..581cfe62a7 100644
> --- a/package/meson/meson.hash
> +++ b/package/meson/meson.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after checking pgp signature
> -# https://github.com/mesonbuild/meson/releases/download/1.8.3/meson-1.8.3.tar.gz.asc
> -sha256  f118aa910fc0a137cc2dd0122232dbf82153d9a12fb5b0f5bb64896f6a157abf  meson-1.8.3.tar.gz
> +# https://github.com/mesonbuild/meson/releases/download/1.9.1/meson-1.9.1.tar.gz.asc
> +sha256  4e076606f2afff7881d195574bddcd8d89286f35a17b4977a216f535dc0c74ac  meson-1.9.1.tar.gz
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> index 0c460eca6f..29082dcbb5 100644
> --- a/package/meson/meson.mk
> +++ b/package/meson/meson.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MESON_VERSION = 1.8.3
> +MESON_VERSION = 1.9.1
>   MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
>   MESON_LICENSE = Apache-2.0
>   MESON_LICENSE_FILES = COPYING

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
