Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B099CCF9F0
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 19:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 512FF614D7;
	Thu, 30 Oct 2025 19:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UjxqK4jvLOgx; Thu, 30 Oct 2025 19:09:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4666614D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4666614D4;
	Thu, 30 Oct 2025 19:09:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A7EBCD
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 19:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C11D40CED
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 19:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hwV9a04JRocD for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 19:09:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A44064004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A44064004D
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A44064004D
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 19:09:40 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3ed20bdfdffso1318286f8f.2
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 12:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761851378; x=1762456178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nVzWQT03hwtYPtqGaX2KFQpEtOVFx7ZYuV5g98VNUR8=;
 b=g4r+yJPoLTsUigN0jBP1ATYkw3ULblWa91PW6DztDWDiusHVOvBfzA7CFcmdwVcG5G
 S5DNV2tEBpShLjFPDYUqid1AcNWdVO91Uphwlx6FmWEmbQE5dU1CBSu7l2XbCks2ivLt
 LPBLkHc/vVqDQbattr8ysjWAYus+OjAUbe03Ukvo/tEj8xE9COj1VHPKJ/G0GmwqdeQ8
 R/hreNUBQfm/vgoO88dWuz5h2F2bGn+IL16m3/nUhUIrPgZ5kIEDBZ5ZoRtUBixgB2wm
 Gq8ah7icHuy02/j9zbiE3Yh+W/bx2FcehM1gYjF6iBbYYAgZ932EVnv0eC31G8nA+4IQ
 3tRg==
X-Gm-Message-State: AOJu0Yz+2TOK/lpVD8SqYYcF3S6bXegq4+2eng0OVzdnG48K5N3iyla9
 +MAR+y1zXlMmTQZazyM6O/YiW8w0P5qiJOQBhvJje39dO3E03t1ZlKR8HHlmS/UApk1ORH3cAxn
 jbV6C
X-Gm-Gg: ASbGncvLGUohJVEGFd2APSBqPsIAKZ1G35GKEch69LKYO5VaPdF79lTN/SYFZ4tg1Lx
 xHTB7LmqzKqfdGvt5ZoRTDT/itgszNB0IJaehMpNxbQdravgac5htLHhTXa9e7q9AmYC8EpvmlQ
 DdubB66PHeCX9xThb60HYwepLpp3pSt0NOP/yY2xGrzsQ76sAqpX7mUKXZ9qZt7dJAsLnPiRthM
 esturMhSPKc9EAqHO4+tgQ/lr7IU/JHttBoIK9AKhwkb1on03/pWwHuVVmxfeFS3mNvRk6Mp3yl
 x1eSwiy1469zd4lKq31zgx81zSJiXAVdA1CpyPyikkjDrtiWbWmnQd4lr71zFP/yODRy3UfgiOM
 JJOBbhvsyhcpZ2SQRuM4bHtmOXuQglgS5J2tGkemjgCH+3ylSj95+rJEyRB5EAcL4X9QxcajBxG
 /6hHAZS5b/AoIQmLEArEz+1sb+46osSZ80FKyB
X-Google-Smtp-Source: AGHT+IHpbuB4o9pUmHv/8eZbrAuDkrzHJAvzSA+bmitHVg67xlWdfCgFO3opGrD47fpCPggmc7NnRg==
X-Received: by 2002:a5d:5f50:0:b0:427:546:4378 with SMTP id
 ffacd0b85a97d-429bd67ddaamr734570f8f.20.1761851378430; 
 Thu, 30 Oct 2025 12:09:38 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952e2e06sm33727962f8f.46.2025.10.30.12.09.38
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 12:09:38 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 20:09:36 +0100
Message-ID: <20251030190936.262624-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030190936.262624-1-thomas.perale@mind.be>
References: <20251030190936.262624-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761851378; x=1762456178; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nVzWQT03hwtYPtqGaX2KFQpEtOVFx7ZYuV5g98VNUR8=;
 b=hT6Utd1ZAIfzDc86VeZiGbBdOs/KEc+8CpI/DUrUUJXUfOMY8/iWRu/Ibd+3KiDJPC
 D2Gel15QAOGo6kF8ckK+gBLgMnZDlPhWb9n/XYOWzXy9JrBS02h5eklVHuYGWze/9ziY
 mdMcU/xDA80I13Frwf3SYkhnehRGxFpOUARf0zZL+UorJYOk+NJbn3hl7TQKR69oB9tm
 ueIWdwksUotLHiukvJJRlZbZg21q1kpCKI92ali2TMXK+SnLxJ8/NMxPl0Fn+monNhwj
 TJWIitjrebOqmoMlmYSgPDCURuIt7iOw5qqynkHpKPJStY8l9XHRga+2RCWMchNvmdka
 kipQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hT6Utd1Z
Subject: [Buildroot] [PATCH 2/2] docs/manual: mention CVE trailer
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

Adds documentation about adding a patch that address a vulnerability.

The patch-policy file now explain mention that patches that address a
vulnerability needs to include a `CVE:` trailer with the reference of
that vulnerability.

Until now only adding the reference to the `_IGNORE_CVES` variable was
necessary, so the documentation of this entry is modified as well to
point to the patch policy.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/manual/adding-packages-generic.adoc |  6 +++---
 docs/manual/patch-policy.adoc            | 13 ++++++++++++-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
index 6827b9975e..e7547460fd 100644
--- a/docs/manual/adding-packages-generic.adoc
+++ b/docs/manual/adding-packages-generic.adoc
@@ -509,9 +509,9 @@ not and can not work as people would expect it should:
 * +LIBFOO_IGNORE_CVES+ is a space-separated list of CVEs that tells
   Buildroot CVE tracking tools which CVEs should be ignored for this
   package. This is typically used when the CVE is fixed by a patch in
-  the package, or when the CVE for some reason does not affect the
-  Buildroot package. A Makefile comment must always precede the
-  addition of a CVE to this variable. Example:
+  the package (see xref:additional-patch-documentation[]), or when the CVE for
+  some reason does not affect the Buildroot package. A Makefile comment must
+  always precede the addition of a CVE to this variable. Example:
 +
 ----
 # 0001-fix-cve-2020-12345.patch
diff --git a/docs/manual/patch-policy.adoc b/docs/manual/patch-policy.adoc
index a4bc5f391a..7a707a33d0 100644
--- a/docs/manual/patch-policy.adoc
+++ b/docs/manual/patch-policy.adoc
@@ -144,6 +144,7 @@ AC_PROG_MAKE_SET
 +AM_CONDITIONAL([CXX_WORKS], [test "x$rw_cv_prog_cxx_works" = "xyes"])
 ----
 
+[[additional-patch-documentation]]
 === Additional patch documentation
 
 Ideally, all patches should document an upstream patch or patch submission, when
@@ -177,4 +178,14 @@ Upstream: N/A <additional information about why patch is Buildroot specific>
 ----
 
 Adding this documentation helps streamline the patch review process during
-package version updates.
\ No newline at end of file
+package version updates.
+
+If the patch addresses one or multiple vulnerabilities, list each identifier on
+a separate line with a +CVE+ trailer.
+
+----
+CVE: <vulnerability identifier>
+----
+
+If multiple patches address the same vulnerability, reference the vulnerability
+on every patches.
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
