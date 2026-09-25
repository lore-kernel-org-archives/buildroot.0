Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE21C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B38B60E1C;
	Fri, 25 Sep 2026 14:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKoHBJlhTNgh; Fri, 25 Sep 2026 14:47:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 19C5560E08
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347632;
	b=Xf5ih6vPn0kmgzOb1HGLopxd4rCCBfTcPCd5JrZFN8aBEmWN3+byPSw+nInHIF2n933k
	 9ad8ZNzx1uBxWTFIdxOw6wl1aFAWcDIEZFtGNzjrjK0fmp1Rz0fobR7d6S6Pyw03pGKNx
	 HE7kwp4U+0fnDmELoPH6VsKP2d8GoRbvjMJSSEGzxLWuj8D3CEFGhyvbA6oDcsupNdfyF
	 WrDatH8G0GlYk3xje++cMS1yOrNIAjMK3PGkyG33BUf/wu9BXlzcSmgid7tVgv4mXFDfT
	 bWYYQFZGd7T295Qx2gbhfR+jKo2N/Oif/0m+Cu2JVHOqsOnFeUwzzXZGWc2SsRiKPhw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347632;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/QSEMP1dnohz0i0tcAF5Qt9x2Y29fOs68JUFLXmIQ5k=;
	b=BFtvLQ0CGPU9o20IuE0LLzBCJNSEUQIPxQnxEMtljczLnT0KXiHkaUPX3vr9NSO0O1pD
	 mhYQde8/z76QTL3zeQT39f9sy1HCyWjTeICqjk+YjABUvO8mYhOJfGhTT/9NR3Iyf3iCE
	 z8wmgjdCw8nL5n67ZleFRA/spJxxbW4dv99GcCwmB5hQ4b2Euavs9+tp/G3AbjdJWPHsA
	 Y6uzRXHIikC8Y79cpOAqxhwEPeFpn20SHLwB9rEPf+Q5b0UY0FxEepGTg55OgMr77+wJz
	 amg8RQpEeFERbLEIexzDQlo91nn/NEEdIsaAULIAyHLzB9IOZHLjMRR7ZalXYtWvmBw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347632;
	bh=/QSEMP1dnohz0i0tcAF5Qt9x2Y29fOs68JUFLXmIQ5k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I3goLappVUkdMM08933D//O+zsM3BLI2wNkmVh7uHH1JpWS/ox6nJZlaA5uJgcbE6
	 LekyxJKBQVipZWdllPdfBwsjBfkXzRKDNiDRj97BiP0gGx5cM5tkEDvKy6oJFdeAec
	 AI0lp6XkWwikkk+TF/uSj5KB2Osysm7PQpaenA57uLc2ElSjLEUPvttKPpXBmfp9jm
	 JMRxVCJTcJByiujloXT6+2hSnLNwDpv7lNrCN6vRX4v9t6JCQsV/9eSHYFShCdP+v1
	 NbLLBy2c6tQ6qNrsweEODYtbL0/DwuTGTtkLS0f3YOA7EcA5UEwEdI+sHLSYvv6laE
	 sGvxcc08wxsGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19C5560E08;
	Fri, 25 Sep 2026 14:47:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C2F81334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A83B160DE7
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WRkWqyz-XmhB for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:47:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 55B5160E07
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347627;
 b=g1tMyuoirsmZF2tV2pOov1Ftj2uZac61TBNx03xPz/OF83WHTE1ZRYI0D2ZBLxL6E7Fb
 kYcEWe05Di+OgVEKtxerN3LbBlMO2KkCUeSoSMSLRrtStOUqRb6eJoAHnFINjYTczt5O+
 tJsNXA7/iT6aDi/fUG7Ha+M03D48Wtwnc0eb6MA53Q4xS3YqMqUi+PHccPgypCzBj5H/N
 A86ChYOY5Uql2lspMrVOeQr/mcfkmpQ5Z9ulwjKViEe2T5hMksc3sRAdgFgZAYSu/oM3w
 DKAh4JFC8RFVAlI44ba0ZEQ+3FnuIlGvwjqSvh2E4j79rNDJZJ6M37riEJSv6IfjfOg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347627;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=uU5Cj8zV1fsAuOEjbAuMpptajVUzRKxGjhNVK3UEjrk=;
 b=ZoJYFNO7mcywq3eDDNW5ad/1Ob3ZenkmvgJR8JBLByAHAdmOIG+J1Hu/1hQgWiOPfWDO
 dg8lA8LToFRxRCPYEFwyaNvtansXmYs6R5s4wTya1zWLlaOHM2btXcikoOIq4Yufzqiln
 uuiaBudHSFaqfSb7OYeRzHLzWZov1rYcnTv+xh0pCdKePs8QtC/Fb8NtTVrJGN9BbrCeI
 uU+Vjzoc2wKDCdOF1QweiB1tBo7D70NSvLGZLsbu0WMBFpcqZ/gVkCsNjn79DuPkRrLae
 ljuMDMjvW9evqyzClaFpdR9N0PtduDQE3Xx+sD1GIYYDhLheLIGGFTbDX4tD3JCacEw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=de7swoaH; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55B5160E07
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:07 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-4843f22dcb8so785977f8f.0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347625; x=1790952425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=uU5Cj8zV1fsAuOEjbAuMpptajVUzRKxGjhNVK3UEjrk=;
 b=vnyIeqYj2KYQcjiCv3T+BK2fOohnCj70+W2fg72Uvkpv+3AKc+ONPrFEN4xAbvK0bc
 oyc8X3Ls1DjvMLNwEEPJhmOKOZ4LrDeT1nccKYVI5/gdCwRhH9Sk8IIQepKgNyLrraBL
 Cs3Kz0aJQgv21r+yesLdHFu3pDGaNZCDSqBF/6Eb3nB/OHafZjkAiUcFKiHbwhSrDXmH
 Fw05qDSbjVUMnCBamyr8UWg73WqQ7ps5iU2Kt4TkOvzbiRUMxZN5Qi15j4vnuf3zeThx
 bjhQfX2nLT4ChktTCXO2J+dwiegEFyy/unqdREAfyRLy8PhX5Nxo2diEV3p2FDLoyLml
 DNIg==
