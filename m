Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A190F436B8
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60A2C81518;
	Fri, 17 Apr 2026 15:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mI7GryIXa-Od; Fri, 17 Apr 2026 15:24:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64EE58120E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439478;
	bh=vyiqzOjOzzb47ugKXYwj9gpvpcW9y9SYQHba9NaT2EE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y9nB5XWIJzkesC26E9f4N6LcwsNFl7iAA9XCsPCruNPeqF5IxgRAmHOyEOIHYxQJu
	 we3UWQ0oLLByGIeHhUcBTvTireEwvL9xxbq4CHxIyBVJyAAXzA0oCd3gMybFpnHdzj
	 g9T0OLhtk78oUwhPxrSMhTLuNW+cesrQbgR+ZYb+UEKom4bxUVE4dgluEp5peA9V4H
	 /T1BlgEuTW4RJMuRup/TJPLT0LIuV14zw8Ad8qW8BZAHztfHpNM/FALmPUfhMZpuAr
	 ClpBsor+yWZA0xO7DEzdEmzf8Z8wxWKpuWn1l5eNVtsG+7fiRcyPE9LjOLIm4wSiaZ
	 5ert/T60Lqjdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64EE58120E;
	Fri, 17 Apr 2026 15:24:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1812D259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0980280FF3
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AQPNyRvia6FA for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:24:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E70F680B32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E70F680B32
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E70F680B32
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:35 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so7623075e9.0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439474; x=1777044274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AYJ2H9Mk0/KNCA9dUHYtUM3JAtAH3KNLQ/yMUmctVhc=;
 b=XKKTm+MDLmU3SP9oG8059qbb+pyorytLqOjX0QDtO3UZmtD5zX+023LeQjylh0K5gO
 ClJ13SGwB2st5wSUQOSs6HV7DtVbXTMFIiVxAtudkMvKKFIOTIv3G0vvVV45pXKO0LfB
 JrCkYrSqfcuJhxu3asIQU0mytquEa8aAkJDntqzX3c9pvbJwOyJTm2kexsrrp8XC58W/
 MPOyK/0f+bzPly6V3yR3L8l+r05/oP0jBCLzGc56N2jQ41qy0YjrXjZLaOvx5w92Mnld
 MMgiSMTx5cn0lfKEI4QGHf3AynXoPI+1GELRn7Zu8Y75n+19gloWMQAzVg+97jhgnuzm
 s9Sw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8ADQMTWPRaqJ1qYtNFyFZZaRijdJQmOaha3U1ZLkSykN/ZDRThZ98P0AX1FdtJbG5YEyrnX26Ec5g=@buildroot.org
X-Gm-Message-State: AOJu0YzJjjptuewdFxrqA2E7PgNbizev+B2cfGw62CaIyjWui5oZRdI5
 UVrlW2ZeP1DClJhDb35PSRRGjE9xfc3OAOgoqWpv86i+TcqnyDK70yMIvxSSruR/pFU=
X-Gm-Gg: AeBDieuPi3aECB4+UYuLCV/S6Fl3cL1YQUsueXtHTAC+3FLgDDabqpPNEhM0eitTUfi
 a4gvHERfoc3ctRRAkPAHy3t/JZdG1ZFGUnnRbWdm6xFW+BdaWY5lxlvZ6ZBDnog7a8CQaSFCwKN
 z/v4q/7VV5jj8DXRaVCAxA+QiNGdFN119uh7bmWLAhdKv4YtESnF8MJzX00fRLTbwM46lM8rVgA
 OEoe7o2o+oUGoH2LA8uQ5SFOHatz37CvPBENG2c89TgGdyJCNUkGOBXXzn7ISoAwJnmrOFA9DKL
 pgkq+i7IP4bq5ospRbgiitf9idqsIzApzdDhZEPtO45ZRTnfL1YZat6igtoL+KqZubwnaVRPq4/
 mt2zZkCxpd8/jHuRud0tOUrXPTZM0uyCw+Xrw6MsB27l3lRq4x62YUgFS0IKAu3kJ4U2UXPdGp4
 BR0UeaIMTzgKL2+79VYPfNvEkMSww=
