Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930B3C87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 19:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65A80840B5;
	Wed,  6 Aug 2025 19:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L503dHTkQ-oe; Wed,  6 Aug 2025 19:31:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 666E483FC4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 666E483FC4;
	Wed,  6 Aug 2025 19:31:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BE73D84
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 19:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E35F40AC3
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 19:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UOeCCGE451_I for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 19:31:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 17ECE409E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17ECE409E6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17ECE409E6
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 19:31:11 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-459ddada9b1so2581245e9.0
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 12:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754508669; x=1755113469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dJhWdQpunZ9Ehf8ugkvKFZsyV9gcjg3RYPr/SrRiPz4=;
 b=FKPDEO7jwGTdkjtOim0BzDJpL5Nvur4EdtGBJz1JfBbNGXqyvsKlMo1l3+R3N1yxyj
 WaR+UBMEPualuzndS/66WRYC/9xQxz3Opb42zffXESI3rlGrET7KrchFm3SD+/fjQ5Yt
 +/lCE8WF3QXlCgf43n7ynL8o7guAgOtHfRPtL6xMTOxG2r7MgR3v9kAhpWsF41+B9em/
 r3ywtdB0alpxcNrLGsqbRvmc5fGdM/komJUCMvGh6UTC8PQX5sgwjJaFzgDk7/VHBJrf
 xsra2uC4fYPZ8GrlAynRk8mwovdffg9a+qMeYLM5AiWY8xaxtNqvDfURY4BURDvhAion
 Q3Ug==
X-Gm-Message-State: AOJu0YxJVPnhaEpgZOMj9MhLRU58Kb6dWiZ8yWNnInzMmTTJHHbb7NRp
 Jpi9tYzXQBnqeSCFfLICf6On1l6Hy+FoqVbY2QTJHdZBO/Ct5dVzJjYTp9MXd/tyd+6kRqqQmik
 H7sag
X-Gm-Gg: ASbGncuMTy9vOlLvZZJH4/oOT7sAwZ3f/r+8fHX4eJ5LGfy8SZynz4chAHoYVu9sH2+
 03xaFKhT7enPD+ZrgQuf34KMoDLVEuUD/SF56hFtF5GLRz9cNzPunnDAoOIQsfzePJVcgzh3h/Y
 4QX5LmPDHCcf9V7f2zwL06jNbFBODWu26XSntmlRMzWidrGQQDrBYoCTCyo2Bwl3JOrA2147aFo
 EGNqSZxvjGcspJkowRr9kTv55KcKE9859uz9wJ6wUuabj6YED9U/Qh2Uiti0HgYov8KuU+F0+S8
 ZIUeeItY6OUt/tTeDAoUB5z9YJ+aNdw1Nyaz7LxhTNyLnH5PZ1s7ACrQhf6sHSHA+K5/sqWOED9
 lS5YWlUGv8Mp4B0ivNZo9ybpj
X-Google-Smtp-Source: AGHT+IGhI+RcES0xhenCiZfhlVnKiOAIN/Fb/qA/uTxo7iBTJLA6hx+OBJDEx8InNGvOShBfSWImjw==
X-Received: by 2002:a05:600c:45d0:b0:459:df25:b839 with SMTP id
 5b1f17b1804b1-459e74bd496mr32989385e9.33.1754508669408; 
 Wed, 06 Aug 2025 12:31:09 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e009e465sm15032891f8f.43.2025.08.06.12.31.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 12:31:09 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  6 Aug 2025 21:31:07 +0200
Message-ID: <20250806193107.528541-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806193107.528541-1-thomas.perale@mind.be>
References: <20250806193107.528541-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754508669; x=1755113469; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dJhWdQpunZ9Ehf8ugkvKFZsyV9gcjg3RYPr/SrRiPz4=;
 b=N4Dg6NKFhkB/AOCQc3j+f3wR6Z8JUKaMi1e6mfs9CBabxTZ+nGx3jCubnWNXsfF6HR
 GxdSz/i+ksrbaOjmVYoLRDuhS7aQYv36HltyGVEymLaZ/5B9FZ3tY9ghDrW01dKzOXUr
 5q2/m6s3tFl/FoQoGAZcDRg9kFA/QOA9eNsN8ke+byxvt3MG4jFsnq2w6XjTjgTpfzce
 BpRAIX+/D5yCwG5wHjewZlHBbdqM5TZmn2zjUhACJcLX4hg1DCZhwtCaIitDwAGNjQiv
 DQ1Uj7VGh3Wvu858Gr2RLE3Z/JbaxNujKqiZCSUXTL4prResZqlHB9VAqQQ3xaBMHeMY
 6P8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=N4Dg6NKF
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
 .../tiff/0002-fix-for-thumbnail-issue.patch   | 35 +++++++++++++++++++
 package/tiff/tiff.mk                          |  3 ++
 2 files changed, 38 insertions(+)
 create mode 100644 package/tiff/0002-fix-for-thumbnail-issue.patch

diff --git a/package/tiff/0002-fix-for-thumbnail-issue.patch b/package/tiff/0002-fix-for-thumbnail-issue.patch
new file mode 100644
index 0000000000..237306f6c2
--- /dev/null
+++ b/package/tiff/0002-fix-for-thumbnail-issue.patch
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
index fe35ed01b5..e9d0109da4 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -16,6 +16,9 @@ TIFF_INSTALL_STAGING = YES
 # 0001-don-t-skip-the-first-line-of-the-input-image.patch
 TIFF_IGNORE_CVES += CVE-2025-8176
 
+# 0002-fix-for-thumbnail-issue.patch
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
