Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32148D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2FE040B3D;
	Wed,  7 Jan 2026 17:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUttD_I5hZnR; Wed,  7 Jan 2026 17:50:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2835840E18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808236;
	bh=WmQOM4m8iVM8l0+tvAX/kHwpFIstujIl03D94zFxeoI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RQCiZ7h/NXaj0xdEVTN8TZ+aQIdn4f1GnJqCtIpCsLuGaINXAljbAEI+kHvHngmZa
	 /MT0DcWIJjTQ2BuKxxktfmG+bo9l0jrHwQSSHJ3VbQ124dHN109Sp6vYGbxHSXVeZw
	 eovW2R03wAM+KDvqGS5ubQjq62QDirWAdyi7BJ37/2bxD1GMReSy6Oc7TdED/v+S5B
	 u/A5c8rCGs90YCCXsVRHCWakhIz6FMMBJecQb38gY22lmF/dt41g8PC/gqIUmwbYR3
	 XbTJ7TV5JpBxLDoCbnJvBfeTx5sskhAjSoXTsDkdZM5dFwJc7QjiGO6wGIXidmgOEM
	 DGH16ojmBgRpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2835840E18;
	Wed,  7 Jan 2026 17:50:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A6E625B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FA6540128
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWA6S59HQE4a for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5B93640160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B93640160
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B93640160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 842F1B97A596; Wed,  7 Jan 2026 18:50:31 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:30 +0100
Message-ID: <20260107175030.226559-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-20-bernd@kuhls.net>
References: <20251221223441.185169-20-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808231; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=Hwg652kVPdZ6psXv8cYXmBLw4QeJaXmLcvc8sdzfMho=;
 b=OvV4uhkvGaadmgqCcTvkJh6SGfnSRfjNrKlG3FxfDrtJ/b9dLjdr+ZsaWHofZHN7f4EVtk
 R6HbMkd+53RRr/2hag04hZKziDxJy/v/asarFbtMRbtvmMKCCe8fPCzgt6U+B3g2COGOY5
 cA+cfOSDnKk8OZnpvrR0xbz7KPzNiDuN7BPsS8wtVgXFeQE4g/HEHpL8FFxgS0VzJQC8QB
 tyquHLgcalqDOPSbib1Q9/oN7W3lO21iqyT4+RbG5SqgRyT6/KOD5GeAfXUOXkgjIsHqg2
 1htsJoHJ6ITY2tfTLiQwsD3344t8LLAobIvarw6XMZ0YsLzkA66iVWBu8KBEnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=OvV4uhkv
Subject: Re: [Buildroot] [PATCH v2 20/23] package/python-pynacl: fix sort
 order of dependencies in Config.in
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Updated package as computed by scanpypi.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/python-pynacl/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-pynacl/Config.in b/package/python-pynacl/Config.in
> index 0553d82ce9..51623a0a70 100644
> --- a/package/python-pynacl/Config.in
> +++ b/package/python-pynacl/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_PYTHON_PYNACL
>  	bool "python-pynacl"
> -	select BR2_PACKAGE_LIBSODIUM
>  	select BR2_PACKAGE_PYTHON_CFFI # runtime
> +	select BR2_PACKAGE_LIBSODIUM
>  	help
>  	  Python binding to the Networking and Cryptography (NaCl)
>  	  library.
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
