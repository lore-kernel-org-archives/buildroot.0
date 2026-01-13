Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E6BD2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F82D8413B;
	Tue, 13 Jan 2026 19:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0fYazPDvTuSI; Tue, 13 Jan 2026 19:45:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 774DA8413D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333539;
	bh=Tpa86RCdaLlN8guib8PUG8TbCiGh6Z0Bv/zuCrwnmGc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OGSX6uxKRAVAAqRZ6ztfBS4xwfuQwwDe4ON5amMSMdMRP7EOvq8wCsHn/JvT3/iXW
	 9jQei/n8hYZR9BSMuiLmIMcjtiTNiE71vYqTPqP10LmnAyS/iGBH3HVgA3DQ/GzLk5
	 pkCFnOCGOpWADYu5uYeC08FumJilvSHyNfcJbSTLrXDUVTdcHZQvfcWqxiEc0YJVTT
	 KEO4BlQaAUKKEcRsS2LU4RQfed+Llw5a+g3EQT8b9WbT27D5A6NXhpfmt2cErdxUfR
	 IAXcLl+dsoN+6GS7rMN75OnYQX9lMCjR0q5p2DBRBqB4w1tP8tDfceJ2a2DPTEB7xR
	 PT9j1aMulX7UA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 774DA8413D;
	Tue, 13 Jan 2026 19:45:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6550231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD82960A94
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TP0D1UsCOyCW for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:45:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF8A2607C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF8A2607C5
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF8A2607C5
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C0A3CB97A887; Tue, 13 Jan 2026 20:45:31 +0100 (CET)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:45:30 +0100
Message-ID: <20260113194530.97762-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250909144713.569514-1-dario.binacchi@amarulasolutions.com>
References: <20250909144713.569514-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333531; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=r3b+D6HkBuDUGrkKplg05L52XaYtY+H7N8Rl1wWryVw=;
 b=YAclZGurzKxU9a1qTk64bQ5hC+1TCs61ZyXoR4VDIm8Qp+pev2eNQ/pW3M1mzq0he6gfwH
 6KRY+CGW3HxwmZ01EEW7Ea5MPlSAB6JXQzlrqPjtImytTauK4rp+CqsPnNLsDS5BWgdrih
 tbZvPHLOio334nh86N9UmC7JRO0NA0ektWiRL8WZiRPP5ryzGN1NNchSs/mf8d6BGYZ+L6
 6uNMNNYoWNIK0QfDd7EZ+JIPBeDZkQKpcMsMEXT8rgQFVMJHJnP/PSWwQvxjQ9TId69p+3
 juLpcRyjyXkBqNhLL8yxoWNdguIDp9jo2LHx7G2KSxuzDN7aeRz2jHhjgp1l2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=YAclZGur
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6base: use
 QT6BASE_CONF_OPTS for Vulkan
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
> The Vulkan option was appended to QT6BASE_CONFIGURE_OPTS instead of
> QT6BASE_CONF_OPTS, which is the variable actually used during CMake
> configuration. This prevented the feature from being enabled/disabled
> as expected.
> 
> Fixes: 1c27f3a12d77b ("package/qt6base: add vulkan option")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/qt6/qt6base/qt6base.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
> index 51a4f1b5be7f..3bf4a1221b43 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -183,9 +183,9 @@ QT6BASE_DEPENDENCIES += freetype
>  
>  ifeq ($(BR2_PACKAGE_QT6BASE_VULKAN),y)
>  QT6BASE_DEPENDENCIES   += vulkan-headers vulkan-loader
> -QT6BASE_CONFIGURE_OPTS += -DFEATURE_vulkan=ON
> +QT6BASE_CONF_OPTS += -DFEATURE_vulkan=ON
>  else
> -QT6BASE_CONFIGURE_OPTS += -DFEATURE_vulkan=OFF
> +QT6BASE_CONF_OPTS += -DFEATURE_vulkan=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_QT6BASE_LINUXFB),y)
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
