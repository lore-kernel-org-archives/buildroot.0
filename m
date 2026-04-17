Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EE6F436B8
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F73A60E61;
	Fri, 17 Apr 2026 15:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1s1I7Pcp09Qn; Fri, 17 Apr 2026 15:24:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9458760E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439492;
	bh=Q/EfXZSIZqV8VCrpfpr4R4LbM9yb2z4gqgJarUC+KVc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ztse3yq/kU9OPeEfRmJTcSI53Vb18LPIe7fOekLQfHBn9+o6n26eC+hUWw+Wvkrro
	 5dF0O0do3NfisJfRYkkuoByuJMZkwgFc4CblZzlFpwDzQoUSo2wfmAMaq0EFKAKCeR
	 LAVHJdwBSnKzBjxdkq1S9oBOjCKRvs7Z4SvjDPLqKa5an4iBKk5mZuuGeKez/6KiyW
	 4iv9FrW8BavbCNNR2V2KJtxEka8oSUsH2Nxh5E2FIkG+RZ3eGdMM7CQQ/mVwvuGSpK
	 SWav2LJsmFpCm7DVdX1gpVMVZl4owkxI3xqe4pREvyglMn0fiyQ6MAb61//XaXMM7e
	 jAIUUfGEc8hcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9458760E69;
	Fri, 17 Apr 2026 15:24:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B2764259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A488B60E5A
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9q3gWXQn7mS7 for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:24:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC90C60E51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC90C60E51
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC90C60E51
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:47 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43d7605ec91so693532f8f.3
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439486; x=1777044286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AHflRDvTtxHDxINzWS/Gr/UYfuu9svFTIolu9J3RATg=;
 b=KpU1unTquOGYuRh2tM0GmHZKyQC3lEOIKVyBDjeCmfGc32mFJ9YrA5n184sQj1gisc
 G5uC0S0hT72p9zRLuudS9IkFuHhsKmfM1lDr+8RKPsaUgH/xBh1xwlRKj+8Tnlwvzk2F
 rCrHQ8K9fIGiHVt9oxystxex4JO32lZShzgwZjUkSYoQsC+9xPZcS/jALIR/7VLzl+BB
 n8R7DiYfmZlv6rsbPyhmmFJGfdF9EQoa+6oXlOoyVp5Oi12crvE77RMSaS/olq22kZAV
 mtPTy+nTFI77+SqOpRD1wxYUvEi+EPMXD/42vljsHkfJNdYVJeM2kJZtYv8a3BIyVpGq
 QMrA==
X-Gm-Message-State: AOJu0Yys5jKpT2DAHDDhTmggU+LtWjngDNWh7tm2lITEIeuxQFFAe+5z
 rskRUsKG5nuyNfGVw8RKMeMYzzgiNZT2gM2lN2Tr2mMhLNy7Bsd4fl/ygjOf63gxUHw=
X-Gm-Gg: AeBDiet9jTzFd0iz6mg5b4aFiFMlcAgRl0aYWK7Bg7bFKsTUuNUaBtjtmIesxXcGRpJ
 BgcHG+qIx8PbilUovmo9A17iiA0lO3P5f1dCMfLQF7mP68RvOKBny2UUN5odBQWd9jgRZcLDeek
 ZqNHyKYWPpUilzhDJsGLBlOBDykt1DaTXp+oLeRYvtn5+NPcp0T9ENhkCMHWZBdMyE3B0A84kJZ
 dipVd1uGjr+zpAG/y+gAFALGUnexopPnO8iCxpMWE7JmYAXCCdolVdvGhLpLZ/QP1ZZW4lxt8Qh
 xCNZ3h6UsKvdaO3QZJXUBGyM6XAfhpIb3qWgSTvMoXWOD48bMGypkkUzzgRCmzdbA6oE78mpTqV
 i/paUIFWWfkTCvONhfbqJS5quF2ZuMRppTUtzluhqMSxmomoBUlWuep0bWqI+Oqj3ifwkwgnQ75
 wunvAV8vwQQr3Ep3qF+5UenwvdOBE=
X-Received: by 2002:a5d:6481:0:b0:43f:e42d:92d with SMTP id
 ffacd0b85a97d-43fe42d0a21mr3325030f8f.4.1776439485611; 
 Fri, 17 Apr 2026 08:24:45 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4ffa8sm5167243f8f.35.2026.04.17.08.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:24:45 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:24:44 +0200
