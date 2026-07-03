Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BBDC43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B05A4129E;
	Fri,  3 Jul 2026 14:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYRnH0Mmnf-C; Fri,  3 Jul 2026 14:32:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17A98412B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089161;
	bh=sHz0h6WnMkN6JKuec45DDeHReOfOgv5enTSgrp970b4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XxBS1Mut07jXCVyyWzlz13VsVG10J/aWUPWjxYvUlhMfLPJQ6rDZb3JkdySp0mdhM
	 tTSl6fo5SY/4p1i4UBuE96gpaXiBkeq/wJwFu0PuV3mkYtX3bdgxtddtYiEU0pAAmO
	 T/J+KAs5wKljUAHu5jE/epxxIH/S+h3lr9/U1IcOhl/j582/bfNBF7SaQgfmiw0ePv
	 eUux21fRyrrybn3FXcORl4EoW+9rG1HVbgrlbQ9qF4NUKEYz53QTx2SdVbA/V06KW/
	 twouqP6aJgtq7KLCLGaXSjZVhSeVrDICNgekn3AjOqr548UF82aeiretXO6XT7E3Pu
	 1mQZ6CE99mSnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17A98412B3;
	Fri,  3 Jul 2026 14:32:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B0C114F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D2E74117D
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kkydlqEGDlB5 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:32:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5EC9C412BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EC9C412BB
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EC9C412BB
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:38 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-490cf3000f0so5654755e9.1
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089156; x=1783693956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MxQcXL5SptZdAXS16ihL7GFO+5Vn3olcz8WB3FK4PKE=;
 b=Ev+yIc8ZvWwr0Rk6ncT+G8PS9gCDi2GgdmkzI5z3nO+ESpI8eRx7lp+Mk46IBr2UkS
 HB+9QB/xf3UWAibU2/uoZNcPMYT99G46tL8QCMiaQI1RYPvIgsWtYyMCXr61WcY7XTfJ
 boGTGCjx77pfWufkIbK0HWtOkTSsJMKm4HNLE8XNK2egKhjMSk6FNxC/GC87gkyk9W3B
 8sZ1ziiivDYZkhVU3bvrslSB7oXf1bWqSByQ3/3uaCShZ9bC0fBsNfIlB5xkBowbLwPA
 fgmtErjhqjRZ2DRzfAVEiNtp4k8GaVQ+OSvFZlz1uPa/YDCSeYulKM676mtO4Uv8KYRR
 e0lA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+JLpzI+RkYR9E6dDpZ6WtjeEQiy2pKblSLiWG+VZ6c5xZeOaKXNnjG7H2d7UYWqD2FDvS+nAf+kLQ=@buildroot.org
X-Gm-Message-State: AOJu0YzwfGvEJDg1dlo1giU3ZzzovD8AH/eHVhoq1AVMpxq7kFtlda/q
 jkcudTUR8UIvmfxl+aR8usrddz+8aZ3HCfO99aAmg7Pl/VM3/jwXRfrcTcg9dzb18ehQHQ5PZPF
 qoCl2
X-Gm-Gg: AfdE7ckAp8SjXODIpkMecuNI6dVQWjq2Y6meLwYG8CfkO4f9k+SWgxEffffuNMYXXeQ
 UUKhHi9tkuaWsm/xvmsk444+bjlH9dr3G77aim5SqZ78fkUZTgrK8rB/9rFlAweea3e5dmlkn7N
 t+FhZWmjjq+YL388mcNWhYcgdpsCvvnVv6ctfGEna3CidTLTsrgWz8Lw/GmvG2zq9QAmnzmjl8G
 64xdL72rXQ0odLAcDf1xt0BTs6xuZDgdmiX7XIHkIdWHk65qUgGCBG84Wkd37H8QNjeBtvOC26I
 orAdy1EU25beElhCh6QrLd55Om+FusO/bwic/sKtBYHJBq/sEXDiuoeItMcBaikZG83H7bWyuxZ
 +bi0tKqv1+CeQ+Q/5CUIrhCDFQZb/yUYeDTGojuNHdDTr4YeUgt2mfiQp1Fr+1/BLo5zEMASzPI
 mUfRyM
X-Received: by 2002:a05:600d:6450:10b0:493:c1a1:68f0 with SMTP id
 5b1f17b1804b1-493d0f2bff6mr1067985e9.20.1783089156046; 
 Fri, 03 Jul 2026 07:32:36 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce0a7cfsm53195875e9.9.2026.07.03.07.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:32:35 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:32:34 +0200
Message-ID: <20260703143234.274966-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260702165744.821512-1-peter@korsgaard.com>
References: <20260702165744.821512-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089156; x=1783693956; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MxQcXL5SptZdAXS16ihL7GFO+5Vn3olcz8WB3FK4PKE=;
 b=GgNZUD9j9zdNOSjU2X3ID2ZwuxSdsU9e4oayRWzMdtwB9ADqBvpRnfMN/QCKAJjjUD
 978fv0qATNwvkj0K01k8a+MMPavOWxSOj4mGZRczVAyqI4SDznXjOCYXi4NY9bmd9X6f
 WqLGKE4h18jhYzpAoypCEcdoX+am4kgHTmOq30/o0Nj/sSMBJvOvtPCatcK12asko5KQ
 id51O4Qda9nZQ5ng1HB8bYsIg3k0j/bcb5Z/UFbN0UPYj6dTPoVokC5bmBkNwxaIQQc9
 mmyLdOjOHvhA8bfh7g7eCcn7Wske0XnnjB5qPKI4zIFc6ndPWSiIEoQw2nzGwRtDtqBI
 nyoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GgNZUD9j
