Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4853EC35FF1
	for <buildroot@archiver.kernel.org>; Fri, 14 Mar 2025 15:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAD8284094;
	Fri, 14 Mar 2025 15:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id if6E_6TzdOOR; Fri, 14 Mar 2025 15:43:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB8DA84141
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB8DA84141;
	Fri, 14 Mar 2025 15:42:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E333EA
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 15:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D6FB8411C
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 15:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ywuv8k_DWSTv for <buildroot@buildroot.org>;
 Fri, 14 Mar 2025 15:42:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f2c; helo=mail-qv1-xf2c.google.com;
 envelope-from=tom5760@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3872283F1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3872283F1A
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3872283F1A
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 15:42:57 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-6eaf1b6ce9aso3900086d6.2
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 08:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741966976; x=1742571776;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=732YJ7KqapILYqYrG4qLlD3FebuT05tJ9YDyIdqkfso=;
 b=PXjqWfy71xYh4pQLoDbNoKdS3EVtlGCUz+BcmzkH+nVcA2OQ0yw1XB7bOUxT1WpQt2
 I3jl4SEy/T811tCh8oepmY5921quET5c5Z8ZjxBd0mve/6A4VrTTiHbZdcRJQh+waHCi
 Ed1JEDbDxD8pWCiMHERtipWor/dgFmJoEYe2xFmVsou+6N7ph/M5AxKjbfaJzcnKwW1l
 tYbhRIdsiULXTOAY7Xd4LbkLx3dZKj+k/A6zGIqcIGtPK7gF2gf4gj/lqiwH3P4ul2qC
 d9Dvq3jaQd5sE0jd+UP7+ZPM9rjVqJ58Lt26mK680Si0fGWwQWgT0IHV0I0HQoRlE8hM
 GwAA==
X-Gm-Message-State: AOJu0YxXmwqIri2L60SGefje2L56drR8gPwsdLcGc7XnY6JQh7adteSa
 570yApjgcVL7qpIMgtRHihjitRSJpHPhAFuUswna35oy7L8c+dmHCUMaQ87q
X-Gm-Gg: ASbGncsCTGsht4EGjvRDoc5cFA+s8/P0ZuMIXX79OUDcjh1s9fFBvW30yV1hPMPTpDY
 IujZOlE3fUzBjzm+0PLz9Udj3I75eNZPZvst0AHL7AAUX63+mH13A+L1vt/pGJWpxkEHJsNYyTc
 M3uPXYNjTu3nSIqbf/ZkpiCwTCfla5+KSnkloPp7COyia6DPce9Kw3maBIsPs/emdAPtlbw78Iz
 5jaIT2NzsOKUBKKwY7XV7GsrCLAcSxdkui9sd7m+282Aks3Dd76dPVw51Imjd5dVnnrbBXMCSqt
 DgSg7Y1oiVZfpctM2pSTielYcbvrryA/odfsaJJ7jU1c/hpyEzCH64Zam/FAo38WfnhObtuh
X-Google-Smtp-Source: AGHT+IH0RejwWJgi17JSsmJLCYege1MLEUSlE0x2k83b3oNsSd9GsoL32V5SaRfXz4WmPv8gApKmKQ==
X-Received: by 2002:ad4:5ae9:0:b0:6e8:e828:820d with SMTP id
 6a1803df08f44-6eaeab3dbcbmr42045876d6.36.1741966975832; 
 Fri, 14 Mar 2025 08:42:55 -0700 (PDT)
Received: from lithium.cow-mirzam.ts.net
 ([2601:47:4000:119d:8d35:4f4d:8ca5:bb15])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6eade209be3sm25513816d6.8.2025.03.14.08.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 08:42:55 -0700 (PDT)
From: Tom Wambold <tom5760@gmail.com>
To: buildroot@buildroot.org
Cc: Tom Wambold <tom5760@gmail.com>, Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Date: Fri, 14 Mar 2025 11:42:51 -0400
Message-ID: <20250314154252.10248-1-tom5760@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741966976; x=1742571776; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=732YJ7KqapILYqYrG4qLlD3FebuT05tJ9YDyIdqkfso=;
 b=S9bDjw4uDvb6KYS8Bb127u1VsZaTKQuvG82BHEhgaGL9DbQVPeRJTeByQ1bN0OgoMX
 FBrKJ004RuwLRsULQPSoR6NB6EDgVzjxkdQc57+SoW16cskuz4gy5UTurNDFCXUbXsQ3
 zQ9k6aHrAoniMDvnJ7ET4vK17T3fhvkBIiHcul/EVuuIHHKk5UPMawQ0ICvxwwQG3lkP
 Av36PQfKNHuAbeoPkUcMOQuCYaOufYDQ2Bp0TXqcIzr4OE/xWOJ6sOLWZQbkuOpCjIvt
 RLNlvUHyaGDlFucIjeoytlt6Zg8PJkFEOrxIP79PbiLJNP1+CRZPn9Bux8nqb4UiYa8d
 /pgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=S9bDjw4u
Subject: [Buildroot] [PATCH] package/go: go-bin host-go provider implies
 target support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS configuration symbol is
used to determine if we can build Go packages for the target
architecture.  Previously, this depended *only* on the
BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS symbol, which is true
only if the host system can bootstrap the Go compiler.

The go-bin package makes it unnecessary to bootstrap the Go compiler.
Also, some host architectures (i.e. arm64/aarch64) don't support
bootstrapping the compiler anyway.

Add a new symbol BR2_PACKAGE_HOST_GO_BIN_TARGET_ARCH_SUPPORTS to let
BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS depend on either being
able to bootstrap the compiler *OR* using the go-bin package.  This
fixes being able to use the Go compiler to build target packages on an
arm64/aarch64 host system.
---
 package/go/Config.in.host        | 2 +-
 package/go/go-bin/Config.in.host | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 7e354b3298..f9b27cc4d8 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -2,7 +2,7 @@
 config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_TARGET_ARCH_SUPPORTS
 	# See https://go.dev/doc/install/source#environment
 	# See src/go/build/syslist.go for the list of supported architectures
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
diff --git a/package/go/go-bin/Config.in.host b/package/go/go-bin/Config.in.host
index 6312c1b950..5fe1686fef 100644
--- a/package/go/go-bin/Config.in.host
+++ b/package/go/go-bin/Config.in.host
@@ -12,3 +12,8 @@ config BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH != ""
+
+config BR2_PACKAGE_HOST_GO_BIN_TARGET_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH != ""
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
