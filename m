Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E4DC8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1596615C5;
	Fri, 11 Jul 2025 10:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id evI5uvaD5TgK; Fri, 11 Jul 2025 10:45:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E038061162
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E038061162;
	Fri, 11 Jul 2025 10:45:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E1548199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C79224078C
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQrs4066LY8r for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:45:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C00B9405A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C00B9405A5
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C00B9405A5
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:23 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4537edf2c3cso20463555e9.3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230722; x=1752835522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LeCvp6+VCj+FPDtiUooGzpzD/mnv5b7hN8nMOseMDtk=;
 b=pMJiuu/hslprgG/lkfai7IDDF57q3GEK2z2Lgyi9i/9EPE2JySsh79+N9Pv6q5kTXJ
 csSjRSSWcrTXZvs2F6lJb6ewS9Cs8O7SJKGjNyc7FxMTmKVW62f5QAv5NZ9CO44WszBs
 LpQoCwblWhZujP3FIMe1Lrn0DHSWv/1r+YrQh6zHjrBW8iRV3h7wFwXmqToNCvPeOeKf
 JbNwp8JlYKPXAKoI41w3oME65Hq1ENfybx4zEIWAqP/juC8Qu169K0JHaDxq3a3AsDhu
 oz6IJiLkUGGkqDrm27SG2qIyT+fy4cS4cdfWuu0cKB6TGfgVXSXKv0JUFGoOeg0U2GQj
 YtnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+TepDUhWXufA4i8Suu5o2NkHp6qPSdynJWIowCDxPu+nYK8ldGusHDDoSIxv1AmDFT6hx+6XVi+Y=@buildroot.org
X-Gm-Message-State: AOJu0Yy4K1TtWMLSFoF66Dnif0J3AmjYXEbzPjiOteaLdb/NeFt2Sb85
 fw4TuEws703r8tpwbg2HO9ummGyzAMhZnSqSoAVC5Wv+QajRPbvbbL8WP7NWHfc/4hs=
X-Gm-Gg: ASbGnct0yeMYmZ3NFvppa7FI47fTH/OjcJwP6l+jXME+AArdPVoU2rpBkMBQJzLbuJ1
 6PU2QwTB4mK84fdxTkTODK35xXf97R/vUqLScASxnc9XvO3TeSHNBoXK33NkGoMpzj0fqHwlvNk
 Ahia0daqFa6JUY1u8rDXUGqeQ+q25PQI8hdmWuihuZjPMiw0lRqapt7mKwJEUou6LbL4iOyI3Jv
 TJhK7xhuyhIK+3kvuWtpoALvWj3Oa2cqlRaorKrJPTMc0jXlKMloM/JWmvgvYJyWx7RfXi0bCMU
 TLDEgAlkrxZsWRvvIKlZJfqUgSCsYmKONcdc1IvLihyBCYjREbwEkOw0W34olSobiF3Vy5Ojbfg
 it8AMQvq0IF21FA==
X-Google-Smtp-Source: AGHT+IHPAz0+vKBqrBNrapI4Ec/8yvEFVBVCtv85LjDSD5MWEBomij1bj/m4rGeFgoBOsfjvGfZfDg==
X-Received: by 2002:a05:600c:4684:b0:442:f97f:8174 with SMTP id
 5b1f17b1804b1-454ec276b88mr25916615e9.18.1752230721711; 
 Fri, 11 Jul 2025 03:45:21 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd485059sm98756815e9.0.2025.07.11.03.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:45:21 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:45:20 +0200
Message-ID: <20250711104520.825117-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250706100755.800002-1-bernd@kuhls.net>
References: <20250706100755.800002-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230722; x=1752835522; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LeCvp6+VCj+FPDtiUooGzpzD/mnv5b7hN8nMOseMDtk=;
 b=ERo+qwmwEnXRzwYGtdsRPl04kxkYV7vUkOWZKrm/uKmdBI6k7vqa1SdIAB1Tocegib
 J1s/hGHo/w9gGfA9RimK0yCz8XYmlHVyfv4e0vVZIrN3aWRYDRCKbseUa06jFlWpFBhi
 Aj3qh3sNOud2ZfDs3NIaocurShfS0aUMHUOZyPl3WpkOZULk6oftO5+6rBtbyQyZZ6lo
 oBE5MiAH5CVV993oGrMBA9BX3KqkQ4aWqCQH8twEDWB11hWOKVIAtwTnAwmHbvEkTr+x
 0azplGMFg5RSQhWAbQN1+zqG3Qtlgvqy5vKG2IRHfxe8WGawr70mej3OzwyhArwph8bK
 z4NA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ERo+qwmw
Subject: Re: [Buildroot] [PATCH] package/tor: bump version to 0.4.8.17
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

