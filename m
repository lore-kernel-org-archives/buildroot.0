Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33FCD0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CC7840B9A;
	Wed,  7 Jan 2026 17:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EuWyb7tOPBIG; Wed,  7 Jan 2026 17:56:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F06041108
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808571;
	bh=pjdGwuwj3F9ga3L5Eg6ibHKCOMAVWQwaT5esZyQUWfU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AmmBD0gor/RKyp/LoVqt2Gonwt+nbijQu/EZjlJO/8UdfVjDdJyXHbgXaJhW/UlsU
	 7aFX67wqGSmtWvtmeo/VUxsO1B6+T0wEEzwTqbxE8YvV3CEAROfhaX/b57gpmzsgCN
	 Fd+O6wUH0+JPMN4XSXtVjSBy2C/twRm8bZ0Mc9oVRViKk5obyUC8Wg7m0MBvLZIqZP
	 GZV2en/aI7j1kLx/whgI7eg3Aj5Wjo/9aKwZiLXea4Zf9q0GelZdmT2sVeLZPSZ9MX
	 t4apTLSYpjfZ2Fy6+qI3ez8pPe9WQO2UuQmMiVzQNf2GeAtnMvKzQptrETARWNYZ+C
	 HSaYFSWAOpstQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F06041108;
	Wed,  7 Jan 2026 17:56:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 35FFC25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2799960667
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2w8xcSLRYX0k for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:56:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 14B3F605CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14B3F605CD
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14B3F605CD
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:56:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6DB8DB97A704; Wed,  7 Jan 2026 18:56:05 +0100 (CET)
To: Viacheslav Bocharov <adeep@lexina.in>
Cc: Arnout Vandecappelle <arnout@rnout.be>, buildroot@buildroot.org,
 Julien Olivain <ju.o@free.fr>
Date: Wed,  7 Jan 2026 18:56:04 +0100
Message-ID: <20260107175604.230781-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223084436.984227-1-adeep@lexina.in>
References: <20251223084436.984227-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808566; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=hmY9IZOo2EJ/CGLabqIu/0z05IJV1hImoxURdt6tfAg=;
 b=gSLm5MOUQtx1jh049ohGYcW9LDP3/Lxwgu7PrrrYmf+1V4H8uqBrtOQI8qaKLoWJooHNtk
 vtiVjSewGgx5IyQsq4fCKazbpvu7bUqZ8oyOpbk7jS2FrT3LZjTNLro8dYsyqcA/+MMWhk
 2/NByp4JG8fmb3Wirlt7nlDDbBLm8k8w4AX0bFOda0+FCB1QMnJ75wsacsz7ysm12RA8tb
 cmlJd/VegHdvVgx17pAqtzmeWftKIqYXNnQePkzjYOTs5Uqd/NKu2HCf9lUUb/6b5i92fv
 HYmGJOI4TGp0kNZvXifZTemrxm/yRXlqv5NPE59DUqNZPKSIs2vx8FSiC6ESJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=gSLm5MOU
Subject: Re: [Buildroot] [PATCH] [RESEND] package/rtl8822cs bump driver
 version to latest with support kernel 6.18
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
> Update rtl8822cs driver for Kernel 6.17/6.18
> Fixes: https://autobuild.buildroot.org/results/bafd5af112e49359201580ece3a12bc8724914fe/
> 
> Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>

Applied to 2025.11.x. Thanks

> ---
>  package/rtl8822cs/rtl8822cs.hash | 2 +-
>  package/rtl8822cs/rtl8822cs.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
> index 2a649fe493..ff2e5d3eaa 100644
> --- a/package/rtl8822cs/rtl8822cs.hash
> +++ b/package/rtl8822cs/rtl8822cs.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  12bf44c0dbce921440f5800a98e877fadda2d656824cca546c2b9e0e99e6a489  rtl8822cs-0ef9ddd619d2a386df90fd7c32b65958b0d675ed.tar.gz
> +sha256  71d1d29d1f04a9decaba4e23df0b213fb454c4cf15f6305133d2821188b588b0  rtl8822cs-2519c0b865e31d93daa65fc5b1168722f6ec7526.tar.gz
> diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
> index d10388c2e1..c6a541dd99 100644
> --- a/package/rtl8822cs/rtl8822cs.mk
> +++ b/package/rtl8822cs/rtl8822cs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RTL8822CS_VERSION = 0ef9ddd619d2a386df90fd7c32b65958b0d675ed
> +RTL8822CS_VERSION = 2519c0b865e31d93daa65fc5b1168722f6ec7526
>  RTL8822CS_SITE = $(call github,jethome-iot,rtl88x2cs,$(RTL8822CS_VERSION))
>  RTL8822CS_LICENSE = GPL-2.0
>  
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