Subject: Re: [Buildroot] [PATCH-2025.02.x] package/{glibc,
 localedef}: security bump to version 2.41-143-gfc7a48bc9
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
> Fixes the following vulnerabilities:
> 
> GLIBC-SA-2026-0009:
> ===================
> scanf %mc off-by-one heap buffer overflow
> 
> Calling the scanf family of functions with a %mc (malloc'd character
> match) in the GNU C Library version 2.7 to version 2.43 with a format
> width specifier with an explicit width greater than 1024 could result in
> a one byte heap buffer overflow.
> 
> The bug is in the buffer growth formula in __vfscanf_internal, which
> under-allocates by one byte during realloc expansion, allowing a
> controlled single-byte overwrite past the end of the heap buffer.
> 
> The impact is limited by the fact that to execute the overwrite you need
> both user controlled input data and a specific choice of maximum width
> that yields a smaller than needed allocation. The latter point has to
> take into account malloc's particular chunk size rounding process.  The
> "%[width]mc" format specifier does not appear to have notable use in
> major Linux-based OS distributions, due to which the real world impact
> may be limited to bespoke use cases.
> 
> CVE-Id: CVE-2026-5450
> 
> GLIBC-SA-2026-0010:
> ===================
> Potential buffer under-read in ungetwc
> 
> Calling the ungetwc function on a FILE stream with wide characters
> encoded in a character set that has overlaps between its single byte and
> multi-byte character encodings, in the GNU C Library version 2.43 or
> earlier, may result in an attempt to read bytes before an allocated
> buffer, potentially resulting in unintentional disclosure of neighboring
> data in the heap, or a program crash.
> 
> A bug in the wide character pushback implementation
> (_IO_wdefault_pbackfail in libio/wgenops.c) causes ungetwc() to operate
> on the regular character buffer (fp->_IO_read_ptr) instead of the actual
> wide-stream read pointer (fp->_wide_data->_IO_read_ptr). The program
> crash may happen in cases where fp->_IO_read_ptr is not initialized and
> hence points to NULL. The buffer under-read requires a special situation
> where the input character encoding is such that there are overlaps
> between single byte representations and multibyte representations in
> that encoding, resulting in spurious matches.  The spurious match case
> is not possible in the standard Unicode character sets.
> 
> CVE-Id: CVE-2026-5928
> 
> https://inbox.sourceware.org/libc-announce/b11f0003-6ec1-4bd6-b9de-9e38a4efeca3@redhat.com/T/
> 
> git shortlog b676adadbc1f5fb2f31bc484a7628cca89ae6f22..
> DJ Delorie (1):
>       stdio-common: Allow partially-filled %mc buffers [BZ #12701]
> 
> Florian Weimer (1):
>       iconv: Suppress intermediate errors with //TRANSLIT (bug 34236)
> 
> Maciej W. Rozycki (2):
>       support: Implement 'xfmemopen' for seamless 'fmemopen' use
>       stdio-common: Reject insufficient character data in scanf [BZ #12701]
> 
> Rocket Ma (2):
>       libio: Fix ungetwc operating on byte stream [BZ #33998]
>       stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x. Thanks

> ---
>  package/glibc/glibc.hash       | 2 +-
>  package/glibc/glibc.mk         | 8 +++++++-
>  package/localedef/localedef.mk | 2 +-
>  3 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index 3f1df7058a..03e8722057 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from git)
> -sha256  c5856a16a8576d35adddd92f7e86c58faeedd849633582a7926f9a3e766ffe2d  glibc-2.41-137-gb676adadbc1f5fb2f31bc484a7628cca89ae6f22-git4.tar.gz
> +sha256  130d77e16a08f7e52e14b49d8554997877a4fe82ac6b840a0202716146ac8fb5  glibc-2.41-143-gfc7a48bc9e999c0f9a1f9fa1b209eac1d6a93363-git4.tar.gz
>  
>  # Hashes for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 3ce6265a6d..8121968e02 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -7,7 +7,7 @@
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -GLIBC_VERSION = 2.41-137-gb676adadbc1f5fb2f31bc484a7628cca89ae6f22
> +GLIBC_VERSION = 2.41-143-gfc7a48bc9e999c0f9a1f9fa1b209eac1d6a93363
>  GLIBC_SITE = https://sourceware.org/git/glibc.git
>  GLIBC_SITE_METHOD = git
>  
> @@ -60,6 +60,12 @@ GLIBC_IGNORE_CVES += CVE-2026-4438
>  # Fixed by glibc-2.41-135-g61737f43b1f0d9f64a6f16649625476b70f9f4d3
>  GLIBC_IGNORE_CVES += CVE-2026-4046
>  
> +# Fixed by glibc-2.41-138-g8941538b92a574a24e9308e164869239d2b0d845
> +GLIBC_IGNORE_CVES += CVE-2026-5928
> +
> +# Fixed by glibc-2.41-142-g1a74f82eedaf0987eda1f522121e6a48fac502e7
> +GLIBC_IGNORE_CVES += CVE-2026-5450
> +
>  # glibc is part of the toolchain so disable the toolchain dependency
>  GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
>  
> diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
> index c3a959c5f5..7b16932125 100644
> --- a/package/localedef/localedef.mk
> +++ b/package/localedef/localedef.mk
> @@ -7,7 +7,7 @@
>  # Use the same VERSION and SITE as target glibc
>  # As in glibc.mk, generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
> -LOCALEDEF_VERSION = 2.41-137-gb676adadbc1f5fb2f31bc484a7628cca89ae6f22
> +LOCALEDEF_VERSION = 2.41-143-gfc7a48bc9e999c0f9a1f9fa1b209eac1d6a93363
>  LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
>  LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
>  LOCALEDEF_SITE_METHOD = git
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
