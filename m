Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31EDC27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 15:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B32E6614EA;
	Thu, 20 Jun 2024 15:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfRMg79KJfxq; Thu, 20 Jun 2024 15:57:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEEB0614D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEEB0614D8;
	Thu, 20 Jun 2024 15:57:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13BE51BF3EA
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 15:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D1C4844DD
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 15:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLMNAbXvDKGw for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 15:57:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8DCC1828A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DCC1828A9
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DCC1828A9
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 15:57:25 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-421757d217aso12544005e9.3
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 08:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718899043; x=1719503843;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L6Cb5m6u1hJDzIc7TljMXzKfrEi/O8wjgMgwh7gInhg=;
 b=pnF3V784/O8JkDTZrnZIekEoC5lWmTj22YFSx10AMcppT/TnXzOU8NbE/FVEPvvnkx
 aonslbynnVpKEJbFrrtdth8zn/UtQFaBIKraa/f5SDrP+WxwxGIShErQP7zmhqNBKiXq
 MSo3oEVyQo+YAlzWtUPWOtlMpFcLFAZtZcF9tr3RRTWTtiRdQ6WAttHQ3cw7n4u2ioF6
 MW7MtawAYF7cXd/s8pqAjPZBZfvDEwPvJKMOwtwVR8DtHztpXh/oeMLFH/YOrzQTKdHk
 MiRORSQtcdVLj8czoP8Fd4lkvx/T9rULG++kPnpJI9cKcXf1aG9CGoPpLoJbFg76mA5Y
 CKzA==
X-Gm-Message-State: AOJu0YyH+MExTCCvXArXHMqAZo3vr4lbTkkBKceOvc5LaubyMGyPw8gI
 qzXEHyljhpElZbHVEv+ysTgMwLx/1XZuDif38FFfixqsJ7S3e34+iQVIJw==
X-Google-Smtp-Source: AGHT+IFYaVfqkPgtCh/gd1iR9ld7yT84ENRmQHmqBZQj30ZEZ9KooPQSTG4nnD5Lb12SQtt1lhKeKQ==
X-Received: by 2002:a5d:464a:0:b0:35f:28eb:5a46 with SMTP id
 ffacd0b85a97d-363170ed434mr6062102f8f.10.1718899043104; 
 Thu, 20 Jun 2024 08:57:23 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3640afbd532sm3642903f8f.22.2024.06.20.08.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:57:22 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 20 Jun 2024 17:57:22 +0200
Message-ID: <20240620155722.2931020-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718899043; x=1719503843; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=L6Cb5m6u1hJDzIc7TljMXzKfrEi/O8wjgMgwh7gInhg=;
 b=VmO4OO+hVNGseAuwLGQ8qtkOLB7pnqnnyl5xUrbaioh61DTzq+9j0ubozHcmHmbDQb
 o/o5kQROLJDYd55nmnMvhn3iP1iDCasCqgzBhZhpSAEy3zKYitKGiRXxpQJSEPQAHJ8O
 BMvZkWFx8ETSFNPRHia0Id1QJr8ZcNrNWeT0K6JAvb7klwca6cGRWCAUAbAw5I24rFDR
 m5SGDZV5fxpjM4JeOU8rD4u+rOZwxYe4Dh36D4fB0+i6jv2lskI6/0CFpBHgbTirdmUV
 azabTO5V64oXYWqHKr5uXQXvIHZHpN96T54I/4F5YXejuzkynxg9DGH+dlpk7ECUSyCI
 owKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VmO4OO+h
Subject: [Buildroot] [PATCH] package/go: ensure there is a host-go provider
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit fa2536ec9401 (package/go: make host package a virtual package)
introduced host-go as a host-only virtual package, which had a single
provider, the choice of which is only exposed when a (target or host)
package has selected BR2_PACKAGE_HOST_GO to indicate it needs host-go.

However, this forgot to account for prompt-less, host-only packages,
which have no way of selecting that symbol.

Having prompt-less, host-only packages is a totally unexceptional,
supported case; for example a host package can be depended upon by
another (target or host) package, or by a filesystem, and we do not
require Kconfig symbols to be exposed for those packages.

As a consequence, when not package is enabled, that can select that
symbol, we can't run 'make source' or 'make host-foo-source':

    make[1]: *** No rule to make target 'host-', needed by
    '[...]/build/host-go-1.22.4/.stamp_configured'. Stop.

Fix that by moving the provider symbol out of the if-block, so that
there is always a provider defined.

Now, we only have host-go-src as a provider, but the symbol is still
part of the choice that is conditional (and that _has_ to be
conditional), so the BR2_PACKAGE_HOST_GO_SRC can never be set unless
there is a package that explicitly select BR2_PACKAGE_HOST_GO.

So, drop the conditional on the default, so that there is always a
provider available.

This mirrors other similar situations, like the rust case.

Fixes: fa2536ec940105acc71630144bd1187c931462ac

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/go/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 483393f8e4..92c1f4cdc3 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -54,12 +54,12 @@ config BR2_PACKAGE_HOST_GO_SRC
 
 endchoice
 
+endif
+
 config BR2_PACKAGE_PROVIDES_HOST_GO
 	string
-	# Default to host-go-src
-	default "host-go-src" if BR2_PACKAGE_HOST_GO_SRC
-
-endif
+	# Default to host-go-src, as the only provider for now
+	default "host-go-src"
 
 source "package/go/go-bootstrap-stage1/Config.in.host"
 source "package/go/go-bootstrap-stage2/Config.in.host"
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
