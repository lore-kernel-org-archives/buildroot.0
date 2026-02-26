Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECFDFD9E0A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35F45407F8;
	Thu, 26 Feb 2026 20:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWEp2xaBdrOG; Thu, 26 Feb 2026 20:47:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40270407A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138848;
	bh=/MVlZDuJUFoTV7+Yz7vU+xUY1JQRVJzas7jPaWD6vDU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rEpjz2TGcBdxmLMr2ez4RAYvQKq+bn5L8IOa8tQae4aYWJiQ6s6BcpxtE+sfZJFB8
	 MJND/4T7uQmCPPNyyQB5qYDdGpxaq2JK2nmjzIaiYDdSylspkfMw9oaD3gutl9Mw2v
	 c4fLX/qdlRhQEQCP6DfxtX1XckFZfvu+zXPgRDK9kSJkd/LrPbxmeWYr36lrb0EKfn
	 oig1YxOGAISAQvjscaFeIa/WQIHa0X8KnIhdXuRM7cXwQaw0zGM8pF8XUwH4THLYP0
	 BuGuGs/KCNaof0ZMKTjzmm/HBBDbjZ2zfhZx1h/8eecF6Mu9jgDHAnEGddq7o4rOfF
	 Wptv8fG0yji/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40270407A4;
	Thu, 26 Feb 2026 20:47:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50D901F3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E3A680E4F
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0CSbF5sf07sk for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:47:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8D2BB80E51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D2BB80E51
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D2BB80E51
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:17 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48379a42f76so10264745e9.0
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 12:47:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772138835; x=1772743635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=60S3ugaHA3neDDfA9VI4etOiBTtXJdz2K8O8EASgqfE=;
 b=VV9DNBT3ogGiBK34iEuOE8bRdJSX+HPHftLxOx7wR9Yh5ZDaDdfLi9akygpIArKAJz
 mHhwbd6ZKiPmfoyEUiLyMF4W/7pydBsD2mZtpyqYnd7DrYWs6IYkOD/HxhcZfUXi+wra
 A/D8kvhRZCkid26xj4Fhk5FU9pp+wAfk3hClmEfBguC2P5Jpa4Zdy/LvPAgMcpqjepkF
 CILj0ADkM56aFmDuQvvk+fpmt3Ms3e4jrU39IkOkrI/BXad2Xo6VUf9MDGAkqww1qYNe
 5GmkjpcCy1IY80hfL/SsTRdYUHOdS0rdB/uFhIoTBg5ydag/6yExvOqwLX/6wBczHjMT
 WKCA==
X-Gm-Message-State: AOJu0YxnDittUCstfQ1vsLY/LRGhGY3sfsC6a+3sQHyBN7tnMqimxQ6M
 sEpg4a1TOYKL6thydkwg50tecwnxbgQC+spgfojDU8JQdb4lyCdMf4qwwAQgTsqpizY=
X-Gm-Gg: ATEYQzyweiVAS/eEC12mt7RJDPubySHytd5SJTexUgPZ4uxxWjLPC/4MEV3DBR5tUnX
 uH2GFXZEpzu4N0BhsWmaE6sVzNiR+M1s9jVxp0CGDrKsLJwFD236JMDv3ErPl/lG3/r0M6gyVla
 C43a7YrQF5CL7UiH+6LunjaEMKiJSmDtdxevqZwwhmSeuz/9kjOuCAw+k0PsrSQYD9Os8n2lJWi
 8I4RBmU+pBY7Kx7zFzL0iCgg+2gbZ0z4/xqrWQXWosxViNAszJFuwffWe8SWGmEbYUFrIPmKjIP
 IHKlLn0/JX3Eed3ea4ZRA0p5N2OVod5PfXKdVTzAFHYjZXK+VVjQwp8GcXFGbiMeZBc7NHEBF9F
 NHCa8vQEaOnpWAn0wonjv+abUUSDG0+whac9MxrMLC7Jg6FIBjgH58k6sP3JLlDCnyoF5YO2yP5
 OLSiPauwNUPFl2jBg=
X-Received: by 2002:a05:600c:a16:b0:46e:4a13:e6c6 with SMTP id
 5b1f17b1804b1-483c9bfb2f2mr2546575e9.19.1772138835464; 
 Thu, 26 Feb 2026 12:47:15 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c60e40fsm1892566f8f.7.2026.02.26.12.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 12:47:15 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 21:47:14 +0100
Message-ID: <20260226204714.254207-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224211448.287963-2-thomas.perale@mind.be>
References: <20260224211448.287963-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772138835; x=1772743635; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=60S3ugaHA3neDDfA9VI4etOiBTtXJdz2K8O8EASgqfE=;
 b=FUETB7o4mG3sIdmp4FlHcvARZVUPy+jJST5RHlOLQpUFJyV6HW91rrJ9uJGLAlRQXQ
 ulFPA846W36SOT1tZNud+ox36tLONyDMra/Zb8iGdHHb+HUR5+Eevm2IvU676Sv9F07e
 tW6cZK4dj2KYK2JHIkvz/wbFD1zHGzyhtWQPdEh9xghpRQY3ZRGzFJs/Oxn2lQiIKFVG
 dg0srV54M7kIvt9GXr4L4FYEB1nkSS9wzOrmcm8Np1x32CxHSouVmeF2kqit/Kq4db4T
 h8IzbZU5I4J0iSp3GvraAahqV2yfpRm0roixGJunPupnN+6zL/78YPVyxThqWWC10ttg
 Gakg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FUETB7o4
