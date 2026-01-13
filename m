Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D80D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1977240E60;
	Tue, 13 Jan 2026 19:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eem-Wh4qKgXl; Tue, 13 Jan 2026 19:48:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EBE940E62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333702;
	bh=35UTlklFxdR5H6+QhoqkAKiq9qGKrkLu1G1qhAaCIz0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=To+k+JltkD0zg3QvE2C56JOVZdZU3trKdbOpetOiRXaouwgBiyPfSNIkmht20cpn8
	 qByMDgykGM7ZBwXi8Jke/e4Pam5JBcJZ1uxAfalg1erm60vcZGwo3/3weeZmHEJFF5
	 v0wnjcTPlF8R1a7zApNF1CWksHKu9MMXi/yX1e7sARvAXYCWZAbE+CiU+EKEWG4qwg
	 FyxTsXZY/fXOg+q7SA8EyvZfyA0/smvBmSAU3o65LUCju4n+J1YPHAmy6nle7USD0L
	 0jMpbpFJkekri/bP3Xizu6xRsDVJbXbgZV7qtN7LWtiZi3wb7o3DVvTSyILiIyJ4I4
	 5ceTFmSBNLDow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EBE940E62;
	Tue, 13 Jan 2026 19:48:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4F1F1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABD0860BB2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tb9M9Au-jSil for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:48:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A25EB60B91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A25EB60B91
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A25EB60B91
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D293AB97A863; Tue, 13 Jan 2026 20:48:16 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:48:15 +0100
Message-ID: <20260113194815.100618-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260102154342.1180158-1-bernd@kuhls.net>
References: <20260102154342.1180158-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333696; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=TonmWpbGA+Eb7jah1Bj160yxKjpLlvLD7BKyFX3VkC4=;
 b=c7C5nJc2N4+KOQUzpy2lnyyk3ZndRbop9XqC5MRuHJ8v+PH+VRWxqDcGXLl21xqYePgxuW
 my+WBQO+cZZZQqP3QNKsB6bXBJ1FDwDuSNGpRwJeXlB0X6EYQlCI1l/r3IqNwzPCJclo8y
 6Tf05nvUMWqVY/L0iytIIlBvyM3BCzXokvkj0ZYkeyupDuDnn2zunPQlRZxD8h1wbPwQBm
 QCX9PXJhSsXspoQ+U0KTCUtc9edV6qGtr2gLDpcrVpB0ySQ5/3JMFlnX9ubbtUAHZAAhYE
 qrPF8I+0yc4hqdL8QWTI5fU8rxBm88ZkZqASNi37aW7FaJ7v8X0BUs1O8+ELyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=c7C5nJc2
Subject: Re: [Buildroot] [PATCH v2 1/1] package/atf: fix non-threaded build
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
> Buildroot commit d6c3257e931ed256e3ebcd78938f6146bba8586f bumped the
> package from 0.21 to 0.23. Upstream release 0.22 includes commit
> https://github.com/freebsd/atf/commit/d7c7c53c0626ab59a62aa4efcf05323b3621baa9
> which uses CLOCK_MONOTONIC without including time.h.
> 
> Fixes:
> https://autobuild.buildroot.net/results/41b/41b25ee8e66e34323eca011e4b5fe479ece9ed76/
> 
> Two minimal defconfigs to reproduce the build error:
> 
> BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
> BR2_PTHREADS_NONE=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_ATF=y
> 
> BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
> BR2_PTHREADS_NONE=y
> BR2_GCC_VERSION_13_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_ATF=y
> 
> All defconfigs of the build errors recorded by the buildroot autobuilders
> contain BR2_PTHREADS_NONE=y.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
> v2: updated subject, build error is unrelated to gcc version (Thomas)
> 
>  .../0001-atf-check.cpp-include-time.h.patch   | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/atf/0001-atf-check.cpp-include-time.h.patch
> 
> diff --git a/package/atf/0001-atf-check.cpp-include-time.h.patch b/package/atf/0001-atf-check.cpp-include-time.h.patch
> new file mode 100644
> index 0000000000..359172c0e6
> --- /dev/null
> +++ b/package/atf/0001-atf-check.cpp-include-time.h.patch
> @@ -0,0 +1,33 @@
> +From 67e7d350a15aff88c151b1fc838dac83d35be955 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Sat, 22 Nov 2025 23:47:41 +0100
> +Subject: [PATCH] atf-check.cpp: include time.h
> +
> +Fixes build error with gcc 14 as reported by the buildroot autobuilders:
> +https://autobuild.buildroot.net/results/41b/41b25ee8e66e34323eca011e4b5fe479ece9ed76/build-end.log
> +
> +atf-sh/atf-check.cpp: In function 'useconds_t get_monotonic_useconds()':
> +atf-sh/atf-check.cpp:183:24: error: 'CLOCK_MONOTONIC' was not declared in this scope
> +
> +Upstream: https://github.com/freebsd/atf/commit/67e7d350a15aff88c151b1fc838dac83d35be955
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + atf-sh/atf-check.cpp | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/atf-sh/atf-check.cpp b/atf-sh/atf-check.cpp
> +index 1354e3a..94da413 100644
> +--- a/atf-sh/atf-check.cpp
> ++++ b/atf-sh/atf-check.cpp
> +@@ -30,6 +30,7 @@ extern "C" {
> + #include <limits.h>
> + #include <signal.h>
> + #include <stdint.h>
> ++#include <time.h>
> + #include <unistd.h>
> + }
> + 
> +-- 
> +2.47.3
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
