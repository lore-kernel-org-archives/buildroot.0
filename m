Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACA0EEE25C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 21:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E29F405FF;
	Thu,  1 Jan 2026 21:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M8NK98r4lcIG; Thu,  1 Jan 2026 21:59:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA172405B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767304768;
	bh=kJhaEV6kkyJMJenRVXHwWCrUMPVYZrLYuH1YxvQHQC0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LpK1g6yXnEqY1IeUG4FBxpfpSylGYt3+w4USs7Hm5AC7Yda8B4gSWJD2g/BNEoqoa
	 pGoXTMdXbLhKx8rKObNYQ4NSS/zsjbkdtWwdr/sY7cuYyZ2wkf+nokm7oQkmIDjN7M
	 mSVtBY+jhfI0XpKdoLiAEQEsxm+/bvqGbM80J+kO3lReWWYXFYMysKdZE2Nn+bZazj
	 i0v874Z+w9I89Jtb93b0Z1UrWY9Y0uxboYum+7f5xT5z177czbyGqRzGO34khHyHlT
	 W7MItwTa/WCW0jFNmsy014t3VcIfJ93pI34KPv1c8hjTuWuWAHN5sY4UF3X3Zf28md
	 qbFj+odwd9vLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA172405B6;
	Thu,  1 Jan 2026 21:59:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 37CB319D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 284436071C
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:59:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ceRIInok4swn for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 21:59:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 41367606F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41367606F7
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41367606F7
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:59:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 84A491A25B3
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:59:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4B9EC60749;
 Thu,  1 Jan 2026 21:59:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5C747113B0713; Thu,  1 Jan 2026 22:59:22 +0100 (CET)
Date: Thu, 1 Jan 2026 22:59:21 +0100
To: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101225921.2902d4fc@windsurf>
In-Reply-To: <20251120220801.1877397-1-mr.zoltan.gyarmati@gmail.com>
References: <20251120220801.1877397-1-mr.zoltan.gyarmati@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767304762; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Q8u5m0wBYJpMdfnDuU9v4f8tpUL5pMLF51+4lEtRRFo=;
 b=unxt3vu2zp4bNJvggpMWIV/ozXk74DjBGFlevvJ7J7a9rWZ/Bswk9VOtpatPYRiZmY6PWA
 +kbPZpnJq8fH+OcZaMuHu5SRlf3TupHaz8Y9UxaEh1j/53ONichryBM2CIMHqPrCjTyiSf
 OqISUTQVuXx3m3uXnDsB8yEkfpe4Yx3pvoCmfVESGnEIxGUTFXrBJ13cZTp0GMGTtIsWwk
 Ca6Dn+fBvSvYf8Xz68C7jA3pIuFrES3zSZtAlnhcModvyX4As29S7oPXzMl8J5GfoUcVXT
 WQMHSeHH2zumMRs9FmZRTn5jEB3Y1G6ng6eYbt1CHKpjG4g6ARko8yp9K7SC5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=unxt3vu2
Subject: Re: [Buildroot] [PATCH 1/2] package/quazip: add config option to
 enable building and installing unit tests
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Zoltan,

Thanks for the patch!

On Thu, 20 Nov 2025 23:08:00 +0100
Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com> wrote:

> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> ---
>  package/quazip/Config.in | 11 +++++++++++
>  package/quazip/quazip.mk | 10 ++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/package/quazip/Config.in b/package/quazip/Config.in
> index 4c7a187571..c6099719e5 100644
> --- a/package/quazip/Config.in
> +++ b/package/quazip/Config.in
> @@ -10,3 +10,14 @@ config BR2_PACKAGE_QUAZIP
>  	  archives. It uses the Qt toolkit.
>  
>  	  http://quazip.sourceforge.net
> +
> +if BR2_PACKAGE_QUAZIP
> +
> +config BR2_PACKAGE_QUAZIP_INSTALL_TESTS
> +	bool "Build tests"
> +	select BR2_PACKAGE_QT6BASE_TEST if BR2_PACKAGE_QT6
> +	select BR2_PACKAGE_QT6BASE_NETWORK if BR2_PACKAGE_QT6

I was initially a bit surprised that you didn't have the same for Qt5,
but test and network are always enabled for Qt5, so makes sense.

> +ifeq ($(BR2_PACKAGE_QUAZIP_INSTALL_TESTS),y)
> +QUAZIP_CONF_OPTS += -DQUAZIP_ENABLE_TESTS=ON
> +
> +define QUAZIP_INSTALL_TESTS
> +	$(INSTALL) -D -m 0755 $(@D)/qztest/qztest $(TARGET_DIR)/usr/bin
> +endef
> +
> +QUAZIP_POST_INSTALL_TARGET_HOOKS += QUAZIP_INSTALL_TESTS

I've added a:

QUAZIP_CONF_OPTS += -DQUAZIP_ENABLE_TESTS=OFF

> +endif

And applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
