Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC72C87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 20:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 113F942785;
	Wed,  6 Aug 2025 20:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id je-IMq9pYhNf; Wed,  6 Aug 2025 20:20:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3031441EE5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3031441EE5;
	Wed,  6 Aug 2025 20:20:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 074EED79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 20:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECAE583D1D
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 20:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2cqgFFu4I6OU for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 20:20:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0382683CEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0382683CEB
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0382683CEB
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 20:20:32 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b7825e2775so170566f8f.2
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 13:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754511631; x=1755116431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hPkh5jsP46mKHz9JKt/FIPRiqaANiS/zK80zciSkaD8=;
 b=PmcuiG8mBIy9pLfhnAt+8NO7OiEWBvjlITjmxGYx9gfUXEVPIchMYzH4WqLwPrWu31
 EKct+WOv1xE8sjt5aIJY8nactblN4fccW87cTMkf6a9WDZrf33kd8gdrSRClEDNvkEk2
 yE5cipqv46ihN7VVWxNJAyCH0JEl2c///yly9LPDQDr1uHtOSzb/lqzrp6UlIpKScwy4
 PoJ8oXoO/NWujIeHi9gGv9woO7M93eU0RkY8DCtw9tWhLQGaShiTG2Bp/KPBKgZvYeuL
 PVs+MR5kTRn/QzPp2+ERwhlEB0IiPEdlhfG8ME07WBj5q9mUWe/4CKribxORUBtu4GOQ
 wxjA==
X-Gm-Message-State: AOJu0YwjDdKTfZZ4SQYLdeYJQ1audu1kKh9AZdpgZDwQiSOLgmp2b2Wr
 exVYdvuQ5Bfu25i8N8t29Czl1VDjbbuitrOTQ3s/lKB3nqNRIuD8ApGHDYQvV+mZtnx/t7i9kTf
 bdJY8
X-Gm-Gg: ASbGnctG3Dae7SeS67PTbx13NcuXyiZIXGyYO0XEhbun9KNmajJeB+GQ83j55YwcSZD
 CssJtUmBpm+9FMZ4u3GumG618gyk5Hp3Kp0PMC9HNG2tydWxvesh2jkx4ynboNIZOW+dLE4uiic
 frO20BVNN0rQEY1kh5aQuEdhrKV8tT/xQbiPL7DPjEp7M1cnrcKClPugv/4jONSVkTqkld1ddTg
 CG2rSPFkg3OasSLR2QdgNaTcNRqaRH3uxK3exGAtGU1ZlgZuRDw+rb1xY8I3RJpkrITJwq6wXln
 QQQxuWesQlR4JU3N/OeBq1dtyup7cyCfAuB6aXRRuQ5mUM1xEZaZwqLTr415q4pgblwtUmOGHtT
 lJyM3nrsCEF0ualwyNsI+7Qo2
X-Google-Smtp-Source: AGHT+IG/ZaV4K0DtD7EoIrhVyXEuwEDXwJkeRGnovWoaJ4f3OQHp5OfdY36LmiHQGqHpfyb4zKz4KQ==
X-Received: by 2002:a05:6000:3111:b0:3b7:948a:1361 with SMTP id
 ffacd0b85a97d-3b8f4159517mr2588124f8f.6.1754511630629; 
 Wed, 06 Aug 2025 13:20:30 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3bf93dsm24194029f8f.27.2025.08.06.13.20.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 13:20:30 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  6 Aug 2025 22:20:29 +0200
