Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E9CC54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A32781271;
	Fri, 31 Jul 2026 12:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wAj3BxUBxb7T; Fri, 31 Jul 2026 12:04:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6A2C81274
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499485;
	bh=7fg/zD8zDzl2ggM8rlCvzoynhmGW8QqP2Y7Cp2/PXDk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pUu0/cgQz8aJaCjbqjDMVrbcKiK06yo0JQfiLLGYYG6eZbkL5NIssX2+iDtTdunkk
	 t4RRgDvL3gi0xVpZfixWyDxZIIBEGSmEs+g5QHEXYvVIejgaXJMS77067cnjGxQ9Ad
	 8m9eiUAr7+EBv7NzVLo+503W0yu8ykgz2hlfjHYYCv5DRJIjl0WddkD35Fli7aO8TH
	 sOaQfIWWWTcFd/gnKCQeEPrnfFKGG8ypX8bJKA4roLdyF2mNfqshT4RJ/NC8+ngaa4
	 W/WGh542kVVnUF9KjBv9644zOPe+coHF3E4OvppFCDhTGzvCOISTmtyyYgKpqQ1m/J
	 NOyauCF8Kh0Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6A2C81274;
	Fri, 31 Jul 2026 12:04:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10C7227C
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 031CE60ACD
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iupzhf1TIglK for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:04:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A458A60825
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A458A60825
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A458A60825
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:04:42 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4720f3bf164so1231042f8f.1
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785499480; x=1786104280;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=td245GWNFgURU1AoPC5J8kVOknVcczq6t2PMje/+Gfc=;
 b=AIefeJv6FpXfHRyQ+SU1AaJh1nKicAV1YszBL3tWQNOUbRRncs9kQlY3bJn0itXGpS
 ABP+DZZGWEo9xZl+RUxtn8sKCeg1hcQ9aUBcNQG/CdKHbrgaERCGJHSGTu68TIxDUnX6
 ybRuFrlUzmF/+xZvv39EnWrYrT/7f8asPJnSacQbLD447gYbtFfAziboNHODSsH2sKgP
 KwjEqoe7W7q2uL6TAUOMmmh+ScCilsoA9ZROFOWaOghrBSzAQYCdzHK8wYde/0FE4uIj
 U9s/2KF91h3MbPB2SyHNrmCz8hWlYu4BQh1zz7PMAJaDxKT0g1RFcbEbagCDGHDHpEOE
 6gtQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RonazLHVEXFBBaD3hdDTaFbMX94pJ2/93i41CDfC1+u3JNI/cxH+FmP4rwMsFHrgacb6bEBED/cWk4=@buildroot.org
X-Gm-Message-State: AOJu0Yy1PnMA2AKbRXVPf4q8QAasxQdlcMsw3AjvUQWHfV6zI9tZNVzi
 IbNPbTamf5MkafIUUBKJzJu5bfC2EgdiVhHypPMbTz6cwP5FmmHUyqFk9vDOPzl0B7GLd5+HN9t
 37ck5
X-Gm-Gg: AR+sD13htpMmLNblxO62cHWtTk/RBOhCULOENV0Xq61pUXKhvbH0aFRwgN0ZrtI+gej
 cxcP/pUDSyAqKfu0cXl98rNFfo4XYSwQEaWZvOcOQoCyjYhY2t089a1PsK+xMzV6nbKeaZXO9Z0
 o+oSKFmW+kH7rYbqlRMNPGSJDEXzdeNRKkKlAl51JbFMmwNXSpIoXX1EesE+Zo+JSEbRSGctC8H
 V/+Z4zxkrDW/Y9G67oD3vQHUbNpCYvOLPNsXNMGJzZu0+XMrIT2b8U2oThNaspvnUROrdiq0Q7n
 TcBmC453AuEsibDBg5EIUdYb0thpkRIp4+S9Pm0NRulEHgnuRBgirU80Oy4RNcv6PMqI0mJJmcf
 USlBrNZM28C9e5s6XVv01Pjghs7OBnCA54SdVYOMmBxkVJ/m4uM26wk6Uslp2IJQEPD1W1DoY4h
 BERmgSNbPBUTJBqp6GXoxNvupn691JnzhcVG6wjvfVlyb0/YMvoJyW3qKFGk6Bq40a+TFPVjo03
 joZo0O1A/ZjfKYM9C8XIjFsaw==
X-Received: by 2002:a05:6000:2483:b0:47f:7ea0:6c20 with SMTP id
 ffacd0b85a97d-47fd3398033mr3405867f8f.15.1785499480201; 
 Fri, 31 Jul 2026 05:04:40 -0700 (PDT)
