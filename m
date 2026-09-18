Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC24C982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9717B60E9F;
	Fri, 18 Sep 2026 13:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dgz07kZOWiSs; Fri, 18 Sep 2026 13:10:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A155460E5C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789737023;
	b=UCHxvCdP/dQUoT4ykjnpPQly0atlxvj9tXf1F9RqqY8Hc7fZLbObkwiQJRHfcY+oEJ8d
	 tjEaV6acWVrJfbIcwj7pJwcgRwkG9u7UiE0POKXbzvGr0xPn0PaCeXgwi2vI5VK0qxgJu
	 4QHgLo9AZP9SNrInPoJkLK4F7cdg61bjnlhxazxCcwbCP16+z8a1o1VzdrTnvwFQ+lFcY
	 ETiG6W0Me7d3y5HWDmSagBYEZvr6g7iNvUx1JBra0J+LE9fP7yQx7BqL8rqClqMucDmdS
	 bD4y63egMkL02igglgWKAp1FHoSvXFOmyGAHqjMtAULF4Y62NOgyzTeDbfpEwRoa5yA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789737023;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=im7Wwt/75rUA5uu9GgyrMhL6c/HqQzYJc5atZsITC9w=;
	b=Y2t9gniWZu6wIqC/zt9b/O+BXyMlz5mgwviIdjQdrfotNvwX2C0bwt53cMhyGjwfIayd
	 HZseLFkOIQRLhSgZXYPmAqIUYn1ql+d1uMeqdf6P6tT9Pq046kQGAcWfjLdPkOjKx6vZ0
	 szPaTtjCVNke6DBMcf5IFS5fXB5r+Ex8GL2dNG68P0dv41h/Gck/zHx68lu/sOlLL+U1j
	 F2yN3BRyz1aEpY0rg9j/VxmgJMad4mt6dq1zRxMjxcM7cZrXcY8MI6cXTw9CC8yeTDBfi
	 3t3pgqILecnFdbNoHNMSBKymDkDSq/TgA4Ww5K8Ir6H5leHQZxdzWZMTj2cLEjGFyaw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789737023;
	bh=im7Wwt/75rUA5uu9GgyrMhL6c/HqQzYJc5atZsITC9w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YyQXkmQT5c9/sJyr52APayGlsEljUqYTsf+Ls18wZHWl9bAFWHXyGtpegeRRYvM7i
	 EYV8AbtYqsHZ7+OqonqoxkrN09Bkc/ZPNsqgnHqtkYXiJfyoZWW9Cmdy4Ss8Hpb9ea
	 KrSk8UzrPz8LAMTp8rSfsnEhMP2fMpg/CMv5vnrIJdKpz5wxL9ac9r/9nS0LQMqb8W
	 xeJLRq+XTT+o5777PwBpCf1AsZKGvaDzr2xOgYnMjtKF+flG6pM9jRW1allKurSK8x
	 miB9mNTvvN03F73qZyGUR1EGD2U3jJoGjGRWsHxqYi8yygBoEEPGml6m0HUeHWm+hT
	 dWGQ5+yoPpxdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A155460E5C;
	Fri, 18 Sep 2026 13:10:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D005224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99FA160E02
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qx1BF4dW19Iy for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:10:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6A5C160DD3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789737019;
 b=F0dEK5sQ9Sx4xbmEKPFisKKjCef2+b7jQ3XCWogJM3P4BK4r4u7MyE7iii33bP/6T8NJ
 OIOulo8DG6gGdV/PaFvihZ1Am+vGzNHPUJXNhQqTZsyVUOuK8Ey2elxDC3b2G7FPMZ4Y0
 bCUkHl0y8+VGkjJnQ/Zymg49pHvXZIXZ4uwFSEWlBEr//C37CpURwRe8EQL85IDnEkKeF
 KfSDXGgxD/IbZuKqNPDAktbjejzUAv5i6uCef+B59a19IpgTgmlHwPTgFJjf3wI2GVjXd
 9ARFgHQo7zaULNu+6k4pWVlOzLGDscWJpV6QEJb2cr8HyVkvieA/EY5eRwkUGM7N27A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789737019;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=sZOXISXDrew+u7kmQ+SmkpXPbcUsYi2xiut+IWpE1Sc=;
 b=tfJrCSI9RN5AwOA4ITyrDTVn2s2Hgj6ZRyYf5bH59uOh6RjIkh2ps5jqkCmPIXp+lRcu
 iN1UhFLqPekuDT1ZAFnEP1sfAF1AUwEMJYrj+OThuln4TVranFu/Tq04htdQ1bngcS7cG
 BxRXbeE9T49amxqZ1NRFMYNTEIv8CSZR1Lib/ViIepSOeKQgDTi4yco2JcLIke5RV8NW8
 Xn7NvF+DPYZ6D+9061X6ANF6OaEZvJqYs/pUC9kQSR86rt2YKeW2SVjr66myevqgwF7Wq
 6QtvveaH0gpl6TCeD3c2fGdbopQ5yE8QIhuv7f95kqbDkh19mP8X6cQcjRhQFtIOKKw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Bk7msnIm; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A5C160DD3
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:10:18 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-4843cedd129so450418f8f.0
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 06:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789737017; x=1790341817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sZOXISXDrew+u7kmQ+SmkpXPbcUsYi2xiut+IWpE1Sc=;
 b=vzdZzXiwohiCi1qg365GQr9I5M6nYB6ab96WLWk8a5R/mouXiDgDQ2m2o2z0RtPRYB
 EiWZ6QNtP+zmbe6hJ4STX8LZ3cyxu/H29JjNeoUcANCPhCZ17ZrYr401dq1HfTqLTGxG
 utuGGEIkkK+rcyQkFmVhbSsvqpUNE1k0Az9BAyHX2APJ5cAfn7zRJTlODWcP8Otd+XFg
 3v9LMy3Uzt3PS3lcLr5P82wLNPU5amHpnqkdKlwkBH4y+GzJfyaI/PejvqOHg0PMadnD
 4Ua4bcs5FhdB/OgZ7i+k761Qa+jAcUujL0gwiEDbuGhlKsISLqOEBAC8V5oA98kvez9Q
 5cHA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxdXcxwpyDM1pWwnOliB2Cd8UN1bjoIvtOAETfaSPbRE+IEhI5ylBZidzGDzVQV8JDf6LpbmKpe6wQ=@buildroot.org
