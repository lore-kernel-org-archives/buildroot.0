Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15A8CAC5B8
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 16:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 589D384CD1;
	Fri, 26 Sep 2025 16:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_vBpMoq5ZUD; Fri, 26 Sep 2025 16:32:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46C1B84C88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46C1B84C88;
	Fri, 26 Sep 2025 16:32:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37EFF177
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 16:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29BC14226D
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 16:32:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vw_wihwZUaD2 for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 16:32:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1B5944226C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B5944226C
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B5944226C
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 16:32:42 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3ee12a63af1so1581747f8f.1
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 09:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758904360; x=1759509160;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ias1k1IJFflndc9y175fWrUZqH2IhgCL3GdEo8uOsVU=;
 b=TUIYeRTPcv+lPF64oQTmDxouDjjCBl7JiG27wlDoOWcXODwO4Q+ZhfmXLsz2t8M8mx
 PZs58zeDwWAGWsjwHw1tT9/MM4MGFBZQfV+rjYBfNve831+Dq0Do5THf5XEgtMcHd6ul
 eFpXTMg7P4YHVMP2XAmvkBO0umFrNcU6DCAAzbrHup5f+yJMSU4Xcm+t+QH3sf3tNjxf
 YgkXeB81NJziNx3h2PxVFKp1DrKFwuqhvdkedb4Ha7mS7TOtm2LKSRgzCmBRxz8Q5lqI
 whcb4sZLDJ6giocwypTuTNqawjcaFFcPNPgDnpaZRLD8hLO2z+WfZMCs54uUNe5XF+9F
 ZYNg==
X-Gm-Message-State: AOJu0YzMV51f4T4H/lS36jD+8BxJCalOWUuaUcuXT30ZmNK8U46nqWU3
 ULNHKwJPNKMnvzQ1VQU/8GXrrbDenOzQBigLFneHEYMmSKdJSHRsZkTOkeGYnyIqYW27QNVGCwS
 pjBHh8HQ=
X-Gm-Gg: ASbGncv9DjTbKmh9HoZQSSTZHCNufvypXipTft1Q+bRsW8TWAmLBGBH6xuaPvgnO6Ad
 KBndcbnoiZThdeq+FNyRPJZJHzwyUaVOetg43Xw4vLMAZUL8pnNDOIE+zws3EJO049Yq5O+G+Lk
 vXkc5/bFRU3O+Ogvy7r8FyDqBAw72byeslwqb3QnFWijJrzDsqhATE1SeSAfQt9FNW+ndsqzPPw
 x2Fj8JOIwPKYAElGC6X4JqvszheJfDYDqg+VUZiV6ezdoqtaGdcjw6a9HrEGj9F5J4P3opVCcID
 NhbMHJp9zhP1gj6VJOSI0Zhgsr5mkTohkn1gRpuebrAHlKnI11Af3qjOu5TWLc5bGI32xIW6Edm
 6TbPXY4ibgsY/I18=
X-Google-Smtp-Source: AGHT+IHQKTKgjHyudYz54EaYegaLxfsmoOx/akTeTsHKBA2rZlvf+x8cWaxL7AHGoeY6dxb0MevoXA==
X-Received: by 2002:a05:6000:1861:b0:3f8:e016:41c0 with SMTP id
 ffacd0b85a97d-40e464201damr7768090f8f.10.1758904360222; 
 Fri, 26 Sep 2025 09:32:40 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab31ea3sm121249955e9.12.2025.09.26.09.32.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 09:32:39 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 26 Sep 2025 18:32:38 +0200
Message-ID: <20250926163239.162734-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758904360; x=1759509160; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=ias1k1IJFflndc9y175fWrUZqH2IhgCL3GdEo8uOsVU=;
 b=WYC8obmbI1HDvSVTi7CYMq5SIOTYEqDiY9/t3rRH3iJyQccMxKyD3v34FIssE2qpd8
 XeI6VdA34T8J6wMKnnq9VHjg+zkQ2XchTcRMYBXKDiVukdY7kHEKhtpHZnoNekCdUHxU
 R0ZCKnEmzHNpuHyz96yFgbj1WvgGEAj85rqmAN3pw1c79edoJpIWOC2FbYmvk7llCSEx
 Ws0LvdFuwonQ4lDNx4b01nD9hF7zlFLimdu1qOkBE9t9MJDtOkHaPE2FNPXb73DWY2hV
 FFBhY9lraRfsiT3o68tcNywcjn6uutadL7TVa8TSkIFGAQmmDyRCZzyr80LEQL7TEMpI
 Nx6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WYC8obmb
Subject: [Buildroot] [PATCH 1/2] package/tiff: ignore CVE-2025-8851
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

The CVE-2025-8851 [1] has been fixed in upstream commit [2] that is part
of the v4.7.0 release.

Because the NVD reference includes the version '<2024-08-11' most of CVE
checker will fail to compare it against 4.7.0 and report it as a
positive.

[1] https://nvd.nist.gov//vuln/detail/CVE-2025-8851
[2] https://gitlab.com/libtiff/libtiff/-/commit/8a7a48d7a645992ca83062b3a1873c951661e2b3

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/tiff/tiff.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 3d426fad4d..dd23c2bd43 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -19,6 +19,9 @@ TIFF_IGNORE_CVES += CVE-2025-8176
 # 0004-fix-for-thumbnail-issue.patch
 TIFF_IGNORE_CVES += CVE-2025-8177
 
+# Fixed in 4.7.0
+TIFF_IGNORE_CVES += CVE-2025-8851
+
 # webp has a (optional) dependency on tiff, so we can't have webp
 # support in tiff, or that would create a circular dependency.
 TIFF_CONF_OPTS = \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
