Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A75F436B7
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ED0580FF9;
	Fri, 17 Apr 2026 15:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Pt8XeI76rWZ; Fri, 17 Apr 2026 15:24:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4111C8032C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439487;
	bh=5+qgV3aSEtq6WYtBFxjQqiYOftWZGc4w+xPESWdqPGY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Nbj4U6fIRokdPnIn5Lcia6reZMEsdFGsON0zQxPYQXVB+ChRFXw090Znp5rurkEKu
	 fveA09Kr347eDT4ctfgK/aZVWJUmm66Z3j7gTh1F1JXktesm47SetNIyFWaR2Sqi2Q
	 ClmogF8Fe4gS2TYrW0DsLjfcdjzPfmj6gG4t3tZW9ONgl0pFDoTnxTOw6R4GFZ5Wn+
	 ekBq1xcP8rqzeRwEZI9CFCF+V4dAWX1M6CrzjDh8sqYkcYbm6/BmZcBQ3u6zgGwupu
	 I9+k+G0WkMPcj70gbgpwbHQx4m4SBzdz+JSChGMscZUGZqu/Jdw/k8esXz20rSKOMD
	 YpHXwzzbxP0hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4111C8032C;
	Fri, 17 Apr 2026 15:24:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BF4B8259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B11E880FF3
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LBUl9otfNfvc for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:24:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3AE9A81882
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AE9A81882
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AE9A81882
 for <buildroot@busybox.net>; Fri, 17 Apr 2026 15:24:43 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48374014a77so10387825e9.3
 for <buildroot@busybox.net>; Fri, 17 Apr 2026 08:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439481; x=1777044281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fCMpKEazMe3oQjNOtPpMgS9Pccnxswu1mVPleE1RhgY=;
 b=ffUJsi40SNoZw4GpRYZMsNDeiMqQyVf9sq5SKGJHm7b/6jGSP9I3Mo6m1y6z+vBA+E
 a3YHbX9xu7/J3Vb4AfnPFe7js7oaSAVK3j4nYKPkE2z4A54n3ub10wOxowiVSiAYt7do
 E8jKmj26Pnpnp/VkySUonjICWERTBTJfQdTHXb1DnresHUrVydnsUSuZqGcVTX+i7ft+
 BDgIETc+5N6qu9mygmPsMRrf2aG9hLniLE/fapZbRuC6frw7VGil66ADldXGYbXXs4DS
 OZcNULJsItaQW5+bfJHMUy5AgSIzgzzg1xix2+kvYNt6ziEGgYSlHriD0nY4TyLIsPgm
 IT0g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8FlqftGCgc0Jm2KEgwm/KT1NDxeKpwxnoiBFgD0uYRUIUObkBEgAago00q1zwdyH/bXU/fGmgNtgU=@busybox.net
X-Gm-Message-State: AOJu0YyJEbk8L3XMWsqk61h61jfMRvygvjTUw8JjF+t9gwIL9qXwaUgf
 GfpfB/C1OjAs5F0ViFeaIcSrIGkKg173gsEVfgxbfxaKxi9AlgwxmjA8Bs7LIt8wGck=
X-Gm-Gg: AeBDietHZV6AXsC9U+1Co2Q0PRFWSvouJgF29LBwZ0qClORdvLv8BJ4jaxSObdKdPo0
 FUjKEeFvbvzN/NBuw8phJBZ/3/IQHkTWU87ExpxwshSVEnoqexm5yz4dhOHgHZJp1H5iQ2aGJor
 ZK4MQdQ38kf5UhFus/rXZypB255bnthaWuQo6d09PX9IQwAqB0OOszwY0JrBsvBIY5E48UHoZzZ
 MTogvTVIsTjjk/APSVCyEn1eQ7Lgfbq3OozHlkO6jrm+mZVAHirFIBTUPFSGhLQh89wodn0FFmC
 h/41HYhiiCuABD0lOS9/O8vnxVHeNHRRgfLPOrTW7Br0NhG9itj6q+mLZ7e/hs/Zka+VhWMXpH5
 IlWCgjlMfBNardHVhoKFv1dv+pNXl4v79yI1CxjfjXKXNJz2fuysuR9Suqu8D9RlaeC5klhd3G6
 ahf0huIZ6WaO+tPRihZurUJh2m+wQ=
X-Received: by 2002:a05:600c:6297:b0:486:d76c:fa57 with SMTP id
 5b1f17b1804b1-488fb77155dmr48601015e9.17.1776439481049; 
 Fri, 17 Apr 2026 08:24:41 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0b54sm18843625e9.20.2026.04.17.08.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:24:40 -0700 (PDT)
To: Francois Perrad <francois.perrad@gadz.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@busybox.net
Date: Fri, 17 Apr 2026 17:24:40 +0200
Message-ID: <20260417152440.312958-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20251002065706.1010793-1-francois.perrad@gadz.org>
References: <20251002065706.1010793-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439481; x=1777044281; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fCMpKEazMe3oQjNOtPpMgS9Pccnxswu1mVPleE1RhgY=;
 b=KSsXRT41NtwHhfrTesJ4kKdWTnUkAj0MORfuT6J9tMk5YIixtueurUoQHanbmbDXFO
 8FMnqltEhiEx+P3USMYZRLo3F7FCy1aw2D0oh4W0Kbh9JpBx4hIYWxfdnjCgj754cqhe
 W/KM827JjGLLVRnPTjy/KXywq8MAWwQxR+6PlkQxTTTvJljMyJxOGcgsFBHQpCs+8tcZ
 MEsBKkJDNCI7QoU69BIumfN2WJdTLNuGlzNjFun94sCW/u15FvcCiOcCTmYKxbUY7JgE
 2aJsJ8PT/qKBxRj13t4UXztClSTKwcFD9aOPBlAY1+2ShOEz3s00BFzkK2sCy5Kf8vJa
 rnPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KSsXRT41
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

Applied to 2025.02.x. Thanks

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
