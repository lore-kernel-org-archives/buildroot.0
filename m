Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C350EB28E2
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CA8B612B7;
	Fri,  6 Feb 2026 08:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ps0BZpOB076H; Fri,  6 Feb 2026 08:12:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C1BE6128A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365544;
	bh=yne9moScP7xmVVWZiLhztSPznLHH9mWuJYrgZRPyaWk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=O5vdZZya0l0GZUx7kkql1Rxt0KJyC5oJZwyckRcJ6iVJUNsBOWVrVQtqGpdyDLKa5
	 7WDofxyZA7HJ6r/Jh53syAAKXQJH/hLVoCPcBkO/aR1oixK8ac3vI6q1kGbPdvR55S
	 Ambq5cTpKObN1lb6f1H5Fs5wsy4dKPsca4TBDG5CCiqM+0tpM6U4e179O1BortyMna
	 jacIrfoMqkwHIhI55Pfz/84GEhHCNcV0lefP0KePzRCrrhQElzvuO7FXfvnpFQhCSD
	 CrRvC9DpTVpSTwTpvkXNHONahYy1sh5yiLNk1XIPGT9UKXWVrBrxjDneFdS99lDXvg
	 fhIHS73enC+HA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C1BE6128A;
	Fri,  6 Feb 2026 08:12:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 06E09173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA040834C7
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ki1uGwWs_NLc for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:12:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ADAFF83BC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADAFF83BC7
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADAFF83BC7
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:08 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4806f9e61f9so11073795e9.1
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:12:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365527; x=1770970327;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wBzzVFnEg0xyAby7rqOLUXWGLCAl3yzSK7grWGdagZ0=;
 b=EIgzIpgOBy+d/dCJo22xaud07RdfOMQf0+dbn1e3IGCYIyanp6+QrjcTpwhZAsLKLA
 Ax+Dr1STchplDrRzI2vKqODtxUUlf6FcyGSRr+Qq3kWr5O0ZfglKFLJeEl1atuD/UQsr
 a0LSkoD4nJhknyFHL1QwNrpTWtJmumE7DtgsxmAqMZ3DBbwnqOR6T7tmZ5/2mjLQqucy
 ESUBbrDoVZMzhyZlJG3NOnlvAljWDc3UWXcCCFD1XqTaE4MK4jgvZQhmR+v+VSGL6wP7
 VK443rcI5x3PvgR7YlbRwCCsiv+YY9K4N0lxuGpKxQIoPFOgLNhgnoTtjg4DmY0n3ET0
 39Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsfW9A+KVjG6y3qH+T/zw7MQIIhinB9Yh9SqqNgHvEHJ0KgA3xFLkbMO0utM15JZpjQshig3CZqd0=@buildroot.org
X-Gm-Message-State: AOJu0YyYx7qdbO2wd4S45cj+OvsDJKmw51BSAt9NBw2wV4+y/rtF5D4c
 PHr0b75oM+UjsEe/E4Zg7zLWpj5QGLV/iSQljugymGuY74X7fFTFv87z2go95UAlpRhPUH6nmVD
 S6NLE
X-Gm-Gg: AZuq6aJpd3RjntvPAMGa6B5CJW0kSfFl1CxCyVVBF+zAlN9IWl68L82I1RMvNwBC5zk
 /qKvYGMMIFjqAVuKceWuUd3W2QrsIdL0m1fiDYT8aAL77TSufkhYUhgs6m3V5LGemlpR4w8aA9J
 e7sh3wPuEsuGCjUYfWyY3xHtaUpk9QeCHTVSTKQkH6+FpGEsyu7r+YzXGar+JxLUfcSBdGTzLDb
 KS90Vp3i95oFfasRiknHqUiVnOc2Avi0PTQtSzZXsfZB8o75NxRF9RYwMz7zxvZ+9VmTd64uEfK
 MC6UeAcOucJ9MgIEMifYbW3ow/wAquWehzTCss3HIPO1hHW4Xf38Nl4bLEhaY3zhXVQuPFHBIO9
 JxmKwFjKzIAgk2mPZYKznHhcX9VBiHuJeJXM0KltQo0qegVDvjR0IeLzFqjTQQ/PMYzoXDP6weX
 Xb3e8=
X-Received: by 2002:a05:600c:6209:b0:45d:d97c:236c with SMTP id
 5b1f17b1804b1-483202160cemr27146255e9.21.1770365526707; 
 Fri, 06 Feb 2026 00:12:06 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4362974b176sm4147615f8f.37.2026.02.06.00.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:12:06 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:12:05 +0100