Received: from mindpad (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd458ab61sm4108166f8f.25.2026.07.31.05.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:04:39 -0700 (PDT)
To: Christian Stewart <christian@aperture.us>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:04:38 +0200
Message-ID: <20260731120438.3087-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713203901.24229-1-christian@aperture.us>
References: <20260713203901.24229-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785499480; x=1786104280; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=td245GWNFgURU1AoPC5J8kVOknVcczq6t2PMje/+Gfc=;
 b=enOvr8LqToPvOE10lMUKHsRYP11PBPr/wYyqXYV4mMwePwQbnlcf4t0FaJwpbA7X8R
 Mbrw0KngM7mTrWU2mk57JX3XHKH1uUG/ox+gv30uk3By9Jr/iSKUgVXnDw1OnXXYvQcI
 1VQEUsow3ReDDYWI0pkEvHsdGQuHW1GLCzFk//IhSOzDZOI/wZxLeqAwdEENr9NY6jrb
 JBuuuURO0sddLRfDOWXXMB6kta+yIbKoTWfTsDvA1cpaUDmSif9eTFKd63xlFFGRyOPI
 PZF6tMoRsyJ8YRdoSS+XjUrF8/+2vxIIhRuped/Y+UMAbs1LZ3JHJBIDrUV0a2QltAPp
 NTEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=enOvr8Lq
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: security bump to version
 1.26.5
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
> Fixes the following security issues:
> 
> CVE-2026-39822: os: root escape via symlink plus trailing slash
> 
> go1.26.5 (released 2026-07-07) includes security fixes to the crypto/tls and os packages, as well as bug fixes to the compiler, the runtime, the go command, and the net, os, and syscall packages.
> 
> https://go.dev/doc/devel/release#go1.26.5
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to 2025.02.x. Thanks

> ---
>  package/go/go.hash | 14 +++++++-------
>  package/go/go.mk   |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/go/go.hash b/package/go/go.hash
> index 69f2a3139c8..6c9c20be69e 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,9 +1,9 @@
>  # sha256 checksum from https://go.dev/dl/
> -sha256  1c646875d0aa8799133184ed57cf79ff24bdefe8c8820470602a9d3d6d9192b8  go1.26.3.src.tar.gz
> -sha256  0ef3626a149b5811c813838c62b7d6618d03ea36047b32c90b0e4851cc42b1fa  go1.26.3.linux-386.tar.gz
> -sha256  2b2cfc7148493da5e73981bffbf3353af381d5f93e789c82c79aff64962eb556  go1.26.3.linux-amd64.tar.gz
> -sha256  9d89a3ea57d141c2b22d70083f2c8459ba3890f2d9e818e7e933b75614936565  go1.26.3.linux-arm64.tar.gz
> -sha256  d44133d4c66b1451a1e247da26db7716f76a081c0169a75e6c84e1871e394320  go1.26.3.linux-armv6l.tar.gz
> -sha256  dbd82b50530ead2beb1fd72215117380df3cb16332b51467116dc35b3691dd75  go1.26.3.linux-ppc64le.tar.gz
> -sha256  5c0605b7175449f1c8e8cb02efaba2695caab914fad4dcedc764c2f4c6dfe6ca  go1.26.3.linux-s390x.tar.gz
> +sha256  495be4bc87176ac567392e5b4116abd98466d33d7b49d41e764ccc6976b2dc42  go1.26.5.src.tar.gz
> +sha256  88c162b204e6eefcc32499453b492e80209f4a4c78c33092636901c540fb0d05  go1.26.5.linux-386.tar.gz
> +sha256  5c2c3b16caefa1d968a94c1daca04a7ca301a496d9b086e17ad77bb81393f053  go1.26.5.linux-amd64.tar.gz
> +sha256  fe4789e92b1f33358680864bbe8704289e7bb5fc207d80623c308935bd696d49  go1.26.5.linux-arm64.tar.gz
> +sha256  6dae9edab81c13bccf962dec15f1fd2ec26c14a6821b4d2c92dab4130c289d7a  go1.26.5.linux-armv6l.tar.gz
> +sha256  c5d60e2b303bb612f20cd82786594b64874e73b35134025e27d3390bf284ae43  go1.26.5.linux-ppc64le.tar.gz
> +sha256  09ce3c504c0323968b75a717244dca4f25cd4cf0443e5ff6bc0bfa74add89fa7  go1.26.5.linux-s390x.tar.gz
>  sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index ebd0d418efa..a64d7538f85 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GO_VERSION = 1.26.3
> +GO_VERSION = 1.26.5
>  
>  HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
>  HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
