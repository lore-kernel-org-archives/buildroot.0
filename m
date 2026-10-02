Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D045BCA5FC4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CD4760B55;
	Fri,  2 Oct 2026 10:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85-OfXpq7gMy; Fri,  2 Oct 2026 10:34:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 817996083B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790937246;
	b=POpEfHIIB3W+qYvt+TpFUyayQdY6naLTIMbvo8KnzCrGPcFHtMoYSk5jVjhOCYpRQqVS
	 eTTYHQF/WgRHOVEXPVOhfueZWESAuD+d+vSKzml9LyuKr75O6Tb8H3Lo/n+J6kwB92WRh
	 YWNrX3QZ/PBhG9//77KUtF9jvSSkcT/4NIMkjxf1+HEHbH9ln7SUXJK62SqF2S7LxNdK2
	 7XZEjANSp7YD4PWeV+sEAm6yGqQEHyNSagwCYXHjZjZzkT8AVjRHu/CCV198GeYk+hTcY
	 tCNujADxCwqMWobDiPSfLLmUuW/zJRpYs/M3Lkk10ab3hknlW8FCYznOcBdaekz2kyw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790937246;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SykL4Knjtk+tTvVRhquu0C9lHfAhK4VCtP9ziyyRCrE=;
	b=PuFCqp+5lhzLhWY+RDHTs6nTB5sKI3o8nvqCJLh1nDT9+4dQld/g5k4iaVFvTrOrDO2U
	 0wqWSAS1eFx5hPPlxD+BbTKl+R7lOuFYuIjXMF6jdRq+jfYJ4/N//3MTGA8FLdGUjstqi
	 51jMn9d71PO8BPs639bwxmJXeinspG9LCttOcdQS7zAszk47HkD7psag9W85d3uWTmpWC
	 UdFYbNQUfDquVy1AGt1VSX+nuH28nt62UbhTbTxU5Zkq8WvQ3YA4dspoYoEBvx45jaUWl
	 YT67AfQWpnBADhPkPkvAG/xFYcn8S24ATviWy41LawbSnIdPw4g3sJefBBrOCDndg7A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790937246;
	bh=SykL4Knjtk+tTvVRhquu0C9lHfAhK4VCtP9ziyyRCrE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VhhJmC4Zf024Qk5Apva19oTS/frqh5WRTNavNWkjOiRBjIuW11sKOGEAAh1yFHxbw
	 7/kpkRPVPyXl1LZQxAYx4i7ivP3VL9M3ghHyoMQdpoqw2Jctf4sd+q/0i+7JztwyPg
	 3kaYOUG4GDcj3cHkgN01KMB2wo1iJ5RVImAC0dxwF81Z7BZ476xLSqM4/AWKxwrPjr
	 Qv7nd2G7+uH0ynXz6IWsbO5hrZem/5HprjnURtWOK/rkqDvOjSZyJrxXlDN5Ye8J2S
	 SzuUkl6dW2E1HhfjhhV8dVB5Cnvb8/pskliO96fu/gSrRIxBzgMmXZNbFW4XRLGWlj
	 au/sa1UesH7GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 817996083B;
	Fri,  2 Oct 2026 10:34:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 018B534D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7F94400B3
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mvxtyQ_8pPAN for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:34:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org C2CAA4004A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790937244;
 b=diM68Ujo9/v1yp0qCqGp2v9LkXf/XfeSBayKxCC8om+4pHto6aTh7fSHYKs3zwprk+Bg
 7cQvZFreAbGCeTkWGnq3Jn4D3kS4iCtF/c6MxiB22bpojChqrRWnCGws0mGWresw17k6M
 miE4oN4LjYcOB02r43CrZpCZey9r8ThJYBrJlvupswN7s9Q/40XjungeqHch6WxQbXH/H
 AGl9QOkcAQwpMIlv6kWF6ruPj2hxQgwaFoHXstqcuvFIHrAdnXQ8bS2SUD6hU7ZmkAe7B
 mW1Alr8hIhiSTm2ZlJZ9132U/7mSEDDqe8NP1h0TgL7FRYt9OMz3ecAA1QdwTzxNlkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790937244;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Kd7gq9KQOqINj6fY5whOjjr82ix+2R1UtncmxKfJH5o=;
 b=oX159zvjH/eru4I76dCRRgD5PxH2INkbVW+pA2J/4ZrSmH6uBRiv/sMn6l5djSRcV6uZ
 gHoLhBr1p0dV/cxvMVVIGgnKh05PhYSJ9XsHhezN3wJvz1f8yPHGz/BqucbGR9L3ZAQ6b
 aZMb9cJESriAg7XoBipx3/QAa1Lu4RsdI+7SQZ6kalMYTy9tJIrmy393MgbXQDQQ5GA2K
 j0jVTmYZzDarLAjxKd7tr6u/hrGrhqdAS3lpM2E14JuQ8Owumww9c/QHSvgJKDEgGr+CE
 xpF1FslG6xTHNBdstMCYqRsbSlEbUUPtR+EN3HJtKAOcDef2CJLMfM+7xtek2fFRzJQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=f4U1oecu; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2CAA4004A
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:34:03 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-4a00713639cso42127545e9.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 03:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790937241; x=1791542041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Kd7gq9KQOqINj6fY5whOjjr82ix+2R1UtncmxKfJH5o=;
 b=JJv8lKMNPadpH4ixu+rmpyefSj5LM/h5D0xZC0LZib6GXEDe1CoWhynhKxe9JDnaac
 ocMRE7tkBNbz/JhAOHAlUdHz5Yrl3ySn6lKLlDhROzUSBS/QXNWBhV3k5+6oUtzs2QI4
 l2hkVgspicJCPIqHODwquvf75oPr3yh+tNaf0XAr9IQqoSJ7+OoVPTPxj7M8251xAQwo
 j5hzWx/Dx4uRA5UEpZG7SbAx76MBDiefpj1tojNySAMPMygLWt015m5xjRpY51dzUDPv
 wJ9TVJnl8JH9btjBa6+WusQzJyPjY3tl4qYWxfoRWuN0khCn/TKLQp9SrapOP+4nssZH
 srMQ==
