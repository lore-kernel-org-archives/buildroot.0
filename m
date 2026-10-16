Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4121CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60DE181697;
	Fri, 16 Oct 2026 15:05:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fnHnj6TrBtGz; Fri, 16 Oct 2026 15:05:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 31E14816F5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163121;
	b=FwRRwGrJpts6/5WaVXr5h4x4pf8q+azQUxpMeJFf4wFrQRD76q/YcyJWdhc7rtQviM4E
	 UaoRh8kAl0ldgxzCJGBHyF/MGG1Dy6AYllHpOyDblSPTWHL07DNp/IRH74W2euBKjt3Jl
	 0RkLGQtPsuJM9GELWaK9nUF8dNaAZXsDvNSIZlAMRBd20QvFl4DwQ7yvaYjHZczdslYlX
	 AMSR6pBgcdNSY+6/TMzourvaimpe5i8mfGO+x2kx0Pf2eG88/CkPwwib1+OD/zCgbdUBr
	 te11/FdNE2uXkdbbo6N5gv+oZ+bfvOiCMHGdDIHJuwYP38uRmHGh3wt57HUyTpAilhA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163121;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=WoPYKRag3O4peEg55N9/OYPWS5LaTiS7WIrqBYQzjk4=;
	b=o6RkD9pXsjBGeGZcbHr+O31hZi6r9trftmIi42cS8ncpd6etJGooCagK16syyvcv49EF
	 hV4oRP9NJDIczZhufy+rtFtd9OkbPgN1QrdizeZcsK0lX36oaAUNyZ0JVF4jd4id9w/Yq
	 ygvaoAbEEVsm0EqazbVcWUaGSynhUxs0MKpU9btblSb+1OM7G3gprAk0OHWynB9cgiwCm
	 rAv9eD6+EUWMrYSi9JKWxKNMPTQfcuVhXX2IvjOA9sccX3sp/n6Pfh8sAhgiaaW4L6Yo4
	 rJkzOx6Q3SyU0Wj5MSfyle1y+oGxyrVzLozuqIfzMoGtP4jl0e7fxOKO1dFXq9h+iZA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163121;
	bh=WoPYKRag3O4peEg55N9/OYPWS5LaTiS7WIrqBYQzjk4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kXVN0cmkZA+OuwfrIyWHFfBmjbERVJCEBlIkIYpnspNmjIVtscyswK4tyYhhPbxng
	 smrtaxWP8LEt8n10ViB9L8oj4qS2zZOm1OEUGLD06ySh22C2ypPlOaDpE2KQmRIlyl
	 kuLN+oP7+Is5hCY6fW9K6OEAzYNMj2hMAUd58G34Om0q7BTaR4QDdkmrflJ3UQrJ0T
	 WivD+bYoWKLL3ebtux+ynZaPZ9gdLlkoQESOOneJaU+27hS0zXTYpRCOoNFNOA8fS0
	 vhEFYbP+aBnAGNkUwz2prvR4OXAl7o5e/o2rGSvcPSGjtg79+Mj3z3nN09DtY5gWQ/
	 FhtPpsyOCs0Og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31E14816F5;
	Fri, 16 Oct 2026 15:05:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 51E7B7AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3439D40BA3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0uXwx3ebw1A for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:05:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AB0B440B86
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163118;
 b=hI1CIzYluN0PBk0/TRe9YVcJpx2GkMPlAIC/PUQWvOVJUNz/nCWZMilDOvaapYhwG1ow
 Y4N4Wcw/ZE0yOibGSAPqqUWILWLgBeg2wDe5FrcE432uIsa/ypNJnZLvUnbVYtaVUiHQE
 NYhR1AjFGTf2HJMWdOQKjGWAwS68Jm2HYFi0E21elw4ChkGLyM3Iwm4BWXDWTZRHzlSr8
 o9oqEqD7b6ld40YLfzPcQDhmLPazuzTR6KLESlpKIQwK8afXwkmXhkNjb5COofoo3OZW9
 NhaJa0B+1OYFDtxChlECHerBJV+E2qf8GkcFH4pb+fBFcEJGFbJtZJHkzLPBPuBsLsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163118;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=ApghAdq+LVo/DNKcqzxoRDN/G1/4pRc/aAHP2je0w0g=;
 b=c84aY13kHvZKc6B/KwM32KcWfDv9Y3Q3ZfuyQHcyPynMPGuN78vzZoyGF0gcKufVCoir
 0Se54vyDl6yY/SNbgC030iEmFsfw18LufTb7v3qzriQyNaleiJGlgVTnlRlej6cnmZpx+
 I6EY64IeQUze/XgLA0HJw0D9IHUo0kL/JrUJvol9Bg2Uzf+VXQa+oy1/Dom0qCyYCI1M9
 ngNqftKHQ+2jRyVktSnr7XME9U6xaYM0YDzUWdaQMXZO3/kxFyNAaF/fEV6yJXWWhxmsu
 hUEFj6YVdizW+ldAgJEt2dNvb/z+oeUqEtMDefldbo7wsrsYvBDNOf/yMjnRI5x6eQA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WWxkRA3q; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB0B440B86
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:17 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49e73611928so7134605e9.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163116; x=1792767916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ApghAdq+LVo/DNKcqzxoRDN/G1/4pRc/aAHP2je0w0g=;
 b=X+NTVHBxpYNFmdSZCpE8qowShVoxbJe0/p2L7SRBoWadtNiC9hL/fk2NBEhNUvKqYp
 9aijNYc7pMU3FYON2UMCXP0gfTGAH4y1QPqH2K/D4k0V+bgaAAU++hT0hzVBS2EAgecp
 DlrdgU08h9RC7P4NLWH6AbJgGvpe56axQheNkiEwyemGwUwn49pAQq+tjVdvtjkkxitO
 BR+JbxDH9baIFd96IG1GPB1PM7QYo+IM5sjQ1v1aG/Pl1Dy2ah9plPt3oHgiFmG6+kSs
 KEdfLunNe117wxO54I2G11vo0pHMGPbXMKA1q1R6gSCOFkBvATyCDLQ8OGSskIZh+CBP
 aSwg==
