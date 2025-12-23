Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14885E6FE43
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 21:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C700C60E88;
	Tue, 23 Dec 2025 21:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-FGslzpW2oX; Tue, 23 Dec 2025 21:25:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E057560E8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766525109;
	bh=jEwGdXGmzSLBpr75kDqWIpt5+XQ/tooyRbQeWWZr60Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nPPpsYLLUB6yt/xy/R/0hNF/HhqIPGu4VHSxnNnZ5qKrQNA7Xd5GhLl/WQ0CwWXET
	 bxNHu5wCwWmzfF9PKN/hbMLLOdKlOwuL+xfcVRUPyFyGiNULTkWe1Su5YIUxK6QSyN
	 qOmGa9EQC4sqrYhSA/l/Bs6igpdnJ7dCyRvgKO+u37sgddUWSA8EERtpUO+pNluVme
	 EoSBrZ0OjZiAWjq/5cmGZdK4FXwBg/xuPL87r4SC/FtcDRwZSBboeFEJb/mt9Sc15B
	 CR1tQQYqzkoZ8MmUhpqvnzKowQZeAeanzVs9yoIovL+w0kjIveY2j12arf4oW43RSI
	 EVylQ40XEsZiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E057560E8A;
	Tue, 23 Dec 2025 21:25:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E174BE
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 21:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 423EC60E8A
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 21:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TikrnCa7y_3X for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 21:25:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 350DF60E88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 350DF60E88
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 350DF60E88
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 21:25:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id EC2D1C1AE2D;
 Tue, 23 Dec 2025 21:24:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0DEF160716;
 Tue, 23 Dec 2025 21:25:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3216A10AB0CC3; Tue, 23 Dec 2025 22:25:01 +0100 (CET)
Date: Tue, 23 Dec 2025 22:25:00 +0100
To: Abelino Romo <abelino.romo@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20251223222500.34ad1120@windsurf>
In-Reply-To: <20251223222358.51a05729@windsurf>
References: <20241127052719.3689847-1-abelino.romo@gmail.com>
 <20241129221324.360497-1-abelino.romo@gmail.com>
 <20251223222358.51a05729@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766525101; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=QdokqoItelfObxuoblU4p46zROty5DFoPQjhySOaepQ=;
 b=vGbSw8xqtddj1bf3q8xu5gqhtSeLD4gvuonGCIImjrycv1vPIcbLaSsJ3hpghk8n5fsmSA
 qm353g8l1vZzCsrc7AvYBM4aCIB/qm0ZYCZsjAtL9czBaW4pjrZbJfp48uUeChzOzEmOCQ
 fCbIMBWU6gt/WdD1whthXHmJgqNCzslPhUCTKFz1CoxP5ZWkPWMzDLoWb+flgpRAajDNZE
 z2qryYxcc0+IjuYzRBASgRyEsd7Ye8GBTnXmCGS6maLuuTRIXTu33WpyC7yrhiNbb56bSv
 m5H+F/6+La83kzBfL3V4173kw31K1twRcmofgCko9JjS03pEHQ1S4ghzUKJjGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=vGbSw8xq
Subject: Re: [Buildroot] [PATCH v3 2/2] package/tpm2-tss-engine: add version
 1.2.0
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

Hello,

On Tue, 23 Dec 2025 22:23:58 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Sorry for the very very long delay in getting back to you. I wanted to
> apply this, but unfortunately, it causes a build failure when
> BR2_PACKAGE_TPM2_TSS_ENGINE_DIGEST_SIGN is enabled:

BTW, here is the defconfig that was used to produce this build failure:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_MD2 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_MDC2 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_IDEA is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_SEED is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_DES is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_WHIRLPOOL is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL3 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_WEAK_SSL is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_CAST is not set
# BR2_PACKAGE_LIBOPENSSL_UNSECURE is not set
# BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_ARGON2 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_CACHED_FETCH is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_CMP is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_THREAD_POOL is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_ECX is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_PADLOCK_ENGINE is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_MODULE is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_QUIC is not set
# BR2_PACKAGE_LIBOPENSSL_SECURE_MEMORY is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_SIV is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_SM2_PRECOMP_TABLE is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL_TRACE is not set
BR2_PACKAGE_TPM2_TSS_ENGINE=y
BR2_PACKAGE_TPM2_TSS_ENGINE_DIGEST_SIGN=y
# BR2_TARGET_ROOTFS_TAR is not set

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
