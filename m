Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BD0C36010
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 18:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D082B83750;
	Fri,  4 Apr 2025 18:24:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k3vfl-BuT0O3; Fri,  4 Apr 2025 18:24:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C77AD82C1E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C77AD82C1E;
	Fri,  4 Apr 2025 18:24:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24977117
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 18:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0354582BFD
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 18:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Axgn-nR_sxo for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 18:24:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 33B2A82A53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33B2A82A53
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33B2A82A53
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 18:24:20 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2260c915749so18025805ad.3
 for <buildroot@buildroot.org>; Fri, 04 Apr 2025 11:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743791059; x=1744395859;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PQRAS5zkEa099EKwvA9/kjYCSRuL5h0xsU+EcoZWXcM=;
 b=iPAa/5a3gmphGK4JFDOLVoOgRsiIFndt+tJTqlNoBhIh7kLwXah+wy6go+YAdmWYMD
 CqyBbYMxXzhY7ifyvyL1P6ZptH6SIgDhj/wyWmhnNwMypzdmCiDG0/3/Dj7MSvYVSeWQ
 t4OHHcucfVtM+yRA3nvxlFgDPUnCAWYXNtiNnJg2M/FYLlU+HpvXmViW9M/RYQGMEsKy
 q7i2tl7d+KubRjbFqEWYdjjKxtju/vv+hw1Tj5EdVaBqTO3xBSmVJHOVxQ7BBwgeQkZ6
 wiOuz2kJ7DzSrWBEdUTAvSk8VWY5K6QDzhP0mkECqjPU7+zawdSVBByxCwHiEOUj370/
 qB6w==
X-Gm-Message-State: AOJu0Ywd9TrPfNvtuoYuhlydI/6rW/QlOa6GHqm8FCaRE2kTmtDclf3m
 jyBLuJeAsTLm50lT3CdUIUOjKAIdCOgCmM+Lq+jwF3h59/lk4oggrshCqJh6fWFob3vYhZ9dnMs
 c
X-Gm-Gg: ASbGncsG1nCqHeJmiDTABV8yelzs9sasqP5biVfAsFgiTTIXRQ3DRouj5WhdWvrhx0N
 C6dvo0xQddlaPY1+jF2XUB5UD85j6Ln509hDolr2G69Ao+TpS8vE3aZj8FrQ0MQPY1vq7BEnR/V
 9JcaZM6OKm5EuMiEeR9mhrbWX1xNzk5FugPOqJt4MyiPZkyQpQIxf5pUhAJzHtcPVZRU68zwYE1
 4/lRHsdxz2Oi2f4XkVgwuMt8VQPFKiJmG7Kcc4HuKpZJSF/ZnFr5mTnrQrGtplQMjkfbEpFoczK
 D0rI2raIm5A0hgMxSoodq8al5e+QIzeh/LZ9PmISnmppS3Y2aIqQltmSWoLfNlrr+xBy
X-Google-Smtp-Source: AGHT+IEQNcD2M+HoIxDLtJwpSRD9UVGE7oQ6GG6aMD6S4HQEdOAjr0Ti1LTQrYilfpiQ2sQCJ5pIVw==
X-Received: by 2002:a17:903:1b2d:b0:216:7926:8d69 with SMTP id
 d9443c01a7336-22a8a8dd69emr47122215ad.47.1743791059313; 
 Fri, 04 Apr 2025 11:24:19 -0700 (PDT)
Received: from localhost.localdomain ([45.143.82.66])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-229785c30cbsm35689495ad.101.2025.04.04.11.24.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Apr 2025 11:24:18 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Christian Stewart <christian@aperture.us>
Date: Fri,  4 Apr 2025 11:24:07 -0700
Message-ID: <20250404182407.45244-1-christian@aperture.us>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1743791059; x=1744395859; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PQRAS5zkEa099EKwvA9/kjYCSRuL5h0xsU+EcoZWXcM=;
 b=XLYa4CBIPmrkgoa1LgX86pneuWZZB+BmbAdCrLJRSlCNoBDlYZqShHRXvkdt3UVos9
 6ii845ZZFOz5oCR3XO7fFgZOCnght4DH7YX7NwsQYp1zI2J+kRrb89Z/JRrap90P7bvK
 PG7UBG91MdhAPhiE+LWBdCLOxG8zCL9P/fXi0hi6lc5+WGCNwYt28b1NPteh4iJcxrRR
 ipZ2HaTJilf+/kt3i4F1XPIcGo75pfOq/OzqJ20c2JGQVSPhuLdjZgoqhA78InbxzUCF
 wjBJK0ewLVxMP5eodx5K8n93wdvXgVFfn2Wzb1TYLP3G5rJOWXJBdJxvVp7xoeSxrcpJ
 749Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=XLYa4CBI
Subject: [Buildroot] [PATCH v1 1/1] package/pkg-cmake.mk: force config
 version >=3.5
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some packages have CMakeLists.txt requiring CMake <3.5.

Newer CMake forces at minimum version 3.5, leading to build failures:

https://github.com/skiffos/SkiffOS/actions/runs/14208988354/job/39812576139#step:8:638
https://github.com/skiffos/SkiffOS/actions/runs/14211566256/job/39819600184#step:8:26664

Add the suggested build flag to force version 3.5.x and fix the error:

  -DCMAKE_POLICY_VERSION_MINIMUM=3.5

This is applied to all cmake packages to force 3.5 as a minimum.

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/pkg-cmake.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index c7032312fb..7bff3851cf 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -53,6 +53,10 @@ define inner-cmake-package
 
 $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
 
+# Some packages requires CMake 3.0.0 but latest CMake requires >=3.5
+# Set the policy version minimum to force these packages to 3.5 or greater.
+$(2)_CONF_OPTS += -DCMAKE_POLICY_VERSION_MINIMUM=3.5
+
 # The default backend, unless specified by the package
 $(3)_CMAKE_BACKEND ?= make
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
