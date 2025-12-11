Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E650AD41D7E
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF8C241044;
	Thu, 11 Dec 2025 19:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLaU4Re9B9rZ; Thu, 11 Dec 2025 19:32:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D340B411B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481546;
	bh=2mz7mvkxBN3jTEgUpAYNd99O7ydXpNCScro37LgFh1c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E8rhTBLQWRFs2CSfrG3OYe404a8UNbdiQXUBizJ1TuU/w6XGNDVu1vfy1MFNiWKsL
	 9xDA8viZTMf/fnFCcvXegoO26iONBMJzytkROOlqrEb3oOqsWvANRViskVfPBMLE6x
	 LG/tdNRFGCrp4krt756natPc98yC4UFk6JBID1fDGRXLDZ/CMBMHSEaSHjIsoiVVci
	 5YvWqsdAgMKMVMcBEF2seZRbgXEjULubB9pP5SQXMu3IcgFdhNbKdcfqAJfPmb0QuK
	 xbmZ9C4tkYN8mN2vXd7YTr5/hhAJN4LedO8+7eqGB2nBM+2dugPybS1VUWM5wu93jU
	 zKDks8c2GTT6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D340B411B2;
	Thu, 11 Dec 2025 19:32:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C9B92C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EAE740027
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pg02YAXGbS-2 for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:32:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3689540012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3689540012
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3689540012
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5C350B979EEF; Thu, 11 Dec 2025 20:32:22 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:32:20 +0100
Message-ID: <20251211193220.1100618-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251122130847.2242703-1-bernd@kuhls.net>
References: <20251122130847.2242703-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481542; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=VHvs5lud3jpt4DFW2i7fyyPzlKx1bJnTYjuYLYaF7Qg=;
 b=OxmsPXFsJtHJ4ckv9E0N0LhKPjYAcSzMJbY6ZvfnP/aZvdTMEPWV2WLopO4SP4rvixdVXj
 oW5gzuHmNjHA2fTgeA/Lrl/6YflB6F4hw2bknstrH1wc1iVlQKpGdJvHRgnZq/ba62ZGme
 YIpOn7jPP8rRt5bEbbMSGH63Vo3lToEAofwz1H2VqGqew85qri/V5Ab3WcLwUJtjaW/A5O
 W8ldlV3+SFKAR63yZcTzf/ZxY4brs3aZXpH5SeUANNfjv0InNZRErq46XM0ji3PFDEQWYp
 LFCiroFyipMuMha+9rlOZ7vELHLAHsJ925iSz6Coz94xdzCicJian2otrZmxiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=OxmsPXFs
Subject: Re: [Buildroot] [PATCH 1/1] package/yaml-cpp: fix build with newer
 gcc
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
> Fixes a build error not yet seen by the autobuilders due to other
> packages failing before. Seen with defconfig:
> https://autobuild.buildroot.net/results/ebf/ebf9a81f7e225ecdab20bbad8ad8daa136fddb46/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.08.x. Thanks

> ---
>  ...tterutils-Explicitly-include-cstdint.patch | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/yaml-cpp/0001-emitterutils-Explicitly-include-cstdint.patch
> 
> diff --git a/package/yaml-cpp/0001-emitterutils-Explicitly-include-cstdint.patch b/package/yaml-cpp/0001-emitterutils-Explicitly-include-cstdint.patch
> new file mode 100644
> index 0000000000..e3dc308a2f
> --- /dev/null
> +++ b/package/yaml-cpp/0001-emitterutils-Explicitly-include-cstdint.patch
> @@ -0,0 +1,42 @@
> +From 7b469b4220f96fb3d036cf68cd7bd30bd39e61d2 Mon Sep 17 00:00:00 2001
> +From: Christopher Fore <csfore@posteo.net>
> +Date: Wed, 14 Aug 2024 21:02:32 -0400
> +Subject: [PATCH] emitterutils: Explicitly include <cstdint>
> +
> +GCC 15 will no longer include it by default, resulting in build
> +failures in projects that do not explicitly include it.
> +
> +Error:
> +src/emitterutils.cpp:221:11: error: 'uint16_t' was not declared in this scope
> +  221 | std::pair<uint16_t, uint16_t> EncodeUTF16SurrogatePair(int codePoint) {
> +      |           ^~~~~~~~
> +src/emitterutils.cpp:13:1: note: 'uint16_t' is defined in header '<cstdint>';
> +this is probably fixable by adding '#include <cstdint>'
> +   12 | #include "yaml-cpp/null.h"
> +  +++ |+#include <cstdint>
> +   13 | #include "yaml-cpp/ostream_wrapper.h"
> +
> +Tests pass.
> +
> +Closes: #1307
> +See-also: https://gcc.gnu.org/pipermail/gcc-cvs/2024-August/407124.html
> +See-also: https://bugs.gentoo.org/937412
> +Signed-off-by: Christopher Fore <csfore@posteo.net>
> +
> +Upstream: https://github.com/jbeder/yaml-cpp/commit/7b469b4220f96fb3d036cf68cd7bd30bd39e61d2
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/emitterutils.cpp | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/emitterutils.cpp b/src/emitterutils.cpp
> +index fc41011a5..f801b1d0c 100644
> +--- a/src/emitterutils.cpp
> ++++ b/src/emitterutils.cpp
> +@@ -1,4 +1,5 @@
> + #include <algorithm>
> ++#include <cstdint>
> + #include <iomanip>
> + #include <sstream>
> + 
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