X-Gm-Message-State: AFq9FYLZvDojN6P+5jWb3sQ535ripVxvtACIeV16jch/KOB+9uAp0FyM
 T0mcOKZljBiTaNO6qUtxhr8Ub7QbkKuL3oDi8cCGLrl1fcx7o6vFn+uomgYolT1ah41ioVngzco
 MVjafedo=
X-Gm-Gg: AYBFou2Na/VtHHHixfLaB7Dpj24lNu+yjErYQ6+lrx7GANXg5/1wz1bpaWq9a+QFKqP
 smTl5DgyIFMHR4fR46Zhhy8To8ID7ADbvz8tJcAOwJWdkfni6+InJbWnq28xEBQNyk60hTZQhr9
 PGAuBNBcmfMUN4U0Jedvx449ZBdHQw7l4oTX+Wnz4i04cd0a+mDU8JUIuAyDy7c0Hv/ig8Iwt/g
 CgF+eKNpPZ37dsIjkoDlKk6xUqAW452Dc4EKAMY6ozA66jzVr7O9m4Pj/2qlAC1pctJbP6aVrbd
 B3YCfL9kzBCk2q8EDq0kgy1RT2myXEYR9h/3wJzQxZQMgwgMXWhAh1qsE3nsbomswbuq9WfQhj4
 6PtueBcdnU2wr81CTl3BxO3xkpA+vgAKrJSeDMEozLfBUxhm3znTtyXoC6sHbLtUxYJaQomsWHS
 6XtseimBQrfkZMfqkluEMI01VPeVkwwibbc6zI9a1mbQmqSfR3Ja4BApiVqFH29UW6ZeR9LGAwI
 W1r8S1vnPekkNiyc74KmtA6BYAP1glmN5vYml8lzw==
X-Received: by 2002:a7b:c842:0:b0:4a1:d291:d863 with SMTP id
 5b1f17b1804b1-4a1d291da56mr23426515e9.4.1792163114959; 
 Fri, 16 Oct 2026 08:05:14 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd50d1bcsm5669637f8f.54.2026.10.16.08.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:05:14 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:05:10 +0200
