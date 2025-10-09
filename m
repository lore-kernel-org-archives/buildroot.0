Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDE5CCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63577612CF;
	Thu,  9 Oct 2025 14:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M6ZY8MxH0KwX; Thu,  9 Oct 2025 14:54:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76D04612D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76D04612D6;
	Thu,  9 Oct 2025 14:54:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F1FD119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9094180F43
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id keybKBBOYCG9 for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:54:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3A00080E91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A00080E91
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A00080E91
 for <buildroot@busybox.net>; Thu,  9 Oct 2025 14:54:45 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e61ebddd6so11031165e9.0
 for <buildroot@busybox.net>; Thu, 09 Oct 2025 07:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021683; x=1760626483;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HNv/XQWENhHuY3V/c6vfcrewizZ3rwH1I0Rog7fsoK8=;
 b=ilOAGH6bwzW/g6Cgzd+fBgbVt8CwfNZVhCwJNktGg1d8ta3eqn9h4Vv5egS2jZFhDS
 yoa3n59mSx13Bdj8ck9A+eXpJASJAP9Rx65wPIMyRTLA2j8fw5lvJ6Lwg6SdsZdwAd49
 JAKRXjPfFeQBwsAyLucOPdD9DQBHnUERUy9nJFhVP3OjUIYjaXYNM1z6e6CSsnPIOZlE
 bMDKxATu9yNfobOWz+djMMc7cAGxveLGSEsrAPRk79Gc2iTMyD5vZja+TgZIQuz9mcWv
 xpVwQcwEeZRDvE7w3nYnQsawKK6sN8EV+hmNPXZO6GSsJ5LU7W/u9h/ydd2SjCjEPN7i
 26FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfVQomRnUi8KGcyBmqIDDACTYxWXUxGV9qu1faP1LLZ6/P2BQ6M2wT8fnW1hiF4Tmkp08AXEb6o5E=@busybox.net
X-Gm-Message-State: AOJu0YwTKtMj8mVJhfUU87pUCDmhh3N1IpfsiSbMWbR/ZNbL17b5mfvg
 neP1kAyH3T/3/lcZWSOx0ucCsUPKyZID86ZXyj6o5GOaF40Menu0DnWnL+fOjgKOXTs=
X-Gm-Gg: ASbGncul0b29nuDfFoZGAmXgufXccJoHIxdKQFfig7XJkywl1H/gaJ8QVURTD4WqIOa
 Y6jpEvOtugsch9tWngOpORXzBYEF7Q5IuDOhwfBXg5w3HpgfuVgDAj9G5B7Zuh9/1+whLWh/Tyl
 96wT98fQ0ddUEEB89pwK6r29BWPblirlXC31vebm7ifU7X0hBr6z6GZGnthtturimXiTkUEBQf7
 MZihBeZ4yt2nPvIOGiq60pOg/nQnHENSZNVSi2GEYI0b0WkkY4lxKdZC12OU+1eUUau8uT8fAf5
 0js6QGnblrmZbw3IeRnze5bcY4xBuncHT4KAsEjUKwRrkhB86pEa0mMEM2sNLX/ti4KbllVEzCJ
 4thE0WFsoEsXt3dTuCdMLCmKhclMtUoTXPHLtCRsshkt0pgYRSn8=
X-Google-Smtp-Source: AGHT+IG5bQAN50FUX5F9G3j5PWMQeVBssteVlKua7V1ALFpMwSPcRPmm/k64n4zWfk2VZrxsvfeUwA==
X-Received: by 2002:a05:600c:a416:b0:46f:b43a:aeef with SMTP id
 5b1f17b1804b1-46fb43aaf5emr4078985e9.38.1760021683111; 
 Thu, 09 Oct 2025 07:54:43 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab3d2c1asm39086875e9.1.2025.10.09.07.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:54:42 -0700 (PDT)
