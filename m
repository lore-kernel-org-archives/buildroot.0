Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4D3CD4F3D
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 19:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B08B4418A0;
	Wed, 20 May 2026 19:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGOjmgB8Tu6y; Wed, 20 May 2026 19:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1551409AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779305827;
	bh=VbsC9tLSyD6fvSyAwV5H2qhTA4hZcVeZijHdWwlSmAA=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=kReMH3INZ5bs70w293WUwD4JUo3ccf8MxXs9S6gwyDpQVY6MP8l7ewoyNt3sLyM1n
	 KHoc3lPFtJ9L2XNQ/EyuJUQYncuJ/KXFc2Wpn5Nni7oTxVePJzf0A1g+majb+0BJVo
	 dURD7KsxPq/M6rxiALXeedDGRIVYKkQtlDVhqEE2PTty1v/rRVcvIbkEj1SHKbEn8m
	 3Ma06T+YNahiHszpS2ioisMQVNK0nJ3+v3SWOOLDSeN/5zX+3/uJSzcBG9RnefFa4D
	 R+mqoDR+S6ibPuxqFrj7AH9jNenneRjgF7/2GeNjoXN9TDpX2KjoPxPay8XWy1ioHj
	 mLDcG9sonSRxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1551409AF;
	Wed, 20 May 2026 19:37:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C2641B2
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DE6061386
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_O2R5pQqGoc for <buildroot@buildroot.org>;
 Wed, 20 May 2026 19:37:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 066C861374
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 066C861374
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 066C861374
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:37:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C2EE7B97C45F; Wed, 20 May 2026 21:37:02 +0200 (CEST)
Message-ID: <d543a778-def6-40a2-bc9d-54bf7e3bc1b9@rnout.be>
Date: Wed, 20 May 2026 21:37:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260520163653.1086908-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260520163653.1086908-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779305823; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=p2s7S1pkAuJRXIN0qz9VnL9fbeJeVdf2r/P67UzuT9M=;
 b=MSYQAeOgCxTiFradFbtxoQdbf3o3QGKB/BjmoXaWyez2GQnhMHFXhSlH51p3U3UigQY/Lh
 Lsx/uwim/FUDsESTHJS/e45IhDIKLztVJ8yv0cm1GnWA6oxJdy4uonjSy0/809J4uf0+Up
 CSXHGwJDiqvqM/IZ1CVriR5PD4Ej3O6R4jnJhaCTaNcmPh61fu5H+bL+H/QRkshvNIvFcI
 f+JLwUY+tu6iY+0+saUANzR8LlwjZEakcOjd6QP9HJoM6R6kW8aFhFy+bekyS+XoSkkW85
 9uGx9JXgsFnZzSAVcGuRqRM4sJzyKcg65Stut9Irxyert6YXH0melzcJ978F1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=MSYQAeOg
Subject: Re: [Buildroot] [PATCH 1/1] package/rsync: security bump version to
 3.4.3
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



On 20/05/2026 18:36, Bernd Kuhls wrote:
> https://download.samba.org/pub/rsync/NEWS#3.4.3
> 
> Fixes CVE-2026-29518, CVE-2026-43617, CVE-2026-43618, CVE-2026-43619,
> CVE-2026-43620 & CVE-2026-45232.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/rsync/rsync.hash | 4 ++--
>   package/rsync/rsync.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
> index 933d330323..666bb5cf99 100644
> --- a/package/rsync/rsync.hash
> +++ b/package/rsync/rsync.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.2.tar.gz.asc
> -sha256  ff10aa2c151cd4b2dbbe6135126dbc854046113d2dfb49572a348233267eb315  rsync-3.4.2.tar.gz
> +# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.3.tar.gz.asc
> +sha256  c72e63ca3021cbc80ba86ec30102773f4c5631fbc492b52e773b3958f82a53d3  rsync-3.4.3.tar.gz
>   # Locally calculated
>   sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
> diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
> index 3282a759c6..5b4345d036 100644
> --- a/package/rsync/rsync.mk
> +++ b/package/rsync/rsync.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RSYNC_VERSION = 3.4.2
> +RSYNC_VERSION = 3.4.3
>   RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
>   RSYNC_LICENSE = GPL-3.0+ with exceptions
>   RSYNC_LICENSE_FILES = COPYING

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
