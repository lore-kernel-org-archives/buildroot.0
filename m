Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E383CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65E6F84327;
	Fri, 15 May 2026 13:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l31_KuTRY4Em; Fri, 15 May 2026 13:33:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3318084325
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852035;
	bh=RfpEXh+RBDGlQzPbmy6KYiDm3xzQ9VFDQ2lzo20QRkg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aEcrGe6vFbY0GOvyNM6d0EFX/1LUh3uRwEzfVKxBumrGCf2mJcnbs4FBxUm4iVWto
	 84zG5aXz42cR4cL8WNkBj6Zci0/xfMVyK6WyNqdA/t1iY3ZuSbGx71FUK8YD+4WlRi
	 n3ucIJnI6VWN5SLfIbkPsq041JiPb77EclntlaK6fxCx1lynpT4+1GXcVVq4U+UyPM
	 vcQ4Na0IgPxUi3qtMMQZrS11wmy6q0Hm09YTVMkdOJHF84ThAOHXfH8nwvwqPIC8ef
	 YTF8V2DIzCrXVV2OPZEBR9hndXA0lBbS2/6WTAUKAD0BRt+oEkcjghZAw8+uTMwYpD
	 Tq7d+bGO0RNTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3318084325;
	Fri, 15 May 2026 13:33:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 67DDF36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5982E84317
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cpm9DNoYFyjX for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:33:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2639B84309
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2639B84309
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2639B84309
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:49 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488b0046078so74691695e9.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852028; x=1779456828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GVQJ7Is/slU2+O2ftuGuAS4CmA8djHSXrvbNPESqvI0=;
 b=luDPHDmcculCCBaZxeHFhUzIOnlkK5woF2O8bCbSbEq+8vl9OFqa8uJvBrcDVYIIfa
 Vm8U7qOaKyhGfHaSHwpOjDYZlF+l9Bj3ehpigWfg2RKKOaajkD9TlbaKCRlFzM8YcM8J
 ZPFRrMDfjwXThFMjW37P3vhHdsqK8P3hS2Ab8rkW1lwx1t9DzG27mtpfLI2fNfbkLYMA
 PkA4tqobW6UBaEXKp2IOcfwlPQDNkJvxpgspwauBnFb5wEkBZfHZqhiT6208QRPNS8EI
 ghavGaCVDd9e7DEun2r8CWXGangRHCM4cSjBPldeevuwqS+APT6qML83DAPhUUW90ThM
 kSiQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/ck4A2HhSvYW4cHAccPAIGWaBkNvvoVwYPHIcql/nSQ9JvI1ZTab/nRwzil5xSQHy3ROOiVNwqImE=@buildroot.org
X-Gm-Message-State: AOJu0YyOPGksNmOmpJvLaD7Ie5Uxub0ydebLh1al40EHH1cn4pj3zyQe
 59WFPjn0TH6R3njHeh7taALihonC2ayZA2lCsr9VLpRUKfpIa9nFkqMsCz1K00RcGAuJWhZBaVF
 rSSyF
X-Gm-Gg: Acq92OFX1vpCcoUz4MUO/KrbCWcxtOkmD3dqJPQeSN1iCr9oUi7zA1ac5OCTyGX68ZP
 X6sMCbpjS8s6Dsh0upKIfiFrTrQLIlLMfnfyvFVQv5cogGggSYym6Z7uBsBGiW4RwU44O77mdxU
 JClXX+i0q4jQj5zbIwg6NdxGIWGzAghlEvzQjtGf+D6FnvUvhrUigAkBYkCpEu00oOmpSErVKdB
 bGviCs6wNU/tcQRdehHz+ljcw/82hhiUMCdUbGndZRMO9LIav0XwJD8gAJ5EkymYujSm0DZcAX9
 Xvj2nlt3yYcox6OBk0Bdb1RRd1QNzmDFo3iNJ4zViJlxBz9DhV0m/Ap+xq/BodBDnHDwHQodZ/G
 /auaU0WSDb281wAIWXxBLv4TFknMkN3Q8u94M3RYTu044EqnGpxb8HaEtzdTPzhtsZQ2C1HNpAv
 S2AmY+DqWHNhiUg5GK+foq/6k/9pWaqpqWj35Ml4FqzlCn
