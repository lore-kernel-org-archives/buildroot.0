Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC06DC5B56A
	for <buildroot@archiver.kernel.org>; Wed, 12 Aug 2026 09:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92EE640625;
	Wed, 12 Aug 2026 09:29:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rk1Yg4xSqk22; Wed, 12 Aug 2026 09:29:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9CC74084B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786526946;
	bh=WR5dSwOZHUdcYFDYQ797n3woIVIpcpIE4UzCBfUcRhs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QtCYpoDwPteREZUboNcmRrdphnXEooA4aTXPbCALHifG6RzisvfHs6WooH80gjTkX
	 plBIJ+mcVsvqT/TAZGlx2nm7y9Qec9r6/o5mvyAKYjvtT5XkkBuPVXSQALMolwDgle
	 g1+vF3997UGSYJKoFuXogYnjvYdKJUdCzeNVUjndE7WiCNxa3KDEVmFg4+49E1z9th
	 h2D40cb5SqZEtwfECPETeBVCYrWkqv4qaTm14d7pOc8B9a7FL+hVQNTGASLWBQ458p
	 sUG/42sSzq05Ed2dsDEkqTXilOW+dXfW9xtf1GSEt/o4hqfPxdKpgt1ExGqCtYgklw
	 mIIocuEQbds3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9CC74084B;
	Wed, 12 Aug 2026 09:29:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B85B049B
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 09:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E51C608AD
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 09:29:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fu3u_sQd7gMs for <buildroot@buildroot.org>;
 Wed, 12 Aug 2026 09:29:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C42EA608A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C42EA608A7
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C42EA608A7
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 09:29:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BE5911A15B5;
 Wed, 12 Aug 2026 09:29:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8C2B46045E;
 Wed, 12 Aug 2026 09:29:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B7A4411C4CAE5; 
 Wed, 12 Aug 2026 11:28:56 +0200 (CEST)
Date: Wed, 12 Aug 2026 11:28:55 +0200
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Cc: buildroot@buildroot.org
Message-ID: <anw8fVxA-RNGqSl1@windsurf>
References: <ansJ5dXXblvYeMLB@windsurf>
 <87h5kzya8h.fsf@li-0ccc18cc-2c67-11b2-a85c-a193851e4c5d.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h5kzya8h.fsf@li-0ccc18cc-2c67-11b2-a85c-a193851e4c5d.ibm.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786526937; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=gM1CyFrBDkziwmWyBlvW5y/Xldcs43nDnC740gbaF1A=;
 b=1JhBfsGOMROd89q9VR3dJBH9me7K2E6NttKT0/uz7uF2WmYJl35c5n8GuJY3WPGmqpXZLw
 rHpW3maWoKdjIiYecNQfLiL1OK96rpgX8oHlod6dasTucfM5qL6/DBuZMYw+Yxr9xae2aG
 4OKIOqYqcKagvX38oSOxfybPfsL7xl2CByMcdcFuWU0KMCCoHdY2lNEix16HwglofzkEM4
 WAWoBff5sEXodm5YWTFOX2DIiskHAL9+x/jFhrnkMZHZseAb1Lf38FBrb7MpeJ/fknE09z
 jy7xFcx2S7T52ZKxJ9RkHpGgpR08rXPSYafQszHfAM4zx5eZvCZDN2A4unAr/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=1JhBfsGO
Subject: Re: [Buildroot] S390 Buildroot/gcc build issue
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

On Wed, Aug 12, 2026 at 11:11:10AM +0200, Alexander Egorenkov wrote:

> the types _Decimal* require for the host compiler to be built with
> --enable-decimal-float.

What do you call the "host compiler" in this context?

Are you talking about the native gcc compiler available on the host,
or the cross-compiler built by Buildroot?

> 
> package/gcc/gcc.mk:
> -------------------
> 
> HOST_GCC_COMMON_CONF_OPTS = \
> 	--target=$(GNU_TARGET_NAME) \
> 	--with-sysroot=$(STAGING_DIR) \
> 	--enable-__cxa_atexit \
> 	--with-gnu-ld \
> 	--disable-libssp \
> 	--disable-multilib \
> 	--disable-decimal-float                 <----- !!!

These are the common options...

> Can we turn --disable-decimal-float into --enable-decimal-float on
> s390x arch ? It fixed the problem for me.
> 
> package/gcc/gcc.mk:
> -------------------
> 
> ifeq ($(BR2_s390x),y)
> HOST_GCC_COMMON_CONF_OPTS += \
> 	--with-long-double-128 \
> 	--enable-decimal-float                 <----- !!!

and for S390, it gets overridden.

See: it's the same variable that gets appended, so at the end we have:

HOST_GCC_COMMON_CONF_OPTS = \
	[...]
	--disable-decimal-float \
	[...]
	--enable-decimal-float

So on S390, the cross-compiler is built with --enable-decimal-float.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
