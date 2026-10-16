Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A62CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 137DB40C19;
	Fri, 16 Oct 2026 15:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHJcXjJEVAgL; Fri, 16 Oct 2026 15:05:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7CBC840C14
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163139;
	b=AKSGfyS1TRXIzaebDQEiWq9x4g+09M8UyCkzXIzMyhOvfGI7Qs+tQK+Ip8i91xlEfEnd
	 N/LKjJFU7T8yR1vMxpSvRBdkaFmebvl26bk79t2gO1cspCZB6tH/YWz1dMhPASLr4NisW
	 HAUBX8aWsJyovxMM+lvP0ySyXFI3B+Q9mgmIufPNSsIEM3E5HPnFwxoZzI1k5oFY1uSSz
	 zRSn2nXBJ7phIPQpQqJCxV6zt0lkfjDMLGMrX1orY5K23HZBHwCYEFZKsNf+8hQUdhcfw
	 n8CMeN90NnztD3ZqG6WODbNzlDaG/bgTmSRUT7QNeIAcRwQAvQM/XDSdQ9Q52BjxIrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163139;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SG4LL9JR2VdgfUd/Rm0V6iaOtGVh5Xy/GREw5R+w3w4=;
	b=pHkolXEqoYMhIL3z5PhXZzbGyrtWMg7tEuXeEbgPihllQOojQx9LAoUe0msrWyxiKNPX
	 fT0x34xDKPpFR6/4Z4eFzSHLkdoLt+CNWIiPDUar4qMvt5mXHzuaLH6AxLsRSzI3aMHai
	 4iDmtvlOsyUW8zD4WhQvKiyEUflNFJwYe+GUeUdopvz28LW7WGI2BtxIXnmCl125DFQ4h
	 xrDDYJsw5ZQKw2N8mq5DAuHHB32iG3fYZ4gBlM+Idm+xGdrfa8IipOBw56rytlfcu+tdQ
	 UI0WZUStIbvSmc2D/9UjQdKDHXzAgswCp7C6U78ak5+pZTGe2ndv82x1q5aw6T7WHEA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163139;
	bh=SG4LL9JR2VdgfUd/Rm0V6iaOtGVh5Xy/GREw5R+w3w4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=URnbqiaViPL6eo4j8sXLQPqgxNSiNJgrgZJeYohyT/v2lgDtIH+fuNjJzdIKRNB9N
	 9N5caWx4r0Vj5CysengfPohNgukmof+rm4CcG2K32mbhmURN/d3pLkf3htUcnqlhyt
	 FG0iehXvu+MAqzZNcaWu93uuicBD9WcOsJl3/JViJAnSHSOSe471bDufbLzZN+jdbP
	 +mh4pYDPKK+2yxc1GffDd5G3xkodUQQfbT94Q7m4aPn1GH/wO03FYJJoNRAgtogpbF
	 Gub+kFK7HqOhMV4S466z2NXlgo6URvnxp7ebHYgLx2Mh4w7Yk9Wx21onwyhVmJqHEK
	 lDLNBf85dS2Sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CBC840C14;
	Fri, 16 Oct 2026 15:05:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3D73255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A197D81747
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tU9veRhM035F for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:05:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5F67F816D8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163137;
 b=pe3XX5JXD65hgY8yEy+pQtmONgyfcZU9EI+8iROoXRw2qPiUrMiac/a+khaZPi0zvw3c
 2XNhKtaBzGR06dbK2XYE/k/bw0xzBsjOGMfHZ+TNCHW7AojJjcEcAdaeBqgiVQPfy0L93
 4RaI/Oc49qowCnA/nNkQWaE+Z2os3AqlPDacuYck9+iv4UPiCXvyyk4TKGX9qGBgVIp9F
 GEEVdXMkdckrW+ha7GPXLjVv48zX4vZhJGRC9N/UQOnx8rqDjVQpTsC5pgvX2o8C3PiU6
 hT91FVGndSCXqFYBLhUQ33g1JXBEvMnAel7TqZ1KAA+Un2+0KEkUo2vLlWFpJ+Ob/gw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163137;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=vaPUbXyoBZNfZQ8eSJIBW/0LZQpMmRJjsQ/4iWA023k=;
 b=qBF8lKRYPBEY0hdUzHDQHHlIuSU9RlRBehggtj8+6CFiVTTck1x/1AgmF45BN9GZC+VE
 dAIERhPH5LIp1h1BD+BGvs/lc12DF8bU1xLXsNkTzBYFrmycnmgdg5QxX5+p6vNcCFBFI
 KDbNcL5qNLjDwE8V5uVh/nAG+l5ybS4CMswonq8DcGJX+g0dK9icCi+Zch/WQ9uPFmHmP
 Wb+KItLLiXO79xq7l3omWB8btZFMOK+vxuY/z+Azr7J9B6rI3MG5STUry+LN8GTwsb46l
 Ol4wLycLN4RIHPiX3ocITvYNROktTm57tmJYhX9Ge0lNC1oi3BkWtPXmVE5uzlwwvfQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="OC1P/Gvo"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F67F816D8
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:37 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a16c399641so442555e9.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163135; x=1792767935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vaPUbXyoBZNfZQ8eSJIBW/0LZQpMmRJjsQ/4iWA023k=;
 b=wrv1rvmpimPUpQK20cX7QUdutwbP5+/nuWway26aMtFKrjkddd8nu0kUhjsTuNdH+s
 77HFuJBa4mG5m5E9yvf/HfAM5S2j9SdmcdqeqeB4xNXBUZzhNnm8C7kr4/Kb1sWxcAPm
 1kBE3v9tG2Fqns/arBPzryeF6t41oKUxTqJQbCADvCsFwibxWGVccjuY1Kuax3C5sycw
 cFY5NtWKF9NQq7+CfHSiw4tdwXbUv85EQ9uHLURbTRdCuYN0j5ynty6oxYGTL91RV7ZQ
 2jejgxUlTK8Gi589EdsZmPZfkPM2ePZ2pHBZHz040tJVfud1xIQ1oz3edqHg/eQi2mkU
 KsBA==
