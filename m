Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80F9D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD29184213;
	Tue, 13 Jan 2026 19:46:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_947w30v8kr; Tue, 13 Jan 2026 19:46:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCDC284215
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333591;
	bh=iHkhpnZFHxy2V+leoQ1ao8T+cShYwZN4AtgkPsUsiCU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E3VSHWg45i7IACIRg4RUmpmYV86ejGTcM8JOk/NyypYRux1XrHAASUyspjshwHPRP
	 MnGXQJJDGjcQ1hVksvcRVS8fUgKzTNnXq0vqzJU4+WLDhRsfwXGF1pAL9A0cuSlRWF
	 aebYf1d25akS+NY9eJVyZF+MfV/f66+shrpPifqdnc4RgumIcNQJkaVWi93HJ6NxYn
	 VxKB+ysnrAvZBsiJaZyDutthTS0GmPwYObvGcQJxdtY+YfuAE2yPYQE75PpJ6e5r6H
	 mHjzs5J9LLPPh+tGVTmW50xB3SZb3kAA/7HM4tnfO33sPdTBoHd97LOWSZJsWuCD6A
	 T1i+dRbt6eoEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCDC284215;
	Tue, 13 Jan 2026 19:46:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D4761C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E88134089A
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CO2wTFh4bydp for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:46:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DCE1C40809
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCE1C40809
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCE1C40809
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 05567B97A863; Tue, 13 Jan 2026 20:46:27 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:46:26 +0100
Message-ID: <20260113194626.98560-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228211045.3059593-4-thomas.petazzoni@bootlin.com>
References: <20251228211045.3059593-4-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333588; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=YaXzdyCIxDl8LeakoiXei/mGp07qf5BL3GxR3qvXkPg=;
 b=fMKucAr0lIt+uLUdhayEuZFaV1ejMde4n7oD6gDF0Sn5Br++oWPiOyql4IYQF746iXJ/9F
 SpG29aXoNICw4HGQ0XHzNdBOFP4U18JbgWNKq6+qR7ki1yO4PbWscEAhp6QxbFLKgEe8MG
 eGPRJMHuLjV1Z5nViFixSC3UncVn44Pu6u5xBHxKIyfpRtMeW3WOVStKoplabRRhwYd9Df
 jf1kBACZPlKFAaJfs0Zu8v4+/dlLRvaHmfSMoIwT+QMPrJemrbqhySSM6uphoEYcfdzceR
 /jAIdWxhZfFXljQHvTRrjueoWBjLBqtBeNpAo11vPzIPZ8uullrLKDMUecSvdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=fMKucAr0
Subject: Re: [Buildroot] [PATCH 4/5] package/qt5/qt5webkit: fix gcc >= 14.x
 build issue
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Add another patch from Fedora, also used in Arch Linux to fix a gcc >=
> 14.x build issue:
> 
> build/qt5webkit-5.212.0-alpha4/Source/WebCore/page/csp/ContentSecurityPolicy.cpp:235:56:   required from here
>   235 |             if ((policy.get()->*allowed)(std::make_pair(algorithm, digest)))
>       |                                          ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
> host/opt/ext-toolchain/aarch64-buildroot-linux-gnu/include/c++/14.3.0/type_traits:1246:52: error: non-constant
> condition for static assertion
>  1246 |       static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
>       |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  ...age-csp-ContentSecurityPolicy.cpp-fi.patch | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/qt5/qt5webkit/0013-Source-WebCore-page-csp-ContentSecurityPolicy.cpp-fi.patch
> 
> diff --git a/package/qt5/qt5webkit/0013-Source-WebCore-page-csp-ContentSecurityPolicy.cpp-fi.patch b/package/qt5/qt5webkit/0013-Source-WebCore-page-csp-ContentSecurityPolicy.cpp-fi.patch
> new file mode 100644
> index 0000000000..ab6137dd28
> --- /dev/null
> +++ b/package/qt5/qt5webkit/0013-Source-WebCore-page-csp-ContentSecurityPolicy.cpp-fi.patch
> @@ -0,0 +1,45 @@
> +From 286e0280a55949d62b2163d68c827539c141d487 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Sun, 28 Dec 2025 18:35:45 +0100
> +Subject: [PATCH] Source/WebCore/page/csp/ContentSecurityPolicy.cpp: fix build
> + with gcc >= 14.x
> +
> +Fixes:
> +
> +/home/thomas/buildroot/br/output-all/build/qt5webkit-5.212.0-alpha4/Source/WebCore/page/csp/ContentSecurityPolicy.cpp:235:56:   required from here
> +  235 |             if ((policy.get()->*allowed)(std::make_pair(algorithm, digest)))
> +      |                                          ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
> +/home/thomas/buildroot/br/output-all/host/opt/ext-toolchain/aarch64-buildroot-linux-gnu/include/c++/14.3.0/type_traits:1246:52: error: non-constant
> +condition for static assertion
> + 1246 |       static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
> +      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Patch used in Fedora and Arch Linux:
> +
> +  https://src.fedoraproject.org/rpms/qt5-qtwebkit/raw/rawhide/f/qtwebkit-fix-build-gcc14.patch
> +  https://aur.archlinux.org/packages/qt5-webkit
> +
> +Upstream: dead
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + Source/WebCore/page/csp/ContentSecurityPolicy.cpp | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/Source/WebCore/page/csp/ContentSecurityPolicy.cpp b/Source/WebCore/page/csp/ContentSecurityPolicy.cpp
> +index 9e726d5fe10c..989a59a6122f 100644
> +--- a/Source/WebCore/page/csp/ContentSecurityPolicy.cpp
> ++++ b/Source/WebCore/page/csp/ContentSecurityPolicy.cpp
> +@@ -231,8 +231,9 @@ bool isAllowedByAllWithHashFromContent(const CSPDirectiveListVector& policies, c
> +         auto cryptoDigest = CryptoDigest::create(toCryptoDigestAlgorithm(algorithm));
> +         cryptoDigest->addBytes(contentCString.data(), contentCString.length());
> +         Vector<uint8_t> digest = cryptoDigest->computeHash();
> ++        ContentSecurityPolicyHash hash = std::make_pair(algorithm, digest);
> +         for (auto& policy : policies) {
> +-            if ((policy.get()->*allowed)(std::make_pair(algorithm, digest)))
> ++            if ((policy.get()->*allowed)(hash))
> +                 return true;
> +         }
> +     }
> +-- 
> +2.52.0
> +
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
