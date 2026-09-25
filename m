Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10ECC98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A913E60D9B;
	Fri, 25 Sep 2026 14:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OqUo-xsKDhAn; Fri, 25 Sep 2026 14:45:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D267C60DA0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347557;
	b=fqtKPR+ZvHpBkl1KvooX3tw6J/NHxFXi/Z2HNOsjOLcbCQMr7XbcJEMhE8svxn9BAtox
	 a6a7w6Vc4D4nZvV8iGGKi5vLinTwYbYazcsZ41Q0+QP+RJ5ilhmqKAyNmeZ9Z4+KlVyUK
	 yV3V499Mf77WFRBZzm7g6W5Sv6QdnyxVChXzXMXuH5XEE5LJUlVaOC779gy0iE/bXIv0C
	 G5et/KdJoh9KPUHoazM7AZxrvyYZV63w84SQja4LWe2x+OBm+TV0UrutHrt4qG9s78kK6
	 00SKUJj59MnXWyh+CtEl0nZMSXvAH/yVjhdkuOO5khUJpKRy4sQbLHjWshr747sJADQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347557;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/slbEhTWo7FMTplf6wXjrYaxSTZJLH9YmyXq+tSj/kA=;
	b=dgZjVDnvShSN+5I6aDDV96L5HhG3zXzcDdAvB0FuGMmW+/bQL8Vja4kSagYADMZehif2
	 72cHcb1KjPLTTsy8rL5ND5/ETO/JgNsidx1dVQzvr26gMVRJo8BUKDMp0Y52C+Axg+6Qb
	 6/xK+Gl5xlGVMm0gMRONt+YWrNot8FmY876eaY746/f/m+1sF0jPtNvyCY6NFVMMwaBqv
	 g/YZCMAAbgaiqqdvAyRpA4LEBjbZ37zpW8YcYZ7Awy7+KO9HlV2U0/dYaE/3lz+lDAOl4
	 7fkImA1+JtaxkeHbeKwtC4RUlk1X7vRDL8lMFm3UoMcepOXDT1fDDSVMarPSiY8VsWg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347557;
	bh=/slbEhTWo7FMTplf6wXjrYaxSTZJLH9YmyXq+tSj/kA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KDHGXbQSbH79e+DbvsAsAzZYhVdaAYYpox2DsGxi5eURVyhckZM9EdTj3fHcRGnfm
	 cLGnpIOaz1HU9mH9PsmnF4uEtD6/3lj++zSdw0gcC5pbBW/6M0ycT2r2sDYlpo0Sjv
	 0/07Peg+bh/VzPXFL3XB1sU/xK2HmxLhERp2PGUJFCUoR+XCVU/gdjW87F6+ot/N/7
	 VUifzCPx6qpinwk8JXZ0WitbH9WHr5VaXyK0Km+ULU/WzcF2Gs5cE96RR0Sswnw+U1
	 89m0hjxdVT77Rm841P+G4dwcPHREKDm/sMQLM/UVDtO23cxRihLZGR8OQzPha+nMxt
	 Rq1iZORw+4ULw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D267C60DA0;
	Fri, 25 Sep 2026 14:45:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 142EE334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0686A60DA0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XPV3DHvKZXfz for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:45:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EDB5460D9B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347552;
 b=SmAm3Td2ZITzjXKCZP6DztM+Q3JnuZupvPmoQbY9MuFITXPS7cDToRQtr1vk7qwYk/Ci
 Oy1l88AN4T8zxo1zNO4aGyD/DBDh/4dgFyvLggZAprob31IUWqffBJMiiT6MHQugYrg0/
 h77ccWbkQZ3Ug6ve/+ozd1KaSheyh083HRz9AdFH8RdqyUDlf7at7L4F6KKtgFtcnkNdq
 ZLY49Int6XFPdxJkvbhcertKAIemnNWtc1r/B5NG8agLIzFE0IKUJK9/7xvPce5Y67CWj
 IKOu0vQhkQ6OYMeV7cDfR8b8pyuJighoD+Rkf2t+YrIOZxMnAhdO+feCIse6oE6DplQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347552;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=70p12R2Whj+HeYibaZVh+T5nXvLc+O36D02WbQYwbdM=;
 b=e1iHHAqKy0f5b7LigDYa8KH8rIzKpw1y+D0W462py+ezpXRp0QPB3iBiS1+tfuQ9WZaV
 KBiBQkKKkmrwMv8SveUSHBp+ncvMtFEsxNsq8KeIsdLGZYrSN+ZobTnba4kZ8p+DGTKgd
 zcEu6l3UvocxRwyazEtxFDTSksKlAWwsYn+q3gR5/DUAAZ7ELroiFYbwZpKVp5RRuG7FL
 M1pCwjGxN5WCMHzD2x0POCxehV4lcxHyHkZ4y6qK9+MiV2DJ+CGJuMhWTxoX6jWa9Dh96
 nEfRxYADSRl8L3AmbP0o5UpSLkIk1+A6BnBDN/NXlkyTjnEEqBEQBtikzVPP33WKoSg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=iEc7vuY2; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDB5460D9B
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:51 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e83a388f8so6731115e9.1
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347550; x=1790952350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=70p12R2Whj+HeYibaZVh+T5nXvLc+O36D02WbQYwbdM=;
 b=puLcaBRCXYVmNk8TdxdqFLcK/FQKtDJMFIKPJ900rFSCGZk7V6lS3T0Kj2VbZ70Xzv
 7a9yrdEyVKTtz5HBsv3rK+Avq8lyQxo3VPXcM1uoRkzWO8LZMXJnmpgZbwULlwmT6891
 1tBc3ZjOIDJQflOqOyQZ2Mp4diHt5Vf57NEX9GzNX/Kgrcj1jCmbZd1ltBw3rXs6l0E7
 vMBnLoeqyl9SUPsSMFVNiBqC43bqOkiezZ8HtrFeZ0EKbBpsmiycKIdm7jJs5WtkrAWF
 n1aJCIuT0BJPV0wb6RTxVFTgl/3NHO23r0yD9H9ck3/LMYNTv0Ta1HoQeMFRdh0mq+bN
 JCkQ==
