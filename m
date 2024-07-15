Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893D3C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 12:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26209405C9;
	Mon, 15 Jul 2024 12:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-muzr6ji2U2; Mon, 15 Jul 2024 12:34:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D653C405CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D653C405CC;
	Mon, 15 Jul 2024 12:34:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D1851BF3B8
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88C51405CC
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mvcDXBmh2Ezc for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 12:34:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6220F405C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6220F405C9
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6220F405C9
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 12:34:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76B0C60007;
 Mon, 15 Jul 2024 12:34:36 +0000 (UTC)
Date: Mon, 15 Jul 2024 14:34:34 +0200
To: Ben Hutchings via buildroot <buildroot@buildroot.org>
Message-ID: <20240715143434.6ae4f592@windsurf>
In-Reply-To: <3c8dd9da9315d5ed33b43fdbfc5898573d966a84.1712957992.git.ben.hutchings@mind.be>
References: <cover.1712957992.git.ben.hutchings@mind.be>
 <3c8dd9da9315d5ed33b43fdbfc5898573d966a84.1712957992.git.ben.hutchings@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721046876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PVYNt0LU/727OasVtTJ4IttZu0/ahVEA5b+QMoUFc0I=;
 b=Xn8ctPiBifd8zN1AlJxb6d8z+6weLtwSGiuc0SeHWXDJSRahpIAcYW84dLeRA6q5ktKdf8
 Wk2kSelthqLKav+1H0QQn/Mj7MOLGPBpjXHmA2TcjUP09wjb3uCvv8DqgTd3lvwkscvbET
 Wr8wpX/cCwsmeFwIdjnKZP33fLJ2adwmSbEioKO3mpyqKM5xIiA1OZkomQHRJGoh1kylTB
 fHlGXGCk7HGmyJNyi2V9qvzI8/oRSVS9uDi9YuS7GSy+7BVZQG9Y/O3rUU3tFZZJA4utzE
 W7yfT940lGDjFB/KQbDeVqFgWpqx76TfAqfOAASYH7ZPJLcZVHU6N38cf50Zig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Xn8ctPiB
Subject: Re: [Buildroot] [PATCH 4/6] package/libgcrypt: Add host package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Ben Hutchings <ben.hutchings@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Apr 2024 23:43:08 +0200
Ben Hutchings via buildroot <buildroot@buildroot.org> wrote:

> This is needed to support a host build of gnupg2.  It is not directly
> selectable.
> 
> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
> ---
>  package/libgcrypt/libgcrypt.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
> index 2e4bf7448e..af342c6948 100644
> --- a/package/libgcrypt/libgcrypt.mk
> +++ b/package/libgcrypt/libgcrypt.mk
> @@ -13,6 +13,7 @@ LIBGCRYPT_INSTALL_STAGING = YES
>  LIBGCRYPT_DEPENDENCIES = libgpg-error
>  LIBGCRYPT_CONFIG_SCRIPTS = libgcrypt-config
>  LIBGCRYPT_CPE_ID_VENDOR = gnupg
> +HOST_LIBGCRYPT_DEPENDENCIES = host-libgpg-error
>  
>  # Patching configure.ac and Makefile.am in 0001
>  LIBGCRYPT_AUTORECONF = YES
> @@ -20,6 +21,8 @@ LIBGCRYPT_CONF_OPTS = \
>  	--disable-tests \
>  	$(if $(BR2_OPTIMIZE_0),--disable-ppc-crypto-support,) \
>  	--with-gpg-error-prefix=$(STAGING_DIR)/usr
> +HOST_LIBGCRYPT_CONF_OPTS = \
> +	--with-gpg-error-prefix=$(HOST_DIR)

I've added --disable-tests here, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