Message-ID: <20261016150513.73502-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261005135659.758139-1-yegorslists@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/mbedtls: security bump to v3.6.7
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
> For more information about the release, see:
> 
> - https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.7
> - https://github.com/Mbed-TLS/mbedtls/compare/mbedtls-3.6.6..mbedtls-3.6.7
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2026-50587:
>     Timing side-channel in RSA PKCS#1 v1.5 decryption
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-50587
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-rsa-pkcs1-v15-decryption-timing-side-channel/
> 
> - CVE-2026-50581:
>     Extended master secret calculation failure ignored
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-50581
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-extended-master-secret-calculation-failure-ignored/
> 
> - CVE-2026-50640:
>     Ignored TLS 1.3 resumption secret derivation error
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-50640
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-ignored-tls13-resumption-secret-derivation-error/
> 
> - CVE-2026-50713:
>     Heap corruption with early renegotiation after corrupted record
>     in DTLS
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-50713
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-heap-corruption-early-renegotiation-corrupted-dtls-record/
> 
> - CVE-2026-50584:
>     ChaCha20 counter overflow can reuse keystream
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-50584
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-chacha20-counter-overflow-keystream-reuse/
> 
> - CVE-2026-73096:
>     TLS 1.3 early data integrity failure due to buffered plaintext
>     across key change
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-73096
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-tls13-early-data-integrity-failure-key-change/
> 
> - CVE-2026-35336:
>     Possible buffer overflow in mbedtls_ecdh_calc_secret()
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-35336
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-possible-buffer-overflow-ecdh-calc-secret/
> 
> - CVE-2026-50580:
>     Remote buffer overflow in TLS 1.2 ECDHE-PSK client handshake
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-50580
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-tls12-ecdhe-psk-client-buffer-overflow/
> 
> - CVE-2026-54435:
>     Side channel leak in ECC optimized modp
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-54435
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-ecc-optimized-modp-side-channel/
> 
> - CVE-2026-50586:
>     Information disclosure in TLS 1.2 NewSessionTicket
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-50586
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-tls12-newsessionticket-information-disclosure/
> 
> - CVE-2026-50583:
>     Out-of-bounds read when parsing a zero-length ECC public key
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-50583
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-zero-length-ecc-public-key-oob-read/
> 
> - CVE-2026-50588:
>     Out-of-bounds read in TLS 1.2 EC J-PAKE ServerKeyExchange
>     parsing
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-50588
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-tls12-ecjpake-serverkeyexchange-oob-read/
> 
> - CVE-2026-50579:
>     Use-after-free in mbedtls_pkcs7_free() when reusing a PKCS7
>     context
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-50579
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-use-after-free-pkcs7-free-reused-context/
> 
> - CVE-2026-54441:
>     Signature algorithm restrictions not enforced on certificate
>     chain
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-54441
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-signature-algorithm-restrictions-certificate-chain/
> 
> - CVE-2026-50585:
>     Incomplete context reset in mbedtls_ssl_session_reset()
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-50585
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-ssl-session-reset-incomplete-context-reset/
> 
> - CVE-2026-73064:
>     A random generator fault can compromise TLS data integrity
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-73064
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-random-generator-fault-tls-integrity/
> 
> - CVE-2026-25832:
>     TLS 1.3 client accepts HelloRetryRequest selecting an
>     unadvertised group
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-25832
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-tls13-hrr-unadvertised-group/
> 
> - CVE-2026-49300:
>     X.509 CA bit forgery via invalid basicConstraints extension
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2026-49300
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-x509-ca-bit-forgery-invalid-basicconstraints/
> 
> It also fixes the following issue, which has no CVE identifier:
> 
> - PKCS7 signed data verification accepts weak hash algorithms
> 
> For more information, see:
>  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-pkcs7-weak-hash-algorithms-accepted/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/mbedtls/mbedtls.hash | 4 ++--
>  package/mbedtls/mbedtls.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
> index f1be074e08..71c5612b48 100644
> --- a/package/mbedtls/mbedtls.hash
> +++ b/package/mbedtls/mbedtls.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.6:
> -sha256  8fb65fae8dcae5840f793c0a334860a411f884cc537ea290ce1c52bb64ca007a  mbedtls-3.6.6.tar.bz2
> +# From https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.7:
> +sha256  a7e8bcbec0e6f761b4af24f25677626b35f762f68eef79c08677a363212d11f6  mbedtls-3.6.7.tar.bz2
>  # Locally calculated
>  sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
> diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
> index 9def876808..3545c42ad0 100644
> --- a/package/mbedtls/mbedtls.mk
> +++ b/package/mbedtls/mbedtls.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MBEDTLS_VERSION = 3.6.6
> +MBEDTLS_VERSION = 3.6.7
>  MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/mbedtls-$(MBEDTLS_VERSION)
>  MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION).tar.bz2
>  MBEDTLS_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