X-Received: by 2002:a05:600c:4707:b0:488:bfc3:efc with SMTP id
 5b1f17b1804b1-488fb6e8eb5mr47209395e9.0.1776439473624; 
 Fri, 17 Apr 2026 08:24:33 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc16f93dsm73244445e9.3.2026.04.17.08.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:24:33 -0700 (PDT)
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:24:32 +0200
Message-ID: <20260417152432.312629-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20250507144633.8255-1-kadambini.nema@gmail.com>
References: <20250507144633.8255-1-kadambini.nema@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439474; x=1777044274; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AYJ2H9Mk0/KNCA9dUHYtUM3JAtAH3KNLQ/yMUmctVhc=;
 b=WmGPrt4XTiIRESZbYJCrmSCySjxCQxNeB9U6+20g2XzCh/LSBBtdFGxd/tSXYuqjqQ
 POptDxAAI9hmLwmqkWF31Wo/CXAle67Qq8C4H0UymldGlEKiu2UfNo+R6/TK8068MsA0
 /8JSlUNskQAsq/7MSyYBKHmCr/gOjfY9f6Hr3zCH/k4onkQZrSCFbOCj0nhTHza+EnPx
 YbqEMiPt2SYRre50snRqsSwVwckqYr6wh0bfgaJ/C9Ap1AIsa6quxHJcRp3mq06xd83W
 fLZIJM2dJ2nPqJZD4nAbTBnFaEqCuREZPb2UCaTDR5eEvbps5NHgqZZ9IE9j4RZvpuGd
 aEQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WmGPrt4X
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: bump version to
 3.5.0
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
> https://github.com/openssl/openssl/releases/tag/openssl-3.5.0
> 
> Changelog:
> https://github.com/openssl/openssl/blob/master/CHANGES.md#openssl-35
> 
> Rebased patches for the new version.
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to 2025.02.x. Thanks

> ---
>  ...nfigure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch | 4 ++--
>  package/libopenssl/0003-Revert-Fix-static-builds.patch      | 6 +++---
>  package/libopenssl/libopenssl.hash                          | 4 ++--
>  package/libopenssl/libopenssl.mk                            | 2 +-
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
> index 629d9c26ce..2634d69f35 100644
> --- a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
> +++ b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
> @@ -18,10 +18,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>   1 file changed, 4 insertions(+)
>  
>  diff --git a/Configure b/Configure
> -index 5a699836f3..f9152b1702 100755
> +index 15054f9..ac3206e 100755
>  --- a/Configure
>  +++ b/Configure
> -@@ -1549,6 +1549,10 @@ unless ($disabled{asm}) {
> +@@ -1685,6 +1685,10 @@ unless ($disabled{asm}) {
>       }
>   }
>   
> diff --git a/package/libopenssl/0003-Revert-Fix-static-builds.patch b/package/libopenssl/0003-Revert-Fix-static-builds.patch
> index b4b78c97fc..e800b782ad 100644
> --- a/package/libopenssl/0003-Revert-Fix-static-builds.patch
> +++ b/package/libopenssl/0003-Revert-Fix-static-builds.patch
> @@ -15,10 +15,10 @@ Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>   1 file changed, 4 insertions(+), 4 deletions(-)
>  
>  diff --git a/Configure b/Configure
> -index 2a5e58805c3b..0e8c1ce5cc74 100755
> +index ac3206e..764ef89 100755
>  --- a/Configure
>  +++ b/Configure
> -@@ -1466,10 +1466,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
> +@@ -1509,10 +1509,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
>           unless file_name_is_absolute($config{prefix});
>   }
>   
> @@ -29,7 +29,7 @@ index 2a5e58805c3b..0e8c1ce5cc74 100755
>   # Allow overriding the build file name
>   $config{build_file} = env('BUILDFILE') || $target{build_file} || "Makefile";
>   
> -@@ -1764,6 +1760,10 @@ if ($strict_warnings)
> +@@ -1807,6 +1803,10 @@ if ($strict_warnings)
>                   }
>           }
>   
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index 5924c5d46a..9f8b23005a 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/openssl/openssl/releases/download/openssl-3.4.1/openssl-3.4.1.tar.gz.sha256
> -sha256  002a2d6b30b58bf4bea46c43bdd96365aaf8daa6c428782aa4feee06da197df3  openssl-3.4.1.tar.gz
> +# From https://github.com/openssl/openssl/releases/download/openssl-3.5.0/openssl-3.5.0.tar.gz.sha256
> +sha256  344d0a79f1a9b08029b0744e2cc401a43f9c90acd1044d09a530b4885a8e9fc0  openssl-3.5.0.tar.gz
>  
>  # License files
>  sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index c1c5b818d7..5e785e1bf0 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBOPENSSL_VERSION = 3.4.1
> +LIBOPENSSL_VERSION = 3.5.0
>  LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
>  LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>  LIBOPENSSL_LICENSE = Apache-2.0
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
