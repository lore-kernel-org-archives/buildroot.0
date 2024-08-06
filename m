Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CD3C3DA64
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 15:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33CF740373;
	Tue,  6 Aug 2024 15:03:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t29gD7u1KfSF; Tue,  6 Aug 2024 15:03:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC6514052E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC6514052E;
	Tue,  6 Aug 2024 15:03:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2DCE21BF2B0
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 15:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1ADC14052E
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 15:03:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVMVihkT2mHj for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 15:03:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98F4D40373
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98F4D40373
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98F4D40373
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 15:03:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C96F31BF20C;
 Tue,  6 Aug 2024 15:03:37 +0000 (UTC)
Date: Tue, 6 Aug 2024 17:03:36 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240806170336.0dd5305c@windsurf>
In-Reply-To: <20240806053623.776588-1-bernd@kuhls.net>
References: <20240806053623.776588-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722956618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V6Yf+S1yMj0BahQ9DdUEnFdTQi518woNdwWfOLJ8c2c=;
 b=l5sY/3WwnVpFQ0GCB7r6Pgv49z5OsxKBqmEj7vQz0QPOKVhALscZObl1ScLUzm18J9C3Gw
 SZtTajWlszwSHdiHeyVL6GBy7EHoK9FTt0qhkGac6fBokpV9zHH8fjmLtanxr2bY9Wr4Jv
 WVWf8Fiwbm08a9s2T/uX/7lkC7UIi5dl18XZiM9W8kK918w3dVEGPPzDxPhiENnkm6Lijs
 DhTqEK15hSnjmw9BCD7ChFtUB46UNTqRmxCgW0l8XoKAVpois9QWUaoo5eNGDtJ0BpB2Fd
 z610W830z0R3L/yodGGgcNd1zRMlM2ZloUil4U35q6PXfZN5/mUXX8XQgxW76A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l5sY/3Ww
Subject: Re: [Buildroot] [PATCH 1/1] package/openconnect: Fix openssl support
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  6 Aug 2024 07:36:23 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Enable needed OpenSSL options even when GnuTLS is enabled by respecting
> BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL=y set by other packages.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f53/f535a63b80f2efe59709d5d9b59bc27ba66d2c26/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/openconnect/Config.in      | 4 ++--
>  package/openconnect/openconnect.mk | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/openconnect/Config.in b/package/openconnect/Config.in
> index cacf617fb9..6bc747bc2d 100644
> --- a/package/openconnect/Config.in
> +++ b/package/openconnect/Config.in
> @@ -4,8 +4,8 @@ config BR2_PACKAGE_OPENCONNECT
>  	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
>  	# configure: error: LibreSSL does not support Cisco DTLS.
>  	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL if !BR2_PACKAGE_GNUTLS
> -	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if !BR2_PACKAGE_GNUTLS
> -	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if !BR2_PACKAGE_GNUTLS
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL

Using BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL seemed not really
appropriate here. Other packages that have to do this use:

	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL

so I changed to this instead.

> -ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +ifeq ($(BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL),y)

This change was not needed, so I dropped it.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