Subject: Re: [Buildroot] [2025.02.x,
 PATCH 2/2] package/jasper: add patch for CVE-2025-8837
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
> Fixes the following vulnerability:
> 
> - CVE-2025-8837:
>     A vulnerability was identified in JasPer up to 4.2.5. This affects the
>     function jpc_dec_dump of the file src/libjasper/jpc/jpc_dec.c of the
>     component JPEG2000 File Handler. The manipulation leads to use after
>     free. An attack has to be approached locally. The exploit has been
>     disclosed to the public and may be used.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-8837
>   - https://github.com/jasper-software/jasper/commit/8308060d3fbc1da10353ac8a95c8ea60eba9c25a
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/jasper/0004-Fixes-402-403.patch | 63 +++++++++++++++++++++++++
>  package/jasper/jasper.mk                |  3 ++
>  2 files changed, 66 insertions(+)
>  create mode 100644 package/jasper/0004-Fixes-402-403.patch
> 
> diff --git a/package/jasper/0004-Fixes-402-403.patch b/package/jasper/0004-Fixes-402-403.patch
> new file mode 100644
> index 0000000000..d7d777d9cd
> --- /dev/null
> +++ b/package/jasper/0004-Fixes-402-403.patch
> @@ -0,0 +1,63 @@
> +From 8308060d3fbc1da10353ac8a95c8ea60eba9c25a Mon Sep 17 00:00:00 2001
> +From: Michael Adams <mdadams@ece.uvic.ca>
> +Date: Tue, 5 Aug 2025 20:46:48 -0700
> +Subject: [PATCH] Fixes #402, #403.
> +
> +JPEG-2000 (JPC) Decoder:
> +- Added the setting of several pointers to null in some cleanup code
> +  after the pointed-to memory was freed.  This pointer nulling is not
> +  needed normally, but it is needed when certain debugging logs are
> +  enabled (so that the debug code understands that the memory associated
> +  with the aforementioned pointers has been freed).
> +
> +CVE: CVE-2025-8837
> +Upstream: https://github.com/jasper-software/jasper/commit/8308060d3fbc1da10353ac8a95c8ea60eba9c25a
> +[thomas: removed the binary blob, adapt line]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/libjasper/jpc/jpc_dec.c |  13 ++++++++-----
> + 3 files changed, 8 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/libjasper/jpc/jpc_dec.c b/src/libjasper/jpc/jpc_dec.c
> +index 125a29ba..7e44f052 100644
> +--- a/src/libjasper/jpc/jpc_dec.c
> ++++ b/src/libjasper/jpc/jpc_dec.c
> +@@ -1107,23 +1107,23 @@ static int jpc_dec_tilefini(jpc_dec_t *dec, jpc_dec_tile_t *tile)
> + 
> + 	if (tile->cp) {
> + 		jpc_dec_cp_destroy(tile->cp);
> +-		//tile->cp = 0;
> ++		tile->cp = 0;
> + 	}
> + 	if (tile->tcomps) {
> + 		jas_free(tile->tcomps);
> +-		//tile->tcomps = 0;
> ++		tile->tcomps = 0;
> + 	}
> + 	if (tile->pi) {
> + 		jpc_pi_destroy(tile->pi);
> +-		//tile->pi = 0;
> ++		tile->pi = 0;
> + 	}
> + 	if (tile->pkthdrstream) {
> + 		jas_stream_close(tile->pkthdrstream);
> +-		//tile->pkthdrstream = 0;
> ++		tile->pkthdrstream = 0;
> + 	}
> + 	if (tile->pptstab) {
> + 		jpc_ppxstab_destroy(tile->pptstab);
> +-		//tile->pptstab = 0;
> ++		tile->pptstab = 0;
> + 	}
> + 
> + 	tile->state = JPC_TILE_DONE;
> +@@ -2259,6 +2259,9 @@ static int jpc_dec_dump(const jpc_dec_t *dec)
> + 	const jpc_dec_tile_t *tile;
> + 	for (tileno = 0, tile = dec->tiles; tileno < dec->numtiles;
> + 	  ++tileno, ++tile) {
> ++		if (!tile->tcomps) {
> ++			continue;
> ++		}
> + 		assert(!dec->numcomps || tile->tcomps);
> + 		unsigned compno;
> + 		const jpc_dec_tcomp_t *tcomp;
> diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
> index d499c8a7c2..90c8e0c9a9 100644
> --- a/package/jasper/jasper.mk
> +++ b/package/jasper/jasper.mk
> @@ -24,6 +24,9 @@ JASPER_IGNORE_CVES += CVE-2025-8835
>  # 0003-Fixes-401.patch
>  JASPER_IGNORE_CVES += CVE-2025-8836
>  
> +# 0004-Fixes-402-403.patch
> +JASPER_IGNORE_CVES += CVE-2025-8837
> +
>  ifeq ($(BR2_STATIC_LIBS),y)
>  JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
>  endif
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
