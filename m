Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED22DD0D152
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0DDB410A1;
	Wed,  7 Jan 2026 17:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OGDQX-b6MRsa; Wed,  7 Jan 2026 17:55:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 497884108A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808551;
	bh=NdWBZdRTgEUmr5PrWArPnETtGWV9DWkUxcpJgLZTNSU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rvqZbRhNwHiRxHOhIUrdUjchnlte/CJ0lYFVHrG01TqMY2lYSZWd5PsXZfUxFzl5o
	 4Ri81bquqGHDKIZ5+vCGpS+G5CCf6IEY2VpMl1K14bAh/UqN0W5VyhV1N7WLRdevxU
	 /UPzsiYCbPBZsZ28zLpDw0DyI4MFS2eCNTrGKU4TfiyAa6GTt0ckIrzI0zz3iOQ/JL
	 YWfhSDcpShjW4owk4sZi+vl1kxeQSagOG6j96WxM912Ud4x0KOLsDCpVd6uw/B2iOe
	 Ur6Lv/AyXHx2xmcVWr2JvmnexdQAlE0v10sOXvgi+7Jjn5sQdn5GHD4WWMiG24ILfm
	 1Wps1jYbJhMtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 497884108A;
	Wed,  7 Jan 2026 17:55:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 862FC25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7859041080
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQtM0WAv2hCi for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:55:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7020840BBF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7020840BBF
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7020840BBF
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 746CAB97A70C; Wed,  7 Jan 2026 18:55:45 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:55:44 +0100
Message-ID: <20260107175544.230331-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217222539.1989993-2-thomas.petazzoni@bootlin.com>
References: <20251217222539.1989993-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808545; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=V8NrlpaZZ9JeIzK1sZS6RzblMooww/FZmAzqS9GqHO0=;
 b=R0pONi/MpRZcvKZ8A7Rlya8tqldsCX2RYtMw6JJz94VHf1EDsaOjZmbUIeKZXeCronu8WO
 XjF5zDd1jdhnzNsrZZ8mlBGgCzfT3uc5Jw7bZqLewOMrYMbCl+uuZBekM9vTkr2Q1pEZxM
 ymVLS9ap0w7S0lM/a2SMmzRS+J9DJBbRdbv590snxMazoVYBzmcJ+OPIzGqOgqXUb8y0AM
 IMufdEwfyOWPQiaGkd9bVfnnFtFe7r8Q90xE1C0tS731EOQds5ceBwpnGxTuLkasZthz2h
 kLJWE1TJWnXhOsSn8f174Ex3PAEKp9tgiYDggNFigbRMTvmzSLdiFcDaIEi4bw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=R0pONi/M
Subject: Re: [Buildroot] [PATCH 2/3] package/cppcms: fix build with recent
 versions of ICU
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
> Since Buildroot commit dcee99507c6767230fd1faeeefe95f5662eb03a3 that
> bumped package/icu to version 77-1, the build of cppcms with ICU
> support enabled fails.
> 
> Indeed, ICU now requires C++17, and while cppcms.mk has some logic to
> get C++ flags using icu-config, the -std=c++17 gets ultimately
> overridden by the built-in -std=c++11 flag encoded in cppcms
> CMakeLists.txt.
> 
> To fix this, we have submitted a patch upstream that ensures the
> CMAKE_CXX_FLAGS passed on the command line take precedence over the
> built-in flags defined in cppcms CMakeLists.txt.
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/9c34a08ea02499b28093ad3fa184cee10b2883ac/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.11.x. Thanks

> ---
>  ...llow-flags-passed-on-the-command-lin.patch | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 package/cppcms/0002-CMakeLists.txt-allow-flags-passed-on-the-command-lin.patch
> 
> diff --git a/package/cppcms/0002-CMakeLists.txt-allow-flags-passed-on-the-command-lin.patch b/package/cppcms/0002-CMakeLists.txt-allow-flags-passed-on-the-command-lin.patch
> new file mode 100644
> index 0000000000..a6b9526e88
> --- /dev/null
> +++ b/package/cppcms/0002-CMakeLists.txt-allow-flags-passed-on-the-command-lin.patch
> @@ -0,0 +1,58 @@
> +From 58faaa72919076e2c847b595a739469243ac9706 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Tue, 16 Dec 2025 16:02:41 +0100
> +Subject: [PATCH] CMakeLists.txt: allow flags passed on the command line to win
> + over built-in flags
> +
> +CMakeLists.txt and booster/CMakeLists.txt define some flags in
> +CXX_FLAGS, and then set CMAKE_CXX_FLAGS in a way that causes the flags
> +in CXX_FLAGS to override the ones passed (for example on the command
> +line through CMAKE_CXX_FLAGS). This prevents the user from overriding
> +those compiler flags in CXX_FLAGS.
> +
> +A specific example is that CXX_FLAGS sets -std=c++11, but with recent
> +version of ICU (such as >= 77-1), -std=c++11 is not enough, passing
> +-std=c++17 is needed. Unfortunately, it cannot be passed through
> +CMAKE_CXX_FLAGS due to the aforementioned problem.
> +
> +This commit allows to resolve this by ensuring that CMAKE_CXX_FLAGS
> +and CMAKE_C_FLAGS win over CXX_FLAGS/C_FLAGS.
> +
> +Upstream: https://github.com/artyom-beilis/cppcms/pull/107
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + CMakeLists.txt         | 4 ++--
> + booster/CMakeLists.txt | 2 +-
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 826e87f..86693e2 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -141,8 +141,8 @@ elseif(MSVC)
> + 	set(C_FLAGS "/W3")
> + endif()
> + 
> +-set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CXX_FLAGS}")
> +-set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${C_FLAGS}")
> ++set(CMAKE_CXX_FLAGS "${CXX_FLAGS} ${CMAKE_CXX_FLAGS}")
> ++set(CMAKE_C_FLAGS "${C_FLAGS} ${CMAKE_C_FLAGS} ")
> + 
> + #############################################################################
> + #
> +diff --git a/booster/CMakeLists.txt b/booster/CMakeLists.txt
> +index 8f63254..4638f76 100644
> +--- a/booster/CMakeLists.txt
> ++++ b/booster/CMakeLists.txt
> +@@ -223,7 +223,7 @@ if(NOT IS_WINDOWS)
> + 	endif()
> + endif()
> + 
> +-set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CXX_FLAGS}")
> ++set(CMAKE_CXX_FLAGS "${CXX_FLAGS} ${CMAKE_CXX_FLAGS}")
> + 
> + #############################################################################
> + #
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
