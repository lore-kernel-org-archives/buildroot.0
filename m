Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF02DCD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 14:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8853D41B40;
	Fri, 15 May 2026 14:13:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKC5i4wCOXhA; Fri, 15 May 2026 14:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82FB94170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778854434;
	bh=ZjkagdwvWBu4RtLPH4aB32H00ufIQG8EamxCeU13oHk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aUkdXvanAFyhOal3NZHl2mdBW0aGjitimd/GHexrYft627TQYYPj9VnSgWJ/OLm7L
	 XJXpgNmQnHGy8YBPEmDsQTNOtvuDpfXv5GVNuCgjlFJTK+F3k0yAIZS7TnFr8F2gjD
	 IkljfLL77SW1VWRFKwsoNt5tYZWHd60GrqBNi5duxygkx15ju0dn2NMSI5QUcsi+xX
	 b/NeoTWpaUDoQfmeksQmkMuDMUUeU9ML49iF8tuSloUNSEAqflxJz1tVokUt52Ob9E
	 scIxgVL1hDs7Pv9WxeJSxVs4JuTXq2VdWPI4XuGcsAt1mX3AK/5W+/ruxeHqqyIuG2
	 RCggqtHEJDXaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82FB94170A;
	Fri, 15 May 2026 14:13:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E8D7E7
 for <buildroot@buildroot.org>; Fri, 15 May 2026 14:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33F556126B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 14:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ex5oxzeqCiy3 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 14:13:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B27D607AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B27D607AA
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B27D607AA
 for <buildroot@buildroot.org>; Fri, 15 May 2026 14:13:51 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-453903ee4adso7955622f8f.3
 for <buildroot@buildroot.org>; Fri, 15 May 2026 07:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854429; x=1779459229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GjdwbhtWtk8EDIhhast86aViSsqMU5JKwlQXQNukYkA=;
 b=JNimG/HatVHGM5tibmX58vxBzAOk9OsAtzE8V8iwaW/RYlKnsbAhsdlfrU67BhA2Ai
 p87rhuEMmDxsaQav355IIAE45maF2vhDoXhPlw0zqygUQL1UWaSKLbr8CL1KYKsQgDy/
 HXEsl0MXQ9sm0EKu4QOBaah4L1tH8PJxtzQ5TSeOSasj9nV42Eg3AzDsZb9+ATUXBHv0
 krl3FGN+lUr2GlFKaQgdTvMwDrTNqggiIUAVyGVMcY0WwRn1th5jwfZuz6MEplG3fqlB
 X0T7xfoWoSrrys5hfkOlZMAc3W6biZ+a2Y90Ic/xDYn4D1Qnl1yYm0eqaXvienhetd21
 DVNQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9xEHJHy46/tSvT1Suac4+6WDQBtmXQVGuBSBJm5qcN2tWVh/FAi3hiw6ofMML7y6NQAYNTjo3k39o=@buildroot.org
X-Gm-Message-State: AOJu0YxvI/6sBFzTB0DhrH8VIAaPnh+IkzWsZ8SnY3sxBerW03mIZWeH
 QR7KM8ZvdDJTqgfWX/abS8XgJA+K274UjzFQi9U+O/BmYXVMld8gw++NaUVeG7J+zd0=
X-Gm-Gg: Acq92OEiSDNB0KQ1Fi0YU7YXjK/8Y0c7qpVfH4eTwkv6y7vYvGB5/AenO6LRGtWNu9D
 VM+shTNUCE8uLy53l6WqvF5TAEc11gGc07iNy27AjTJzGdrfUxrcN3QboM77g/PFD9ryseRRxnM
 +ivXQk78uj8SegW7iMSLYAGVpeArYcN/R9S7+t4m2fdnJCkWIiAZdMay9Zo91vAnSSrEJrSacKl
 rM8OTtaKMRpjJquL4QAt/c4jF3y/bSG43WWaQTuM76y1Xr/VaJV58LjxJ1oN+UfON1mIu4okbAd
 2JvOHOKofa58bG80o84gvCRF68Up5kt/9UoSUKhSr6odNRdx5Hmd9DFbsBiL6XX5puDB8diTubi
 OSFEF6wW+s45q+tHe3tZ9JjbKV4+jYr7rYrc/IA+dQaW0QHzu3PKpaauKuiGxOiVMf3yyJeR9Om
 DfjnTfwHYMBdfYUUqDP2Q7M44rvO5DNJWiSOn8Km9Q6kq0qirzBnCHop0=
X-Received: by 2002:a05:600c:6206:b0:489:5022:39a4 with SMTP id
 5b1f17b1804b1-48fe60e79fdmr61982065e9.9.1778854429576; 
 Fri, 15 May 2026 07:13:49 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe6b9efsm24697295e9.5.2026.05.15.07.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 07:13:49 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 16:13:48 +0200