Message-ID: <20260417152444.313154-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413122459.58318-1-thomas.perale@mind.be>
References: <20260413122459.58318-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439486; x=1777044286; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AHflRDvTtxHDxINzWS/Gr/UYfuu9svFTIolu9J3RATg=;
 b=MSeJcJuOAIA3DV7SdZV1QTC1rSQ+gm/WoJfTzzQRfvSVIPFajkFoeJSECuGAtbZM/c
 zbe3ZNFJaS3oCB6Acb0duIg/acn2y97qIrc8tN1IEgfEIXrJlUU1eYDdlxAgJVGurUpG
 VhoQLubF0nxwY1IquUD9jWRqj9U0BgKfvhUO0iCHux9zYJhq/oB/gEWFapHJEPfL7Z5S
 wta4u3Nf1xg1zpQqchs9Cu0LNSNOKGeDj/QXJdYlSVdFeJkBg4Ox+V7iQsdNCDbK4pxw
 XcF7EzqBjY1jDprqoZkGguiuQ9lZLlVfNBU6PfswSjS3yQ5jjYqH2Nd2fYSVugC0oCbm
 jbtg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MSeJcJuO
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/libspdm: add patch to
 support openssl 3.5
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
> The master branch bumped libspdm in commit [1] that fixes the build
> error that appeared with openssl bump [2].
> The 2025.02.x branch remained on openssl 3.4 and didn't need a backport.
> With the EOL of openssl 3.4 and 2025.02.x is moving to 3.5 this backport
> is now necessary to build libspdm.
> 
> [1] a01c07f572 package/libspdm: bump version to 3.8.0
> [2] 9868ca6ec9 package/libopenssl: bump version to 3.5.0
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
> 
> NOTE: if applied from patchwork this patch won't apply because of
>     encoding issues.
> 
>  ...port-API-introduced-in-openssl-3.5.0.patch | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/libspdm/0001-Backport-API-introduced-in-openssl-3.5.0.patch
> 
> diff --git a/package/libspdm/0001-Backport-API-introduced-in-openssl-3.5.0.patch b/package/libspdm/0001-Backport-API-introduced-in-openssl-3.5.0.patch
> new file mode 100644
> index 0000000000..72ea0ec7e1
> --- /dev/null
> +++ b/package/libspdm/0001-Backport-API-introduced-in-openssl-3.5.0.patch
> @@ -0,0 +1,34 @@
> +From 88797f83daf6654d6381e3539abe1670763f2ac1 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 11 Apr 2025 17:47:05 -0700
> +Subject: [PATCH] Backport API introduced in openssl 3.5.0
> +
> +This commit [1] introduced this new API which is used by pem.h from
> +openssl and it should be provided by asn1.h which is vendored here so
> +it goes out of sync and causes build errors e.g
> +
> +In file included from ./os_stub/cryptlib_openssl/pk/x509.c:18:
> +/usr/include/openssl/pem.h:399:28: error: unknown type name 'OSSL_i2d_of_void_ctx'
> +  399 | int PEM_ASN1_write_bio_ctx(OSSL_i2d_of_void_ctx *i2d, void *vctx,
> +
> +[1] https://github.com/openssl/openssl/commit/35f6e7ea02b599d5aaf220b4720cbadd946d8023
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream: https://github.com/DMTF/libspdm/commit/88797f83daf6654d6381e3539abe1670763f2ac1
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + os_stub/openssllib/openssl_gen/openssl/asn1.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/os_stub/openssllib/openssl_gen/openssl/asn1.h b/os_stub/openssllib/openssl_gen/openssl/asn1.h
> +index a90152ee0dc..fcfbe42ec0b 100644
> +--- a/os_stub/openssllib/openssl_gen/openssl/asn1.h
> ++++ b/os_stub/openssllib/openssl_gen/openssl/asn1.h
> +@@ -368,6 +368,7 @@ typedef struct ASN1_VALUE_st ASN1_VALUE;
> + 
> + typedef void *d2i_of_void(void **, const unsigned char **, long);
> + typedef int i2d_of_void(const void *, unsigned char **);
> ++typedef int OSSL_i2d_of_void_ctx(const void *, unsigned char **, void *vctx);
> + 
> + /*-
> +  * The following macros and typedefs allow an ASN1_ITEM
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