X-Received: by 2002:a05:600c:3096:b0:48a:5339:ef0e with SMTP id
 5b1f17b1804b1-48fe5fcdf39mr35893485e9.3.1778852028091; 
 Fri, 15 May 2026 06:33:48 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48feaa2accfsm16462825e9.3.2026.05.15.06.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:33:47 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:33:47 +0200
Message-ID: <20260515133347.315739-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501123100.1918951-45-bernd@kuhls.net>
References: <20260501123100.1918951-45-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852028; x=1779456828; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GVQJ7Is/slU2+O2ftuGuAS4CmA8djHSXrvbNPESqvI0=;
 b=dBIA4PMHhkGdku1oOG1Ab9qqS6J/FGGVEmsqVTET0Kzt4DPZj7jIdf4AFVI5g9+1pM
 txNbLhqpQm7BjRtwUYGG1BBsTzFsQLRYjJx7lml8y+G8b7OiwibiDE1Jga10ULO91qay
 vLGmshe6RqwW6antNNCfH+/F1IyqRNraZQvFE15hsjoAM+2+n3GVEJ3fQmjgW3YCbZu1
 Vufz4rEIq+pAVPxWUTEH6xbkhKKa8+njxhCWgD1jvrS8pMgwfLK8h/ZI8ag2yU/0Azvf
 f8srG93ntihHkFpxokn/aqDZS55Ve8ihJGSZKj6/ODTwfwMRGV/FCR/XDkoTEswFmgeI
 Qhgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dBIA4PMH
Subject: Re: [Buildroot] [PATCH 45/75] package/python-pyopenssl: security
 bump version to 26.1.0
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
> https://github.com/pyca/pyopenssl/blob/26.1.0/CHANGELOG.rst
> 
> Version 26.1.0 fixes CVE-2026-40475
> Version 26.0.0 fixes CVE-2026-27459 & CVE-2026-27448.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/python-pyopenssl/python-pyopenssl.hash | 4 ++--
>  package/python-pyopenssl/python-pyopenssl.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
> index b42719e3ca..84f4b7fa60 100644
> --- a/package/python-pyopenssl/python-pyopenssl.hash
> +++ b/package/python-pyopenssl/python-pyopenssl.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pyopenssl/json
> -md5  d755732945157fb8ca98c2d66a55755d  pyopenssl-25.3.0.tar.gz
> -sha256  c981cb0a3fd84e8602d7afc209522773b94c1c2446a3c710a75b06fe1beae329  pyopenssl-25.3.0.tar.gz
> +md5  e48484d4a915a47a71064c10ede7e991  pyopenssl-26.1.0.tar.gz
> +sha256  737f0a2275c5bc54f3b02137687e1a765931fb3949b9a92a825e4d33b9eec08b  pyopenssl-26.1.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
> index 2dee55d8cc..da31da5c5a 100644
> --- a/package/python-pyopenssl/python-pyopenssl.mk
> +++ b/package/python-pyopenssl/python-pyopenssl.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PYOPENSSL_VERSION = 25.3.0
> +PYTHON_PYOPENSSL_VERSION = 26.1.0
>  PYTHON_PYOPENSSL_SOURCE = pyopenssl-$(PYTHON_PYOPENSSL_VERSION).tar.gz
> -PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/80/be/97b83a464498a79103036bc74d1038df4a7ef0e402cfaf4d5e113fb14759
> +PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/8c/a8/26d36401e3ab8eed9030ad33f381da7856fcfad5691780fccd1b019718fc
>  PYTHON_PYOPENSSL_LICENSE = Apache-2.0
>  PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
>  PYTHON_PYOPENSSL_CPE_ID_VENDOR = pyopenssl
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
