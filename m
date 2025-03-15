Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8353C28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 19:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EA5260809;
	Sat, 15 Mar 2025 19:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRCGyEtpdZm0; Sat, 15 Mar 2025 19:57:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45562607CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45562607CC;
	Sat, 15 Mar 2025 19:57:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 289ADC8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17B8C40423
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7bB-Ai5Swv0 for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 19:57:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 331DE400EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 331DE400EC
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 331DE400EC
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:16 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso4893855e9.2
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 12:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742068634; x=1742673434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=S/cJbkODMJCtASV4i4oN8l77hPCgLTyIb4rh/upZpZc=;
 b=gtbcXH5g2GtH9FPSD571EJRbDLxIXDMqZV/nWdOLEVKvRMcLOsItDhePHevp4t5vVL
 DVsiUVhMW7yF6VPFoRkbxQIPgV1KOWMbyn87x1maEsJKFywWz+jMepRZ7yxMccgV/52c
 +s3F1Vb6WgM1Nm2ve1bRbefXaiwpHRhwFfTYmdPx0OEgO41kdlaaJvYkqyy5CoWibsY2
 MPf8q7H0AEQW39AceB8WPpYhgZVmTZJvIzhuN9EGc0sA1p+nnokPAkWPWVN3h4Fq6S3F
 Sf0lUyiXQqJUdJlC+VTlCZxhjyrPClc5qAKrdvNOuLbdtwkv/ovp3ndY67j7oI3wwkVg
 qBMg==
X-Gm-Message-State: AOJu0YxwnZoITZ9gqq4KFMOt1dI9ZgRLgbOIFV2OVM238qxMB+5B+Ybr
 bhzdHe46xAbU2JPodcLudTV+7AC0jGSi4Mkix30+g3XBs1OCyHciFiNuyg==
X-Gm-Gg: ASbGncsordgiJLU34mNqR3qLs25R1m4u3MwqTnBI/X7MJsiPJKBUYBZ+WtTn2+c+h24
 p5TQ/ZZuidOdjykcnxujiMwanB/VC3+F7kohU1XExsCJ3Xe8SXb90fqpLeclp+cVWVOntmuW27A
 8a9qTWBFld2v/pL7HJFCmfY/Zv8IzwRhHTsbkmJshLdjFwYCd55rvC840smR29dbeqKBF8V+YbZ
 CGhBgZpvlI3E2QWzxhGoCyG3A2EFuP6CdKwTqbG0NB9+IZA6CcbyufCMASZ1/Yx4p3PKg/Sy9gr
 U/byGfGKxpHeVqV6+OZBKWk+k7SXqCVNonpJ976GCJdhId+NPxxDbUU=
X-Google-Smtp-Source: AGHT+IHY2ScqCGKuqw1Ice7lZd3Vi16w0YZI0E03PQ048bB337Yw/fbY4du+qecfIpUsv5rwN1itXg==
X-Received: by 2002:a05:600c:350a:b0:43c:f70a:2af0 with SMTP id
 5b1f17b1804b1-43d1ec8643amr92817755e9.16.1742068633941; 
 Sat, 15 Mar 2025 12:57:13 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975afesm9756836f8f.47.2025.03.15.12.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 12:57:13 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Date: Sat, 15 Mar 2025 20:57:01 +0100
Message-ID: <daf08123c83ade6f9a16b7e8ff06d8b3e790abbc.1742068624.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1742068624.git.yann.morin.1998@free.fr>
References: <cover.1742068624.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742068634; x=1742673434; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S/cJbkODMJCtASV4i4oN8l77hPCgLTyIb4rh/upZpZc=;
 b=U8fqCoM5OibiP/PP9N+DblMuKJao/cCG9ZVH43H9ws6pArccExQqTbWgGvmFHvT+U8
 PrnR5jibBaHTIKFE4IYhgu7MmtCW2W/GRsYVZuZNtWZpHL3hF+ZQmTsjeWJgrIF75Oja
 yISRu7tNPe1UTkfWnH+jTR9U4ilAxau6tNwOG6EzbD9pYr6XdNJ19UtPOIjAL9hpME+6
 SKEiGN/bJuOCGjGLRZdA9zIq+Bnj3YXS0y8JVJzeFxrL+FmUEscFDRdAFWT8qH+yCkJ6
 yA1FZKdYbrQgzhhPNRRgW2KlOOWBZZea4uLYcZOhNeCwEd449LleE7OjDRH90sFI9YOP
 hsDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U8fqCoM5
Subject: [Buildroot] [PATCH 03/14 v4] package/conmon: depends on systemd
 when enabled
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

When it detects it runs under systemd, conmon will want to log to the
journal. However, it needs to be linked with libsystemd to do so and if
not, will error out:

    Feb 22 11:10:03 buildroot conmon[199]: conmon 3b462ce6f2cc64f75c42 <error>: Include journald in compilation path to log to systemd journal

This prevents starting any container.

Add a dependency to systemd when it is enabled.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Christian Stewart <christian@aperture.us>
---
 package/conmon/conmon.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/conmon/conmon.mk b/package/conmon/conmon.mk
index 1e57786686..ed1a2554fa 100644
--- a/package/conmon/conmon.mk
+++ b/package/conmon/conmon.mk
@@ -18,6 +18,10 @@ else
 CONMON_DISABLE_SECCOMP = 1
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+CONMON_DEPENDENCIES += systemd
+endif
+
 define CONMON_CONFIGURE_CMDS
 	printf '#!/bin/bash\necho "$(CONMON_DISABLE_SECCOMP)"\n' > \
 		$(@D)/hack/seccomp-notify.sh
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