X-Gm-Message-State: AFuF++lbaF1G2KA1q3Z4IjH56azKjArSvD0YZCJieUSNszggrv73eG6Q
 P86bASIIHy/UgwBF/QTrpA5BQcYzluOp5LBmp80BOv+eKRO0ouwjCVp28NBkIrRc5yKae7nWQGw
 EIiPpR7Tejw==
X-Gm-Gg: AYBFou3/6OKHXsUgoTz6J18VnQMl7JnO3cg1lc7N/Jr0pU8z4RE6EqlZvEC09Vk5k6d
 xkYo9+8Lg4VrX+KdSdj5CZ2WgsdNEzJSZI9DHl1ZHKslks/5mM9ChhZXjULklv+GepSGtll0FoV
 y6zyx+BXtv2R3sanrnZIE62iv8IbVhGIvSZU4dTP73shumcp9AP0yl7oK4HpjXAjUhuj7VNGN3d
 zTxa56oklzAebGmvqWT/jqftJMSAuunIiP6zMZt3E/x9dnLpnQ+Bww8kYPHQ6A0+BAGvX9aPH48
 8Mk+NULSnuOq1ayQ1cbaGgwbE9NT7RmW59DWYBEovZc9rM0gTKc6vU6tehTkONwnA5oVdxwRPhq
 F06GVzMlWDBlo/NJN0Y827XyY3Ox0YygYC5L9QsmSCNfUItnPqKjSJQEJ2kBXy4XFphz0JqOCy2
 mfzKBehWS+/Bqp7C2jtkeLjMuHUpJZxpm/iMAIbgK/HBRZUx2RIGM+H4fka9XfNKBMy8nKQasWJ
 hmey0lqZJGMm7UA5vwqM9TksAw=
X-Received: by 2002:a05:600c:46d4:b0:498:943:ccc0 with SMTP id
 5b1f17b1804b1-49fe6e35833mr102769815e9.6.1790347550001; 
 Fri, 25 Sep 2026 07:45:50 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a64ef3asm7809850f8f.30.2026.09.25.07.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:45:49 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:45:46 +0200
Message-ID: <20260925144548.4098310-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915215100.2031555-2-thomas.petazzoni@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/tensorflow-lite: fix Config.in
 comment
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
> This commit fixes 3 issues in the Config.in comment:
> 
> - It is displayed even on unsupported CPU architectures, so we add a
>   "depends on BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS"
> 
> - It doesn't mention the need for a glibc toolchain even though that's
>   part of the dependencies
> 
> - The requirement for dynamic lib support should be part of the same
>   comment as the other dependencies
> 
> Fixes: fd29fee3a3ac0ce45404ed256d2059836c352728 ("package/tensorflow-lite: new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/tensorflow-lite/Config.in | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-lite/Config.in
> index 604a1ea9ec..2536112f99 100644
> --- a/package/tensorflow-lite/Config.in
> +++ b/package/tensorflow-lite/Config.in
> @@ -31,9 +31,8 @@ config BR2_PACKAGE_TENSORFLOW_LITE
>  
>  	  https://www.tensorflow.org/
>  
> -comment "tensorflow-lite needs a toolchain w/ gcc >= 10, C++, threads"
> +comment "tensorflow-lite needs a glibc toolchain w/ gcc >= 10, C++, threads, dynamic libraries"
> +	depends on BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || \
> -			!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_TOOLCHAIN_HAS_THREADS
> -
> -comment "tensorflow-lite needs a toolchain w/ shared libraries"
> -	depends on !BR2_SHARED_LIBS
> +			!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_TOOLCHAIN_HAS_THREADS || \
> +			BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
