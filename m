Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E156CCAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA6316F577;
	Thu, 11 Sep 2025 20:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S53JjYoeSRiF; Thu, 11 Sep 2025 20:04:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B746C6F594
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B746C6F594;
	Thu, 11 Sep 2025 20:04:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 142A2443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0567284BDB
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fhTXl66IR3iz for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:04:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09AFE84BCD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09AFE84BCD
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09AFE84BCD
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:04:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0EB19B978815; Thu, 11 Sep 2025 22:04:13 +0200 (CEST)
Message-ID: <45bdae30-9c3b-486c-a21e-1ebb28455b94@rnout.be>
Date: Thu, 11 Sep 2025 22:04:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
 <20250910213241.1529448-12-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250910213241.1529448-12-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1757621053; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Ta+ZPQkETd4gRCtVnkS88B3+naxp/Nb3oTycp9bAukU=;
 b=oK/Mjrlf5lKTr9kd9oDOnMFXTn+JbS3NKr6j4Sl3I3v0DQp5i+jPn1exInCOLmdbDjdkn5
 oa1fDZMbx5g6RnpbuUe5BfV5U/5jzl+SI9t8nZgCopGsMXnZvuU3H44Vr0L0uPLmFt2uFA
 9tDmQ2KJfvU8NurojY+Sh3EonlbxesWMbMpYkdyYVUZL8LwSUcp5hodLYMgiqEJSOuniim
 H9KXNnKeNLMUxf5SruSjusa6XvXiPeS7oQ8Zxa/tl2wgZs63TNe4GZTdXBPDTJh1i+MZH/
 U1A2WGZsppbyJ2UOtNn8I0/m+TxJosjvYYPKAMRcixGd8sHeKHa02Ojq1Z/vEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=oK/Mjrlf
Subject: Re: [Buildroot] [PATCH 11/23] package/libsexy: remove package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/09/2025 23:32, Thomas Petazzoni via buildroot wrote:
> libsexy requires libgtk2, which we're about to remove, so let's drop
> libsexy.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   Config.in.legacy             |  7 +++++++
>   package/Config.in            |  1 -
>   package/libsexy/Config.in    | 11 -----------
>   package/libsexy/libsexy.hash |  3 ---
>   package/libsexy/libsexy.mk   | 14 --------------
>   5 files changed, 7 insertions(+), 29 deletions(-)
>   delete mode 100644 package/libsexy/Config.in
>   delete mode 100644 package/libsexy/libsexy.hash
>   delete mode 100644 package/libsexy/libsexy.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index f1f9dd2cfa..548e517b42 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>   
>   comment "Legacy options removed in 2025.11"
>   
> +config BR2_PACKAGE_LIBSEXY
> +	bool "libsexy has been removed"
> +	select BR2_LEGACY
> +	help
> +	  The libsexy package has been removed, as libgtk2 has been
> +	  removed as well.
> +
>   config BR2_PACKAGE_LIBGLADE
>   	bool "libglade has been removed"
>   	select BR2_LEGACY
> diff --git a/package/Config.in b/package/Config.in
> index d54c579b82..317030a44e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -419,7 +419,6 @@ comment "X applications"
>   comment "X libraries and helper libraries"
>   	depends on BR2_PACKAGE_XORG7
>   
> -	source "package/libsexy/Config.in"
>   	source "package/x11r7/xkeyboard-config/Config.in"
>   
>   comment "X window managers"
> diff --git a/package/libsexy/Config.in b/package/libsexy/Config.in
> deleted file mode 100644
> index a2a2cc820c..0000000000
> --- a/package/libsexy/Config.in
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -config BR2_PACKAGE_LIBSEXY
> -	bool "libsexy"
> -	depends on BR2_PACKAGE_LIBGTK2
> -	select BR2_PACKAGE_LIBXML2
> -	help
> -	  libsexy is a collection of GTK+ widgets that extend the
> -	  functionality of such standard widgets as GtkEntry and
> -	  GtkLabel by subclassing them and working around the
> -	  limitations of the widgets.
> -
> -	  https://blog.chipx86.com/tag/libsexy/
> diff --git a/package/libsexy/libsexy.hash b/package/libsexy/libsexy.hash
> deleted file mode 100644
> index 6f47e8ba7c..0000000000
> --- a/package/libsexy/libsexy.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Locally calculated
> -sha256  8c4101a8cda5fccbba85ba1a15f46f2cf75deaa8b3c525ce5b135b9e1a8fe49e  libsexy-0.1.11.tar.gz
> -sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
> diff --git a/package/libsexy/libsexy.mk b/package/libsexy/libsexy.mk
> deleted file mode 100644
> index b079264122..0000000000
> --- a/package/libsexy/libsexy.mk
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -################################################################################
> -#
> -# libsexy
> -#
> -################################################################################
> -
> -LIBSEXY_VERSION = 0.1.11
> -LIBSEXY_SITE = http://releases.chipx86.com/libsexy/libsexy
> -LIBSEXY_DEPENDENCIES = libgtk2 libxml2
> -LIBSEXY_INSTALL_STAGING = YES
> -LIBSEXY_LICENSE = LGPL-2.1+
> -LIBSEXY_LICENSE_FILES = COPYING
> -
> -$(eval $(autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