X-Gm-Message-State: AFuF++kIZ/Ix5rDS88k4GoCf0tGqiIp9qjZl2p/6+QMTOiVBAyawn9XZ
 W9YPDSR/583puS36NtEogAEhIKIfoniZd3ihc4h4GV924Ky57q93qFzVVV+6Iv8Ylwh+bJasB4q
 zMmA+rWkNhg==
X-Gm-Gg: AYBFou1T5jD7eVb3X0U1EkIr4QM1WCP+s5L2he6Tp9Aa3Ud/HpkzDN2w47HgLplk8mG
 HXMbJ6cJDSZSOvMo/+AGXGyil8kyikRIb6SzV0OiVIG3Mh1jffcoqzmu6BJhaDQXcYQS41tn0RQ
 O4gQdMHT2TJAD1IduvpzdDpswldUGMxno46fjTY7v7P1W8Xk9emrFWs1hJoPW7AwVULOmzM7s8H
 x8bSJGXGlGkTnMOMmg7iDIjoVeYKTAjZshVGHkQRqNUX1195Ku4+I8R+VRaOVYk3O3JukcyNyt7
 ItkpM5nGIylhQ9nkIjnR9paWIfl9p1J0eXkCrr26JhkOu7Bsxp4rf+HmOpyhAeCj2PK6p2bNaA/
 vXyDbBXFCr3S03H7obikwcG0TkugLh0sICxIkWTGc95w4qN7NWawlR6CtYXTPDKbCU1O1ApcCeb
 z2UTrw1RDHE7d+clzYimguZnF2b9e3SSeMdBHyfizOUOlMovlCJQeq7vRMCFkIaYwTANkqz7Dfr
 DQPKZYAQisJ1jbHkH9j1SXHXeFN8e/V+AkDvLZkDQ==
