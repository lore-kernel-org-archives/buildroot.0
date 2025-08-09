Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7D8C87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 17:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2A5780BA0;
	Sat,  9 Aug 2025 17:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gPDz2I0lrCPs; Sat,  9 Aug 2025 17:54:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B92B80B36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B92B80B36;
	Sat,  9 Aug 2025 17:54:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D9A7231
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C066260D61
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5nPKMcg8m2a for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 17:54:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EDAA260C0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDAA260C0F
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDAA260C0F
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:54:21 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b780bdda21so2457797f8f.3
 for <buildroot@buildroot.org>; Sat, 09 Aug 2025 10:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754762059; x=1755366859;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K3JD5wcK00PJut4j24w3gnA2Yww6DCbJTV5j+u70usI=;
 b=hS5M7pq4HL2YTykOoSHC3aaIC3f7rdabebe8Cnid74uFmzqMOwyawbqtZEhO2fhYO6
 K08l300cXXiDstgFFtCJRNYRfdw3dgoqYJIw3lZM47aPtQkXernY8gcngGWv5QwE0oGY
 YlG68c3pxLndsKFCwarmO25SfrbxiHWcU284cCBATxrhiTwY3cB+4/zkKc7bTSqWMQfl
 T/B9xNPSH6ON2plFtVCkBq/3ps7K8JWX13wTdH9knHGQFmniv/o0vAfBXy0+NUwoxP90
 80vI7bOreKGxOnrf658EpBGnl3vyZMfq9Nge0t5ARc83HiJEunPjSnH+2lnRVFZH7lR+
 2mIw==
X-Gm-Message-State: AOJu0Ywrp1v8XrwX3mrRv6S6ZcRPZWXUjI/n/jDfnYmVdoeGyn16YJEG
 bvg+xIIs6jrEtzIi7cGLd5RlY+5Ixtb23/g6AEVeARuu7Gs2nFwDPGHm3/GtgF/vxLMgwMiymEr
 xfyZp
X-Gm-Gg: ASbGncvko5i/PzUmUP/mUu4llJLUcDJiNO9AR+SBFJI2yQpgnIlYaTD2L5h/7kjkwfJ
 Abv77RQwnd/Whm5Fw28cc/xfrvrXOnvIkKIVGROfgAmsGSQANGVUn0wFrvrQtLKE75MYhS30aw3
 PNNpkXTmgPucyKOFfz76JIMH8gcwDvUanHW+rsQPPKMa9zCNqGy3vjTvGTl1XJt8xKyTZss5yRi
 dsA/H+xy5gTw/yOoN2t3McWqarSCiTCT7mT0mIgSKW5mwpdKBWPscKw8Fh4/4mqmCsnGheRR5Ix
 2NXVLjOdoyEjCYmGyV4/QN/3FcNCoqjWP8ZxFNTQv1Tn5nrv3xc08FTKdMB2LoZEWjGXY9uTkfS
 059luK5X7wJ//6g==
X-Google-Smtp-Source: AGHT+IE2n8OQqQo1DrSFFn5GdpgGjTLAG5pouUEL1cdFzqAZhb1daiuA1iqoDSLwLuGfb9XmL3cPmw==
X-Received: by 2002:a05:6000:2510:b0:3b4:9721:2b19 with SMTP id
 ffacd0b85a97d-3b900b4724dmr5397363f8f.11.1754762059034; 
 Sat, 09 Aug 2025 10:54:19 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5852e28sm182443085e9.9.2025.08.09.10.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 10:54:18 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat,  9 Aug 2025 19:54:17 +0200
Message-ID: <20250809175417.315091-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754762059; x=1755366859; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K3JD5wcK00PJut4j24w3gnA2Yww6DCbJTV5j+u70usI=;
 b=Oa8NQZWDCpRE7tJx0SdGcRLYcKv62DhPQ6mL6LD5IU0+vYGIgmPu8LsSAbE4yPxG2z
 T7ARvuDBbcO6KjhAOoZewh0CeahMbUbMpve+I4ePbgNWidaODxgmo2Jwnb1H/ZaqNNx7
 Ci4IAGpgvP9wjF/jH1EGPRCorQOCMiweGoZCLV4TU9fAB2232K3ghcnusRlLdIhbyjNd
 3rAWQQ5kplzj4f/Zyc3hLCXfTdpxaGt3rfsSRXjJLossbyefj3gv1mA+0jcos6mcriKL
 FOG5OBAP8ShG7gFfRrlJJa5Kz9ojlt7+jm0r21jbpm6MUQXrXZ1Z70vUtzucN4wAboU8
 GRVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Oa8NQZWD
Subject: [Buildroot] [PATCH] package/libapparmor: remove stale reference to
 patch 0001
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

The AUTORECONF variable was introduced in commit [1] with reference to
the patches that modified the m4 and Makefile.am files.

The commit [2] removed the last such patch but left the reference to the
patch and the AUTORECONF variable.

Later, commit [3] updated the mirror to the gitlab URL that no longer
bundle a pre-generated `configure` file, making the execution of
AUTORECONF necessary anyway.

This patch removes the obsolete reference to the patch 0001 removed in
[2] to avoid ambiguity with the new patch 0001 introduced in commit [4].

[1] 01a82c1401 package/libapparmor: enable python bindings
[2] 27cd0b5033 package/apparmor: bump to version 3.0.4
[3] 5649202ddc package/libapparmor: bump to version 3.1.7
[4] 2640f5dcd0 package/libapparmor: fix build w/ musl

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libapparmor/libapparmor.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index fa59ff2924..b1c9a952f0 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -16,7 +16,6 @@ LIBAPPARMOR_DEPENDENCIES = host-bison host-flex host-pkgconf
 LIBAPPARMOR_SUBDIR = libraries/libapparmor
 LIBAPPARMOR_INSTALL_STAGING = YES
 
-# Patch 0001 touches Makefile.am and m4 files
 LIBAPPARMOR_AUTORECONF = YES
 
 # Most AppArmor tools will want to link to the static lib.
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