In reply of:
> Release notes:
> https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
> https://forum.torproject.org/t/stable-release-0-4-8-17/19681
> 
> Removed patch which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...t-define-DISABLE_ENGINES-after-OPENS.patch | 58 -------------------
>  package/tor/tor.hash                          |  4 +-
>  package/tor/tor.mk                            |  2 +-
>  3 files changed, 3 insertions(+), 61 deletions(-)
>  delete mode 100644 package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch
> 
> diff --git a/package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch b/package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch
> deleted file mode 100644
> index f8ad803203..0000000000
> --- a/package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From 48f8d6918977673125d53a85d19d709136106739 Mon Sep 17 00:00:00 2001
> -From: orbea <orbea@riseup.net>
> -Date: Thu, 31 Aug 2023 14:35:52 -0700
> -Subject: [PATCH] crypt_openssl_mgt: define DISABLE_ENGINES after
> - OPENSSL_NO_ENGINE
> -
> -With LibreSSL-3.8.1 these engines are no long available causing a build
> -failure, but LibreSSL correctly defines OPENSSL_NO_ENGINE as part of its
> -opensslfeatures.h. However Tor includes crypto_openssl_mgt.h before any
> -of the openssl includes which would define OPENSSL_NO_ENGINE and then
> -fails to define DISABLE_ENGINES.
> -
> -As the define is used in only a single .c file it is best to move it
> -there.
> -
> -Signed-off-by: orbea <orbea@riseup.net>
> -Upstream: https://gitlab.torproject.org/tpo/core/tor/-/commit/48f8d6918977673125d53a85d19d709136106739
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - src/lib/crypt_ops/crypto_openssl_mgt.c | 5 +++++
> - src/lib/crypt_ops/crypto_openssl_mgt.h | 5 -----
> - 2 files changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/src/lib/crypt_ops/crypto_openssl_mgt.c b/src/lib/crypt_ops/crypto_openssl_mgt.c
> -index 6c01cb6aa8..ca12a82518 100644
> ---- a/src/lib/crypt_ops/crypto_openssl_mgt.c
> -+++ b/src/lib/crypt_ops/crypto_openssl_mgt.c
> -@@ -40,6 +40,11 @@ ENABLE_GCC_WARNING("-Wredundant-decls")
> -
> - #include <string.h>
> -
> -+#ifdef OPENSSL_NO_ENGINE
> -+/* Android's OpenSSL seems to have removed all of its Engine support. */
> -+#define DISABLE_ENGINES
> -+#endif
> -+
> - #ifndef NEW_THREAD_API
> - /** A number of preallocated mutexes for use by OpenSSL. */
> - static tor_mutex_t **openssl_mutexes_ = NULL;
> -diff --git a/src/lib/crypt_ops/crypto_openssl_mgt.h b/src/lib/crypt_ops/crypto_openssl_mgt.h
> -index 96a37721dd..eac0ec1977 100644
> ---- a/src/lib/crypt_ops/crypto_openssl_mgt.h
> -+++ b/src/lib/crypt_ops/crypto_openssl_mgt.h
> -@@ -49,11 +49,6 @@
> - #define OPENSSL_V_SERIES(a,b,c) \
> -   OPENSSL_VER((a),(b),(c),0,0)
> -
> --#ifdef OPENSSL_NO_ENGINE
> --/* Android's OpenSSL seems to have removed all of its Engine support. */
> --#define DISABLE_ENGINES
> --#endif
> --
> - #if OPENSSL_VERSION_NUMBER >= OPENSSL_VER(1,1,0,0,5)
> - /* OpenSSL as of 1.1.0pre4 has an "new" thread API, which doesn't require
> -  * setting up various callbacks.
> ---
> -GitLab
> -
> diff --git a/package/tor/tor.hash b/package/tor/tor.hash
> index 34c7c0f097..55c915ef4d 100644
> --- a/package/tor/tor.hash
> +++ b/package/tor/tor.hash
> @@ -1,4 +1,4 @@
> -# From https://dist.torproject.org/tor-0.4.8.16.tar.gz.sha256sum
> -sha256  6540dd377a120fb8e7d27530aa3b7ff72a0fa5b4f670fe1d64c987c1cfd390cb  tor-0.4.8.16.tar.gz
> +# From https://dist.torproject.org/tor-0.4.8.17.tar.gz.sha256sum
> +sha256  79b4725e1d4b887b9e68fd09b0d2243777d5ce3cd471e538583bcf6f9d8cdb56  tor-0.4.8.17.tar.gz
>  # Locally computed
>  sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> index 5f376d136f..399d4b481f 100644
> --- a/package/tor/tor.mk
> +++ b/package/tor/tor.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TOR_VERSION = 0.4.8.16
> +TOR_VERSION = 0.4.8.17
>  TOR_SITE = https://dist.torproject.org
>  TOR_LICENSE = BSD-3-Clause
>  TOR_LICENSE_FILES = LICENSE
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