X-Received: by 2002:a05:6000:4707:b0:487:527:80a5 with SMTP id
 ffacd0b85a97d-488717724a8mr10783348f8f.41.1790347625329; 
 Fri, 25 Sep 2026 07:47:05 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a354c47sm7993841f8f.15.2026.09.25.07.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:47:04 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:47:01 +0200
Message-ID: <20260925144704.4100577-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260918072248.1496007-1-yegorslists@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/cannelloni: security bump to
 version 2.1.2
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
> For change log, see:
> 
> https://github.com/mguentner/cannelloni/releases/tag/v2.0.1
> https://github.com/mguentner/cannelloni/releases/tag/v2.1.0
> https://github.com/mguentner/cannelloni/releases/tag/v2.1.1
> https://github.com/mguentner/cannelloni/releases/tag/v2.1.2
> 
> 2.1.2 fixes CVE-2026-37539 (CVSS 3.1 score 9.8, CWE-121): a stack based
> buffer overflow in CAN frame parsing, in parseCANFrame() in parser.cpp
> and decodeFrame() in decoder.cpp, allowing remote attackers to cause a
> denial of service (crash) or possibly execute arbitrary code via
> crafted CAN FD frames.
> 
> The advisory names v2.0.0 explicitly, so the version used so far is
> affected. The CVE is not reported by
> https://security.buildroot.org/master/component/cannelloni because its
> NVD entry has no CPE data (vendor and product are both "n/a") and can
> therefore not be matched against the package version.
> 
> Apart from the security fix, 2.0.0..2.1.2 contains only a handful of
> changes: undeliverable frames are dropped after a timeout on a broken
> CAN bus, variable length arrays are gone, the default remote address is
> fixed, and pthreads are looked up with the CMake module instead of by
> hand. 2.1.1 is a maintenance release only, as the 2.1.0 tag pointed to
> a commit that was not the final one.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> 
> Changes v1 -> v2 (suggested by Thomas Petazzoni):
> - Retitle as a security bump, as 2.1.2 fixes CVE-2026-37539
> - Describe the CVE, confirm that the 2.0.0 we had is affected, explain
>   why security.buildroot.org does not report it, and summarize the
>   remaining 2.0.0..2.1.2 changes
> - Link the change logs of all releases in 2.0.0..2.1.2, not just 2.1.2
> 
>  package/cannelloni/cannelloni.hash | 2 +-
>  package/cannelloni/cannelloni.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cannelloni/cannelloni.hash b/package/cannelloni/cannelloni.hash
> index 625e43d157..6b45d497e4 100644
> --- a/package/cannelloni/cannelloni.hash
> +++ b/package/cannelloni/cannelloni.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  3dde63727549d4a39154e78b95f4a5dad96af236ca6cef531f347c0b923c74d5  cannelloni-2.0.0.tar.gz
> +sha256  c704707f7dd9f1ed64e9195097809f8882c03b1fa0a79864b8e3bf286521e3d7  cannelloni-2.1.2.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
> diff --git a/package/cannelloni/cannelloni.mk b/package/cannelloni/cannelloni.mk
> index 7978cfccf5..2e6a61545e 100644
> --- a/package/cannelloni/cannelloni.mk
> +++ b/package/cannelloni/cannelloni.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CANNELLONI_VERSION = 2.0.0
> +CANNELLONI_VERSION = 2.1.2
>  CANNELLONI_SITE = $(call github,mguentner,cannelloni,v$(CANNELLONI_VERSION))
>  CANNELLONI_LICENSE = GPL-2.0
>  CANNELLONI_LICENSE_FILES = gpl-2.0.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