X-Gm-Message-State: AFuF++l49UXHxZoMUFhtBTD0FHWN4/znCi4oGtEWBcvoD0C35nmgGMh9
 mGpEtjJe07UGj2MadsWhIfg8UgJxTcLa2U6gN0E2KkBJzLHSbJOK2C5wzgFB0u4rn9yyW08Gqef
 FI6IuZ6s=
X-Gm-Gg: AYBFou3r+8SacDc6pl6yz7SzEkpZZwgfi9K70FhQPdylc6pHFYg1GtNoORPicK2By8l
 Xdy1xzRKJxsBJxzbWsl5j4djZ1vtn/df8DnfDO+UkONxNLDXFAu1xk5yuGgAUHG/mwFACUTo+g0
 1ZLjJfptRI1oH9rbShPXZRTc9tY3CyDobAUKuLNIFyNuwbtn/n2xfgKfHGAxmcNNDthlKTd195G
 j2nLg3gIdfdAIHoq6R7q5zyejyCtHrj4V8EUEfWfgDVdpBxy2ciP1BF/+NX5WozEXXs4vAITDbK
 9mbYAE3lrufnYGcKJzDxVFXi/DmHjLA1t/Ergwd6mKhv+SACL+aCakkMrEZRRAT3Xz/J19b3ddC
 xd5q0HAciklg51uB3W9OSmHccRwJ/zPqnOdCJKOGdnpKVF4oZKMTeqy+ZgM8urrmRqVGL0gvvBs
 G3CIBpP7lnWZhyxR9vbV9KvuPOFFLYy/cTabasUN/bZz0fzqpwygp3WC3oSdm5znLQKceHgilrp
 FUYGZiHsTN1npAbsce2xAT/WMQWWImImZg7VzbZd78NxDiksFd8Rw==
X-Received: by 2002:a05:600c:6a04:b0:4a0:4f6:3dc5 with SMTP id
 5b1f17b1804b1-4a027542255mr28391735e9.7.1790937241142; 
 Fri, 02 Oct 2026 03:34:01 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b380faaeesm4553604f8f.18.2026.10.02.03.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 03:34:00 -0700 (PDT)
