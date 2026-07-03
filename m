Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23CCC43602
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6FCC81FFC;
	Fri,  3 Jul 2026 14:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Er5RVJXxX3l; Fri,  3 Jul 2026 14:32:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8EE18204B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089148;
	bh=zaceezFlt9kD/TZxA/CGQnY5zsQNxTdFbXkcBe+DwIE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VNNVzQTirERzELgfT+WEIjLyPgVikF1WfngxCa9lh9QIteWnRBANPt6gytb/uuTEp
	 FgihaywruQ8yoNPEUHnJAqODkEl9ggYkmTiGwntBFR4AQRz/HkZlaCS8Mzlz5MgI4D
	 go9eGcMmenNxKTepApFZDIkXt55MshVACSoDJZCw5Qf+o0AGsakP8NEvcme+eTdUwN
	 RZtJVvx1Ube/wDnYHBistijpI2iv1YDjoUFr+s9/oyhi0cQ3n+3ZiSTcWZQU9Fjd0b
	 bpop9ANK0kygEKTNbdop5ci5O9CC0I546KSon3Gu1AaEyY8aPeOgMWVBs7tN6F+rFW
	 coUtFuv4fYRBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8EE18204B;
	Fri,  3 Jul 2026 14:32:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B602363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 393D960D58
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJBV0ZsvftXZ for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:32:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2906060B58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2906060B58
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2906060B58
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:27 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-474303f3c72so404809f8f.0
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089145; x=1783693945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=L99Bu/wyLaN4m33ZkPk1/dJJKkE0x/Jw57Zt09hafGE=;
 b=rvqGpH4SWPB2rJ0dOMBhaySfVgG90JtRGVwMWoLdxDs6UbjWjjlcbveGnW7QQ0ErJ/
 BWfOV/DhHZRDJlbu4Zu5TLSvPbRLdoMx8xz8QX+e90vFeEiakegtHW7l7c4MlfS3oTeb
 Z1n45TsWZJy++wLMKZOy8SeCIf0TZ1v9wvOeOACgMVQ6P+k+RG47BR7FS102CeDoAlmu
 j5m+YS2TpJsjA8Bv5gBIlXxYPKRfjRB8IjaMnimjLn5Y1Qgjucns21T045a+Dp9s5rW8
 kWnVmZY92Xag/f4bIMb3bxZlHlV56bxB5badz3UcOaXrB6CVRKNAAKXyiL0sjo9tyi6p
 mxCg==
X-Gm-Message-State: AOJu0YxeXZdxiJpF6HLY3KbV8r9gd0EvL5T10rQv3bZ8xg0amLbFPUDc
 CvPoOeKRkWLoWYv1/gfKRFvkkwSZPbthzFbvpodl3ymOTIIpR10ct2xHElO+6euuEtM=
X-Gm-Gg: AfdE7ck5Y1GWyLtztx9LjEEZXuJftS8O4CAzRRTC9VIJ1waVOYQNOFbQwDj0HkZh4RR
 imA/S8vBnNV/ry6fjWsMaSs/nsEGLJYjhyR8/0yawEht2WhFw2xf5bImgKYmYeervbXUZrcsHRf
 6sjzJgFxmc+HqU40ohYNup+ztMubqvZ+G6Nezys6W6PCNdZHWtbNtuaKArhVR18+LYqukeP0fsz
 fCUKzVvHrSIlRCgM4K30sjwqMyNdfkCCUYDCpimDE6IP1J7/pS4LhpETL6J0yj8Uc2GuxrJ5mnb
 DSk3W8aZ2qTne4U5nPQOz3UcUwld/ci7Kt8OQIhht43WAmcYPoO0R8dTHvqJ8I8pvrNzF+7Q6Hy
 12cju5pnjzPAq1SmQwaJnQgnWHqhVxDnVeZuvK4ljfhysTBcPlGXpcxstdwr+aTuqLfLGqnmQEB
 6cGe4l
X-Received: by 2002:a05:600c:6994:b0:493:bc4a:fb55 with SMTP id
 5b1f17b1804b1-493d0f4d189mr956765e9.38.1783089145004; 
 Fri, 03 Jul 2026 07:32:25 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477d766e0b4sm17720005f8f.0.2026.07.03.07.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:32:23 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:32:23 +0200