X-Gm-Message-State: AFuF++nuXyfpc3UDnNK3Vf0XWH5i4YtqgQ+BVrBsjtODh+O62s+eTIyr
 rNDtdt0wS3XNiiYc5N8iRydaAkytZ+V2Hj6Vc9rQbvzG4Dia+czd4FrBTH95UkZmnGaKZm9RqCe
 ppiS6
X-Gm-Gg: AYBFou3JLt8RoAKATWQRMtV4Qn3zsDJ3nZ+EKXJD/tby9XtIMoRbU4IYo3a5qgh9aHV
 iC+Ljx2Ft6bU3bOP8UhSBZVw/cMEYP2ZnSEmSXjdv6uDSw313pheEDt8AYvSQRv4UsKzI6/trUz
 p+ozdTAP+0rzjn9mhGIbHTmrk3vIROch/w4rgMll8d5bUgKJn1MMcRc5BDI3Srp5QFpoCalHo+7
 zLB1m+gCv6dAudfAPke4Z89Cb/wDhx+OC6MpISvtmkYcIKSBSLvNEhMxWnUmsExON54CC6e23Z/
 X7yW4fwxsG3GM/9GMoX/FXlA5hlyB2SdO+R22G9LxIj+dlV8A/NP3DS/tjQ1glnf0GklT1Su4Fb
 OgEKLlW1hk7Fnew2N50AI9PVmL6PLKZiQmNWMo1JNFuuUdNVitXGecC2eNDzKx18SFvyLlSjBv4
 VsiEtF/UG80SunaYol8atY+G5gn7HuQ9RpvwQ78ipUdMLgubMjOyJJz6LSFAv9R3hl
X-Received: by 2002:a05:6000:2912:b0:487:72f:fb42 with SMTP id
 ffacd0b85a97d-4871e25ddafmr6359026f8f.14.1789737016997; 
 Fri, 18 Sep 2026 06:10:16 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4871ff3a957sm4107517f8f.7.2026.09.18.06.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:10:16 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 15:10:16 +0200
Message-ID: <20260918131016.163757-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912211206.1555090-1-thomas.petazzoni@bootlin.com>
References: <20260912211206.1555090-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python-memray: add missing
 dependency on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
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
> BR2_PACKAGE_PYTHON_MEMRAY selects BR2_PACKAGE_LIBUNWIND but forgot to
> propagate "depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9".
> 
> Fixes: c2df8bab97d7f7b8b61ce055b4820ceb1bd34a48 ("package/python-memray: new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2026.08.x. Thanks

> ---
>  package/python-memray/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python-memray/Config.in b/package/python-memray/Config.in
> index 1c5b286a8d..16b661f8b8 100644
> --- a/package/python-memray/Config.in
> +++ b/package/python-memray/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_PYTHON_MEMRAY
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # elfutils/libdebuginfod
>  	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libunwind
>  	select BR2_PACKAGE_ELFUTILS
>  	select BR2_PACKAGE_ELFUTILS_LIBDEBUGINFOD
>  	select BR2_PACKAGE_LIBUNWIND
> @@ -19,8 +20,9 @@ config BR2_PACKAGE_PYTHON_MEMRAY
>  
>  	  https://github.com/bloomberg/memray
>  
> -comment "python-memray needs a toolchain w/ C++, dynamic library, threads, wchar"
> +comment "python-memray needs a toolchain w/ C++, dynamic library, threads, wchar, gcc >= 4.9"
>  	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
> -		!BR2_TOOLCHAIN_HAS_THREADS
> +		!BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