Message-ID: <20250806202029.625736-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806202029.625736-1-thomas.perale@mind.be>
References: <20250806202029.625736-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754511631; x=1755116431; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hPkh5jsP46mKHz9JKt/FIPRiqaANiS/zK80zciSkaD8=;
 b=J2wJY6SpZt2X+dBgDQW+mhZLXOjv0dVzxNbLiqej12yIi6jYJVoCPkE+n2BTEDKRSc
 ZOXwOFc6ctgkzXeBdRs+PWHK5jQqUFu+ak2zCwFGnELifuziZ/GIXCcdPTk7OwRKjbjR
 G7IfOcSdmrC/EB63oUnGEIi4yH/ZVb8Di+o4pgGj7aeg9+aSCb9uqX5UWkbVFwGNhmIh
 t5K2r92oho72V1IKL9vtZWuPKqBcM0wcPp2CGLJlhcn906EXRPLPOMcqOJccu/V/92UI
 /N4RG73jPL64W7sxg5vRcIwxziI2v4XnUAdOPUGolf4Zlp1+q6SUrC/knmBUAjS0FZQc
 AxUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=J2wJY6Sp
Subject: [Buildroot] [PATCH 2/2] package/tiff: add patch to fix CVE-2025-8177
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

Fix the following vulnerability:

- CVE-2025-8177

    A vulnerability was found in LibTIFF up to 4.7.0. It has been rated as
    critical. This issue affects the function setrow of the file
    tools/thumbnail.c. The manipulation leads to buffer overflow. An
    attack has to be approached locally. The patch is named
    e8c9d6c616b19438695fd829e58ae4fde5bfbc22. It is recommended to apply a
    patch to fix this issue. This vulnerability only affects products that
    are no longer supported by the maintainer.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-8177
  - https://gitlab.com/libtiff/libtiff/-/merge_requests/737

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
v1 -> v2: renamed the patch from 0002 to 0004
---
 .../tiff/0004-fix-for-thumbnail-issue.patch   | 35 +++++++++++++++++++
 package/tiff/tiff.mk                          |  3 ++
 2 files changed, 38 insertions(+)
 create mode 100644 package/tiff/0004-fix-for-thumbnail-issue.patch

diff --git a/package/tiff/0004-fix-for-thumbnail-issue.patch b/package/tiff/0004-fix-for-thumbnail-issue.patch
new file mode 100644
index 0000000000..237306f6c2
--- /dev/null
+++ b/package/tiff/0004-fix-for-thumbnail-issue.patch
@@ -0,0 +1,35 @@
+From e8de4dc1f923576dce9d625caeebd93f9db697e1 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Wed, 25 Jun 2025 17:14:18 +0000
+Subject: [PATCH] Fix for thumbnail issue #715
+
+CVE: CVE-2025-8177
+Upstream: https://gitlab.com/libtiff/libtiff/-/commit/e8de4dc1f923576dce9d625caeebd93f9db697e1
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ tools/thumbnail.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/tools/thumbnail.c b/tools/thumbnail.c
+index 9cade913..7e21f521 100644
+--- a/tools/thumbnail.c
++++ b/tools/thumbnail.c
+@@ -620,7 +620,15 @@ static void setrow(uint8_t *row, uint32_t nrows, const uint8_t *rows[])
+             }
+             acc += bits[*src & mask1];
+         }
+-        *row++ = cmap[(255 * acc) / area];
++        if (255 * acc / area < 256)
++        {
++            *row++ = cmap[(255 * acc) / area];
++        }
++        else
++        {
++            fprintf(stderr, "acc=%d, area=%d\n", acc, area);
++            *row++ = cmap[0];
++        }
+     }
+ }
+ 
+-- 
+GitLab
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index bd95fdca7f..3d426fad4d 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -16,6 +16,9 @@ TIFF_INSTALL_STAGING = YES
 # 0001-don-t-skip-the-first-line-of-the-input-image.patch, 0002-fix-tiffmedian-bug.patch, 0003-conflict-resolution.patch
 TIFF_IGNORE_CVES += CVE-2025-8176
 
+# 0004-fix-for-thumbnail-issue.patch
+TIFF_IGNORE_CVES += CVE-2025-8177
+
 # webp has a (optional) dependency on tiff, so we can't have webp
 # support in tiff, or that would create a circular dependency.
 TIFF_CONF_OPTS = \
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