Message-ID: <20260206081205.33075-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125122113.2531851-1-bernd@kuhls.net>
References: <20260125122113.2531851-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365527; x=1770970327; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wBzzVFnEg0xyAby7rqOLUXWGLCAl3yzSK7grWGdagZ0=;
 b=LD4Vp7bP7dUWZKH/Oh6oYtdcJrSvtamDsT2rNKV76P8zO3uyws/X4Vgiuqrx4uv6es
 N/wDGwcTuPEMXp19ZkfFUoVydnMDhulHcwLExx/X6Jch57mTTQwNhwYqKmkM2BYIi0h0
 lCZVozcU2StZBEjCXJ+RBFD/FFFmu0FezvBeu87xdrLW7mT0vusEiROd30AqMPedTmDL
 k1e+vXXLox+3cyWE5d0AAB7ki18lwBHdyJ5DRfldgD/dTW2LgJbWWTobosnE3X9isVwb
 Uje80QssTVqgZ2StabyNwim9B37lwTH9DSUYCsldRaFAWqECC5/6mMH8Jih22a8CRuVF
 2XWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LD4Vp7bP
Subject: Re: [Buildroot] [PATCH 1/1] package/syslog-ng: fix non-c++ build
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
> Buildroot commit 18630db8e822120d0d4b9f37fa7c0d901f55d8e9 bumped the
> package from 4.7.1 to 4.8.1. Upstream version 4.8.0 includes commit
> https://github.com/syslog-ng/syslog-ng/commit/163c894563c9f5536c5e91222c9efda64031b08c
> which causes build errors with non-c++ toolchains:
> https://github.com/syslog-ng/syslog-ng/issues/5040
> 
> Fixes:
> https://autobuild.buildroot.net/results/70c/70ca3364da15383a8270d180cd2bf67977d9cb56/
> 
> The earliest build error recorded by the autobuilders dates back to
> 2025-04-23 so a backport should be considered:
> https://autobuild.buildroot.net/results/dd2/dd2b1dedbd92280dac01ae4d6454ef7eb08cc539/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  ...vert-grpc-fix-C-standard-lib-linkage.patch | 30 +++++++++++++++++++
>  package/syslog-ng/syslog-ng.mk                |  2 ++
>  2 files changed, 32 insertions(+)
>  create mode 100644 package/syslog-ng/0001-Revert-grpc-fix-C-standard-lib-linkage.patch
> 
> diff --git a/package/syslog-ng/0001-Revert-grpc-fix-C-standard-lib-linkage.patch b/package/syslog-ng/0001-Revert-grpc-fix-C-standard-lib-linkage.patch
> new file mode 100644
> index 0000000000..9acb7f9f5f
> --- /dev/null
> +++ b/package/syslog-ng/0001-Revert-grpc-fix-C-standard-lib-linkage.patch
> @@ -0,0 +1,30 @@
> +From 1b93cb5890d502ab3fd7623306a7feaa09c4d8ff Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Sun, 25 Jan 2026 13:07:29 +0100
> +Subject: [PATCH] Revert "grpc: fix C++ standard lib linkage"
> +
> +This partially reverts commit 163c894563c9f5536c5e91222c9efda64031b08c.
> +
> +Upstream: https://github.com/syslog-ng/syslog-ng/issues/5040#issuecomment-3796535385
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + modules/examples/Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/modules/examples/Makefile.am b/modules/examples/Makefile.am
> +index fe1a08feb..5914e5273 100644
> +--- a/modules/examples/Makefile.am
> ++++ b/modules/examples/Makefile.am
> +@@ -35,7 +35,7 @@ EXTRA_modules_examples_libexamples_la_DEPENDENCIES = $(MODULE_DEPS_LIBS) $(EXAMP
> + modules_examples_libexamples_la_LDFLAGS = $(MODULE_LDFLAGS)
> + 
> + if ENABLE_CPP
> +-nodist_EXTRA_modules_examples_libexamples_la_SOURCES = force-cpp-linker-with-default-stdlib.cpp
> ++modules_examples_libexamples_la_LIBADD += -lstdc++
> + endif
> + 
> + EXTRA_DIST += modules/examples/CMakeLists.txt
> +-- 
> +2.47.3
> +
> diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
> index fa405ca5cb..7bf77da205 100644
> --- a/package/syslog-ng/syslog-ng.mk
> +++ b/package/syslog-ng/syslog-ng.mk
> @@ -11,6 +11,8 @@ SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-n
>  SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
>  SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
>  SYSLOG_NG_CPE_ID_VENDOR = oneidentity
> +# 0001-Revert-grpc-fix-C-standard-lib-linkage.patch
> +SYSLOG_NG_AUTORECONF = YES
>  SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
>  	json-c libglib2 openssl pcre2
>  SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
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
