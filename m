Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B01C5AC80
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 08:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32D4080E04;
	Sun,  9 Aug 2026 08:26:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qi0P6Os3eTum; Sun,  9 Aug 2026 08:26:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29B9080DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786263995;
	bh=vVvCSaFXAi+A09PO/N9NlIzpJd2UgpGoi3M/OEZOHG0=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eOHSvh7x6S0DVEXXLVA1k01YNmDpG7fqq+l2GaglM7hifIDU4j6bbfMYWCKCXgegy
	 nnRZbZ/BZZ7503LGbphL+GQiPEQgGKxv/1kBlj6STPKeLU3zUqYqFXtkRzhRX+d62p
	 o5GgVXskfrVARb3uqYaoJclLAk009gotNNo5KE7B/08deqAQAYxgS8wBr3M0Rd0nxM
	 ujFxeVNzxk0EJtn8QnDeoiDQXeyBXOVvY4B4GslqyAbfbntLpduHTUdZ4/6lqX8Ysk
	 j7rcGg7dN55nUIzKbNH6/3PWklWnE/RlFMGZID4nIznLCdob23eeR42TCucJiSEQJ2
	 lMgAP7hMiV0ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29B9080DE5;
	Sun,  9 Aug 2026 08:26:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C144E10E
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 08:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A36A360635
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 08:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X8jqNeBvhft4 for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 08:26:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=155.212.184.193;
 helo=mail.rulkc.org; envelope-from=viper@landau.one; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A2406605F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2406605F8
Received: from mail.rulkc.org (mail.rulkc.org [155.212.184.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2406605F8
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 08:26:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 81C25100385; Sun,  9 Aug 2026 11:26:24 +0300 (MSK)
Message-ID: <946cece6-2a40-409b-86e1-44102d4a6138@landau.one>
Date: Sun, 9 Aug 2026 11:26:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: rulkc@linuxtesting.org
References: <20260801222945.1612760-1-viper@landau.one>
Content-Language: en-US
From: Konstantin Menyaev <viper@landau.one>
In-Reply-To: <20260801222945.1612760-1-viper@landau.one>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landau.one; s=dkim; 
 t=1786263984; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=W+5vhYBXKqTfzql3W07nQ+yHvhbQoUHnQWfBgNtBhIU=;
 b=dE+pl+zshSO53wjHqPSPGOC8sje9nqjyTNZmcM8xo9V3YIe/5v/Hz2fw0tRx6F+OCiXtoI
 Kl+eEzjthvGELhRz0Uy4Wg5oGOEwdcjFEDThOJucLaRNZ0rjgXfyLKjKcHWis64PYv5oZq
 qFuCqeUrH6h9QI30Oa4AGbg6Jax65z9Fn43CzBBV5GPA3pIiWdPjch8UtrW4bYOFbnbn/i
 ZbCqc5gm5NtqlS2HbmfCNnwO0+0ZENgEDhwMnLJFhzc+gCvCD3i6TJpaeS4u1hdjxJmcYI
 55zQn+R9oYycKlymWGDkRrFw5iywgHxsVnQc3FORiGnxjwpU6GexcHBu9gdt8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=landau.one
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=landau.one header.i=@landau.one header.a=rsa-sha256
 header.s=dkim header.b=dE+pl+zs
Subject: Re: [Buildroot] [PATCH 1/1] package/mtd: build with -fPIC when
 shared libraries are enabled
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/2/26 01:29, viper@landau.one wrote:
> From: Konstantin Menyaev <viper@landau.one>
> 
> Historically, mtd-utils only provided static libraries, so they are
> built without -fPIC.
> 
> This becomes an issue for configs with shared libraries,
> where apps may need to link libmtd.a or libubi.a
> into shared objects, resulting in relocation errors.
> 
> Build the MTD package with -fPIC when shared libraries are enabled,
> while keeping static-only builds unchanged.
> 
> Signed-off-by: Konstantin Menyaev <viper@landau.one>
> ---
>   package/mtd/mtd.mk | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index 2a625fccce..d67770d5ba 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -14,8 +14,13 @@ MTD_CPE_ID_PRODUCT = mtd-utils
>   MTD_INSTALL_STAGING = YES
>   MTD_DEPENDENCIES = host-pkgconf
>   
> +MTD_CFLAGS = $(TARGET_CFLAGS)
>   MTD_LDFLAGS = $(TARGET_LDFLAGS)
>   
> +ifeq ($(BR2_SHARED_LIBS)$(BR2_STATIC_SHARED_LIBS),y)
> +MTD_CFLAGS += -fPIC
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
>   MTD_DEPENDENCIES += libexecinfo
>   MTD_LDFLAGS += -lexecinfo
> @@ -35,7 +40,7 @@ else
>   MTD_CONF_OPTS += --without-zlib
>   endif
>   
> -MTD_CONF_ENV += LDFLAGS="$(MTD_LDFLAGS)"
> +MTD_CONF_ENV += CFLAGS="$(MTD_CFLAGS)" LDFLAGS="$(MTD_LDFLAGS)"
>   
>   ifeq ($(BR2_PACKAGE_MTD_JFFS_UTILS),y)
>   MTD_CONF_OPTS += --with-jffs

kindly ping
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
