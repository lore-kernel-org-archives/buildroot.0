Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73157C83F17
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 14:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26CCA40469;
	Thu, 10 Jul 2025 14:32:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cMDOeL0oahxm; Thu, 10 Jul 2025 14:32:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6241640F03
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6241640F03;
	Thu, 10 Jul 2025 14:32:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D01D269
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 14:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C19A280B62
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 14:32:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dd9WulYqZ5uh for <buildroot@buildroot.org>;
 Thu, 10 Jul 2025 14:32:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AEF7E80B58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEF7E80B58
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEF7E80B58
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 14:32:47 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a510432236so828846f8f.0
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 07:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752157966; x=1752762766;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JSBlHbrYv8hcEfXn+hZFF0Cgmm+2sWfgrUxnlCUX3mQ=;
 b=rz573C97ZUbG0rK79jSpr9oHol294ObzcVOIwHlhKyPdMRMwhFO4JyhPlGG0GV6N/n
 wFdr/77P3hro8hnXu5ty57L+fbTtx7U6eAdP7oUaunK9tumbQ+sNw/GNIsgpOdueIxXF
 pFOS4VBdJUFRMT+my3yFNrFMshP6xPHFB+3Dxjn736ew55njnKm7Oi059YffF+A2lyPu
 EWpT9rLLYhEW3QjbbwXNX2KezWhVBmWm0hb8W2ToNZzU277V/RtfKfMkLzqXPUS5y20j
 GY2i44iqJDGfQpT1oMfUiOIKGtMemdDMbk9s5cBIrLuLNLdSv+FymaeTTMIQTrd+i3lS
 tAMQ==
X-Gm-Message-State: AOJu0YzEvVqLbUtM7HDSLnZa1UmDPbY8WPOQPUA7ZSHR/FV7+XlDhdtT
 NTA3fycXYtjA5Hl/ONFH3EvVl67JRJWeTjhFaTdSEPMEq9WESJ6Ll+TTBlpriYdfl7XGsX2Z+1b
 6ACJU
X-Gm-Gg: ASbGnctA1zv1kU2h4N8oKCFmIcpkcMrWdiS7QgZO4npapRkDCajFFnDtztUZ0/5oD0N
 Pk1xnVjndEJ0opzb1LZZwTDQQ+5MVq7vrmpFdq1A2if5CDvzxB7bj9idwcgpeU34vZIizX7dTXP
 6o0N2tABPKUcho1ac8MLBe6v2PMRD6FjiWiC2sMx8/4RWI9oMWblxrjLn3jID5RWnK53KsIAyJZ
 gUN4JbQGylC+BY1JfbTT81sJYPM+o8iDO8E+Uck7JQSp8VRpDB1aXPLxd+uPg7mP0bsWfxCrnch
 AwfFvz/vfsbmfT9Nv1AMeIhpB62tsopVurE6Aozeo1AweVJnUZTi1K9qtK4XKC/b
X-Google-Smtp-Source: AGHT+IG2A5YeP/6sEHeTj79dZ4YpXzbA1CB6MV3tZYuIlwjR2M6OugPeNTKMfkrkCuNWFwuNIqDQWw==
X-Received: by 2002:a05:6000:654:b0:3a4:d6ed:8e00 with SMTP id
 ffacd0b85a97d-3b5e86b089emr2527541f8f.33.1752157965617; 
 Thu, 10 Jul 2025 07:32:45 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cdc6a542sm52895105e9.1.2025.07.10.07.32.44
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 07:32:45 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 16:32:44 +0200
Message-ID: <20250710143244.678848-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752157966; x=1752762766; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=JSBlHbrYv8hcEfXn+hZFF0Cgmm+2sWfgrUxnlCUX3mQ=;
 b=hhBh2CO+/5n9cH9vYZ8grUhNHrrrW7lam9kDOr6oScilcXnEn0Zo4GdPIW8Treyd77
 XZ6OmFzx1dwK5eVgIcWLMnW3yG97UqWCupUwsTKshDLpNqauTsLeHzDLM0br6sas3iGQ
 uZo/Y0FImcFkT+kGXms7k+uMsOl/rdR51xOd/gbEuG75dFD4UC6YUGrRUGgGbhnJMTrO
 Pja4JwYcGAFuPSiK5DVvFrCyBywq8cPQfQhXxhrSHcxK5KW/btnQ7fYxsTdjrgXMoGha
 71D686ISHGcsRrRKek5kfZUpSiYaW3ofrjFBPnqkddNoczTOJqQ+XY8X7TdJNBmgRHU6
 riXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hhBh2CO+
Subject: [Buildroot] [PATCH] package/libargtable2: fix build error
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

The following build error is happening on the autobuilder:

```
arg_int.c:60:12: error: implicit declaration of function 'isspace' [-Wimplicit-function-declaration]
   60 |     while (isspace(*ptr))
      |            ^~~~~~~
arg_int.c:33:1: note: include '<ctype.h>' or provide a declaration of 'isspace'
   32 | #include <limits.h>
  +++ |+#include <ctype.h>
   33 |
arg_int.c:89:8: error: implicit declaration of function 'toupper' [-Wimplicit-function-declaration]
   89 |    if (toupper(*ptr++)!=toupper(X))
      |        ^~~~~~~
arg_int.c:89:8: note: include '<ctype.h>' or provide a declaration of 'toupper'
```

Both `isspace` and `toupper` are declared in the `ctype.h` header. The
include was added in a later upstream commit.
This patch adds that upstream commit and strip everything else to only
patch that include.

Fixes: https://autobuild.buildroot.org/results/d38/d38e3e12f52c3fde08ab446ca14a1a7bd65c9469//
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../libargtable2/0001-apply-uint-patch.patch  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/libargtable2/0001-apply-uint-patch.patch

diff --git a/package/libargtable2/0001-apply-uint-patch.patch b/package/libargtable2/0001-apply-uint-patch.patch
new file mode 100644
index 0000000000..fed0307852
--- /dev/null
+++ b/package/libargtable2/0001-apply-uint-patch.patch
@@ -0,0 +1,25 @@
+From 3fe1ce4d7aa7c4fc16471a9ab023ecf6628c2f11 Mon Sep 17 00:00:00 2001
+From: Chris McClelland <prophet3636@gmail.com>
+Date: Thu, 12 Nov 2020 14:18:27 +0000
+Subject: [PATCH] Apply uint patch
+
+Upstream: https://github.com/makestuff/libargtable2/commit/3fe1ce4d7aa7c4fc16471a9ab023ecf6628c2f11
+[thomas: strip to only have the include]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/arg_int.c     |  2 ++
+ 1 files changed, 2 insertions(+)
+
+diff --git a/src/arg_int.c b/src/arg_int.c
+index 29c20e5..c51706a 100644
+--- a/src/arg_int.c
++++ b/src/arg_int.c
+@@ -24,6 +24,8 @@ USA.
+ #include "config.h"
+ #endif
+ 
++#include <ctype.h>
++
+ /* #ifdef HAVE_STDLIB_H */
+ #include <stdlib.h>
+ /* #endif */
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