X-Gm-Message-State: AFq9FYK82VRj4/G5Y+ZAzVvnB5kb+10b+pDfAdHOB5n/+S1IG/eKQ8aq
 ub8Oxdlg8EJu+U1jK83f1DZAwkaztYKm0Bjo5yVnPJCOsb/IKS1PVyrQxKXR+0py72AbK2WTueN
 /1zbYUpQ=
X-Gm-Gg: AYBFou2wzxWdhJa9TFpiG6ASqnalE3GQJvQLuo2TUcDVrxpRMQb04b8awCHP7vkE3SL
 XGGiD2lUuxZJVx35FQqZuqJC32sY+DcQwNV3/1grETwdXsjztDj5W+uIwu87gLva9p9uLSnU2v+
 oNp6gPkRsadrL0VdFSk/jOVPiInkO/nJtK/JdC/AlFvvQYq/k5P6GXL4E1ROBh88g+vD3EqsGCx
 nlpmHmdCYS6NRRb99cKsajjev2JFBhZxeVr8ZskAvr/sKn1eo+rs+dO1p1MbkbaRZ8QWfgotICj
 2N68vkOwJokG+vwlILUOTK9z7UzYwWGckxYXEkru6GcTaokhgdT9nvmV7/pchwximoYCtL1swRV
 O5RaPZWniqmv38SH9KffsPcfj8wDWZlwkVLwiMJSv+b+KnwZvNvc+NRnx+DnvjjAyZKPaEr0Gjp
 AnoUVozBXe2DozETzsm671ENvBGWyM19qDih1ALHxcOBvnok5jRP4mrszwtknbdgDIfQ3qtD9KF
 SLJhHKbsFyPzIepr6bnweJNtIguwzavP+fZ7wsgORtxshvnGFUsHw==
X-Received: by 2002:a05:600d:849a:10b0:49f:e8bf:8f9b with SMTP id
 5b1f17b1804b1-4a1d75af354mr2023555e9.4.1792163135000; 
 Fri, 16 Oct 2026 08:05:35 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4c5957sm5483147f8f.9.2026.10.16.08.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:05:32 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:05:28 +0200
Message-ID: <20261016150531.74291-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261006190356.176112-1-thomas.perale@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/wolfssl: security bump to v5.9.4
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
> See the release note:
> 
> - https://github.com/wolfSSL/wolfssl/releases/tag/v5.9.4-stable
> 
> This fixes the following vulnerabilities:
> 
> - CVE-2026-15442: https://www.cve.org/CVERecord?id=CVE-2026-15442
> - CVE-2026-89102: https://www.cve.org/CVERecord?id=CVE-2026-89102
> - CVE-2026-89133: https://www.cve.org/CVERecord?id=CVE-2026-89133
> - CVE-2026-89134: https://www.cve.org/CVERecord?id=CVE-2026-89134
> - CVE-2026-89135: https://www.cve.org/CVERecord?id=CVE-2026-89135
> - CVE-2026-89136: https://www.cve.org/CVERecord?id=CVE-2026-89136
> - CVE-2026-93302: https://www.cve.org/CVERecord?id=CVE-2026-93302
> - CVE-2026-93304: https://www.cve.org/CVERecord?id=CVE-2026-93304
> - CVE-2026-94417: https://www.cve.org/CVERecord?id=CVE-2026-94417
> - CVE-2026-94418: https://www.cve.org/CVERecord?id=CVE-2026-94418
> - CVE-2026-94419: https://www.cve.org/CVERecord?id=CVE-2026-94419
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/wolfssl/wolfssl.hash | 2 +-
>  package/wolfssl/wolfssl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
> index c259734875..23f90dc197 100644
> --- a/package/wolfssl/wolfssl.hash
> +++ b/package/wolfssl/wolfssl.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256  2f4ef3d4fd387a9b3191d36a6316d69116c46ff69bb9583b6c82b36d7b8ca114  wolfssl-5.9.2.tar.gz
> +sha256  7256bfc89b183a75183806c7debfa203443873b0b4a562e1b80d68e01b45ac57  wolfssl-5.9.4.tar.gz
>  
>  # Hash for license files:
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
> index 779fd2cabf..20244c4e83 100644
> --- a/package/wolfssl/wolfssl.mk
> +++ b/package/wolfssl/wolfssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WOLFSSL_VERSION = 5.9.2
> +WOLFSSL_VERSION = 5.9.4
>  WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
>  WOLFSSL_INSTALL_STAGING = YES
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