To: buildroot@buildroot.org,
	yann.morin@orange.com
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  2 Oct 2026 12:33:58 +0200
Message-ID: <20261002103400.77485-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <79fcf083efc142ce08b4a877e8d8bf60ee568ca8.1789971481.git.yann.morin@orange.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/distribution-registry: security
 bump
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This feature-release also congtains security fixes:
> * CVE-2026-35172
> * CVE-2026-33540
> * CVE-2026-41888
> 
> Drop our backported patch, included since 3.1.0
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to 2026.08.x. Thanks

> ---
>  .../0001-s3-aws-fix-build-for-386.patch       | 45 -------------------
>  .../distribution-registry.hash                |  2 +-
>  .../distribution-registry.mk                  |  2 +-
>  3 files changed, 2 insertions(+), 47 deletions(-)
>  delete mode 100644 package/distribution-registry/0001-s3-aws-fix-build-for-386.patch
> 
> diff --git a/package/distribution-registry/0001-s3-aws-fix-build-for-386.patch b/package/distribution-registry/0001-s3-aws-fix-build-for-386.patch
> deleted file mode 100644
> index a725ab8e92..0000000000
> --- a/package/distribution-registry/0001-s3-aws-fix-build-for-386.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From 6970080b10a53d858dd444a643a2bd911de12940 Mon Sep 17 00:00:00 2001
> -From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Thu, 29 May 2025 11:28:38 +0800
> -Subject: [PATCH] s3-aws: fix build for 386
> -
> -When building for 386, we got the following build error:
> -
> -  registry/storage/driver/s3-aws/s3.go:312:99: cannot use
> -  maxChunkSize (untyped int constant 5368709120) as int value
> -  in argument to getParameterAsInteger (overflows)
> -
> -This is because the s3_64bit.go is used. Adjust the build tag matching
> -in s3_32bit.go and s3_64bit.go to fix this issue.
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -Upstream: https://github.com/distribution/distribution/commit/6970080b10a53d858dd444a643a2bd911de12940
> -Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ----
> - registry/storage/driver/s3-aws/s3_32bit.go | 2 +-
> - registry/storage/driver/s3-aws/s3_64bit.go | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/registry/storage/driver/s3-aws/s3_32bit.go b/registry/storage/driver/s3-aws/s3_32bit.go
> -index 218e3eab..84161fcb 100644
> ---- a/registry/storage/driver/s3-aws/s3_32bit.go
> -+++ b/registry/storage/driver/s3-aws/s3_32bit.go
> -@@ -1,4 +1,4 @@
> --//go:build arm
> -+//go:build arm || 386
> - 
> - package s3
> - 
> -diff --git a/registry/storage/driver/s3-aws/s3_64bit.go b/registry/storage/driver/s3-aws/s3_64bit.go
> -index 55254e49..2ed1f92f 100644
> ---- a/registry/storage/driver/s3-aws/s3_64bit.go
> -+++ b/registry/storage/driver/s3-aws/s3_64bit.go
> -@@ -1,4 +1,4 @@
> --//go:build !arm
> -+//go:build !arm && !386
> - 
> - package s3
> - 
> --- 
> -2.51.1
> -
> diff --git a/package/distribution-registry/distribution-registry.hash b/package/distribution-registry/distribution-registry.hash
> index 38d7b5a487..9c2fa922ee 100644
> --- a/package/distribution-registry/distribution-registry.hash
> +++ b/package/distribution-registry/distribution-registry.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  6330e6b625c0232b43cee8ea32800a660a7d7a0c79f4f53e4d9a8a6707138d46  distribution-registry-v3.0.0-git4-go2.tar.gz
> +sha256  5ed3891ed90c7d097304f49aec2e1f16299770309e2f424b5ee9531b1da2429a  distribution-registry-v3.1.1-git4-go2.tar.gz
>  sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
> diff --git a/package/distribution-registry/distribution-registry.mk b/package/distribution-registry/distribution-registry.mk
> index a01a3c1710..1119132b48 100644
> --- a/package/distribution-registry/distribution-registry.mk
> +++ b/package/distribution-registry/distribution-registry.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DISTRIBUTION_REGISTRY_VERSION = v3.0.0
> +DISTRIBUTION_REGISTRY_VERSION = v3.1.1
>  DISTRIBUTION_REGISTRY_SITE = https://github.com/distribution/distribution
>  DISTRIBUTION_REGISTRY_SITE_METHOD = git
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
