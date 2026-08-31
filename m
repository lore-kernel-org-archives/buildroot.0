Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB74C624A4
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 14:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11B8E405BD;
	Mon, 31 Aug 2026 14:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3WPXPzMvqCde; Mon, 31 Aug 2026 14:05:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788185159;
	bh=XvdTsh7q8TsgrNidYbVBIAIQK3DLv3/oTkreo+cua5w=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=SmQ6CcEPW7RIibE5o32oDe/4frd8vj+UHbY0onyRE9rzruzS0hNzYU0Z19+iI+ale
	 axPDJ/eVx6CEAZwZ2hw6VJDemEIYVwY8aqKd8mOua68tAbVfg4bEwWhtWebEnQ9DjT
	 3oqEGYZklhxh+xlrHnIV9R6mX/pfkPgb45j/L9vj6EtJ44Scf6aeA+OfyQEVPhUlvj
	 iXrri+rzCRgjf6lQq7CIFkCesGy8tG04sBZG8h0qA6Xtox2Xpa6kx0lSB6pRevMwkN
	 4lhpmmQ7o+nN34r5EiE3r3AqWDT0NgRNoxQbuxG+7WAGRPjxn9jWr3Nx84/9ZX1zGm
	 /jydJDCpJ9FPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D0FE4058E;
	Mon, 31 Aug 2026 14:05:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A6E452AA
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 14:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 699FC806E1
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 14:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dQx8CbhyCC83 for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 14:05:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DC4380B6B
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 14:05:55 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-49b0d8bc2aaso35257765e9.0
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 07:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788185153; x=1788789953;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WF6YnT+1F2dAdgEtRE9rAuiwPyI3ztBzB2ydkG3SxTw=;
 b=JXcU5PIjk+Y0Q+GMuQ8hq+mhx0Khzjmptuyw2X0iSIUNQ0PUP0mVN4djYSjF9B0iL4
 wcTH1+WkFgtLDHWK38eWInip32XJ5ElBVX5Vl7uPchzXBXLwhjw3b36rVrUgI/fFnu4f
 yTJ2562kt51ZO9YWFjGajKErrMfFgH5FOFMdPX/dkbdR31yzYyD42OtVB2C2hqPG1nhe
 eoXePOuFRBLjEeynUH0IKgikem01Gz6VTzdEEr07XxT5Ya8IFE+iOcwNqC7eOcAt9OOW
 xWBo/eVoSalFGZm63GnODMZMOOfkx4FT5XU+xOT5S4AxPyb6KI3bAqYTOt2SNleO9tAM
 AMbw==
X-Gm-Message-State: AFuF++molrUxV3UpXwHS48FLSfH8SV7nz5llMzgBM7Tkty6eRYfiZRTb
 bMiAReoDlBsQ6SASjBaBVU4jsvAegckPXWynWtm8gVbrxyJ2sANbxT0+MoKGcFga1PlJaLP4m8h
 K4A/Lj/Y=
X-Gm-Gg: AR+sD13rSsJvhVfHKakloOqraibl/2PVjT5ZOt/U0QNzCMiLr0Cqas1So0y4vy42Krz
 MLYn94gSoVMvDHhepVns9oPwwVIF4QuW/ItIT+SBYx6daHfGZS7AmtCJqIsyQrfUkAg5JGfc0ww
 BWPq4KIepB+O1qH1luCAz6f/eIWP1Qx+km3qI7OEg1bfyvQEIkisLRS5syJLan812QBrE+9fu4u
 3Osxn3yYzlf33ULZbbd209YDty09uqc5khL3GpF7nZUepGg7s6/Xwb0Y7WsSxYVOOADJpzAgirm
 qX4nJIyJMZQsGAAkm6zAg2TOmD4Veyne4rnWKxWcf4sX7DRagpgMtPdNvP9LkoX6uv88daUhikJ
 zalvMuAUk32pRf67nG5uHu7WHwg+eKpzYJADWbK8TlYL55X7XYC0ITLCd5CfYRvMivwZ8FEcvN1
 v3qE5KppawksZfFKU8jEXhQipXWaohrnXuN0UeXmnprzScC9CPhc3wMdARrzQA7EbWPN3hCvyhC
 UoXtu9cnCDd0R0=
X-Received: by 2002:a05:600c:1d1d:b0:49b:d45:703e with SMTP id
 5b1f17b1804b1-49b91c2dfecmr399625005e9.8.1788185153225; 
 Mon, 31 Aug 2026 07:05:53 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b91c5790csm241353015e9.0.2026.08.31.07.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 07:05:52 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 thomas.perale@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Mon, 31 Aug 2026 16:05:30 +0200
Message-ID: <20260831140530.443610-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/vim: fix hash for README.txt
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 297f6f1921960c1735bca34b5a80138e2a8261f4 updated vim.
However README.txt (used as part of the license hash check) has been updated
upstream in [1], without any corresponding hash change in Buildroot, leading
to build failure.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/work_items/189

NB: This also affects 2025.02.x & 2026.05.x, so this patch
    should be applied there too.

[1] https://github.com/vim/vim/commit/e7e21018fc0b60c153c8e668f696d95e574cc5a4

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/vim/vim.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 57aa3dd49d..ec3e92aaa0 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -2,4 +2,4 @@
 
 sha256  9b90b23241007b20ba89b7b00e6202008f4ff5b5278974d42aa199867c2eada5  vim-9.2.0943.tar.gz
 sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
-sha256  ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  README.txt
+sha256  1e9afcb6b83c11af081b6ff7873861895819c7bacfc8d2ea53972a532c622868  README.txt
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
