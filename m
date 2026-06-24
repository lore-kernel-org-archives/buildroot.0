Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF0FCDE000
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 10:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E2FD40C34;
	Wed, 24 Jun 2026 10:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CR_Hd1R9zc4R; Wed, 24 Jun 2026 10:13:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C30440C26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782296028;
	bh=djayo/Gza2t69glN6pu/vVe2cwvg3xhRc/RVS9Gr0O8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=QzHcWqBgLwvvh2zJIz08nu7hvYLlRsYHr1WzEKBAPaQ58thoj/WSm4hUNbzmUVNE9
	 bICs1vXCEuLYKd25ga9RBhW2I4P0kb9DAhC3KxfMFz5rTQU5BEdHhKg+j8ZZ3AS6Fv
	 5w8xD7Hqa0dWFGFzypWLqcs4pkV3Uea8J/H5hnV6StU4vx6wmrE2hzv4TSCeCDyeXC
	 FfMnBLTiD4KrjmZ0MhA0aoQnzNy3ZseaBQNfbyjt66UYrFf8v9ZGq2o9D1vM7wtFMt
	 D/GEg9eHDX6dpJBYtdDj8cmMBo3hZhsfRdK/TZ1DtYPCWM9qUASaX+/xWOVu7f9kkU
	 Z76ns+at/UtCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C30440C26;
	Wed, 24 Jun 2026 10:13:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 323BC367
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9152C60BC4
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bcz05zwdkqJ0 for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 10:13:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 03BED60BA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03BED60BA8
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03BED60BA8
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:43 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-490b3637b90so5565965e9.3
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 03:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782296021; x=1782900821;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rMHAh636BxkSYHg3OvG2mBWxwOR29OiIzsNa+FJ8g/s=;
 b=b5qZe9cYqNxv3TWcIlIhWybaILRUnhbobsg6E+UODi0wQH7TYxJE8W5LEwPKD4m39p
 9v/onOToO7eqL6bYQ2u/YxfeoygPS+AhF87Qb51Afkb4PTdPRnL5p8KcTlnuO1ler5OA
 JrthdXj1TwgcXY7g271RKlBg20LrJLa0WuXCf6ajNWXWSkgIhq4ydfOkuYdzQSJNlBoX
 WejMhbK6TIH8PcMC4zTrNz3sDGpJdqHHjfwbAcYUnlmGEOY+wjfwNQvbFnOprCvzkwKo
 qH+lJpdUm08nuiP0NO0kTW1QnZmYtrd/rTmCiaXK6pBWl1cXefKKtvMyNUE0GsI7p394
 CSKg==
X-Gm-Message-State: AOJu0Yyd3/eQ/YjZ03Ui41b5NbrAaH0zQoSm/7wCdXXvsGtHMz98jd5U
 CGTcs2KHyE8C52v8YnpQLEaUFc0grcFjEggqfkpxNTSXLX0jazATra1uxWG3Qfxb4Gk4Jks9eSP
 4aPzR
X-Gm-Gg: AfdE7cmgJ24ipAiznV0f9KEi9cnY+dYRSAo8723yQJXmcU0ceOrybrLyP33NB1FrF23
 LkRbkzEPcuJMRcG3kOjJvhq0+7IbNWOCHLrm89Y2mN1qrPeV//7YIjfndpdIr5hfHfvWkzUl+wJ
 CQUMjj6gvL1yDoQk2XYJPVsaHq+6NV/82ohiO9ZCEg12AHYhNt+ac2kH9VpVUFuiYvr8VgpdCSZ
 MWE4cSLcax1bm2faAFXPgPa0wPY2Zi/7M6CXha0uXwgulhdUU/TNFiqhUG25skFu13x58jJeRMU
 8Fu3z938gnD53mjrtBBQJFYGf1klVZyK471Me3jJuwZSPaR9k5aGvsSE+hYEMjxRCG+dJyR4A6N
 AQQ5Bw5AMGcgQ1ItmX60u/p1/LfKC6mEcOc1DrgaBtWjCA9Bn7F3H8teSw0p5bxIqaIani0UOXX
 PFVbQ1
X-Received: by 2002:a05:600c:5494:b0:490:b06a:649e with SMTP id
 5b1f17b1804b1-492608784abmr34746175e9.25.1782296021151; 
 Wed, 24 Jun 2026 03:13:41 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c221d9a22sm5441002f8f.19.2026.06.24.03.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 03:13:40 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 12:13:32 +0200
Message-ID: <20260624101340.80670-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782296021; x=1782900821; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rMHAh636BxkSYHg3OvG2mBWxwOR29OiIzsNa+FJ8g/s=;
 b=GTFPLAOK5iR30teuzCFJIaJbtSEA6eHazrS8NOnN9GpAB16FRP8Zr09DX04Lh05cHD
 J1AeEPYUuRr3B1Q1QFSNBt2RQT1wZHeIa03No8y594W+TwqV/fMx79E5hLtwR4qR3CEK
 ut1Q3FEv5TkGj7qVIyjp8nNqKuayok5wXasaYEYrIk2uNS6HGXYunPE/UR5pj2tguXEa
 SEMWfMh/TOhkLxckDr5SIhXt/yf4woF//u+0tHklqfqNol3vyKyajj9CMK2US9Mc1MHK
 0OyzWzellNWrzlv0gVORumpEDxGZHwwJ7wvoXObIZJdJMMzhdqeMQRguJBFpE0JzYcEt
 LebA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=GTFPLAOK
Subject: [Buildroot] [PATCH 1/9]
 testing/tests/utils/test_generate_cyclonedx.py: test scp-style git sites
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
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The commit [1] fixed a formatting bug with the SCP style git sites
declaration.

Add this style of link to the test case to keep a track of it.

[1] ebcfdb8b0a utils/generate-cyclonedx: fixup scp-style git sites

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/utils/test_generate_cyclonedx.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index e6640fbd0d..b91add2349 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -149,6 +149,7 @@ class TestGenerateCycloneDX(unittest.TestCase):
                 "uris": [
                     "git+git://git.example.org/foo",
                     "svn+https://svn.example.org/foo",
+                    "git+git@example.org:project/foo.git",
                     "https+https://sources.buildroot.net/foo",
                     "http|https+https://mirror.example.org/foo",
                 ],
@@ -172,6 +173,11 @@ class TestGenerateCycloneDX(unittest.TestCase):
                     "url": "https://svn.example.org/foo",
                     "comment": "svn repository",
                 },
+                {
+                    "type": "vcs",
+                    "url": "ssh://git@example.org/project/foo.git",
+                    "comment": "git repository",
+                },
                 {
                     "type": "source-distribution",
                     "url": "https://mirror.example.org/foo/foo-1.2.tar.gz",
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