Message-ID: <20260515141348.350163-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <af17STLwSLfdAgT4@waldemar-brodkorb.de>
References: <af17STLwSLfdAgT4@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778854429; x=1779459229; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GjdwbhtWtk8EDIhhast86aViSsqMU5JKwlQXQNukYkA=;
 b=es1CsH9vhiMPCk3CMHb6MQ5mvMmSGRKo5B31iH3GRmf2+6caLj5hxKhQXk4gOot8KZ
 THZTG6j3VH+jYA+1IJsx47pGTjzj+SxLSLrYxcUysYA+zKXiWQ3zirnRNs1wzO1E6jp5
 RFl/++60vGuZkCT1fxhct6S02KtrM6dEGaZhstq5u5Nm8mJRi3Ji2+vsejXt4qq9BvCZ
 +7DW1SbJGZkjXXVFf/jWH24WyHSwHeMpZPOIkTRCBlC4/Cv0Z48pj/Qls97Qx04qtl2I
 +NHpaYts+TlSPWRHZ/B3pUcZ22BkQzjXnI6hRgAjqAnonPKJHt1bwjDZCmoGWLG8I1PG
 NUIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=es1CsH9v
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/libxmlsec1: new package
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

I added it to 2025.02.x.

In reply of:
> Added from Buildroot master.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

> ---
> Is there a better way to do it?
> Do you want three cherry-picks from master to branch?

I think this is fine, I would have still kept the description of the original
commit. I wanted to add it myself but then forgot before commiting.

PERALE Thomas

> ---
>  package/Config.in                  |  1 +
>  package/libxmlsec1/Config.in       | 12 +++++++++
>  package/libxmlsec1/libxmlsec1.hash |  3 +++
>  package/libxmlsec1/libxmlsec1.mk   | 42 ++++++++++++++++++++++++++++++
>  4 files changed, 58 insertions(+)
>  create mode 100644 package/libxmlsec1/Config.in
>  create mode 100644 package/libxmlsec1/libxmlsec1.hash
>  create mode 100644 package/libxmlsec1/libxmlsec1.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 38da39033b..64225c03c8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1910,6 +1910,7 @@ menu "JSON/XML"
>  	source "package/libxmlb/Config.in"
>  	source "package/libxmlpp/Config.in"
>  	source "package/libxmlrpc/Config.in"
> +	source "package/libxmlsec1/Config.in"
>  	source "package/libxslt/Config.in"
>  	source "package/libyaml/Config.in"
>  	source "package/mxml/Config.in"
> diff --git a/package/libxmlsec1/Config.in b/package/libxmlsec1/Config.in
> new file mode 100644
> index 0000000000..4a686853ae
> --- /dev/null
> +++ b/package/libxmlsec1/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_LIBXMLSEC1
> +	bool "libxmlsec1"
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBXML2
> +	help
> +	  XMLSec library provides C based implementation for major XML
> +	  Security standards:
> +	    - XML Signature Syntax and Processing
> +	    - XML Encryption Syntax and Processing
> +
> +	  https://www.aleksey.com/xmlsec/
> +	  https://github.com/lsh123/xmlsec
> diff --git a/package/libxmlsec1/libxmlsec1.hash b/package/libxmlsec1/libxmlsec1.hash
> new file mode 100644
> index 0000000000..9e0e67e732
> --- /dev/null
> +++ b/package/libxmlsec1/libxmlsec1.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  a631c8cd7a6b86e6adb9f5b935d45a9cf9768b3cb090d461e8eb9d043cf9b62f  xmlsec1-1.3.9.tar.gz
> +sha256  d5e9388534256360c6a009d4f19ab2b8d6ec0aa7ff32a51e22d899ed7beb5c48  Copyright
> diff --git a/package/libxmlsec1/libxmlsec1.mk b/package/libxmlsec1/libxmlsec1.mk
> new file mode 100644
> index 0000000000..29222bc16f
> --- /dev/null
> +++ b/package/libxmlsec1/libxmlsec1.mk
> @@ -0,0 +1,42 @@
> +################################################################################
> +#
> +# libxmlsec1
> +#
> +################################################################################
> +
> +LIBXMLSEC1_VERSION = 1.3.9
> +LIBXMLSEC1_SOURCE = xmlsec1-$(LIBXMLSEC1_VERSION).tar.gz
> +LIBXMLSEC1_SITE = https://github.com/lsh123/xmlsec/releases/download/$(LIBXMLSEC1_VERSION)
> +LIBXMLSEC1_LICENSE = MIT
> +LIBXMLSEC1_LICENSE_FILES = Copyright
> +LIBXMLSEC1_INSTALL_STAGING = YES
> +LIBXMLSEC1_DEPENDENCIES = libxml2 openssl
> +HOST_LIBXMLSEC1_DEPENDENCIES = host-libxml2 host-openssl
> +LIBXMLSEC1_AUTORECONF = YES
> +
> +LIBXMLSEC1_CONF_OPTS = \
> +	--enable-crypto-dl=no \
> +	--with-openssl \
> +	--without-gnutls \
> +	--without-gcrypt \
> +	--without-nss \
> +	--disable-des
> +
> +HOST_LIBXMLSEC1_CONF_OPTS = \
> +	--enable-crypto-dl=no \
> +	--with-openssl \
> +	--without-gnutls \
> +	--without-gcrypt \
> +	--without-nss \
> +	--without-libxslt \
> +	--disable-des
> +
> +ifeq ($(BR2_PACKAGE_LIBXSLT),y)
> +LIBXMLSEC1_DEPENDENCIES += libxslt
> +LIBXMLSEC1_CONF_OPTS += --with-libxslt
> +else
> +LIBXMLSEC1_CONF_OPTS += --without-libxslt
> +endif
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
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