Message-ID: <20260703143223.274661-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260626082852.96329-4-thomas.perale@mind.be>
References: <20260626082852.96329-4-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089145; x=1783693945; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L99Bu/wyLaN4m33ZkPk1/dJJKkE0x/Jw57Zt09hafGE=;
 b=EKIX2yLDK+i11jmPMD/8VPy8guDk8RD7pFoHmSE+YIdoaUa1DkoTgk++pxRHIYXh29
 5UbXKHzwKhCR7ajjPWrr3B6NNjIVy3hrmNYBU2Kx1WKw4NrnBs1C/sJKWi4Sgk1RlJ+B
 a9JCbBoIN8Hq9d62achO95+zYMNPiZ53puzlUYG0Gr4q7zgT15XKm51rXLRk7nsbBAts
 rfBGejBM65JtZP0BNJB8+2QLcUFupjH89LM/lgCMsbF7qdL1meEhKpHGvltmW2m/h7oF
 ZsFWab6IK7YCHdpyuXD88UPHEK38rzQpihzQvFRJ9+L4htvWV7LS+ofK3yuENkskmYXK
 72rQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EKIX2yLD
Subject: Re: [Buildroot] [PATCH 2025.02.x 4/4] package/squid: add upstream
 patch for CVE-2026-50012
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
> - CVE-2026-50012
>     Due to an Improper Input Validation bug, Squid is vulnerable to a
>     Heap-based Buffer Overflow attack against cache digests.
> 
> For more information, see:
>   - https://github.com/squid-cache/squid/security/advisories/GHSA-5vmx-9x64-9284
>   - https://github.com/squid-cache/squid/commit/19fcfe922717c8b255270c032dcde4071c003bcd
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/squid/0006-CVE-2026-50012.patch | 33 +++++++++++++++++++++++++
>  package/squid/squid.mk                  |  3 +++
>  2 files changed, 36 insertions(+)
>  create mode 100644 package/squid/0006-CVE-2026-50012.patch
> 
> diff --git a/package/squid/0006-CVE-2026-50012.patch b/package/squid/0006-CVE-2026-50012.patch
> new file mode 100644
> index 0000000000..ac3af8a36d
> --- /dev/null
> +++ b/package/squid/0006-CVE-2026-50012.patch
> @@ -0,0 +1,33 @@
> +From 19fcfe922717c8b255270c032dcde4071c003bcd Mon Sep 17 00:00:00 2001
> +From: Francesco Chemolli <5175948+kinkie@users.noreply.github.com>
> +Date: Sat, 30 May 2026 10:16:33 +0000
> +Subject: [PATCH] Harden peerDigestSwapInMask against invalid cache digest
> + reply (#2423)
> +
> +A cache_digest on-the-wire size may be bigger than the
> +mask_size declared in the digest itself.
> +
> +Ignore the digest in case this happens.
> +Upstream: https://github.com/squid-cache/squid/commit/19fcfe922717c8b255270c032dcde4071c003bcd
> +CVE: CVE-2026-50012
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/peer_digest.cc | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/src/peer_digest.cc b/src/peer_digest.cc
> +index 741090574d6..53dac203eab 100644
> +--- a/src/peer_digest.cc
> ++++ b/src/peer_digest.cc
> +@@ -622,6 +622,11 @@ peerDigestSwapInMask(void *data, char *buf, ssize_t size)
> +      * NOTENOTENOTENOTENOTE: buf doesn't point to pd->cd->mask anymore!
> +      * we need to do the copy ourselves!
> +      */
> ++    Assure(size >= 0);
> ++    if (fetch->mask_offset + size > static_cast<ssize_t>(pd->cd->mask_size)) {
> ++        finishAndDeleteFetch(fetch, "peer digest mask data too large", true);
> ++        return -1;
> ++    }
> +     memcpy(pd->cd->mask + fetch->mask_offset, buf, size);
> + 
> +     /* NOTE! buf points to the middle of pd->cd->mask! */
> diff --git a/package/squid/squid.mk b/package/squid/squid.mk
> index 439d65e479..21aca9fe8b 100644
> --- a/package/squid/squid.mk
> +++ b/package/squid/squid.mk
> @@ -27,6 +27,9 @@ SQUID_IGNORE_CVES += CVE-2026-33526
>  # 0005-CVE-2026-47729.patch
>  SQUID_IGNORE_CVES += CVE-2026-47729
>  
> +# 0006-CVE-2026-50012.patch
> +SQUID_IGNORE_CVES += CVE-2026-50012
> +
>  SQUID_DEPENDENCIES = libcap host-libcap libtool libxml2 host-pkgconf \
>  	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
>  SQUID_CONF_ENV = \
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