To: Francois Perrad <francois.perrad@gadz.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@busybox.net
Date: Thu,  9 Oct 2025 16:54:42 +0200
Message-ID: <20251009145442.482310-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002065706.1010793-1-francois.perrad@gadz.org>
References: <20251002065706.1010793-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760021683; x=1760626483; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HNv/XQWENhHuY3V/c6vfcrewizZ3rwH1I0Rog7fsoK8=;
 b=ODzWr2BFdQSA4kuV7A9HnTOnr99WXNSoNzhvZPC7bdm+DNUVd+6EssIOrO22MUbTSm
 p4hfU7AE+aqimNmDxUNggs6uE3W0/nnnmOxWozpsiSWEEt/YDc1xH04sahUQu+oOOWQT
 j9gNhXeMGG0QNUUQEUjZmXiHe9Sc8fj0Jv4uLVPUcyE5lYaamvgMtf1AXegGTOISMXhS
 yhv13K9GXalZAH/AdMF/aP6JvtG8plubtrpnRQ97Ui+UMDDbEe/VKxmUDfofMhorS7I+
 vEZCKJQD0Ms6JzH628d/ZKSZWcF21JP2rY17J8aW9Yx1sv1R50PCWOrfg86PfI/aIwZw
 zoOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ODzWr2BF
Subject: Re: [Buildroot] [PATCH] package/libopenssl: security bump to
 version 3.5.4
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
> fixes CVE-2025-9230, CVE-2025-9231, CVE-2025-9232
> see https://github.com/openssl/openssl/releases/tag/openssl-3.5.4
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  ...Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch | 2 +-
>  package/libopenssl/0003-Revert-Fix-static-builds.patch        | 4 ++--
>  ...Serialize-install-process-to-avoid-multiple-make-dep.patch | 2 +-
>  package/libopenssl/libopenssl.hash                            | 4 ++--
>  package/libopenssl/libopenssl.mk                              | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
> index 2634d69f3..f74576bea 100644
> --- a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
> +++ b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
> @@ -21,7 +21,7 @@ diff --git a/Configure b/Configure
>  index 15054f9..ac3206e 100755
>  --- a/Configure
>  +++ b/Configure
> -@@ -1685,6 +1685,10 @@ unless ($disabled{asm}) {
> +@@ -1686,6 +1686,10 @@ unless ($disabled{asm}) {
>       }
>   }
>   
> diff --git a/package/libopenssl/0003-Revert-Fix-static-builds.patch b/package/libopenssl/0003-Revert-Fix-static-builds.patch
> index e800b782a..10ca97a24 100644
> --- a/package/libopenssl/0003-Revert-Fix-static-builds.patch
> +++ b/package/libopenssl/0003-Revert-Fix-static-builds.patch
> @@ -18,7 +18,7 @@ diff --git a/Configure b/Configure
>  index ac3206e..764ef89 100755
>  --- a/Configure
>  +++ b/Configure
> -@@ -1509,10 +1509,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
> +@@ -1510,10 +1510,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
>           unless file_name_is_absolute($config{prefix});
>   }
>   
> @@ -29,7 +29,7 @@ index ac3206e..764ef89 100755
>   # Allow overriding the build file name
>   $config{build_file} = env('BUILDFILE') || $target{build_file} || "Makefile";
>   
> -@@ -1807,6 +1803,10 @@ if ($strict_warnings)
> +@@ -1808,6 +1804,10 @@ if ($strict_warnings)
>                   }
>           }
>   
> diff --git a/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch b/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
> index feb0e21ef..344b8d07b 100644
> --- a/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
> +++ b/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
> @@ -26,7 +26,7 @@ diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tm
>  index e85763ccf8..b671723813 100644
>  --- a/Configurations/unix-Makefile.tmpl
>  +++ b/Configurations/unix-Makefile.tmpl
> -@@ -650,7 +650,11 @@ depend: Makefile
> +@@ -661,7 +661,11 @@ depend: Makefile
>   # Install helper targets #############################################
>   ##@ Installation
>   
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index d0ca45d30..e78b664aa 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/openssl/openssl/releases/download/openssl-3.5.3/openssl-3.5.3.tar.gz.sha256
> -sha256  c9489d2abcf943cdc8329a57092331c598a402938054dc3a22218aea8a8ec3bf  openssl-3.5.3.tar.gz
> +# From https://github.com/openssl/openssl/releases/download/openssl-3.5.4/openssl-3.5.4.tar.gz.sha256
> +sha256  967311f84955316969bdb1d8d4b983718ef42338639c621ec4c34fddef355e99  openssl-3.5.4.tar.gz
>  
>  # License files
>  sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index b892d4e23..2f844fd44 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBOPENSSL_VERSION = 3.5.3
> +LIBOPENSSL_VERSION = 3.5.4
>  LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
>  LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>  LIBOPENSSL_LICENSE = Apache-2.0
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
