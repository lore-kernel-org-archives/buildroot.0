Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A67DDC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:45:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E54A60E92
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E54A60E92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20BD6823A0;
	Sat, 24 Jul 2021 21:45:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uHbX0M4xVrv5; Sat, 24 Jul 2021 21:45:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CF1B81DE0;
	Sat, 24 Jul 2021 21:45:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 036D51BF2AA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E603A60611
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L9SdEb66Nad0 for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 21:45:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EF13605F0
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 21:45:37 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id b7so6385143edu.3
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 14:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QQw2vv3cCcCjOdievm5yLQLvbFcKELhg1k/kXkRUOIY=;
 b=ec9VlGr4uTx3sBKfTxWqf2Rr4EpFlsU7+MZ/A5uk8/e+JYvbniOjFEVYQexEf1J5em
 oGXRSJFKEcaYq1EcJFIIymlPsHjHx+DEv/Jz53fcQX6heXdjz6sXL23oa/2Nymg2kdzb
 6N2ieOt7eK/9ggBdj65gMzwR2nmjSNe0mbiJ3A8Z25yA5C2vc0VCpkHcqWHQ25cgF1Ke
 m+VfGJ/l5EzgGHTH5vRLJ7NuBBgJtZ4yGEYKJ96BtR7Xu+5GHZ2Sv8sNj79fpf89+4ex
 LlzOzr5SH2orwMUasrMJznkVMLFbjDMO9PGFUhj4wDROJxTYCczNtQzQ/lbrF8vEJgrG
 gB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QQw2vv3cCcCjOdievm5yLQLvbFcKELhg1k/kXkRUOIY=;
 b=Pva0lRbLtfpRE/dnEgMwGFPe7yFWV5Sczpp0Yrqw8G5NlZfTJtGfMswYuUnTxIB5Mu
 pexCqw8Ocn0418Uh55luQi0+yri04UhY+JMr0XPWOITRtzw4nTQxp83EotacJQBp6UhH
 08tPvxzSjP+pBZX8c18bAAK8vDdQXdx13Coo6CuoXmCOecUi4bUAotS+CFkwwsQ63xiA
 0wTYsX/EtT3nHxuFmnNNfLzmcgbC7WhCkId6j/1L/IWCE97G+5qx+ZnxnQLwFKKNeben
 Rykl8IU2ujc1LaIfPGVnEd7GBjyZl9u8Irsy40UD0jluGPbE32kSFBWPmo7OHg6DUBMj
 frfA==
X-Gm-Message-State: AOAM53070wkphw/Tb7Rz6UidU8Gg0K8wYLz1cr6hPzrF0MnJJtKdRcZ3
 1mQM49QEchE1LbGtI1fIQNrTcgUUwpUEZend
X-Google-Smtp-Source: ABdhPJwpLDrayTYbN2dW8zY5WpQcvYBY2MW/uloMxXf8TWy7Wky1BiO7Lox51L7ush+/3bzUBKGxvQ==
X-Received: by 2002:a05:6402:40cf:: with SMTP id
 z15mr13628180edb.175.1627163135201; 
 Sat, 24 Jul 2021 14:45:35 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n26sm12325235eds.63.2021.07.24.14.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 14:45:34 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 23:45:25 +0200
Message-Id: <20210724214526.47637-2-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210724214526.47637-1-arnout@mind.be>
References: <20210724214526.47637-1-arnout@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 2/3] package/lapack: introduce
 BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This makes it easier for packages that depend on lapack to get
their dependencies correct.

Since the !uClibc dependency only exists for PowerPC, treat it as
an architecture dependency.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lapack/Config.in | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/lapack/Config.in b/package/lapack/Config.in
index 6cd0810cb1..ee7aeae7a8 100644
--- a/package/lapack/Config.in
+++ b/package/lapack/Config.in
@@ -1,13 +1,18 @@
-comment "lapack/blas needs a toolchain w/ fortran"
+config BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
+	bool
+	default y
+	# _fpu_control is used on PowerPC, but not available with uClibc
 	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
+
+comment "lapack/blas needs a toolchain w/ fortran"
+	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_FORTRAN
 
 config BR2_PACKAGE_LAPACK
 	bool "lapack/blas"
+	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_FORTRAN
 	depends on !BR2_PACKAGE_CLAPACK
-	# _fpu_control is used on PowerPC, but not available with uClibc
-	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
 	help
 	  LAPACK and BLAS FORTRAN implementation. This package
 	  installs two libraries: libblas and liblapack.
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
