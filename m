Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAD4D43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B281581131;
	Thu, 11 Dec 2025 19:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i3xTfrSszcfI; Thu, 11 Dec 2025 19:32:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C506B8117E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481551;
	bh=CDSDdrxjOtfxsffejEF5Xm2QV1w3WiJG3yr1Vhpaydo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Hv+653JQ4iMHb3SOoP27/UYGdk7reGXpb308Mzpuk3MvartIgplTG9ecjkEGV86x/
	 K0oFbaguffNDRHofr1CdocJdIiPvElQYLyAxcHk2pxDNtXED446J+SDrg50xh+dKGs
	 pXlB6RajDH+9tIWf5s2zQ/i+TxX6/Q2FbojQh+8YmiMrFIz+reFEIPTe0H6W3wYcmo
	 eUIAGvhWyuuNSFwmmhTB+Gt95+rDjWK7QHTvZ/jY01rvabZpBYTqDA9GHaJe2h01A2
	 Y+W5oS8dxNgAtqSLELsd5GXikeg1FCUhIkKjKRKAEYgsu04gVltM4R40z8VY0Ue/fd
	 vJWZnAUQ8gXnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C506B8117E;
	Thu, 11 Dec 2025 19:32:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C9F66E7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B08B040027
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRwiMwN8c5lx for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:32:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A16AE40012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A16AE40012
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A16AE40012
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CC20CB979EEF; Thu, 11 Dec 2025 20:32:27 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:32:26 +0100
Message-ID: <20251211193226.1100735-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203180334.2117343-1-bernd@kuhls.net>
References: <20251203180334.2117343-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481547; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=8BWqUggekKouS/5C1ctI7yv8sZIA4RWHgpuSvj4yRV0=;
 b=CxfFC+cSwSyvZIVZzdAcWr6sDcC4Fe+2ebVW0ilLuQqmsN9+Q3T6eOGna5pvFz4yERq53R
 FUT1g4SQCmJHsz2r29M6w9Wv3UCKLq4/7AUEB2rXilnHUzwz+BwhgcXTLcjJ0ljkrkr5FZ
 4B4ixQBz/6jGSCzYDhPi/bt8j6wm/rzENfWlAqteoAAZTDmT6QN2DAsE5UOETbqt5FNOIr
 8GB6p4AWjw5pCFfG9w3RRVV1C8JL0oDL8VlByvvI5EL4TuHb6McyOm0O2Io6CxmBQsXeHM
 3adtKg2TQKt4VuUETOC/7aYM6BBBgxoeR4fih667w6Qlu22hXriiC/sgtFvKYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=CxfFC+cS
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: bump version to 3.13.10
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
> Release notes of this bugfix release:
> https://www.python.org/downloads/release/python-31310/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.08.x. Thanks

> ---
>  package/python3/python3.hash | 6 +++---
>  package/python3/python3.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python3/python3.hash b/package/python3/python3.hash
> index d1a8f3780f..778dca3b69 100644
> --- a/package/python3/python3.hash
> +++ b/package/python3/python3.hash
> @@ -1,5 +1,5 @@
> -# From https://www.python.org/downloads/release/python-3139/
> -md5  516aabdf3de01eeefb6de1aacf9df810  Python-3.13.9.tar.xz
> +# From https://www.python.org/downloads/release/python-31310/
> +md5  5ada33c7f08d5d2df881657bdb8e848d  Python-3.13.10.tar.xz
>  # Locally computed
> -sha256  ed5ef34cda36cfa2f3a340f07cac7e7814f91c7f3c411f6d3562323a866c5c66  Python-3.13.9.tar.xz
> +sha256  bc673c04375a1a3f0808c27ba8f0411ab811ad390a8740318ccb9c60fad8fd77  Python-3.13.10.tar.xz
>  sha256  78b12c3a81360b357002334f0e70ea0e92eebf7a9b358805c03c48484945f3bb  LICENSE
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 7aad14a8ca..6200b8af4e 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  PYTHON3_VERSION_MAJOR = 3.13
> -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).9
> +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).10
>  PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
>  PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
>  PYTHON3_LICENSE = Python-2.0, others
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
